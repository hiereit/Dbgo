package model.dto;
import java.util.Date;

public class Schedule {
	private String schId, memo, title, category, u_id;
	private int achievement;
	private Date shcDate;
	
	//Constructor (default/ ...)
	public Schedule() { //default 持失切
		super();
	}
	
	public Schedule(String schId, Date shcDate, String memo, 
			String title, String category, String u_id,	int achievement) {
		super();
		this.schId = schId;
		this.shcDate = shcDate;
		this.memo = memo;
		this.title = title;
		this.category = category;
		this.u_id = u_id;
		this.achievement = achievement;
	}	
	
	//setter & getter 識情
	public String getSchId() {		return schId;	}
	public void setSchId(String schId) {		this.schId = schId;	}
	public Date getShcDate() {		return shcDate;	}
	public void setShcDate(Date shcDate) {		this.shcDate = shcDate;	}
	public String getMemo() {		return memo;	}
	public void setMemo(String memo) {		this.memo = memo;	}
	public String getTitle() {		return title;	}
	public void setTitle(String title) {		this.title = title;	}
	public String getCategory() {		return category;	}
	public void setCategory(String category) {		this.category = category;	}
	public String getU_id() {		return u_id;	}
	public void setU_id(String u_id) {		this.u_id = u_id;	}
	public int getAchievement() {		return achievement;	}
	public void setAchievement(int achievement) {		this.achievement = achievement;	}
	
	public String toString() {
		return "";
	} 
	

}
