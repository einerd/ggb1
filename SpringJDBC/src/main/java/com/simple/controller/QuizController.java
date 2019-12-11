package com.simple.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simple.command.Quiz01VO;

@Controller
@RequestMapping("/quiz")
public class QuizController {
	
	@RequestMapping(value = "/quiz01")
	public void quiz01(){
	}

	@RequestMapping(value = "/sendBirth")
	public String sendBirth(@ModelAttribute("birth") Quiz01VO vo) {
		
		System.out.println(vo.getYear()+vo.getMonth()+vo.getDay());
		
		return "quiz/quiz01_ok";
	}
	
	@RequestMapping(value = "/quiz02")
	public void quiz02(){
	}
	
	@RequestMapping(value = "/join")
	public String join(@RequestParam("id")String id,
					   @RequestParam("pw")String pw,
					   @RequestParam("name")String name,
					   @RequestParam("email")String email,
					   Model model
						) {
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		model.addAttribute("name", name);
		model.addAttribute("email", email);
		return "quiz/quiz02_ok";
		
	}
	
	@RequestMapping(value = "/quiz03")
	public void quiz03(){
	}
	
	@RequestMapping(value="/join2")
	public String join2(@RequestParam("id")String id,
			   			@RequestParam("pw")String pw,
			   			@RequestParam("pw_check")String pwc,
			   			Model model,
			   			RedirectAttributes RA) {
		
		if(id.equals("")) {
			RA.addFlashAttribute("msg", "아이디를 입력하세요");
			return "redirect:/quiz/quiz03";
		}else if(pw.equals("")) {
			RA.addFlashAttribute("msg", "비밀번호를 입력하세요");
			return "redirect:/quiz/quiz03";
		}else if(!pw.equals(pwc)) {
			RA.addFlashAttribute("msg", "비밀번호를 확인하세요");
			return "redirect:/quiz/quiz03";
		}else {
			model.addAttribute("id", id);
			return "quiz/quiz03_ok";
		}
		
	}

}
