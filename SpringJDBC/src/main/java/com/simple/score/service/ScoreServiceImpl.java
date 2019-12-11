package com.simple.score.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.simple.command.ScoreVO;
import com.simple.score.dao.ScoreDAO;
import com.simple.score.mapper.ScoreMapper;

//@Component - 가능
//@Repository - 가능
@Service("scoreService") //해당 클래스를 component-scan이 읽어서 bean으로 생성
public class ScoreServiceImpl implements ScoreService {
//	@Autowired
//	@Qualifier("scoreDao")
//	private ScoreDAO scoreDao;
//	
//	@Override
//	public void scoreRegist(ScoreVO vo) {
//		scoreDao.scoreRegist(vo);
//	}
//
//	@Override
//	public ArrayList<ScoreVO> scoreList() {
//		//ArrayList<ScoreVO> list =scoreDao.scoreList();
//		return scoreDao.scoreList();
//	}
//
//	@Override
//	public void scoreDelete(int num) {
//		scoreDao.scoreDelete(num);
//	}
// ----------------------마이바티스 라인------------------------	
	@Autowired
	private ScoreMapper scoreMapper;
	
	@Override
	public void scoreRegist(ScoreVO vo) {
		scoreMapper.scoreRegist(vo);
//		HashMap<String, String> map = new HashMap<>();
//		map.put("name", vo.getName());
//		map.put("kor", vo.getKor());
//		map.put("eng", vo.getEng());
//		map.put("math", vo.getMath());
//		
//		scoreMapper.scoreRegist(map);
	}

	@Override
	public ArrayList<ScoreVO> scoreList() {
		ArrayList<ScoreVO> list = scoreMapper.scoreList();
		return list;
	}

	@Override
	public void scoreDelete(int num) {
		int result = scoreMapper.scoreDelete(num);
		System.out.println("삭제여부 : "+result);
	}
	
}
