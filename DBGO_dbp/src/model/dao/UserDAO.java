package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dto.User;

public class UserDAO {	//UserDao파일 지우고 UserDAO이름으로 다시 파일 만듦
	
	public UserDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
	}
	
	private Connection getConnection() {
      
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
	
	public User findUserInfo(String u_id) {
		Connection conn = null;
		PreparedStatement pStmt = null;		
		ResultSet rs = null;
		
		String query = "SELECT u_id, name, email, nickname, password "
				+ "FROM userinfo "
				+ "WHERE u_id = ? ";
		
		try {
    		conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setString(1, u_id);
			rs = pStmt.executeQuery();
			
			User user = null;
			if(rs.next()) {
				user = new User();
				user.setU_id(u_id);
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
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
	

	public List<User> findUserList() {
	       
    	Connection conn = null;
		PreparedStatement pStmt = null;		
		ResultSet rs = null;
		
		String query = "SELECT u_id, name, email, password "
				+ "FROM userinfo "
				+ "ORDER BY u_id";
		
		try {
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			rs = pStmt.executeQuery();
			
			List<User> list = new ArrayList<User>();
			
			while(rs.next()) {
				User dto = new User(
				rs.getString("u_id"),
				rs.getString("name"),
				rs.getString("email"),
				rs.getString("password"));
				
				list.add(dto);
			}
			return list;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {	
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
	
	
	public int createUser (String u_id, String name, String email, String password) {
		Connection conn = null;
		PreparedStatement pStmt = null;	
		int recordCount = 0;
		
//		String query = "INSERT INTO userinfo (u_id, name, email, nickname, password) "
//				+ "VALUES (u_id, name, email, nickname, password) ";
		
		String query = "INSERT INTO userinfo (u_id, name, email, nickname, password) "
				+ "VALUES (u_id_seq.NEXTVAL, name, email, nickname, password) ";
		
		try {
			conn = getConnection();
			
			pStmt = conn.prepareStatement(query);
			recordCount = pStmt.executeUpdate();
			
			if(recordCount == 0)
				System.out.println("���Ե� ȸ���� �����ϴ�.");
			else
				System.out.println(recordCount + "���� ȸ���� ���ԵǾ����ϴ�.");
			
			return recordCount;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {	
			if (pStmt != null) 
				try { 
					pStmt.close();
				} catch (SQLException ex) { ex.printStackTrace(); }
			if (conn != null) 
				try { 
					conn.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
		}
		return 0;
	}
	

	public int updateUser (String u_id, String password) {	
		Connection conn = null;
		PreparedStatement pStmt = null;
		int recordCount = 0;
		
		String query = "UPDATE userInfo "
				+ "SET password = ? "
				+ "WHERE u_id = ? ";
	
		try {
			conn = getConnection();
			
			pStmt = conn.prepareStatement(query);
			pStmt.setString(1, u_id);
			pStmt.setString(2, password);
			recordCount = pStmt.executeUpdate();
			if(recordCount == 0)
				System.out.println("��й�ȣ UPDATE ����");
			
			return recordCount;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {	
			if (pStmt != null) 
				try { 
					pStmt.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
			if (conn != null) 
				try { 
					conn.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
		}
		return 0;
	}
	

	public int removeUser (String u_id) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		int recordCount = 0;
		
		String query = "DELETE FROM userInfo "
					+ "WHERE u_id = ? ";
		
		try {
			conn = getConnection();
			
			pStmt = conn.prepareStatement(query);
			pStmt.setString(1, u_id);
			recordCount = pStmt.executeUpdate();
			if(recordCount == 0)
				System.out.println("ȸ�� ���� ����");
			
			return recordCount;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {	
			if (pStmt != null) 
				try { 
					pStmt.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
			if (conn != null) 
				try { 
					conn.close(); 
				} catch (SQLException ex) { ex.printStackTrace(); }
		}
		return 0;
	}


	public boolean existingUser(String u_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;

		String query = "SELECT count(*) "
				+ "FROM userInfo "
				+ "WHERE u_id = ? ";      

		try {
			
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setString(1, u_id);
			rs = pStmt.executeQuery();
			
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {	
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
