package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import model.dto.Schedule;

public class ScheduleDAO {
	Connection conn = null;
	PreparedStatement pStmt = null;
	ResultSet rs = null;	
	
	public ScheduleDAO() { // ������ 
        // JDBC driver �ε� �� ��� ... 
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}	

    } 
	private Connection getConnection() {		
		String url = // "jdbc:oracle:thin:@localhost:1521:xe";
				"jdbc:oracle:thin:@202.20.119.117:1521:orcl";	
		String user = "dbprog0208";
		String passwd = "qkrprh5";

	    // DBMS���� ���� ȹ�� ...
		try {
			conn = DriverManager.getConnection(url, user, passwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}	 
		return conn;
    }
	public void insertSchedule(int sch_id, Date sch_start_date, Date sch_end_date,
			String memo, String title, String category, int u_id, int acv) {
		String query = "INSERT INTO SCHEDULE "
					 + "VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setInt(1, sch_id);
			pStmt.setDate(2, (java.sql.Date)sch_start_date);
			pStmt.setDate(3, (java.sql.Date)sch_end_date);
			pStmt.setString(4, memo);
			pStmt.setString(5, title);
			pStmt.setString(6, category);
			pStmt.setInt(7, u_id);
			pStmt.setInt(8, acv);			
			
			pStmt.executeUpdate();
			//System.out.println("��� ��ȣ\t����̸�\t����\t����\t����");
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		} finally {	
			close();
		}
	}
	public void updateSchedule(String memo, String title, String category, Date startDate, Date endDate) {
		String query = "UPDATE SCHEDULE SET "
					 + "memo = ? "
					 + ", category = ?"
					 + ", start_date = ?"
					 + ", end_date = ? "					 
					 + "WHERE title = ?";
		try {
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setString(1, memo);
			pStmt.setString(2, category);	
			pStmt.setDate(3, (java.sql.Date)startDate);
			pStmt.setDate(3, (java.sql.Date)endDate);
			pStmt.setString(3, title);
			pStmt.executeUpdate();
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		} finally {	
			close();
		}
	}
	public void deleteSchedule(String u_id) {
		String query = "DELETE FROM SCHEDULE "
					 + "WHERE title = ?";
		try {
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setString(1, u_id);
			pStmt.executeUpdate();
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		} finally {	
			close();
		}
	}
	public Schedule findScheduleInfo(String schTitle) {
		String query = "SELECT * "
					+ "FROM schedule "
					+ "WHERE title = ? ";
		
		Schedule sch = null;
		 
		try {
			conn = getConnection();
			pStmt = conn.prepareStatement(query);
			pStmt.setString(1, schTitle);
			
			rs = pStmt.executeQuery();
			//System.out.println("��� ��ȣ\t����̸�\t����\t����\t����");
			if(rs.next()) {
				
				int sch_id = rs.getInt("sch_id");
				Date sch_start_date = rs.getDate("start_date");
				Date sch_end_date = rs.getDate("end_date");
				String memo = rs.getString("memo");
				String title = rs.getString("title");
				String category = rs.getString("category");
				int u_id = rs.getInt("u_id");
				int achievement = rs.getInt("achievement");
				
		
				sch = new Schedule(sch_id, sch_start_date,sch_end_date, memo, title, category, u_id, achievement);
				
				return sch;
			}
		}catch(SQLException ex) {
			ex.printStackTrace();
		} finally {	
			close();
		}
		return null;
	
	}
	 public List<Schedule> findSchedulesInDept(String userId) {

	        // printEmployeesInDept()�� ���� ...
	    	String query =  "SELECT * "
			  		+ "FROM schedule "
			  		+ "WHERE userId = ?";
	    	try {
		    	conn = getConnection();
		    	pStmt = conn.prepareStatement(query);
		    	pStmt.setString(1, userId);
				rs = pStmt.executeQuery();    	
		        
		    	// ArrayList<Employee> ��ü�� �����ϰ�, �˻��� �� ��� ������ ���� Employee ��ü�� ���� �� �����ϰ�, �� ��ü�� ArrayList�� �߰���
		    	List<Schedule> schList = new ArrayList<Schedule>();
		    	
		    	Schedule sch = new Schedule();
		    	
		    	while(rs.next()) {	    
		    		sch.setSchId(rs.getInt("sch_id"));
		    		sch.setSschStartDate(rs.getDate("start_date"));
		    		sch.setSchEndDate(rs.getDate("end_date"));
					sch.setMemo(rs.getString("memo"));
					sch.setTitle(rs.getString("title"));
					sch.setCategory(rs.getString("category"));
					sch.setU_id(rs.getInt("u_id"));
					sch.setAchievement(rs.getInt("achievement"));
			
					schList.add(sch);				
				}		
		    	return schList;
	    	} catch(SQLException ex) {
	    		ex.printStackTrace();
	    	} finally {
	    		close();
	    	}
			return null;
	    }
	
	
	
	public void close() { //�ڿ��ݳ�
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
