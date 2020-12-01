package model.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.dto.Schedule;

public class ScheduleDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	public ScheduleDAO() { 
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

    } 

	public Schedule create(Schedule sch) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(ScheduleMapper.class).insertSchedule(sch);
			if (result > 0) {
				sqlSession.commit();
			}
			return sch;
		} finally {
			sqlSession.close();
		}
	}
	
	public int update(Schedule sch) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(ScheduleMapper.class).updateSchedule(sch);
			if (result > 0) {
				sqlSession.commit();
			}
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
	public int updateByDrop(String sch_id, String start_date) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(ScheduleMapper.class).updateScheduleStart(sch_id, start_date);
			if (result > 0) {
				sqlSession.commit();
			}
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
	public int updateByDrop(String sch_id, String start_date, String end_date) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(ScheduleMapper.class).updateScheduleSE(sch_id, start_date, end_date);
			if (result > 0) {
				sqlSession.commit();
			}
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
	public int delete(String sch_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.getMapper(ScheduleMapper.class).deleteSchedule(sch_id);
			if (result > 0) {
				sqlSession.commit();
			} 
			return result;	
		} finally {
			sqlSession.close();
		}
	}
	
//	public Schedule findSchedule(String sch_id) {
//		SqlSession sqlSession = sqlSessionFactory.openSession();
//		try {
//			return sqlSession.getMapper(ScheduleMapper.class).findSchedule();			
//		} finally {
//			sqlSession.close();
//		}
//	}
	
	 public List<Schedule> findAllSchedules(String u_id) {
		 SqlSession sqlSession = sqlSessionFactory.openSession();
			try {
				return sqlSession.getMapper(ScheduleMapper.class).selectAllSchedule(u_id);			
			} finally {
				sqlSession.close();
			}
	    }
}
