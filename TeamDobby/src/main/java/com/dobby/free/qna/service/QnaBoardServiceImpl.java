package com.dobby.free.qna.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobby.free.command.QnaVO;
import com.dobby.free.command.ReviewVO;
import com.dobby.free.qna.mapper.QnaBoardMapper;
import com.dobby.free.util.Criteria;


@Service("QnaBoardService")
public class QnaBoardServiceImpl implements QnaBoardService{

	@Autowired
	private QnaBoardMapper QnaBoardMapper;

	@Override
	//public void regist(QnaVO vo) {
	public boolean registA(QnaVO vo) {
		System.out.println(vo.toString());
		return QnaBoardMapper.registA(vo);
	}
	
	@Override
	public boolean registB(QnaVO vo) {
		System.out.println(vo.toString());
		return QnaBoardMapper.registB(vo);
	}

	@Override
	public ArrayList<QnaVO> getList(Criteria cri, int pno) {
		// TODO Auto-generated method stub
		return QnaBoardMapper.getList(cri, pno);
	}

	

	@Override
	public boolean update(QnaVO vo) {
		System.out.println(vo.toString());
		// TODO Auto-generated method stub
		return QnaBoardMapper.update(vo);
	}

	@Override
	public QnaVO detail(int qna_no) {
		// TODO Auto-generated method stub
		return QnaBoardMapper.detail(qna_no);
	}

	@Override
	public boolean delete(int qna_no) {
		// TODO Auto-generated method stub
		return QnaBoardMapper.delete(qna_no);
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return QnaBoardMapper.getTotal();
	}

	@Override
	public QnaVO getPno(int qno) {
		// TODO Auto-generated method stub
		return QnaBoardMapper.getPno(qno);
	}
	
}
