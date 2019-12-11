package com.simple.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.simple.command.reqVO;

@Controller //컴포넌트 스캔이 해당 어노테이션을 읽어들여서 bean으로 생성
@RequestMapping("/request") //기본으로 리퀘스트 폴더를 설정
public class RequestController {

	//모든 요청은 컨트롤러로 향하기 때문에, url주소에 request맵핑에 들어있는 경로로 호출해야 합니다
//	@RequestMapping("/req_ex01")
//	public String req_ex01() {
//		
//		System.out.println("안녕!");
//		
//		return "request/req_ex01"; //jsp의 화면이름을 지정하면 viewResolver 설정에 의해 처리
//	}
	
//	@RequestMapping("/req_ex01")
//	public void req_ex01() {
//		
//	}
//	
//	@RequestMapping("/basic1")
//	public void basic1() {
//		System.out.println("탔어!");
//		//반환유형이 없다면 호출된 url과 동일한 페이지로 연결 됩니다
//	}
//	
//	@RequestMapping(value="/basic2", method = RequestMethod.GET)
//	public void basic2() {
//		System.out.println("basic2호출(get방식)");
//	}
//	
//	@RequestMapping(value="/basic3", method = RequestMethod.POST)
//	public void basic3() {
//		System.out.println("basic3호출(post방식)");
//	}
//	
//	@RequestMapping("/basic4")
//	public void basic4() {
//		System.out.println("get, post알아서 맵핑");
//	}
	
	@RequestMapping({"/req_ex01", "basic1","basic2","basic3","basic4"})
	public void view() {
		System.out.println("호출성공");
	}
// ==========================================요청파라미터 값 받기==========================================
	
	@RequestMapping("/req_ex02")
	public String req_ex02() {
		return "request/req_ex02";
	}
	//1st. 전통적인 방법으로 파라미터값 받기
	/*
	@RequestMapping("/param")
	public String param(HttpServletRequest request) {
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("pw"));
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("age"));
		
		return "request/req_ex02_result";
	}
	*/
	
	//2nd. @requestParam("name")
	/*
	@RequestMapping("/param")
	public String param(@RequestParam("id") String id, @RequestParam("pw") String pw, @RequestParam("name") String name, @RequestParam("age") String age) {
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		System.out.println(age);
		
		return "request/req_ex02_result";
	}
	*/
	
	//3rd. VO객체로 받는방법
	@RequestMapping(value="/param")
	public String param(reqVO vo) {
		System.out.println(vo.toString());
		return "request/req_ex02_result";
	}
	
	@RequestMapping(value="/param2")
	public String param2(@RequestParam(value = "interest", required = false, defaultValue = "") ArrayList<String> inter) {
		//스프링에서 매개변수로 파라미터를 선언했을때, 해당 매개변수가 전달되지 않으면 badRequest로 맵핑을 붙이지 않습니다
		//필수 파라미터가 아닐경우 required = false 속성을 지정해주면 됨
		//필수 파라미터가 아닐경우 null값을 지정받게 되는데 , defaultValue=""를 이용하면 기본값을 지정해서 받을수 있음
		System.out.println(inter.toString());
		
		return "request/req_ex02_result";
	}
	
	@RequestMapping("/req_quiz01")
	public void req_quiz01() {
		
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(@RequestParam("id") String id, @RequestParam("pw") String pw) {
		
		System.out.println(id +" " + pw);
		
		if(id.equals("abc123")&&pw.equals("xxx123")) {
			return "request/req_ex02_result";
		}else {
			return "request/req_quiz01";
		}
	}
	

	
}
