package com.simple.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.simple.board.service.BoardService;
import com.simple.command.BoardVO;

@Controller
@RequestMapping("/service")
public class BoardServiceController {
	
	@Autowired
	@Qualifier("boardSer")  // @Resource(name = "boardSer")
	private BoardService bs;

	@RequestMapping(value="/boardRegister")
	public void boardRegister() {
	}
	@RequestMapping(value="/boardResult")
	public void boardResult() {
	}
	
	@RequestMapping(value="/boardForm", method=RequestMethod.POST)
	public String boardForm(BoardVO vo) {
		System.out.println(vo.getTitle());
		
		bs.register(vo);
		
		return "service/boardResult";
	}
	
	@RequestMapping(value="/boardList")
	public String boardList(Model model) {
		ArrayList<BoardVO> blist = bs.getList();
		
		model.addAttribute("blist", blist);
		return "service/boardList";
	}
	
	@RequestMapping(value="/boardDelete")
	public String boardDelete(@RequestParam("num")int num) {
		System.out.println(num);
		bs.delete(num);
		
		return "redirect:/service/boardList";
	}
}
