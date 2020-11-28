package model.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.dto.GroupInfo;

public class GroupDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	public GroupDAO() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public GroupInfo create(GroupInfo group) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(GroupMapper.class).insertGroupInfo(group);
			if (result > 0) {
				sqlSession.commit();
			}
			return group;
		} finally {
			sqlSession.close();
		}
	}
	
	public int addMembers(String g_id, String u_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(GroupMapper.class).insertAdmission(g_id, u_id);
			if (result > 0) {
				sqlSession.commit();
			} 
			return result;
		} finally {
			sqlSession.close();
		}
	}
	
	public int removeGroup(String g_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(GroupMapper.class).deleteGroupInfo(g_id);
			if (result > 0) {
				sqlSession.commit();
			} 
			return result;	
		} finally {
			sqlSession.close();
		}
	}
	
	public List<GroupInfo> findGroupList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(GroupMapper.class).selectAllGroups();			
		} finally {
			sqlSession.close();
		}
	}
	
	public List<GroupInfo> findMyGroupList(String u_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(GroupMapper.class).selectGroupListByUserId(u_id);			
		} finally {
			sqlSession.close();
		}
	}
	
	
	
}
