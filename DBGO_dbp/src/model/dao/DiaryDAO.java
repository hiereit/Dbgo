package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	public Diary findDiary(String deptName) {
		Connection conn = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;

		String query = "SELECT deptNo, manager, count(empNo) AS numOfEmp "
				+ "FROM emp_180988 e JOIN dept_180988 d USING (deptNo) "
				+ "WHERE dname = ? "
				+ "GROUP BY deptNo, manager";
		return null;


	}
}
