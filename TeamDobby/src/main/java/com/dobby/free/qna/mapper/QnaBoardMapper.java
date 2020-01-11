package com.dobby.free.qna.mapper;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.dobby.free.command.QnaVO;
import com.dobby.free.command.ReviewVO;
import com.dobby.free.util.Criteria;

public interface QnaBoardMapper {

	public boolean registA(QnaVO vo); //등록
	public boolean registB(QnaVO vo); //등록
	
	public ArrayList<QnaVO> getList(@Param("cri") Criteria cri,
									@Param("pno") int pno,
									@Param("startDate") Timestamp startDate,
									@Param("endDate") Timestamp endDate);
	
	
	
	
	
	public boolean updateA(QnaVO vo);
	public boolean updateB(QnaVO vo);
	public QnaVO detail(int qna_no);
	public boolean delete(int qna_no);
	
	public int getTotal(@Param("startDate") Timestamp startDate,
						@Param("endDate") Timestamp endDate,
						@Param("pno") int pno);
	
	public QnaVO getPno(int qno);
	public QnaVO getInfo(int qna_no);
	
	
}
