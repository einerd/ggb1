package com.simple.score.service;

import java.util.ArrayList;

import com.simple.command.ScoreVO;

public interface ScoreService {

	public void scoreRegist(ScoreVO vo); //점수 등록메서드
	public ArrayList<ScoreVO> scoreList();//점수 목록메서드
	public void scoreDelete(int num);
}
