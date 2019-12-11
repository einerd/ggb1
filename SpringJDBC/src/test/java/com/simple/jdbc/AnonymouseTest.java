package com.simple.jdbc;

import org.junit.Test;

interface Car{
	public void run(); //추상메서드
}

public class AnonymouseTest {
	
	@Test //테스트 어노테이션 붙어있는 메서드 실행
	public void test() {
		
		Car car = new Car() {
			@Override
			public void run() {
				System.out.println("안녕");
			}
		};
		
		car.run();
		//보통의 경우는 구현하는 클래스를 생성해서 사용하지만, 재사용할 일이 없다면 익명클래스(이름없는 클래스)로 선언해서
		//1회성으로 사용할 수 있음
		
	}

}
