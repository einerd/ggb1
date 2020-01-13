package com.dobby.free.list.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobby.free.command.AddressVO;
import com.dobby.free.command.ProductDetailVO;
import com.dobby.free.command.UserVO;
import com.dobby.free.list.mapper.ListMapper;
import com.dobby.free.util.Criteria;

@Service
public class ListServiceImpl implements ListService {

	@Autowired
	private ListMapper listMapper;
	// 상품리스트
	@Override
	public ArrayList<ProductDetailVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return listMapper.getList(cri);
	}
	// 장바구니 넣기
	@Override
	public int insertCart(ProductDetailVO vo, int uno, int stock) {
		// TODO Auto-generated method stub
		return listMapper.insertCart(vo, uno, stock);
	}
	// 개별상품정보 긁기
	@Override
	public ProductDetailVO searchProductInfo(int pno) {
		// TODO Auto-generated method stub
		return listMapper.searchProductInfo(pno);
	}
	// 장바구니리스트 긁어오기
	@Override
	public ArrayList<ProductDetailVO> getBasketList(int uno) {
		// TODO Auto-generated method stub
		return listMapper.getBasketList(uno);
	}
	// 장바구니에서 삭제
	@Override
	public int delInBasketList(int pno, int uno) {
		// TODO Auto-generated method stub
		return listMapper.delInBasketList(pno, uno);
	}
	// 장바구니 -> 결제페이지 이동시 장바구니 리스트 최종 업데이트
	@Override
	public int updateBasketList(int pno, int p_b_quantity, int uno) {
		// TODO Auto-generated method stub
		return listMapper.updateBasketList(pno, p_b_quantity, uno);
	}
	// 회원정보 불러오기 ( 주소 테이블 연관)
	@Override
	public UserVO getCustomerInfo(int uno) {
		// TODO Auto-generated method stub
		return listMapper.getCustomerInfo(uno);
	}
	// 장바구니에 이미 있는 상품인지 확인
	@Override
	public int searchBasketListAlrdy(int uno, int pno) {
		// TODO Auto-generated method stub
		return listMapper.searchBasketListAlrdy(uno, pno);
	}
	// 게시글 수 카운트
	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return listMapper.getTotal(cri);
	}
	// 검색과 같이 동작하는 게시글 수 카운트
	@Override
	public int getCount(HashMap<String, String> map, Criteria cri) {
		// TODO Auto-generated method stub
		return listMapper.getCount(map, cri);
	}
	// 결제완료시 주문테이블에 업데이트
	@Override
	public int purchaseSubmit(ProductDetailVO vo, int uno) {
		// TODO Auto-generated method stub
		return listMapper.purchaseSubmit(vo, uno);
	}
	// 주문테이블에서 구매내역 가져오기
	@Override
	public ArrayList<ProductDetailVO> getMyHistoryList(int uno, Criteria cri) {
		// TODO Auto-generated method stub
		return listMapper.getMyHistoryList(uno, cri);
	}
	// 마지막으로 사용했던 주소 가져오기
	@Override
	public AddressVO getLastAddress(int uno) {
		// TODO Auto-generated method stub
		return listMapper.getLastAddress(uno);
	}
	// 신규 주소 입력시 마지막으로 사용했던 주소 덮어쓰기
	@Override
	public int updateLastAddress(AddressVO addVO, int uno) {
		// TODO Auto-generated method stub
		return listMapper.updateLastAddress(addVO, uno);
	}
	// 주소테이블에 신규등록한 주소가 있는지 확인
	@Override
	public int searchSubAddress(int uno) {
		// TODO Auto-generated method stub
		return listMapper.searchSubAddress(uno);
	}
	// 주소테이블에 신규 주소 인서트
	@Override
	public int insertSubAddress(AddressVO addVO, int uno) {
		// TODO Auto-generated method stub
		return listMapper.insertSubAddress(addVO, uno);
	}
	@Override
	public int checkProduct(int pno) {
		// TODO Auto-generated method stub
		return listMapper.checkProduct(pno);
	}

}
