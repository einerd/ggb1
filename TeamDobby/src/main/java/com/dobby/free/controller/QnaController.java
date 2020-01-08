package com.dobby.free.controller;

import java.io.File;
import java.text.SimpleDateFormat;
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

import com.dobby.free.command.ProductDetailVO;
import com.dobby.free.command.QnaVO;
import com.dobby.free.list.service.ListService;
import com.dobby.free.qna.service.QnaBoardService;

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
							Model model) {
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
				String q_uploadpath = "F:\\KJH_PROJECT\\workspace\\TeamDobby\\src\\main\\webapp\\resources\\img\\qna\\"+ q_fileloca;
				
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
	
	
	
	
	
	
	
	// 화면수정 기능
	@RequestMapping(value = "/qnaUpdate")
	public String qnaUpdate(@RequestParam("file") MultipartFile file,
			 				@RequestParam("pno") int pno,
			 				@RequestParam("uno") int uno,
			 				@RequestParam("qna_no") int qno,
			 				@RequestParam("b_history") String b_history,
			 				@RequestParam("q_title") String q_title,
			 				@RequestParam("q_content") String q_content,
			 				@RequestParam("user_id") String user_id, RedirectAttributes RA) {
		QnaVO vo = new QnaVO();
		vo.setB_history(b_history);
		vo.setUser_id(user_id);
		vo.setPno(pno);
		vo.setQ_content(q_content);
		vo.setQ_title(q_title);
		vo.setUno(uno);
		vo.setQna_no(qno);
		boolean result = QnaBoardService.update(vo);

		if (result) {
			RA.addFlashAttribute("msg", "게시물이 수정되었습니다");
		} else {
			RA.addFlashAttribute("msg", "게시물 수정이 실패했습니다");
		}

		return "redirect:/productList/productDetail?pno="+pno+"#qna-point";

	}
	
	
	//----------------------------------------------------------------------------
	
	// 상품 수정
	/*
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(QnaVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		//logger.info("post goods modify");
		
		// 새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(vo.getQ_uploadpath() + req.getParameter("gdsImg")).delete();
			new File(vo.getQ_uploadpath() + req.getParameter("gdsThumbImg")).delete();
			
			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else {  // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setGdsImg(req.getParameter("gdsImg"));
		vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
		
		}
		
		adminService.goodsModify(vo);
		
		return "redirect:/admin/index";
	}
	*/
	//----------------------------------------------------------------------------
	
	
	// 화면삭제 기능
	@RequestMapping("/qnaDelete")
	public String qnaDelete(@RequestParam("qna_no") int qna_no, 
							@RequestParam("pno") int pno,
							RedirectAttributes RA) {

		boolean result = QnaBoardService.delete(qna_no);

		if (result) {
			RA.addFlashAttribute("msg", "게시물이 삭제 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "게시물 삭제에 실패했습니다");
		}

		return "redirect:/productList/productDetail?pno="+pno+"#qna-point";
	}
	
	@RequestMapping(value="getPno/{qno}/")
	@ResponseBody
	public QnaVO getPno(@PathVariable("qno") int qno) {
		return QnaBoardService.getPno(qno);
	}
	
}
