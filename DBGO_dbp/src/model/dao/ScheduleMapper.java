package model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.dto.Schedule;

public interface ScheduleMapper {
	public int insertSchedule(Schedule sch);
	
	public int deleteSchedule(String sch_id);
			
	public int updateSchedule(Schedule sch);

	public void updateScheduleACH(int ach);
	
	//public Schedule findSchedule(String sch_id);
	
	public List<Schedule> selectAllSchedule(String u_id);
}
