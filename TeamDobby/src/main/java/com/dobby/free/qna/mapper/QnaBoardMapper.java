package com.dobby.free.qna.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.dobby.free.command.QnaVO;
import com.dobby.free.command.ReviewVO;
import com.dobby.free.util.Criteria;

public interface QnaBoardMapper {

	public boolean registA(QnaVO vo); //등록
	public boolean registB(QnaVO vo); //등록
	public ArrayList<QnaVO> getList(@Param("cri") Criteria cri, @Param("pno") int pno); //목록
	public boolean update(QnaVO vo);
	public QnaVO detail(int qna_no);
	public boolean delete(int qna_no);
	public int getTotal();
	public QnaVO getPno(int qno);
	
	
}
