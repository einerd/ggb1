package com.dobby.free.qna.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.dobby.free.command.QnaVO;
import com.dobby.free.util.Criteria;


public interface QnaBoardService {

	public boolean registA(QnaVO vo);
	public boolean registB(QnaVO vo);
	public boolean updateA(QnaVO vo);
	public boolean updateB(QnaVO vo);
	public QnaVO detail(int qna_no);
	public boolean delete(int qna_no);
	public int getTotal(Timestamp startDate, Timestamp endDate, int pno);
	public QnaVO getPno(int qno);
	public QnaVO getInfo(int qna_no);
	
	
	
	public ArrayList<QnaVO> getList(Criteria cri, int pno, Timestamp startDate, Timestamp endDate);
	
}
