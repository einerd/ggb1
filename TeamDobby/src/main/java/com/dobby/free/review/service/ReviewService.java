package com.dobby.free.review.service;

import java.util.ArrayList;

import com.dobby.free.command.ReviewVO;
import com.dobby.free.util.Criteria;

public interface ReviewService {
	
	public void regist(ReviewVO vo); //등록하기
	public ArrayList<ReviewVO> getList(Criteria cri, int pno); //목록 불러오기
	public int getTotal(); //페이징 전체 게시글 수
	public ReviewVO detail(int review_no); //상세, 수정
	public boolean update(ReviewVO vo); //업데이트
	public boolean delete(int review_no); //삭제
	public boolean upload(ReviewVO vo); //업로드
	public ReviewVO getPno(int rno); // 목록 돌아가기 위해 필요한 pno
	
}
