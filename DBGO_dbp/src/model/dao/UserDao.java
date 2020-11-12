package model.dao;

import java.awt.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
        // DBMS¿ÍÀÇ ¿¬°á È¹µæ ...
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
		} finally {		// ÀÚ¿ø ¹Ý³³
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
		} finally {		// ÀÚ¿ø ¹Ý³³
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
}
