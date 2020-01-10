package com.dobby.free.user.mapper;

import java.util.ArrayList;

import com.dobby.free.command.QnaVO;
import com.dobby.free.command.ReviewVO;
import com.dobby.free.command.UserVO;

public interface UserMapper {

	public UserVO login(UserVO vo); //로그인
	public int idConfirm(UserVO vo); //중복체크
	public int join(UserVO vo); //회원가입
	public UserVO getInfo(String user_id); //마이페이지 유저정보
	public int update(UserVO vo); //마이페이지 업데이트
	public ArrayList<QnaVO> getUserQnaList(int uno);
	public ArrayList<ReviewVO> getUserReviewList(int uno);

}
