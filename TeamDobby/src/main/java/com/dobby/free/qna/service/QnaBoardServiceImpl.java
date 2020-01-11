package com.dobby.free.qna.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobby.free.command.QnaVO;
import com.dobby.free.qna.mapper.QnaBoardMapper;
import com.dobby.free.util.Criteria;


@Service("QnaBoardService")
public class QnaBoardServiceImpl implements QnaBoardService{

	@Autowired
	private QnaBoardMapper QnaBoardMapper;

	@Override
	public boolean registA(QnaVO vo) {
		System.out.println(vo.toString());
		return QnaBoardMapper.registA(vo);
	}
	
	@Override
	public boolean registB(QnaVO vo) {
		System.out.println("registB에서뭐받니?"+vo.toString());
		return QnaBoardMapper.registB(vo);
	}


	@Override
	public boolean updateA(QnaVO vo) {
		System.out.println("updateA에 온 vo:"+vo.toString());
		// TODO Auto-generated method stub
		return QnaBoardMapper.updateA(vo);
	}
	
	@Override
	public boolean updateB(QnaVO vo) {
		System.out.println("updateB에 온 vo:"+vo.toString());
		// TODO Auto-generated method stub
		return QnaBoardMapper.updateB(vo);
	}

	@Override
	public QnaVO detail(int qna_no) {
		// TODO Auto-generated method stub
		return QnaBoardMapper.detail(qna_no);
	}

	@Override
	public boolean delete(int qna_no) {
		// TODO Auto-generated method stubs
		System.out.println("삭제하러 오긴왔어..");
		return QnaBoardMapper.delete(qna_no);
	}

	@Override
	public int getTotal(Timestamp startDate, Timestamp endDate, int pno) {
		// TODO Auto-generated method stub
		return QnaBoardMapper.getTotal(startDate, endDate, pno);
	}

	@Override
	public QnaVO getPno(int qno) {
		// TODO Auto-generated method stub
		return QnaBoardMapper.getPno(qno);
	}

	@Override
	public QnaVO getInfo(int qna_no) {
		// TODO Auto-generated method stub
		return QnaBoardMapper.getInfo(qna_no);
	}

	@Override
	public ArrayList<QnaVO> getList(Criteria cri, int pno, Timestamp startDate, Timestamp endDate) {
		// TODO Auto-generated method stub
		return QnaBoardMapper.getList(cri, pno, startDate, endDate);
	}
	
}
