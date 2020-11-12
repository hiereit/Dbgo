package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.GroupInfo;

public class GroupDAO {
	
	public GroupDAO() {
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

		// DBMS와의 연결 획득
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}	 
		return conn;
	}
	
	public List<GroupInfo> getGroupList() {
		Connection conn = null;
		PreparedStatement pStmt = null;		// PreparedStatment 참조 변수 생성
		ResultSet rs = null;		
		String query = "SELECT * " 
					 + "FROM GROUPINFO";
		
		try {
			conn = getConnection();	// DBMS와의 연결 획득 
			pStmt = conn.prepareStatement(query);	// Connection에서 PreparedStatement 객체 생성
			rs = pStmt.executeQuery();	
			
			List<GroupInfo> groupList = new ArrayList<GroupInfo>();
			while (rs.next()) {		// 커서를 통해 한 행씩 fetch
				GroupInfo g = new GroupInfo(rs.getString("g_id"), rs.getString("g_name"));
				groupList.add(g);
			}
			return groupList;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {		// 자원 반납
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
	
	public List<GroupInfo> getMyGroupList(String u_id) {
		Connection conn = null;
		PreparedStatement pStmt = null;		// PreparedStatment 참조 변수 생성
		ResultSet rs = null;		
		String query = "SELECT g.g_id, g.g_name " 
					 + "FROM ADMISSION a JOIN GROUP g USING (g_id) "
					 + "WHERE a.u_id = ?";
		
		try {
			conn = getConnection();	// DBMS와의 연결 획득 
			pStmt = conn.prepareStatement(query);	// Connection에서 PreparedStatement 객체 생성
			pStmt.setString(1, u_id);
			rs = pStmt.executeQuery();	
			
			List<GroupInfo> groupList = new ArrayList<GroupInfo>();
			while (rs.next()) {		// 커서를 통해 한 행씩 fetch
				GroupInfo g = new GroupInfo(rs.getString("g_id"), rs.getString("g_name"));
				groupList.add(g);
			}
			return groupList;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {		// 자원 반납
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
	
	public void removeGroup(String g_id) {
		Connection conn = null;
		PreparedStatement pStmt = null;		// PreparedStatment 참조 변수 생성
		ResultSet rs = null;
		String query = "DELETE FROM group "
					 + "WHERE g_id = ?";
		
		try {
			conn = getConnection();	// DBMS와의 연결 획득 
			pStmt = conn.prepareStatement(query);	// Connection에서 PreparedStatement 객체 생성
			pStmt.setString(1, g_id);
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
		} finally {		// 자원 반납
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
	
	public List<GroupInfo> updateGroup(String g_id, String g_name) {
		Connection conn = null;
		PreparedStatement pStmt = null;		// PreparedStatment 참조 변수 생성
		ResultSet rs = null;		
		String query = "UPDATE group " 
					 + "SET g_name = ? "
					 + "WHERE g_id = ?";
		
		try {
			conn = getConnection();	// DBMS와의 연결 획득 
			pStmt = conn.prepareStatement(query);	// Connection에서 PreparedStatement 객체 생성
			pStmt.setString(1, g_name);
			pStmt.setString(2, g_id);
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
		} finally {		// 자원 반납
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
	
	public void createGroup(String u_id, String g_name) {
		Connection conn = null;
		PreparedStatement pStmt = null;		// PreparedStatment 참조 변수 생성
		ResultSet rs = null;		
		String query1 = "INSERT INTO ADMISSION u_id VALUES ?";
		String query2 = "INSERT INTO GROUP g_name VALUES ?";
		
		try {
			conn = getConnection();	// DBMS와의 연결 획득 
			pStmt = conn.prepareStatement(query1);	// Connection에서 PreparedStatement 객체 생성
			pStmt.setString(1, u_id);
			int result1 = pStmt.executeUpdate();
			pStmt.close();						// pStmt가 가리키는 객체 close!

			pStmt = conn.prepareStatement(query2);	
			pStmt.setString(1, g_name);
			int result2 = pStmt.executeUpdate();
			
			if (result1 != 1 || result2 != 1) {
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
		} finally {		// 자원 반납
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
