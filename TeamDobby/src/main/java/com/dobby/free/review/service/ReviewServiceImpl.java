package com.dobby.free.review.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobby.free.command.ReviewVO;
import com.dobby.free.review.mapper.ReviewMapper;
import com.dobby.free.util.Criteria;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewMapper reviewMapper;

	//등록하기
	@Override
	public void regist(ReviewVO vo) {
		
		reviewMapper.regist(vo);
	}
	
	//목록불러오기
	@Override
	public ArrayList<ReviewVO> getList(Criteria cri, int pno) {
		
		return reviewMapper.getList(cri, pno);
	}
	
	@Override
	public int getTotal() {
		
		return reviewMapper.getTotal();
	}


	@Override
	public ReviewVO detail(int review_no) {
		
		return reviewMapper.detail(review_no);
	}


	@Override
	public boolean update_a(ReviewVO vo) {
	
		return reviewMapper.update_a(vo);
	}
	
	@Override
	public boolean update_b(ReviewVO vo) {
		
		return reviewMapper.update_b(vo);
	}
	
	@Override
	public boolean delete(int review_no) {
		
		return reviewMapper.delete(review_no);
	}

	@Override
	public boolean upload_a(ReviewVO vo) {
		
		return reviewMapper.upload_a(vo);
	}
	
	@Override
	public boolean upload_b(ReviewVO vo) {
		
		return reviewMapper.upload_b(vo);
	}

	@Override
	public ReviewVO getPno(int rno) {
		
		return reviewMapper.getPno(rno);
	}

	@Override
	public ReviewVO fileList(int review_no) {
		
		return reviewMapper.fileList(review_no);
	}

	@Override
	public boolean fileNull(int review_no) {
		
		return reviewMapper.fileNull(review_no);
	}


	
}
