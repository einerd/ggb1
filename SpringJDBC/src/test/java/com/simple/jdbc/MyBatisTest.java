package com.simple.jdbc;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.simple.jdbc.testmapper.TestMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/appServlet/DB-context.xml")
public class MyBatisTest {

	//DB-context.xml파일에서 mybatis-scan명령으로 해당패키지를
	@Autowired
	private TestMapper testmapper;
	
	@Test
	public void test() {
		String result = testmapper.getTime();
		System.out.println(result);
	}
}
