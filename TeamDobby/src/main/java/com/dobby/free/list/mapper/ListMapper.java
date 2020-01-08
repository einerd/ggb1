package com.dobby.free.list.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.dobby.free.command.AddressVO;
import com.dobby.free.command.ProductDetailVO;
import com.dobby.free.command.UserVO;
import com.dobby.free.util.Criteria;

public interface ListMapper {

	// 상품리스트 불러오기
	public ArrayList<ProductDetailVO> getList(Criteria cri);
	// 장바구니에 넣기 ( 상품리스트에서 바로 넣기 )
	public int insertCart(@Param("vo") ProductDetailVO vo,
						  @Param("uno") int uno,
						  @Param("stock") int stock);
	// 개별상품정보 불러오기
	public ProductDetailVO searchProductInfo(int pno);
	// 장바구니 리스트 불러오기
	public ArrayList<ProductDetailVO> getBasketList(int uno);
	// 장바구니에서 삭제
	public int delInBasketList(@Param("pno") int pno,
							   @Param("uno") int uno);
	// 장바구니 리스트 업데이트 (장바구니에서 결제하기 페이지로 이동시)
	public int updateBasketList(@Param("pno") int pno,
							    @Param("p_b_quantity") int p_b_quantity,
							    @Param("uno") int uno);
	// 회원정보 불러오기 ( 결제하기에서 주소정보 불러올때 쓰임)
	public UserVO getCustomerInfo(int uno);
	// 장바구니에 이미 있는 상품인지 확인
	public int searchBasketListAlrdy(@Param("uno") int uno, @Param("pno") int pno);
	// 게시글 수 카운트
	public int getTotal(Criteria cri);
	// 게시글 수 카운트 (각 테이블마다 동적쿼리로 동작)
	public int getCount(@Param("key") HashMap<String, String> map,
					    @Param("cri") Criteria cri);
	// 구매했을 시 주문 테이블에 추가
	public int purchaseSubmit(@Param("vo") ProductDetailVO vo,
							  @Param("uno") int uno);
	// 구매내역 리스트 불러오기
	public ArrayList<ProductDetailVO> getMyHistoryList(int uno);
	// 주소테이블에서 주소 불러오기
	public AddressVO getLastAddress(int uno);
	// 결제시 신규주소 입력하였을 때 신규주소 업데이트
	public int updateLastAddress(@Param("vo") AddressVO addVO,
								 @Param("uno") int uno);
	// 주소테이블에 입력된 주소가 있는지 검색
	public int searchSubAddress(int uno);
	// 주소테이블에 주소 추가
	public int insertSubAddress(@Param("vo") AddressVO addVO,
								@Param("uno") int uno);

}
