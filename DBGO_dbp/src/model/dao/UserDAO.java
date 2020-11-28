package model.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.dto.User;

public class UserDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	public UserDAO() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	
	public User findUserInfo(String u_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			return sqlSession.getMapper(UserMapper.class).selectUserByUserId(u_id);
		} finally {
			sqlSession.close();
		}
	}

	
	public List<User> findUserList(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(UserMapper.class).selectAllUsers();
		} finally {
			sqlSession.close();
		}
	}


	public int createUser(String u_id, String name, String email, String password) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(UserMapper.class).insertUser(u_id, name, email, password);
		}finally {
			sqlSession.close();
		}
	}

	public int updateUser(String u_id, String password) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(UserMapper.class).updateUser(u_id, password);
		}finally {
			sqlSession.close();
		}
	}
	
	
	public int removeUser (String u_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(UserMapper.class).deleteUser(u_id);
		}finally {
			sqlSession.close();
		}
	}


	public boolean existingUser(String u_id){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.getMapper(UserMapper.class).selectExistingUser(u_id);
		}finally {
			sqlSession.close();
		}
	}
	
}