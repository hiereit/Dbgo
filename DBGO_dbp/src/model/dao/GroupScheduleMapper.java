package model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.dto.GroupSchedule;

public interface GroupScheduleMapper {
	public int insertGroupSchedule(GroupSchedule groupsch);
	
	public int deleteGroupSchedule(String groupsch_id);
	
	public int updateGroupSchedule(GroupSchedule groupsch);

	public List<GroupSchedule> findGroupSchedule(String g_id);

	public GroupSchedule findGroupScheduleDetail(String groupsch_id);

	public String findGroupName(String g_id);
}
