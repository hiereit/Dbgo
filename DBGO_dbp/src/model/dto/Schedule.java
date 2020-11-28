package model.dto;
import java.util.Date;

public class Schedule {
	private String memo, title, category;
	private int achievement, u_id, schId;
	private Date schDate;
	
	//Constructor (default/ ...)
	public Schedule() { //default ������
		super();
	}
	
	public Schedule(int sch_id, Date schDate, String memo, 
			String title, String category, int u_id,	int achievement) {
		super();
		this.schId = sch_id;
		this.schDate = schDate;
		this.memo = memo;
		this.title = title;
		this.category = category;
		this.u_id = u_id;
		this.achievement = achievement;
	}	
	
	//setter & getter ����
	public int getSchId() {		return schId;	}
	public void setSchId(int schId) {		this.schId = schId;	}
	public Date getSchDate() {		return schDate;	}
	public void setSchDate(Date schDate) {		this.schDate = schDate;	}
	public String getMemo() {		return memo;	}
	public void setMemo(String memo) {		this.memo = memo;	}
	public String getTitle() {		return title;	}
	public void setTitle(String title) {		this.title = title;	}
	public String getCategory() {		return category;	}
	public void setCategory(String category) {		this.category = category;	}
	public int getU_id() {		return u_id;	}
	public void setU_id(int u_id) {		this.u_id = u_id;	}
	public int getAchievement() {		return achievement;	}
	public void setAchievement(int achievement) {		this.achievement = achievement;	}
	
	public String toString() {
		return "";
	}

	public void setSchDate(java.sql.Date date) {
		// TODO Auto-generated method stub
		this.schDate = schDate;
	}


}
