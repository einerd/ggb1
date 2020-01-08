package com.dobby.free.list.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.dobby.free.command.AddressVO;
import com.dobby.free.command.ProductDetailVO;
import com.dobby.free.command.UserVO;
import com.dobby.free.util.Criteria;

public interface ListService {
	
	// 상품 전체 불러오기
	public ArrayList<ProductDetailVO> getList(Criteria cri);
	// 장바구니 상품 리스트 불러오기
	public ArrayList<ProductDetailVO> getBasketList(int uno);
	// 장바구니 인서트
	public int insertCart(ProductDetailVO vo, int uno, int stock);
	// 개별상품정보
	public ProductDetailVO searchProductInfo(int pno);
	// 장바구니 삭제
	public int delInBasketList(int pno, int uno);
	// 장바구니 업데이트 (장바구니에서 결제페이지 이동시)
	public int updateBasketList(int pno, int p_b_quantity, int uno);
	// 고객정보 불러오기 ( 주소 불러올 때 )
	public UserVO getCustomerInfo(int uno);
	// 장바구니에 이미 있는지 없는지 확인
	public int searchBasketListAlrdy(int uno, int pno);
	// 게시글 수
	public int getTotal(Criteria cri);
	// 게시글 수 2 ( 검색시 동적쿼리로 동작 )
	public int getCount(HashMap<String, String> map, Criteria cri);
	// 결제완료시 구매내역 테이블 업데이트
	public int purchaseSubmit(ProductDetailVO vo, int uno);
	// 구매내역 불러오기
	public ArrayList<ProductDetailVO> getMyHistoryList(int uno);
	// 이전주소 불러오기 (주소 테이블)
	public AddressVO getLastAddress(int uno);
	// 신규주소 입력 시 이전주소 덮어쓰기
	public int updateLastAddress(AddressVO addVO, int uno);
	// 신규주소 있는지 확인 (주소테이블 확인)
	public int searchSubAddress(int uno);
	// 주소테이블 인서트
	public int insertSubAddress(AddressVO addVO, int uno);
	
}
