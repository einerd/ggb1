package com.dobby.free.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dobby.free.command.AddressVO;
import com.dobby.free.command.ProductDetailVO;
import com.dobby.free.command.QnaVO;
import com.dobby.free.command.ReviewVO;
import com.dobby.free.command.UserVO;
import com.dobby.free.list.service.ListService;
import com.dobby.free.qna.service.QnaBoardService;
import com.dobby.free.review.service.ReviewService;
import com.dobby.free.util.Criteria;
import com.dobby.free.util.PageVO;

@Controller
@RequestMapping(value="/productList")
public class ListController {

	@Autowired
	private ListService listService;
	
	@Autowired
	@Qualifier("reviewService")
	private ReviewService reviewService;
	
	@Autowired
	@Qualifier("QnaBoardService")
	private QnaBoardService QnaBoardService;
	
	
	// 크게보기 / 작게보기 리스트 이동
	@RequestMapping(value="/productList_?")
	public String productList_A(String pageNum, String mode,
								Model model, Criteria cri,
								HttpServletRequest request) {
		System.out.println("------------------------");
		System.out.println("넘어온 패스: " + request.getSession().getAttribute("path"));
		
		if(request.getRequestURI().contains("A")) request.getSession().setAttribute("path", "A");
		else if(request.getRequestURI().contains("B")) request.getSession().setAttribute("path", "B");
		
		System.out.println("바뀐 패스: " + request.getSession().getAttribute("path"));
		String path = (String)request.getSession().getAttribute("path");
		String searchName = (String)request.getSession().getAttribute("searchName");
		String searchType = (String)request.getSession().getAttribute("searchType");
		System.out.println("넘어온 모드: " + mode);
		if(mode == null) mode = (String)request.getSession().getAttribute("mode");
		System.out.println("바뀐 모드: " + mode);
		boolean bool = true;
		if(pageNum != null) {
			int page = Integer.parseInt(pageNum);
			if(path.equals("A")) {
				cri.setAmount(4);
				if((!mode.equals("A")) && (mode != null)) {
					page = (page * 2) - 1;
					request.getSession().setAttribute("mode", "B");
				}
				bool = false;
			}else if(path.equals("B")){
				cri.setAmount(8);
				if((!mode.equals("B")) && (mode != null)) {
					page -= (page / 2);
					request.getSession().setAttribute("mode", "A");
				}
				bool = false;
			}
			cri.setPageNum(page);
		}
		if(bool) {
			path = "A";
			request.getSession().setAttribute("path", "A");
			cri.setAmount(4);
		}
		System.out.println("네임:" + searchName);
		System.out.println("타입:" + searchType);
		if(searchName != null) cri.setSearchName(searchName);
		if(searchType != null) cri.setSearchType(searchType);
		HashMap<String, String> map = new HashMap<>();
		map.put("key", "productList");
		ArrayList<ProductDetailVO> list = listService.getList(cri);
		System.out.println("리스트: " + list);
		int total = listService.getTotal(cri);
		model.addAttribute("pageVO", new PageVO(cri, total));
		model.addAttribute("list", list);
		model.addAttribute("total", listService.getCount(map, cri));
		return "productList/productList_"+path;
	}
	
	
	// 장바구니 리스트 이동
	@RequestMapping(value="/basketList")
	public String basketList(HttpServletRequest request,
							 Model model,
							 RedirectAttributes RA,
							 Criteria cri) {
		String user_id = (String)request.getSession().getAttribute("user_id");
		if(user_id == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			return "redirect:/";
		}
		HashMap<String, String> map = new HashMap<>();
		map.put("key", "basket");
		int uno = (int)request.getSession().getAttribute("uno");
		model.addAttribute("list", listService.getBasketList(uno));
		model.addAttribute("total", listService.getCount(map, cri));
		System.out.println("장바구니 이동");
		return "productList/basketList";
	}
	
	// 구매내역 리스트 이동
	@RequestMapping(value="/purchaseHistory")
	public String purchaseHistory(HttpServletRequest request,
								  Model model,
								  RedirectAttributes RA,
								  Criteria cri) {
		String user_id = (String)request.getSession().getAttribute("user_id");
		if(user_id == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			return "redirect:/";
		}
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("key", "p_history");
		int uno = (int)request.getSession().getAttribute("uno");
		model.addAttribute("total", listService.getCount(map, cri));
		model.addAttribute("list", listService.getMyHistoryList(uno));
		return "productList/purchaseHistory";
	}
	
