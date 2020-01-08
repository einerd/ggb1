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
	public boolean update(ReviewVO vo) {
	
		return reviewMapper.update(vo);
	}
	
	
	@Override
	public boolean delete(int review_no) {
		
		return reviewMapper.delete(review_no);
	}

	@Override
	public boolean upload(ReviewVO vo) {
		
		return reviewMapper.upload(vo);
	}

	@Override
	public ReviewVO getPno(int rno) {
		// TODO Auto-generated method stub
		return reviewMapper.getPno(rno);
	}

	

	

	

	
}
