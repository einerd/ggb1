package com.dobby.free.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dobby.free.command.QnaVO;
import com.dobby.free.command.ReviewVO;
import com.dobby.free.command.UserVO;
import com.dobby.free.user.service.UserService;
import com.dobby.free.util.Criteria;
import com.dobby.free.util.PageVO;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//회원가입화면
	@RequestMapping(value="/userJoin")
	public String userJoin() {
		return "user/userJoin";
	}
	
	@RequestMapping(value="/idConfirm")
	@ResponseBody
	public int idConfirm(@RequestBody UserVO vo) {
		
		int result = userService.idConfirm(vo);

		return result;
	}
	
	@RequestMapping(value="/joinForm", method = RequestMethod.POST)
	public String joinForm(UserVO vo, RedirectAttributes RA) {
		//성공시 login페이지로 유도 / 실패시 login페이지로 유도
		int result = userService.join(vo);
		if( result == 1) { //회원가입 성공
			RA.addFlashAttribute("msg", "회원가입을 축하합니다");
		} else { //회원가입 실패
			RA.addFlashAttribute("msg", "회원가입에 실패했습니다");
		}
		return "redirect:/";
	}
	
	//마이페이지화면(페이지 진입시, 조인을 통해서, user에 대한정보와, user가 쓴글에 대한 정보를 동시에 처리)
	@RequestMapping(value="/userMypage")
	public String userMypage(@RequestParam(value="path", required=false) String path,
							 HttpSession session, Model model,
							 Criteria cri, RedirectAttributes RA) {
		if(path == null) path = "";
		String user_id = (String)session.getAttribute("user_id");
		if(user_id == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			return "redirect:/";
		}
		int uno = (int)session.getAttribute("uno");
		UserVO userVO = userService.getInfo(user_id);
		int total1 = userService.getTotalReview(uno);
		int total2 = userService.getTotalQna(uno);
		PageVO pageVO1 = new PageVO(cri, total1);
		PageVO pageVO2 = new PageVO(cri, total2);
		
		ArrayList<QnaVO> qnaList = userService.getUserQnaList(uno, cri);
		ArrayList<ReviewVO> reviewList = userService.getUserReviewList(uno, cri);
		
		if(path.equals("review")) {
			pageVO1 = new PageVO(cri, total1);
			pageVO2.setPageNum(1);
			qnaList = userService.getUserQnaList(uno, new Criteria());
		}else if(path.equals("qna")) {
			pageVO1.setPageNum(1);
			pageVO2 = new PageVO(cri, total2);
			reviewList = userService.getUserReviewList(uno, new Criteria());
		}
		
		model.addAttribute("pageVO1", pageVO1);
		model.addAttribute("pageVO2", pageVO2);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("userVO", userVO);
			
		return "user/userMypage";
	}
	
//	@RequestMapping(value="userModify")
//	public String userModify(UserVO vo) {
//		
//		int result = userService.update(vo);
//		
//		return "redirect:/user/userMypage";
//	}
	
	@RequestMapping(value="userLogout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 로그인 요청 처리 후 메인화면 이동
	@RequestMapping(value="/loginForm")
	public String login(HttpServletRequest request, UserVO vo,
						Model model, RedirectAttributes RA) {
		System.out.println("아이디: " + vo.getHeader_user_id());
		System.out.println("비번: " + vo.getHeader_user_pw());
		
		String ID = vo.getHeader_user_id();
		String PW = vo.getHeader_user_pw();
		UserVO vo2 = new UserVO();
		vo2.setUser_id(ID);
		vo2.setUser_pw(PW);
		
		UserVO result = userService.login(vo2);
		if(result != null) {
			request.getSession().setAttribute("user_id", ID);
			request.getSession().setAttribute("uno", result.getUno());
			request.getSession().setAttribute("user_name", result.getUser_name());
			request.getSession().setAttribute("user_nick", result.getUser_nick());
			return "redirect:/";
		}else {
			RA.addFlashAttribute("msg", "로그인에 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/searchTarget")
	public String searchTarget(String searchName,
							   String searchType,
							   HttpServletRequest request) {
		request.getSession().setAttribute("searchName", searchName);
		request.getSession().setAttribute("searchType", searchType);
		System.out.println("타입: " + searchType);
		if(searchType.equals("all")) {
			request.getSession().removeAttribute("searchType");
		}
		return "redirect:/productList/productList_A";
	}

}