	// 상세보기에서 바로 구매하였을 시 (장바구니를 안거쳤을 때)
	@RequestMapping(value="/purchaseDirectly")
	public String purchaseDirectly(@RequestParam("pno") int pno,
								   @RequestParam("stock") int stock,
								   AddressVO addVO,
								   HttpServletRequest request,
								   RedirectAttributes RA) {
		String user_id = (String)request.getSession().getAttribute("user_id");
		if(user_id == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			return "redirect:/";
		}
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("key", "p_history");
		
		int uno = (int)request.getSession().getAttribute("uno");
		if(!(addVO.getPost_name() == null)) {
			addVO.setUno(uno);
			int tmp = listService.searchSubAddress(uno);
			if(tmp == 0) {
				listService.insertSubAddress(addVO, uno);
			}else {
				listService.updateLastAddress(addVO, uno);
			}
		}
		
		ProductDetailVO vo = listService.searchProductInfo(pno);
		vo.setP_b_quantity(stock);
		listService.purchaseSubmit(vo, uno);
		request.getSession().removeAttribute("pass");
		RA.addFlashAttribute("msg", "구매 완료!!");
		
		return "redirect:/productList/purchaseHistory";
	}
	
	
	// 결제화면에서 -> 구매내역 등록 후 장바구니에서 삭제하고 구매내역 페이지로 이동
	@RequestMapping(value="/purchaseSubmit")
	public String purchaseSubmit(AddressVO addVO,
								 HttpServletRequest request,
								 Model model,
								 RedirectAttributes RA) {
		String user_id = (String)request.getSession().getAttribute("user_id");
		if(user_id == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			return "redirect:/";
		}
		int uno = (int)request.getSession().getAttribute("uno");
		if(!(addVO.getPost_name() == null)) {
			addVO.setUno(uno);
			int tmp = listService.searchSubAddress(uno);
			if(tmp == 0) {
				listService.insertSubAddress(addVO, uno);
			}else {
				listService.updateLastAddress(addVO, uno);
			}
		}
		
		ArrayList<ProductDetailVO> list = listService.getBasketList(uno);
		
		for(ProductDetailVO vo : list) {
			System.out.println(vo.toString());
			listService.purchaseSubmit(vo, uno);
			int tmp = listService.delInBasketList(vo.getPno(), uno);
			System.out.println("삭제여부: " + tmp);
		}
		RA.addFlashAttribute("msg", "구매 완료!!");
		return "redirect:/productList/purchaseHistory";
	}
	
	// 결제화면 이동
	@RequestMapping(value="/paymentPage")
	public String paymentPage(HttpServletRequest request,
							  Model model,
							  RedirectAttributes RA) {
		String user_id = (String)request.getSession().getAttribute("user_id");
		if(user_id == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			return "redirect:/";
		}
		int uno = (int)request.getSession().getAttribute("uno");
		UserVO vo = listService.getCustomerInfo(uno);
		model.addAttribute("UserVO", vo);
		AddressVO addVO = listService.getLastAddress(uno);
		model.addAttribute("addVO", addVO);
		model.addAttribute("list", listService.getBasketList(uno));
		return "productList/paymentPage";
	}
	
	// 상품정보 긁어오기 + 장바구니 인서트
	@RequestMapping(value="/insertCart")
	public String insertCart(@RequestParam("pageNum") int pageNum,
							 @RequestParam("pno") int pno,
							 @RequestParam("stock") int stock,
							 HttpServletRequest request,
							 Model model, String mode,
							 RedirectAttributes RA) {
		String user_id = (String)request.getSession().getAttribute("user_id");
		String path = (String)request.getSession().getAttribute("path");
		System.out.println("전달된 패스: " + path);
		System.out.println("전달된 모드: " + (String)request.getSession().getAttribute("mode"));
		if(user_id == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			return "redirect:/";
		}
		int uno = (int)request.getSession().getAttribute("uno");
		int tmp = listService.searchBasketListAlrdy(uno, pno);
		if(tmp == 0) {
			ProductDetailVO vo = listService.searchProductInfo(pno);
			int result = listService.insertCart(vo, uno, stock);
			if(result == 1) {
				RA.addFlashAttribute("msg", "장바구니에 추가되었습니다");
				return "redirect:/productList/productList_"+path+"?pageNum="+pageNum+"&mode="+mode;
			}
		}
		RA.addFlashAttribute("msg", "해당상품은 이미 장바구니에 존재합니다");
		return "redirect:/productList/productList_"+path+"?pageNum="+pageNum+"&mode="+mode;
	}
	
