package com.simple.score.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.simple.command.ScoreVO;

public interface ScoreMapper {

	public void scoreRegist(ScoreVO vo);
	//public void scoreRegist(HashMap<String, String> map);
	public ArrayList<ScoreVO> scoreList();
	public int scoreDelete(int num);
	
}
