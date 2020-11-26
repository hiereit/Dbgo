package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.GroupSchedule;

public class GroupScheduleDAO {

	public GroupScheduleDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}	
	}
	
	private Connection getConnection() {
		String url = //"jdbc:oracle:thin:@localhost:1521:xe";
					"jdbc:oracle:thin:@202.20.119.117:1521:orcl";			
		String username = "dbprog0208";
		String password = "qkrprh5";

		// DBMS���� ���� ȹ��
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}	 
		return conn;
	}
	
	public List<GroupSchedule> getGroupScheduleList(String g_id) {
		Connection conn = null;
		PreparedStatement pStmt = null;		// PreparedStatment ���� ���� ����
		ResultSet rs = null;		
		String query = "SELECT * " 
					 + "FROM GROUP_SCHEDULE "
					 + "WHERE g_id = ?";
		
		try {
			conn = getConnection();	// DBMS���� ���� ȹ�� 
			pStmt = conn.prepareStatement(query);	// Connection���� PreparedStatement ��ü ����
			rs = pStmt.executeQuery();	
			
			List<GroupSchedule> groupScheduleList = new ArrayList<GroupSchedule>();
			while (rs.next()) {		// Ŀ���� ���� �� �྿ fetch
				GroupSchedule gsch = new GroupSchedule(rs.getString("homework"), rs.getString("g_id"),
						rs.getString("groupsch_id"), rs.getDate("groupsch_date"), rs.getString("memo"), rs.getString("title"));
				groupScheduleList.add(gsch);
			}
			return groupScheduleList;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {		// �ڿ� �ݳ�
			if (rs != null) 
				try { 
					rs.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
			if (pStmt != null) 
				try { 
					pStmt.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
			if (conn != null) 
				try { 
					conn.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
		}
		return null;
	}
	
	public void removeGroupSchedule(String groupsch_id) {
		Connection conn = null;
		PreparedStatement pStmt = null;		// PreparedStatment ���� ���� ����
		ResultSet rs = null;
		String query = "DELETE FROM group_schedule "
					 + "WHERE groupsch_id = ?";
		
		try {
			conn = getConnection();	// DBMS���� ���� ȹ�� 
			pStmt = conn.prepareStatement(query);	// Connection���� PreparedStatement ��ü ����
			pStmt.setString(1, groupsch_id);
			int result = pStmt.executeUpdate();
			
			if (result != 1) {
				conn.rollback();
			}
			else {
				conn.commit();
			}
		} catch (SQLException ex) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ex.printStackTrace();
		} finally {		// �ڿ� �ݳ�
			if (rs != null) 
				try { 
					rs.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
			if (pStmt != null) 
				try { 
					pStmt.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
			if (conn != null) 
				try { 
					conn.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
		}
	}
	
	public void updateGroup(String groupsch_id, String title) {
		Connection conn = null;
		PreparedStatement pStmt = null;		// PreparedStatment ���� ���� ����
		ResultSet rs = null;		
		String query = "UPDATE group_schedule " 
					 + "SET title = ? "
					 + "WHERE groupsch_id = ?";
		
		try {
			conn = getConnection();	// DBMS���� ���� ȹ�� 
			pStmt = conn.prepareStatement(query);	// Connection���� PreparedStatement ��ü ����
			pStmt.setString(1, title);
			pStmt.setString(2, groupsch_id);
			int result1 = pStmt.executeUpdate();
			
			if (result1 != 1) {
				conn.rollback();
			}
			else {
				conn.commit();
			}
		} catch (SQLException ex) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ex.printStackTrace();
		} finally {		// �ڿ� �ݳ�
			if (rs != null) 
				try { 
					rs.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
			if (pStmt != null) 
				try { 
					pStmt.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
			if (conn != null) 
				try { 
					conn.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
		}
	}
	
	public void createGroup(String g_id, String title) {
		Connection conn = null;
		PreparedStatement pStmt = null;		// PreparedStatment ���� ���� ����
		ResultSet rs = null;		
		String query = "INSERT INTO GROUP_SCHEDULE (g_id, title) VALUES (?, ?)";
		
		try {
			conn = getConnection();	// DBMS���� ���� ȹ�� 
			pStmt = conn.prepareStatement(query);	// Connection���� PreparedStatement ��ü ����
			pStmt.setString(1, g_id);
			pStmt.setString(2, title);
			int result1 = pStmt.executeUpdate();
			pStmt.close();						
			
			if (result1 != 1) {
				conn.rollback();
			}
			else {
				conn.commit();
			}
		} catch (SQLException ex) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ex.printStackTrace();
		} finally {		// �ڿ� �ݳ�
			if (rs != null) 
				try { 
					rs.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
			if (pStmt != null) 
				try { 
					pStmt.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
			if (conn != null) 
				try { 
					conn.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
		}
	}
}