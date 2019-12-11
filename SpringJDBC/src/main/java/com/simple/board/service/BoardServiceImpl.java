package com.simple.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.simple.board.dao.BoardDAO;
import com.simple.board.mapper.BoardMapper;
import com.simple.command.BoardVO;

@Service("boardSer")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper bMapper;
	
	@Override
	public void register(BoardVO vo) {
		bMapper.boardInsert(vo);
		System.out.println(vo.getWriter());
	}

	@Override
	public ArrayList<BoardVO> getList() {
		ArrayList<BoardVO> list = bMapper.boardSelect();
		return list;
	}

	@Override
	public void delete(int num) {
		int result = bMapper.boardDelete(num);
		System.out.println("삭제 여부 : "+result);
	}
	
//	@Autowired
//	@Qualifier("bDAO")
//	private BoardDAO bDAO;
//	
//	@Override
//	public void register(BoardVO vo) {
//		bDAO.boardInsert(vo);
//	}
//
//	@Override
//	public ArrayList<BoardVO> getList() {
//		return bDAO.boardSelect();
//	}
//
//	@Override
//	public void delete(int num) {
//		bDAO.boardDelete(num);
//	}

}
