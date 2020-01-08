package com.dobby.free.review.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.dobby.free.command.ReviewVO;
import com.dobby.free.util.Criteria;

public interface ReviewMapper {

	public void regist(ReviewVO vo); //등록하기
	public ArrayList<ReviewVO> getList(@Param("cri") Criteria cri, @Param("pno") int pno); //목록 불러오기
	public int getTotal(); //페이징 전체 게시글 수
	public ReviewVO detail(int review_no); //상세, 수정
	public boolean update(ReviewVO vo); //업데이트
	public boolean delete(int review_no); //삭제
	public boolean upload(ReviewVO vo); //업로드
	public ReviewVO getPno(int rno);
}
