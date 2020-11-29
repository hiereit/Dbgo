package model.dto;
import java.util.Date;

public class Schedule {
	private String memo, title, category;
	private int achievement, u_id, schId;
	private Date schStartDate, schEndDate;
	
	//Constructor (default/ ...)
	public Schedule() { //default ������
		super();
	}
	
	public Schedule(Date schStartDate, String title) {
		super();
		this.schStartDate = schStartDate;
		this.title = title;

	}	
	
	public Schedule(int sch_id, Date schStartDate, Date schEndDate, String memo, 
			String title, String category, int u_id, int achievement) {
		super();
		this.schId = sch_id;
		this.schStartDate = schStartDate;
		this.memo = memo;
		this.title = title;
		this.category = category;
		this.u_id = u_id;
		this.achievement = achievement;
	}	
	
	//setter & getter ����
	public int getSchId() {		return schId;	}
	public void setSchId(int schId) {		this.schId = schId;	}
	public Date getSchStartDate() {		return schStartDate;	}
	public void setSschStartDate(Date schStartDate) {		this.schStartDate = schStartDate;	}
	public Date getSchEndDate() {	return schEndDate;}
	public void setSchEndDate(Date schEndDate) {		this.schEndDate = schEndDate;	}
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



}
