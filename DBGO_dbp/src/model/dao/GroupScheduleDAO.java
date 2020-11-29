package model.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.util.ArrayList;

import model.dto.GroupSchedule;

public class GroupScheduleDAO {
	private SqlSessionFactory sqlSessionFactory;

	public GroupScheduleDAO() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public GroupSchedule insertGroupSchedule(GroupSchedule groupsch) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(GroupScheduleMapper.class).insertGroupSchedule(groupsch);
			if (result > 0) {
				sqlSession.commit();
			} 
			return groupsch;
		} finally {
			sqlSession.close();
		}
	}
	
	public int deleteGroupSchedule(String groupsch_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(GroupScheduleMapper.class).deleteGroupSchedule(groupsch_id);
			if (result > 0) {
				sqlSession.commit();
			} 
			return result;	
		} finally {
			sqlSession.close();
		}
	}
	
	public int updateGroupSchedule(GroupSchedule groupsch) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(GroupScheduleMapper.class).updateGroupSchedule(groupsch);
			if (result > 0) {
				sqlSession.commit();
			} 
			return result;
		} finally {
			sqlSession.close();
		}
	}

	public List<GroupSchedule> findGroupSchedule(String g_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(GroupScheduleMapper.class).findGroupSchedule(g_id);			
		} finally {
			sqlSession.close();
		}
	}

	public GroupSchedule findGroupScheduleDetail(String groupsch_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(GroupScheduleMapper.class).findGroupScheduleDetail(groupsch_id);			
		} finally {
			sqlSession.close();
		}
	}

	public String findGroupName(String g_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(GroupScheduleMapper.class).findGroupName(g_id);			
		} finally {
			sqlSession.close();
		}
	}
}