	// 제품 상세화면에서 장바구니 인서트
	@RequestMapping(value="/insertBasket")
	public String insertBasket(@RequestParam("pno") int pno,
							   @RequestParam("stock") int stock,
							   HttpServletRequest request,
							   RedirectAttributes RA) {
		String user_id = (String)request.getSession().getAttribute("user_id");
		if(user_id == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			return "redirect:/";
		}
		int uno = (int)request.getSession().getAttribute("uno");
		int tmp = listService.searchBasketListAlrdy(uno, pno);
		if(tmp == 0) {
			ProductDetailVO vo = listService.searchProductInfo(pno);
			int result = listService.insertCart(vo, uno, stock);
			if(result == 1) {
				RA.addFlashAttribute("msg", "장바구니에 추가되었습니다");
				return "redirect:/productList/productDetail?pno="+pno;
			}
		}
		RA.addFlashAttribute("msg", "해당상품은 이미 장바구니에 존재합니다");
		return "redirect:/productList/productDetail?pno="+pno;
	}
	
	// 제품 상세화면에서 바로 구매하기 이동
	@RequestMapping(value="/paymentDirectly")
	public String paymentDirectly(@RequestParam("pno") int pno,
								  @RequestParam("stock") int stock,
								  HttpServletRequest request,
								  Model model,
								  RedirectAttributes RA) {
		String user_id = (String)request.getSession().getAttribute("user_id");
		if(user_id == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			return "redirect:/";
		}
		ProductDetailVO vo = listService.searchProductInfo(pno);
		vo.setP_b_quantity(stock);
		ArrayList<ProductDetailVO> list = new ArrayList<ProductDetailVO>();
		list.add(vo);
		int uno = (int)request.getSession().getAttribute("uno");
		request.getSession().setAttribute("pass", "direct");
		UserVO tmp = listService.getCustomerInfo(uno);
		model.addAttribute("UserVO", tmp);
		AddressVO addVO = listService.getLastAddress(uno);
		model.addAttribute("addVO", addVO);
		model.addAttribute("list", list);
		return "productList/paymentPage";
	}
	
	// 장바구니에서 상품 삭제
	@RequestMapping(value="/delInBasketList")
	public String delInBasketList(@RequestParam("pno") int pno,
								  HttpServletRequest request,
								  RedirectAttributes RA) {
		String user_id = (String)request.getSession().getAttribute("user_id");
		if(user_id == null) {
			RA.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			return "redirect:/";
		}
		int uno = (int)request.getSession().getAttribute("uno");
		listService.delInBasketList(pno, uno);
		return "redirect:/productList/basketList";
	}
	
	// 장바구니에서 최종결제페이지로 이동하면서 물품 구매갯수 업데이트
	@RequestMapping(value="/updateBasketList")
	@ResponseBody
	public int updateBasketList(@RequestBody ArrayList<ProductDetailVO> list,
								HttpServletRequest request) {
		int uno = (int)request.getSession().getAttribute("uno");
		System.out.println(list.toString());
		for(ProductDetailVO vo : list) {
			listService.updateBasketList(vo.getPno(), vo.getP_b_quantity(), uno);
		}
		return 1;
	}
	
	// 제품 상세보기 이동
	@RequestMapping(value="/productDetail")
	public String productDetail(@RequestParam("pno") int pno,
								@RequestParam(value="path", required=false) String path,
								@RequestParam(value="startDate", required=false) Timestamp startDate,
								@RequestParam(value="endDate", required=false) Timestamp endDate,
								Model model, Criteria cri) {
		if(path == null) path = "";
		
		System.out.println("스타트데이트: " + startDate);
		System.out.println("엔드데이트: " + endDate);
		System.out.println("패스: " + path);
		int total1 = reviewService.getTotal(startDate, endDate, pno);
		int total2 = QnaBoardService.getTotal(startDate, endDate, pno);
		PageVO pageVO1 = new PageVO(cri, total1);
		PageVO pageVO2 = new PageVO(cri, total2);
		ArrayList<ReviewVO> list = reviewService.getList(cri, pno, startDate, endDate);
		ArrayList<QnaVO> list2 = QnaBoardService.getList(cri, pno, startDate, endDate);
		
		if(path.equals("review")) {
			pageVO1 = new PageVO(cri, total1);
			pageVO2.setPageNum(1);
			list2 = QnaBoardService.getList(new Criteria(), pno, startDate, endDate);
		}else if(path.equals("qna")) {
			pageVO1.setPageNum(1);
			pageVO2 = new PageVO(cri, total2);
			list = reviewService.getList(new Criteria(), pno, startDate, endDate);
		}
		
		ProductDetailVO vo = listService.searchProductInfo(pno);
		
		model.addAttribute("pageVO1", pageVO1);
		model.addAttribute("pageVO2", pageVO2);
		
		model.addAttribute("review", list); // 리뷰게시글 정보
		model.addAttribute("QnaList", list2);// qna게시글 정보
		model.addAttribute("vo", vo); // 상품정보
		return "productList/productDetail";
	}
	
	@RequestMapping(value="checkProduct/{pno}")
	@ResponseBody
	public int checkProduct(@PathVariable("pno") int pno) {
		int result = listService.checkProduct(pno);
		return result;
	}
}
