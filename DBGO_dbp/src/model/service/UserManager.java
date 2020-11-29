package model.service;

import java.sql.SQLException;
import java.util.List;

import model.dto.GroupInfo;
import model.dto.GroupSchedule;
import model.dto.User;
import model.dao.GroupDAO;
import model.dao.UserDAO;
import model.dao.GroupScheduleDAO;

public class UserManager {//
	private static UserManager userMan = new UserManager();
	private UserDAO userDAO;
	private GroupDAO groupDAO;
	private GroupScheduleDAO groupScheduleDAO;

	private UserManager() {
		try {
			userDAO = new UserDAO();
			groupDAO = new GroupDAO();
			groupScheduleDAO = new GroupScheduleDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static UserManager getInstance() {
		return userMan;
	}
	
	public int create(User user) throws SQLException, ExistingUserException {
		if (userDAO.existingUser(user.getU_id()) == true) {
			throw new ExistingUserException(user.getU_id() + "는 존재하는 아이디입니다.");
		}
		return userDAO.createUser(user.getU_id(), user.getName(), user.getEmail(), user.getPassword());
	}
	

	public int update(User user) throws SQLException {
		return userDAO.updateUser(user.getU_id(), user.getPassword());
	}	
	
	
	public int remove(String userId) throws SQLException {
		return userDAO.removeUser(userId);
	}
	

	public User findUser(String userId)
		throws SQLException, UserNotFoundException {
		User user = userDAO.findUserInfo(userId);
		
		if (user == null) {
			throw new UserNotFoundException(userId + "는 존재하지 않는 아이디입니다.");
		}		
		return user;
	}
	
	public List<User> findUserList() throws SQLException {
		return userDAO.findUserList();
}

	public boolean login(String userId, String password)
		throws SQLException, UserNotFoundException, PasswordMismatchException {
		User user = findUser(userId);

		if (!user.matchPassword(password)) {
			throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
		}
		return true;
	}
	

	public UserDAO getUserDAO() {
		return this.userDAO;
	}
	
	public GroupInfo createGroup(GroupInfo group) throws SQLException {
		return groupDAO.create(group);		
	}
	
	public int addMember(String g_id, String u_id) throws SQLException {
		return groupDAO.addMembers(g_id, u_id);
	}
	
	public List<GroupInfo> findMyGroupList(String u_id) throws SQLException {
		return groupDAO.findMyGroupList(u_id);
	}

	public List<GroupSchedule> findGroupSchedule(String g_id) {
		return groupScheduleDAO.findGroupSchedule(g_id);
	}

	public GroupSchedule findGroupScheduleDetail(String groupsch_id) {
		return groupScheduleDAO.findGroupScheduleDetail(groupsch_id);
	}

	public String findGroupName(String g_id) {
		return groupScheduleDAO.findGroupName(g_id);
	}
}