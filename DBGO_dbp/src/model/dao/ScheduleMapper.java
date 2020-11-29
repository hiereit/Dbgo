package model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.dto.Schedule;

public interface ScheduleMapper {
	public int insertSchedule(Schedule sch);
	
	public int deleteSchedule(String sch_id);
			
	public int updateSchedule(@Param("memo") String memo, @Param("memo") String title, @Param("memo") String category, 
			@Param("memo") String start_date, @Param("memo") String end_date);

	public void updateScheduleACH(int ach);
	
	//public Schedule findSchedule(String sch_id);
	
	public List<Schedule> selectAllSchedule(String u_id);
}
