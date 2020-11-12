package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.User;

public class UserDao {
	
	public UserDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
	}
	
	private Connection getConnection() {
        // DBMS���� ���� ȹ�� ...
    	String url = // "jdbc:oracle:thin:@localhost:1521:xe";
				"jdbc:oracle:thin:@202.20.119.117:1521:orcl";	
    	String user = "scott";
    	String passwd = "TIGER";

    	Connection conn = null;
    	try {
    		conn = DriverManager.getConnection(url, user, passwd);
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}	 
    	return conn;
    }
	
	public User findUserInfo(int u_id) {
		Connection conn = null;
		PreparedStatement pStmt = null;		
		ResultSet rs = null;
		
		String query = "SELECT u_id, name, email, nickname, password "
				+ "FROM userinfo "
				+ "WHERE u_id = ? ";
		
		try {
    		conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setInt(1, u_id);
			rs = pStmt.executeQuery();
			
			User user = null;
			if(rs.next()) {
				user = new User();
				user.setU_id(u_id);
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setNickname(rs.getString("nickname"));
				user.setPassword( rs.getString("password"));	
			}
			return user;
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
	
	
	public List<User> findUsersInfo(int u_id) {
       
    	Connection conn = null;
		PreparedStatement pStmt = null;		
		ResultSet rs = null;
		
		String query = "SELECT u_id, name, email, nickname, password "
				+ "FROM userinfo "
				+ "WHERE u_id = ? ";
		
		try {
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setInt(1, u_id);
			rs = pStmt.executeQuery();
			
			List<User> list = new ArrayList<User>();
			
			while(rs.next()) {
				User dto = new User();
				
				dto.setU_id(u_id);
				dto.setName(rs.getString("ename"));
				dto.setEmail(rs.getString("email"));
				dto.setEmail(rs.getString("nickname"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPassword(rs.getString("password"));
				
				list.add(dto);
			}
			return list;
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

	
	public void createUser (int u_id, String name, String email, String nickname, String password) {
		Connection conn = null;
		PreparedStatement pStmt = null;			// PreparedStatment ���� ���� ����
		int recordCount = 0;
		
		String query = "INSERT INTO userinfo (u_id, name, email, nickname, password) "
				+ "VALUES (u_id, name, email, nickname, password) ";
		
		try {
			conn = getConnection();
			
			pStmt = conn.prepareStatement(query);
			recordCount = pStmt.executeUpdate();	//1�� ������Ʈ �Ǵ��� üũ�غ��� ������ ��
			if(recordCount == 0)
				System.out.println("���Ե� ȸ���� �����ϴ�.");
			else
				System.out.println(recordCount + "���� ȸ���� ���ԵǾ����ϴ�.");
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {		// �ڿ� �ݳ�
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


	public void updateUser (int u_id, String password) {	//��й�ȣ�� �ٲܼ� �ְ�?
		Connection conn = null;
		PreparedStatement pStmt = null;
		int recordCount = 0;
		
		String query = "UPDATE userInfo "
				+ "SET password = ? "
				+ "WHERE u_id = ? ";
	
		try {
			conn = getConnection();
			
			pStmt = conn.prepareStatement(query);
			pStmt.setInt(1, u_id);
			pStmt.setString(2, password);
			recordCount = pStmt.executeUpdate();
			if(recordCount == 0)
				System.out.println("��й�ȣ UPDATE ����");
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {		// �ڿ� �ݳ�
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
	

	public void removeUser (int u_id) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		int recordCount = 0;
		
		String query = "DELETE FROM userInfo "
					+ "WHERE u_id = ? ";
		
		try {
			conn = getConnection();
			
			pStmt = conn.prepareStatement(query);
			pStmt.setInt(1, u_id);
			recordCount = pStmt.executeUpdate();
			if(recordCount == 0)
				System.out.println("ȸ�� ���� ����");
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {		// �ڿ� �ݳ�
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


	public boolean existingUser(int u_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;

		String query = "SELECT count(*) "
				+ "FROM userInfo "
				+ "WHERE u_id = ? ";      

		try {
			
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setInt(1, u_id);
			rs = pStmt.executeQuery();
			
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
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
		return false;
	}
}
