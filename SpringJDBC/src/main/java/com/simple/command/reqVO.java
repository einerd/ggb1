package com.simple.command;

import java.util.ArrayList;

public class reqVO {
	//단, form태그의 name과 setter의 set을 제외한 이름이 같아야 함
	private String id;
	private String pw;
	private String name;
	private String age;
	private ArrayList<String> interest;
	
	public ArrayList<String> getInterest() {
		return interest;
	}
	public void setInterest(ArrayList<String> interest) {
		this.interest = interest;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "reqVO [id=" + id + ", pw=" + pw + ", name=" + name + ", age=" + age + ", interest=" + interest + "]";
	}

}
