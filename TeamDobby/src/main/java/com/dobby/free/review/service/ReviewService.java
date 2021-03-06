package com.dobby.free.review.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.dobby.free.command.ReviewVO;
import com.dobby.free.util.Criteria;

public interface ReviewService {
	
	public void regist(ReviewVO vo); //등록하기
	public ArrayList<ReviewVO> getList(Criteria cri, int pno, Timestamp startDate, Timestamp endDate); //목록 불러오기
	public int getTotal(Timestamp startDate, Timestamp endDate, int pno); //페이징 전체 게시글 수
	public ReviewVO detail(int review_no); //상세, 수정
	public boolean update_a(ReviewVO vo); //업데이트 (파일 있는 경우)
	public boolean update_b(ReviewVO vo); //업데이트 (파일 없는 경우)
	public boolean delete(int review_no); //삭제
	public boolean upload_a(ReviewVO vo); //업로드 (파일 있는 경우)
	public boolean upload_b(ReviewVO vo); //업로드 (파일 없는 경우)
	public boolean fileNull(int review_no); //업로드(파일 없는 경우, 파일을 null값으로 변환)
	public ReviewVO getPno(int rno); // 목록 돌아가기 위해 필요한 pno
	public ReviewVO fileList(int review_no); //파일리스트 가져오기
	
}
