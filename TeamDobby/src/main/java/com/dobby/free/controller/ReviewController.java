package com.dobby.free.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
	public String reviewWrite(HttpSession session, Model model,
			 RedirectAttributes RA) {
		
		String user_id = (String)session.getAttribute("user_id");
		if(user_id == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			return "redirect:/";
		}
		
		return "review/reviewWrite";
		
	}//reviewWrite END
	
	
	//목록화면
	@RequestMapping(value = "/reviewList", method=RequestMethod.GET)
	public String reviewList(Model model, Criteria cri,
							 @RequestParam("pno") int pno,
							 RedirectAttributes RA) {
		
		ArrayList<ReviewVO> list = reviewService.getList(cri, pno);
		int total = reviewService.getTotal();
		PageVO pageVO = new PageVO(cri, total);
		
		RA.addFlashAttribute("pageVO", pageVO); //페이지 정보
		RA.addFlashAttribute("review", list); //게시글 정보
		
		return "redirect:/productList/productDetail?pno="+pno+"#review-point";
		
	}//reviewList END
	
	
	
	//상세화면
	@RequestMapping(value = "/reviewDetail")
	public String reviewDetail(@RequestParam("review_no") int review_no, Model model) {
		
		ReviewVO vo = reviewService.detail(review_no);
		model.addAttribute("reviewVO", vo);
		
		return "review/reviewDetail";
	
	}//reviewDetail END
	
	
	//수정화면
	@RequestMapping(value = "/reviewModify" )
	public String reviewModify(@RequestParam("review_no") int review_no,
							   Model model, HttpSession session, 
							   RedirectAttributes RA, HttpServletRequest request) {
		
		String user_id = (String)session.getAttribute("user_id");
		String writer = (String)request.getParameter("writer");
		if(user_id == null || !user_id.equals(writer)) {
			RA.addFlashAttribute("msg", "게시물 수정의 권한이 없습니다.");
			return "redirect:/";
		}
		
		ReviewVO vo = reviewService.detail(review_no);
		model.addAttribute("reviewVO", vo);
		
		return "review/reviewModify";
	
	}//reviewModify END

	
	
	//게시판 수정 기능
	@RequestMapping(value = "/reviewUpdate")
	public String reviewUpdate(ReviewVO fo, RedirectAttributes RA, 
							   @RequestParam(value = "file", required=false) MultipartFile file) {
		int pno = fo.getPno();
		int uno = fo.getUno();
		
		//조회처리
		ReviewVO r = reviewService.fileList(fo.getReview_no());
		
		//내부 파일 삭제처리
		String path = r.getR_uploadpath() + "\\" + r.getR_img_name();
		File file2 = new File(path);
		
		if(file2.exists() == true) {
			file2.delete();
		}
	
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			try {
				//1 저장할 폴더
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String r_fileloca = sdf.format(date);
				String r_uploadpath = "F:\\KJH_GITHUB\\tmp\\TeamDobby\\src\\main\\webapp\\resources\\img\\"+ r_fileloca;
				
				File folder = new File(r_uploadpath);
				if( !folder.exists()) {
					folder.mkdir(); //폴더생성
				}
				
				//2 DB에 저장할 정보
				//String writer = (String)session.getAttribute("user_id"); //글쓴이
				
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
				ReviewVO vo = new ReviewVO(fo.getReview_no(), fo.getUser_id(), fo.getR_title(), fo.getR_content(), r_img_name, r_img_ext, r_uploadpath, r_fileloca, null, fo.getStarCount(), pno, uno);
				boolean result = reviewService.update_a(vo); //업로드메서드
			
			
				if(result) {
					RA.addFlashAttribute("msg", "게시물이 수정되었습니다");
				} else {
					RA.addFlashAttribute("msg", "게시물 수정이 실패했습니다");
				}
				
				return "redirect:/productList/productDetail?pno="+pno+"#review-point";
			
			}catch(Exception e) {
				System.out.println("업데이트중 에러발생" + e.getMessage());
			}
		
		}else {
		
			reviewService.fileNull(fo.getReview_no());
			
			ReviewVO vo = new ReviewVO(fo.getReview_no(), fo.getUser_id(), fo.getR_title(), fo.getR_content(), null, fo.getStarCount(), pno, uno);
			
			boolean result = reviewService.update_b(vo);
			
			if(result) {
				RA.addFlashAttribute("msg", "게시물이 수정 되었습니다");		
			} else {
				RA.addFlashAttribute("msg", "게시물 수정이 실패했습니다");
			}
			
		}
			return "redirect:/productList/productDetail?pno="+pno+"#review-point";
			
	}//reviewUpdate END
	
	
	
	//게시판 삭제 기능
	@RequestMapping("/reviewDelete")
	public String reviewDelete(@RequestParam("review_no") int review_no, 
							   @RequestParam("pno") int pno, RedirectAttributes RA, HttpSession session, HttpServletRequest request) {
		
		String user_id = (String)session.getAttribute("user_id");
		String writer = (String)request.getParameter("writer");
		if(user_id == null || !user_id.equals(writer)) {
			RA.addFlashAttribute("msg", "게시물 삭제의 권한이 없습니다.");
			return "redirect:/productList/productDetail?pno="+pno+"#review-point";
		}
				
		//조회처리
		ReviewVO r = reviewService.fileList(review_no);
		//삭제처리
		String path = r.getR_uploadpath() + "\\" + r.getR_img_name();
		File file2 = new File(path);
				
		if(file2.exists() == true) {
			file2.delete();
		}
		
		boolean result = reviewService.delete(review_no);
		
		if(result) {
			RA.addFlashAttribute("msg", "게시물이 삭제 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "게시물 삭제에 실패했습니다");
		}
		return "redirect:/productList/productDetail?pno="+pno+"#review-point";
		
	}//reviewDelete END
	
	
	
	//게시판 업로드 기능
	@RequestMapping(value="/reviewUpload") //이미지 파일이 있는경우
	public String reviewUpload(@RequestParam(value = "file", required = false) MultipartFile file,
							   @RequestParam(value = "writer") String user_id,
							   @RequestParam(value = "r_title") String r_title,
							   @RequestParam(value = "r_content") String r_content,
							   @RequestParam(value = "cnt") int starCount,
							   @RequestParam(value = "pno") int pno,
							   @RequestParam(value = "uno") int uno,
							   HttpSession session, RedirectAttributes RA) {

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				//1 저장할 폴더
			try {
				System.out.println("여기로 들어왔다");
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String r_fileloca = sdf.format(date);
				String r_uploadpath = "F:\\KJH_GITHUB\\tmp\\TeamDobby\\src\\main\\webapp\\resources\\img\\"+ r_fileloca;
				
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
				ReviewVO vo = new ReviewVO(0, user_id, r_title, r_content, r_img_name, r_img_ext, r_uploadpath, r_fileloca, null, starCount, pno, uno);
				boolean result = reviewService.upload_a(vo); //업로드메서드
				
				if(result) {
					RA.addFlashAttribute("msg", "게시물이 등록 되었습니다");
				}else {
					RA.addFlashAttribute("msg", "게시물 등록이 실패했습니다");
				}
				return "redirect:/productList/productDetail?pno="+pno+"#review-point";
			}catch(Exception e) {
				System.out.println("업데이트중 에러발생" + e.getMessage());
			}
				
		}else {
			ReviewVO vo = new ReviewVO(0, user_id, r_title, r_content, null, starCount, pno, uno);
			boolean result = reviewService.upload_b(vo);
			
			if(result) {
				RA.addFlashAttribute("msg", "게시물이 등록 되었습니다");		
			} else {
				RA.addFlashAttribute("msg", "게시물 등록이 실패했습니다");
			}
		}
		return "redirect:/productList/productDetail?pno="+pno+"#review-point";
		
	}//reviewUpload END
	

	
	
	//게시물 번호 가져오기
	@RequestMapping(value = "getPno/{rno}/")
	@ResponseBody
	public ReviewVO getPno(@PathVariable("rno") int rno) {
		return reviewService.getPno(rno);
	}
	
	
				
	
	
	
}
