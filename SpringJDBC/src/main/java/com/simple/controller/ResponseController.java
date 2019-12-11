package com.simple.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simple.command.reqVO;

@Controller
@RequestMapping("/response")
public class ResponseController {
	
	@RequestMapping(value="/res_ex01")
	public void res_ex01() {
		
	}
	
	//---------- model 전달자 ----------
	//1st
	//메서드의 매개변수로 model을 지정하면 자동으로 데이터를 저장하는 model객체를 생성함
	@RequestMapping(value="/res_ex02")
	public String res_ex02(Model model) {
		
		model.addAttribute("serverTime", new Date() );
		model.addAttribute("name", "홍길자");
		model.addAttribute("nick", "멍멍이");
		
		return "response/res_ex02";
	}
	//2nd
	@RequestMapping(value="/res_ex03")
	public ModelAndView res_ex03() {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("servertime", new Date());
		mv.addObject("name","홍길숙");
		mv.setViewName("response/res_ex03");
		
		return mv;
	}
	//3rd
	//화면에서 전달받은 파라미터를 다음화면에서 그대로 사용할 경우(req+model)이 합쳐진 형태
	@RequestMapping(value="/res_ex04")
	public String res_ex04(@ModelAttribute("id") String id) {
		System.out.println(id);
		
		return "response/res_ex04";
	}
	
	@RequestMapping(value="/res_ex05")
	public String res_ex05(@ModelAttribute("info") reqVO vo) {
		System.out.println(vo.toString());
		
		return "response/res_ex05";
	}
	
	@RequestMapping(value="/res_quiz01")
	public void res_quiz01() {
	}
	@RequestMapping(value="/res_quiz02")
	public void res_quiz02() {
	}
	@RequestMapping(value="/res_quiz03")
	public void res_quiz03() {
	}
	
	@RequestMapping(value="/res_login")
	public String res_login(@ModelAttribute("quiz01") reqVO vo) {
		
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		if(vo.getId().equals("kim12")&&vo.getPw().equals("1234")) {
			return "response/res_quiz02";
		}else {
			return "response/res_quiz03";
		}
	}
	
	@RequestMapping(value="/res_login2")
	public String res_login2(@RequestParam("id2")String id, @RequestParam("pw2")String pw, Model model) {
			
			System.out.println(id);
			System.out.println(pw);
			
			if(id.equals("kim12")&&pw.equals("1234")) {
				model.addAttribute("id2", id);
				model.addAttribute("pw2", pw);
				return "response/res_quiz02";
			}else {
				model.addAttribute("id2", id);
				return "response/res_quiz03";
			}
	}
	
	@RequestMapping(value="/res_login3")
	public ModelAndView res_login3(@RequestParam("id3")String id, @RequestParam("pw3")String pw) {
		System.out.println(id);
		System.out.println(pw);
		ModelAndView mv = new ModelAndView();
		if(id.equals("kim12")&&pw.equals("1234")) {
			mv = new ModelAndView();
			mv.addObject("id3", id);
			mv.addObject("pw3", pw);
			mv.setViewName("response/res_quiz02");
			return mv;
		}else {
			mv.addObject("id3",id);
			mv.setViewName("response/res_quiz03");
			return mv;
		}
	}
	
	//------------------------- redirect and RedirectAttributes ----------------------------
	//화면처리
	@RequestMapping("/res_redirect")
	public String res_redirect() {
		System.out.println("탔냐?");
		return "response/res_redirect";
	}
	
	@RequestMapping(value = "/login4")
	public String login4(@RequestParam("id")String id, 
						@RequestParam("pw")String pw, 
						Model model,
						RedirectAttributes RA) {
		
		if(id.equals(pw)) {
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			return "response/res_redirect_ok";
		}else {
			//redirect:/ 를 사용하면 모델은 설사 같은 위치에서 선언을 한다 할지라도 전달이 되지 않음
			//redirect시에 1회성 데이터로 사용할수 있는 RedirectAttribute전달자
			RA.addFlashAttribute("msg", "아이디 비밀번호를 확인하세요!");
			return "redirect:/response/res_redirect";  
		}
		
	}
	
}
