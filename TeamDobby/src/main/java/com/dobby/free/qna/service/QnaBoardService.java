package com.dobby.free.qna.service;

import java.util.ArrayList;

import com.dobby.free.command.QnaVO;
import com.dobby.free.command.ReviewVO;
import com.dobby.free.util.Criteria;


public interface QnaBoardService {

	public boolean registA(QnaVO vo);
	public boolean registB(QnaVO vo);
	public ArrayList<QnaVO> getList(Criteria cri, int pno);
	public boolean update(QnaVO vo);
	public QnaVO detail(int qna_no);
	public boolean delete(int qna_no);
	public int getTotal();
	public QnaVO getPno(int qno);
	
}
