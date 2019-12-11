package com.simple.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.simple.command.ScoreVO;
import com.simple.score.service.ScoreService;
import com.simple.score.service.ScoreServiceImpl;

@Controller
@RequestMapping("/service")
public class ScoreServiceController {
	//1st
	//private ScoreService ss = new ScoreServiceImpl();
	//2nd
	//@Autowired
	//private ScoreService ss;
	@Autowired
	@Qualifier("scoreService") //의존객체 강제 연결 --없어도 연결은 잘 되지만 나중에 많아질경우를 위해 설정함
	private ScoreService ss;
	
	//화면처리
	@RequestMapping(value="/scoreRegist")
	public void scoreRegist() {
	}
	
	@RequestMapping(value="/scoreResult")
	public void scoreResult() {
	}
	
	//점수 등록 메서드
	@RequestMapping(value="/scoreForm", method=RequestMethod.POST)
	public String scoreForm(ScoreVO vo) {
		
		ss.scoreRegist(vo);
		
		return "service/scoreResult";
	}
	
	//점수목록 화면처리
	@RequestMapping(value="/scoreList")
	public String scoreList(Model model) {
		//DAO에 있는 arraylist를 화면까지 전달
		ArrayList<ScoreVO> scoreList = ss.scoreList();
		//메서드 파라미터에 Model추가하고, model에 결과를 담는다
		model.addAttribute("scoreList", scoreList);
		return "service/scoreList";
	}
	
	//점수 삭제
	@RequestMapping(value="/scoreDelete")
	public String scoreDelete(@RequestParam("num")int num) {
		System.out.println(num);
		ss.scoreDelete(num);
		
		return "redirect:/service/scoreList";
	}
}
