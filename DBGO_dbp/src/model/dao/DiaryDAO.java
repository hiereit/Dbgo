package model.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.dto.Diary;
import model.dto.GroupSchedule;

public class DiaryDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	public DiaryDAO() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public Diary insertDiary(Diary diary) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(DiaryMapper.class).insertDiary(diary);
			if (result > 0) {
				sqlSession.commit();
			} 
			return diary;
		} finally {
			sqlSession.close();
		}
	}
	
	public List<Diary> findAllDiaries(String u_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(DiaryMapper.class).findAllDiaries(u_id);			
		} finally {
			sqlSession.close();
		}
	}
	
	public Diary findDiary(String d_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(DiaryMapper.class).findDiary(d_id);			
		} finally {
			sqlSession.close();
		}
	}
	
	public int deleteDiary(String d_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(DiaryMapper.class).deleteDiary(d_id);
			if (result > 0) {
				sqlSession.commit();
			} 
			return result;	
		} finally {
			sqlSession.close();
		}
	}

	public List<Diary> findAllDiariesByDate(String u_id, String d_date) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(DiaryMapper.class).findAllDiariesByDate(u_id, d_date);			
		} finally {
			sqlSession.close();
		}
	}
}
