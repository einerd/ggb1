package com.simple.board.dao;

import java.util.ArrayList;

import com.simple.command.BoardVO;


public interface BoardDAO {

	public void boardInsert(BoardVO vo); //게시글 등록메서드
	public ArrayList<BoardVO> boardSelect(); //모든 게시글 가져오기
	public void boardDelete(int num); //삭제 메서드
	
	//위 메서드를 구현하는 클래스 BoardDAOImpl을 생성하고 오버라이딩하세요 
	
}
