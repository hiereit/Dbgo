package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;

import model.dto.GroupSchedule;
import model.dto.Schedule;

public interface ScheduleMapper {
	public void insertScheduleInfo(Schedule sch);
	
	public int deleteScheduleInfo(String sch_id);
			
	public void updateScheduleInfo(String memo, String title, String category, 
			String startDate, String endDate);

	public void updateScheduleACH(int ach);
	
	public Schedule findScheduleInfo(String schTitle);
	
	//public List<Schedule> selectAllSchedule(String userId);
	 

	

}
