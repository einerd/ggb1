package com.simple.score.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.simple.command.ScoreVO;

@Repository("scoreDao")
public class ScoreDAOImpl implements ScoreDAO{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void scoreRegist(ScoreVO vo) {
		//insert
		String sql = "insert into score01(num, name, kor, eng, math) values(score01_seq.nextval, ?, ?, ?, ?)";
		//update(쿼리구문, ?에 바인딩할 값을 배열에 순서대로 전달)
		int result = jdbcTemplate.update( sql, new Object[] {vo.getName(), vo.getKor(), vo.getEng(), vo.getMath()} );
		
		System.out.println("성공여부 : "+result);
	}

	@Override
	public ArrayList<ScoreVO> scoreList() {
		//select
		String sql = "select * from score01";
		List<ScoreVO> list = jdbcTemplate.query( sql, new Object[] {}, new RowMapper<ScoreVO>() {

			@Override
			public ScoreVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				//rs에는 쿼리의 결과가 들어있음, rowNum의 개수만큼 반복
				//rs를 분해해서 return으로 실행결과를 반환
				ScoreVO vo = new ScoreVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setKor(rs.getString("kor"));
				vo.setEng(rs.getString("eng"));
				vo.setMath(rs.getString("math"));
				return vo;
			}
			
		} );
		return (ArrayList<ScoreVO>)list;
	}

	@Override
	public void scoreDelete(int num) {
		//delete
		String sql = "delete from score01 where num = ?";
		int result = jdbcTemplate.update(sql, new Object[] {num});
		System.out.println("삭제여부 : "+result);
	}
	



}
