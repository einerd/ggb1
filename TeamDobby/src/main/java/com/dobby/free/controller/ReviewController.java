package com.dobby.free.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dobby.free.command.ReviewVO;
import com.dobby.free.review.service.ReviewService;
import com.dobby.free.util.Criteria;
import com.dobby.free.util.PageVO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	@Qualifier("reviewService")
	private ReviewService reviewService;
	
	//등록화면
	@RequestMapping(value = "/reviewWrite", method=RequestMethod.GET)
	public String reviewWrite() {
		return "review/reviewWrite";
	}
	
	//목록화면
	@RequestMapping(value = "/reviewList", method=RequestMethod.GET)
	public String reviewList(Model model, Criteria cri,
							 @RequestParam("pno") int pno,
							 RedirectAttributes RA) {
		
		ArrayList<ReviewVO> list = reviewService.getList(cri, pno);
		int total = reviewService.getTotal();
		PageVO pageVO = new PageVO(cri, total);
		
		model.addAttribute("pageVO", pageVO); //페이지 정보
		model.addAttribute("review", list); //게시글 정보
		RA.addFlashAttribute("focus", "review");
		return "redirect:/productList/productDetail?pno="+pno+"#review-point";
	}
	
	//등록화면 폼 처리
	@RequestMapping(value = "/registForm")
	public String registForm(ReviewVO vo, RedirectAttributes RA) {
		System.out.println(vo.toString());
		
		reviewService.regist(vo);
		
		RA.addFlashAttribute("msg", "게시물이 정상적으로 등록됬습니다");
		return "redirect:/review/reviewList";
	}
	
	//상세화면
	@RequestMapping(value= "/reviewDetail")
	public String reviewDetail(@RequestParam("review_no") int review_no, Model model) {
		
		ReviewVO vo = reviewService.detail(review_no);
		model.addAttribute("reviewVO", vo);
		
		return "review/reviewDetail";
	
	}
	
	//수정화면
	@RequestMapping(value= "/reviewModify" )
	public String reviewModify(@RequestParam("review_no") int review_no,
							   Model model) {
		
		ReviewVO vo = reviewService.detail(review_no);
		model.addAttribute("reviewVO", vo);
		
		return "review/reviewModify";
	
	}
	
	//화면수정 기능
	@RequestMapping(value= "/reviewUpdate")
	public String reviewUpdate(ReviewVO vo, RedirectAttributes RA) {
		int pno = vo.getPno();
		System.out.println("star");
		System.out.println(vo.toString());
		boolean result = reviewService.update(vo);
		if(result) {
			RA.addFlashAttribute("msg", "게시물이 수정되었습니다");
		} else {
			RA.addFlashAttribute("msg", "게시물 수정이 실패했습니다");
		}
		RA.addFlashAttribute("focus", "review");
		return "redirect:/productList/productDetail?pno="+pno+"#review-point";
		
	}
	
	//화면삭제 기능
	@RequestMapping("/reviewDelete")
	public String reviewDelete(@RequestParam("review_no") int review_no, 
							   @RequestParam("pno") int pno, RedirectAttributes RA) {
		
		boolean result = reviewService.delete(review_no);
		
		if(result) {
			RA.addFlashAttribute("msg", "게시물이 삭제 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "게시물 삭제에 실패했습니다");
		}
		RA.addFlashAttribute("focus", "review");
		return "redirect:/productList/productDetail?pno="+pno+"#review-point";
	}
	
	@RequestMapping("/reviewUpload")
	@ResponseBody
	public String reviewUpload(@RequestParam("file") MultipartFile file,
							   @RequestParam("user_id") String user_id,
							   @RequestParam("r_title") String r_title,
							   @RequestParam("r_content") String r_content,
							   @RequestParam("starCount") int starCount,
							   @RequestParam("pno") int pno,
							   HttpSession session ) {
		
		try {
			//1 저장할 폴더
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String r_fileloca = sdf.format(date);
			String r_uploadpath = "F:\\KJH_PROJECT\\workspace\\TeamDobby\\src\\main\\webapp\\resources\\img\\"+ r_fileloca;
			
			File folder = new File(r_uploadpath);
			if( !folder.exists()) {
				folder.mkdir(); //폴더생성
			}
			
			//2 DB에 저장할 정보
			//String writer = (String)session.getAttribute("user_id"); //글쓴이
			
			//파일명변경 ex)238b0dc88dad4f489050ce00326f5cf2.jpg
			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-", "");
			String fileRealName = file.getOriginalFilename();//실제파일명
			long size = file.getSize(); //파일크기 
			String r_img_ext = fileRealName.substring( fileRealName.lastIndexOf(".")  , fileRealName.length());//파일확장자
			String r_img_name = uuids + r_img_ext; //변경해서 저장할 파일명
			
			//3 업로드
			File saveFile = new File(r_uploadpath + "\\" + r_img_name);
			file.transferTo(saveFile); //spring의 파일 업로드메서드
			
			//4 DB에 insert작업
			ReviewVO vo = new ReviewVO(0, user_id, r_title, r_content, r_img_name, r_img_ext, r_uploadpath, r_fileloca, null, starCount, pno);
			boolean result = reviewService.upload(vo); //업로드메서드
			
			if(result) {
				
				return "success";
			} else {
				return "fail";
			}
			
		} catch (Exception e) {
			System.out.println("업로드중 에러발생" + e.getMessage());
			return "fail";
		}
	}
	
	@RequestMapping(value="getPno/{rno}/")
	@ResponseBody
	public ReviewVO getPno(@PathVariable("rno") int rno) {
		return reviewService.getPno(rno);
	}
	
}
