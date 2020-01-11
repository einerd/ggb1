package com.dobby.free.review.mapper;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.dobby.free.command.ReviewVO;
import com.dobby.free.util.Criteria;

public interface ReviewMapper {

	public void regist(ReviewVO vo); //등록하기
	public ArrayList<ReviewVO> getList(@Param("cri") Criteria cri, @Param("pno") int pno, 
									   @Param("startDate") Timestamp startDate, 
									   @Param("endDate") Timestamp endDate); //목록 불러오기
	public int getTotal(@Param("startDate") Timestamp startDate,
						@Param("endDate") Timestamp endDate,
						@Param("pno") int pno); //페이징 전체 게시글 수
	public ReviewVO detail(int review_no); //상세, 수정 화면보기
	public boolean update_a(ReviewVO vo); //업데이트 기능
	public boolean update_b(ReviewVO vo); //업데이트 기능
	public boolean delete(int review_no); //삭제 기능
	public boolean upload_a(ReviewVO vo); //업로드 (파일 있는 경우) 기능
	public boolean upload_b(ReviewVO vo); //업로드 (파일 없는 경우) 기능
	public ReviewVO getPno(int rno); //pno 가져오기
	public ReviewVO fileList(int review_no); //파일리스트 가져오기 기능
	
	public boolean fileNull(int review_no); 
}
