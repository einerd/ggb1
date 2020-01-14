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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dobby.free.command.ProductDetailVO;
import com.dobby.free.command.QnaVO;
import com.dobby.free.command.ReviewVO;
import com.dobby.free.list.service.ListService;
import com.dobby.free.qna.service.QnaBoardService;
import com.dobby.free.util.Criteria;
import com.dobby.free.util.PageVO;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	@Qualifier("QnaBoardService")
	private QnaBoardService QnaBoardService;
	@Autowired
	private ListService listService;

	// 등록화면
	@RequestMapping(value = "/qnaRegist", method = RequestMethod.GET)
	public String qnaRegist(@RequestParam("pno") int pno,
							Model model, HttpSession session,
							RedirectAttributes RA) {
		if(session.getAttribute("user_id") == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스 입니다");
			return "redirect:/";
		}
		ProductDetailVO vo = listService.searchProductInfo(pno);
		model.addAttribute("vo", vo);
		return "qna/qnaRegist";
	}

	// 게시글 등록폼 처리
	@RequestMapping(value="/registForm")
	public String registForm(@RequestParam("file") MultipartFile file,
							 @RequestParam("pno") int pno,
							 @RequestParam("uno") int uno,
							 @RequestParam("b_history") String b_history,
							 @RequestParam("q_title") String q_title,
							 @RequestParam("q_content") String q_content,
							 @RequestParam("user_id") String user_id,
							 HttpSession session, RedirectAttributes RA) {
		System.out.println("여기여기여기 왔어!");
		
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			try {
				System.out.println("파일 있는쪽으로 들어왔어 어쩔거야?");
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String q_fileloca = sdf.format(date);
				String q_uploadpath = "F:\\KJH_GITHUB\\tmp\\TeamDobby\\upload\\qna\\"+ q_fileloca;
				
				File folder = new File(q_uploadpath);
				if( !folder.exists()) {
					folder.mkdir(); //폴더생성
				}
	//			String writer = (String)session.getAttribute("uno");
				
				//파일명변경 ex)238b0dc88dad4f489050ce00326f5cf2.jpg
				UUID uuid = UUID.randomUUID();
				String uuids = uuid.toString().replaceAll("-", "");
			
				String fileRealName = file.getOriginalFilename();//실제파일명
				long size = file.getSize(); //파일크기 
				String q_img_ext = fileRealName.substring( fileRealName.lastIndexOf(".")  , fileRealName.length());//파일확장자
				String q_img_name = uuids + q_img_ext; //변경해서 저장할 파일명
				
				System.out.println("uuid"+uuid);
				System.out.println("사진리얼네임"+fileRealName);
				System.out.println("q_img_ext"+q_img_ext);
				System.out.println("q_img_name"+q_img_name);
				
				//3 업로드
				File saveFile = new File(q_uploadpath + "\\" + q_img_name);
				file.transferTo(saveFile); //spring의 파일 업로드메서드
				
				//4 DB에 insert작업
	//			QnaVO vo = new QnaVO(0, writer, uploadPath, fileLoca, fileName, fileRealName, content, null);
				QnaVO vo2 = new QnaVO(0, pno, uno, 0, b_history, q_title, q_content, q_img_name, q_img_ext, q_uploadpath, q_fileloca, null);
				vo2.setUser_id(user_id);
				System.out.println("vo2:"+vo2.toString());
				boolean result = QnaBoardService.registA(vo2); //업로드메서드
				
				System.out.println("결과!!:"+result);
				
				if(result) {
					RA.addFlashAttribute("msg", "게시물이 정상적으로 등록되었습니다");
					return "redirect:/productList/productDetail?pno="+pno+"#qna-point";
					
				} else {
					
					return "redirect:/productList/productDetail?pno="+pno+"#qna-point";
					//return "fail";
				}
				
			} catch (Exception e) {
				System.out.println("업로드중 에러발생" + e.getMessage());
				return "fail";
			}
			
		}else {
			System.out.println("파일없는쪽으로 왔어!!");
			QnaVO vo = new QnaVO();
			vo.setB_history(b_history);
			vo.setUser_id(user_id);
			vo.setPno(pno);
			vo.setQ_content(q_content);
			vo.setQ_title(q_title);
			vo.setUno(uno);
			System.out.println("파일없는거에서 뭐받나 보자"+vo.toString());
			QnaBoardService.registB(vo);
			RA.addFlashAttribute("msg", "게시물이 정상적으로 등록되었습니다");
			System.out.println("여기까진왔니?");
			return "redirect:/productList/productDetail?pno="+pno+"#qna-point";
		} 
		
		//서비스의 regist메서드를 생성하고, mapper에 regist메서드를 생성한 후에
		//마이바티스 xml에서 db에 insert처리
		//QnaBoardService.regist(vo2);
		
		//리다이렉트시에 1회성 소멸데이터로 리다이렉트시 한번만 사용하고 싶을때
		//RA.addFlashAttribute("msg", "게시물이 정상적으로 등록되었습니다");
		//System.out.println("여기까진왔니?");
		//다시 컨트롤러를 태워서 보냄 redirect:/ 
		//return "redirect:/qna/qnaList";
	}

	// 상세화면
	@RequestMapping(value = "/qnaDetail")
	public String reviewDetail(@RequestParam("qna_no") int qna_no, Model model) {
		
		QnaVO vo = QnaBoardService.detail(qna_no);
		
		System.out.println(vo.toString());
		
		model.addAttribute("qnaVO", vo);

		return "qna/qnaDetail";

	}

	// 수정화면
	@RequestMapping(value = "/qnaModify")
	public String qnaModify(@RequestParam("qna_no") int qna_no, Model model) {

		QnaVO vo = QnaBoardService.detail(qna_no);
		model.addAttribute("qnaVO", vo);

		return "qna/qnaModify";
	}
	


	// 상품 수정
	
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(@RequestParam("file") MultipartFile file,
			 				@RequestParam("pno") int pno,
			 				@RequestParam("uno") int uno,
			 				@RequestParam("qna_no") int qna_no,
			 				@RequestParam("b_history") String b_history,
			 				@RequestParam("q_title") String q_title,
			 				@RequestParam("q_content") String q_content,
			 				@RequestParam("user_id") String user_id, RedirectAttributes RA) throws Exception {
		//logger.info("post goods modify");
		
		QnaVO vo = new QnaVO();
		vo.setB_history(b_history);
		vo.setUser_id(user_id);
		vo.setPno(pno);
		vo.setQ_content(q_content);
		vo.setQ_title(q_title);
		vo.setUno(uno);
		vo.setQna_no(qna_no);
		
		
		// 새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			//new File(vo.getQ_uploadpath() + req.getParameter("gdsImg")).delete();
			//new File(vo.getQ_uploadpath() + req.getParameter("gdsThumbImg")).delete();
			
			
			/*
			QnaVO vo = new QnaVO();
			vo.setB_history(b_history);
			vo.setUser_id(user_id);
			vo.setPno(pno);
			vo.setQ_content(q_content);
			vo.setQ_title(q_title);
			vo.setUno(uno);
			vo.setQna_no(qna_no);
			*/

			QnaVO oldvo = QnaBoardService.getInfo(qna_no);
			
			File oldfile=new File(oldvo.getQ_uploadpath()+"\\"+oldvo.getQ_img_name());
			
			//System.out.println("★★★★★이걸봐:"+oldvo.getQ_uploadpath()+oldvo.getQ_img_name());
			
			if( oldfile.exists() ){
				if(oldfile.delete()){ 
					System.out.println("파일삭제 성공"); 
					
				}else{ System.out.println("파일삭제 실패"); } 
				
			}else{ System.out.println("파일이 존재하지 않습니다."); 
			}

			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String q_fileloca = sdf.format(date);
			String q_uploadpath = "F:\\KJH_GITHUB\\tmp\\TeamDobby\\upload\\qna\\"+ q_fileloca;
			
			File folder = new File(q_uploadpath);
			if( !folder.exists()) {
				folder.mkdir(); //폴더생성
			}
//			String writer = (String)session.getAttribute("uno");
			
			//파일명변경 ex)238b0dc88dad4f489050ce00326f5cf2.jpg
			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-", "");
		
			String fileRealName = file.getOriginalFilename();//실제파일명
			long size = file.getSize(); //파일크기 
			String q_img_ext = fileRealName.substring( fileRealName.lastIndexOf(".")  , fileRealName.length());//파일확장자
			String q_img_name = uuids + q_img_ext; //변경해서 저장할 파일명
			
			System.out.println("uuid"+uuid);
			System.out.println("사진리얼네임"+fileRealName);
			System.out.println("q_img_ext"+q_img_ext);
			System.out.println("q_img_name"+q_img_name);
			
			//3 업로드
			File saveFile = new File(q_uploadpath + "\\" + q_img_name);
			file.transferTo(saveFile); //spring의 파일 업로드메서드
			
			vo.setQ_img_name(q_img_name);
			vo.setQ_img_ext(q_img_ext);
			vo.setQ_uploadpath(q_uploadpath);
			vo.setQ_fileloca(q_fileloca);
			
			
			//4 DB에 insert작업
//			QnaVO vo = new QnaVO(0, writer, uploadPath, fileLoca, fileName, fileRealName, content, null);
			QnaVO vo2 = new QnaVO(qna_no, pno, uno, 0, b_history, q_title, q_content, q_img_name, q_img_ext, q_uploadpath, q_fileloca, null);
			vo2.setUser_id(user_id);
			System.out.println("vo2:"+vo2.toString());//업로드메서드
			boolean result = QnaBoardService.updateA(vo2);
			
			
			System.out.println("결과!!:"+result);
			
			

			if(result) {
				RA.addFlashAttribute("msg", "게시물이 정상적으로 수정되었습니다");
				return "redirect:/productList/productDetail?pno="+pno+"#qna-point";
				
			} else {
				
				return "redirect:/productList/productDetail?pno="+pno+"#qna-point";
				//return "fail";
			}
			
			
		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
//			vo.setGdsImg(req.getParameter("gdsImg"));
//			vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
			
			System.out.println("파일없는쪽으로 왔어!!");
			/*
			QnaVO vo = new QnaVO();
			vo.setB_history(b_history);
			vo.setUser_id(user_id);
			vo.setPno(pno);
			vo.setQ_content(q_content);
			vo.setQ_title(q_title);
			vo.setUno(uno);
			*/
			System.out.println("파일없는거에서 뭐받나 보자"+vo.toString());
			QnaBoardService.updateB(vo);
			RA.addFlashAttribute("msg", "게시물이 정상적으로 수정되었습니다");
			System.out.println("여기까진왔니?");
			return "redirect:/productList/productDetail?pno="+pno+"#qna-point";
		
		}
		
	}
	
	//----------------------------------------------------------------------------
	
	
	// 화면삭제 기능
	@RequestMapping("/qnaDelete")
	public String qnaDelete(@RequestParam("qna_no") int qna_no,
							RedirectAttributes RA) {

		QnaVO oldvo = QnaBoardService.getInfo(qna_no);
		
		File oldfile=new File(oldvo.getQ_uploadpath()+"\\"+oldvo.getQ_img_name());
		
		System.out.println("★★★★★이걸봐:"+oldvo.getQ_uploadpath()+oldvo.getQ_img_name());
		
		if( oldfile.exists() ){
			if(oldfile.delete()){ 
				System.out.println("파일삭제 성공"); 
				
			}else{ System.out.println("파일삭제 실패"); } 
			
		}else{ System.out.println("파일이 존재하지 않습니다."); 
		}
		
		QnaVO vo = QnaBoardService.getInfo(qna_no);
		int pno= vo.getPno();
		
		boolean result = QnaBoardService.delete(qna_no);
		
		if (result) {
			RA.addFlashAttribute("msg", "게시물이 삭제 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "게시물 삭제에 실패했습니다");
		}
		return "redirect:/productList/productDetail?pno="+pno+"#qna-point";
		//return "redirect:/qna/qnaList";
	}
	
	@RequestMapping(value="getPno/{qno}/")
	@ResponseBody
	public QnaVO getPno(@PathVariable("qno") int qno) {
		return QnaBoardService.getPno(qno);
	}
	
	@RequestMapping(value="view")
	@ResponseBody
	public byte[] view(@RequestParam("fileLoca") String fileLoca,
					   @RequestParam("fileName") String fileName) {
		File file = new File("F:\\KJH_GITHUB\\tmp\\TeamDobby\\upload\\qna\\"+fileLoca+"\\"+fileName);
		
		byte[] result = null;
		try {
			result = FileCopyUtils.copyToByteArray(file);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
