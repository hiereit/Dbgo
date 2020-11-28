package model.dto;

import java.util.Date;

public class GroupSchedule {
	private String homework = null;
	private String g_id = null;
	private String groupsch_id = null;
	private Date groupsch_date = null;
	private String memo = null;
	private String title = null;
	//private String category = null;
	//ī�װ� ����
	
	public GroupSchedule() {super();}
	
	public GroupSchedule(String homework, String g_id, String groupsch_id, Date groupsch_date, String memo,
			String title) {
		super();
		this.homework = homework;
		this.g_id = g_id;
		this.groupsch_id = groupsch_id;
		this.groupsch_date = groupsch_date;
		this.memo = memo;
		this.title = title;
	}
	public String getHomework() {
		return homework;
	}
	public void setHomework(String homework) {
		this.homework = homework;
	}
	public String getG_id() {
		return g_id;
	}
	public void setG_id(String g_id) {
		this.g_id = g_id;
	}
	public String getGroupsch_id() {
		return groupsch_id;
	}
	public void setGroupsch_id(String groupsch_id) {
		this.groupsch_id = groupsch_id;
	}
	public Date getGroupsch_date() {
		return groupsch_date;
	}
	public void setGroupsch_date(Date groupsch_date) {
		this.groupsch_date = groupsch_date;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
