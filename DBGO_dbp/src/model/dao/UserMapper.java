package model.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import model.dto.User;

public interface UserMapper {
	public User selectUserByUserId(String u_id);
	
	public List<User> selectAllUsers();
	
	public int insertUser (@Param("u_id") String u_id, @Param("name") String name, @Param("email") String email, @Param("password") String password);
	
	public int updateUser (@Param("u_id") String u_id, @Param("password") String password);
	
	public int deleteUser (String u_id);
	
	public boolean selectExistingUser(String u_id);
	
	
}
