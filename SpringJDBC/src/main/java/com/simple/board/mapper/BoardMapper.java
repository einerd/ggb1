package com.simple.board.mapper;

import java.util.ArrayList;

import com.simple.command.BoardVO;

public interface BoardMapper {
	
	public void boardInsert(BoardVO vo);
	public ArrayList<BoardVO> boardSelect();
	public int boardDelete(int num);

}		
