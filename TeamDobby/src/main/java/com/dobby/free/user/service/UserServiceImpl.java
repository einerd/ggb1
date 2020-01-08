package com.dobby.free.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobby.free.command.UserVO;
import com.dobby.free.user.mapper.UserMapper;

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

	
}
