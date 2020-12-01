package model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.dto.Schedule;

public interface ScheduleMapper {
	public int insertSchedule(Schedule sch);
	
	public int deleteSchedule(String sch_id);
			
	public int updateSchedule(Schedule sch);
	
	public int updateScheduleStart(@Param("sch_id") String sch_id, @Param("start_date") String start_date);
	
	public int updateScheduleSE(@Param("sch_id") String sch_id, @Param("start_date") String start_date, @Param("end_date") String end_date);

	public void updateScheduleACH(int ach);
	
	public List<Schedule> selectAllSchedule(String u_id);
}
