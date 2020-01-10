package com.dobby.free.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/test")
public class TestController {

	@RequestMapping(value="form")
	public String form() {
		return "test/form";
	}
	
	@RequestMapping(value="testForm")
	public void testForm(String name,
						 MultipartFile file) {
		System.out.println("이름: " + name);
		System.out.println("파일: " + file);
	}
	
	@RequestMapping(value="kjh")
	@ResponseBody
	public int kjh(@RequestParam("name") String name,
				   @RequestParam(value = "file", required = false) MultipartFile file) {
		System.out.println("이름: " + name);
		System.out.println("파일: " + file);
		return 1;
	}
}
