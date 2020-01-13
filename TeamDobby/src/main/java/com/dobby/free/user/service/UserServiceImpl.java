package com.dobby.free.user.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobby.free.command.QnaVO;
import com.dobby.free.command.ReviewVO;
import com.dobby.free.command.UserVO;
import com.dobby.free.user.mapper.UserMapper;
import com.dobby.free.util.Criteria;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserVO login(UserVO vo) {
		return userMapper.login(vo);
	}

	@Override
	public int idConfirm(UserVO vo) {
		return userMapper.idConfirm(vo);
	}
	
	@Override
	public int join(UserVO vo) {
		return userMapper.join(vo);
	}
	
	@Override
	public UserVO getInfo(String user_id) {
		return userMapper.getInfo(user_id);
	}
	
	@Override
	public int update(UserVO vo) {
		return userMapper.update(vo);
	}

	@Override
	public ArrayList<QnaVO> getUserQnaList(int uno, Criteria cri) {
		// TODO Auto-generated method stub
		return userMapper.getUserQnaList(uno, cri);
	}

	@Override
	public ArrayList<ReviewVO> getUserReviewList(int uno, Criteria cri) {
		// TODO Auto-generated method stub
		return userMapper.getUserReviewList(uno, cri);
	}

	@Override
	public int getTotalReview(int uno) {
		// TODO Auto-generated method stub
		return userMapper.getTotalReview(uno);
	}

	@Override
	public int getTotalQna(int uno) {
		// TODO Auto-generated method stub
		return userMapper.getTotalQna(uno);
	}

	
}
