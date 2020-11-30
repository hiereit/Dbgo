package model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.dto.GroupInfo;

public interface GroupMapper {
	public int insertGroupInfo(GroupInfo group);
	
	public int insertAdmission(@Param("g_id") String g_id, @Param("u_id") String u_id);
	
	public List<GroupInfo> selectAllGroups();
	
	public List<GroupInfo> selectGroupListByUserId(String u_id);
}
