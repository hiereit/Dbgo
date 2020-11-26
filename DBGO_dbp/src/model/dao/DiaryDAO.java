package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import model.dto.Diary;

public class DiaryDAO {
	public DiaryDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
	}
	
	private static Connection getConnection() {
		String url = // "jdbc:oracle:thin:@localhost:1521:xe";
				"jdbc:oracle:thin:@202.20.119.117:1521:orcl";
		String user = "dbprog0208";
		String passwd = "qkrprh5";

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, passwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public List<String> findMonthDiary(String userId, Date date) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;

		String query = "SELECT d_date "
				+ "FROM diary "
				+ "WHERE MONTHS_BETWEEN (" + date + ", d_date) = ? "
				+ "AND u_id = ?";
		
		try {
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setInt(1, 0);
			pStmt.setString(2, userId);
			rs = pStmt.executeQuery();	
			
			List<String> dateList = new ArrayList<>();
			while (rs.next()) {
				dateList.add(rs.getDate("d_date").toString());
			}
			return dateList;
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
	
	public Diary getDiaryContent(String userId, Date date) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;

		String query = "SELECT d_date "
				+ "FROM diary "
				+ "WHERE d_date = ? "
				+ "AND u_id = ?";

		try {
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setDate(1, date);
			pStmt.setString(2, userId);
			rs = pStmt.executeQuery();	
			
			Diary diary = new Diary();
			if (rs.next()) {
				diary.setDate(rs.getDate("d_date").toString());
				diary.setContent(rs.getString("content"));
			}
			return diary;
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
	
	public int deleteDiary(String userId, Date date) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		int result;

		String query = "DELETE FROM diary "
				+ "WHERE d_date = ? "
				+ "AND u_id = ?";
		
		try {
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setDate(1, date);
			pStmt.setString(2, userId);
			result = pStmt.executeUpdate();	
			return result;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {		// ÀÚ¿ø ¹Ý³³
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
	
	public int updateDiary(String userId, Date date, String content) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		int result;

		String query = "UPDATE diary "
				+ "SET content = ? "
				+ "WHERE d_date = ? "
				+ "AND u_id = ?";
		
		try {
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setString(1, content);
			pStmt.setDate(2, date);
			pStmt.setString(3, userId);
			result = pStmt.executeUpdate();	
			return result;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {		// ÀÚ¿ø ¹Ý³³
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
}
