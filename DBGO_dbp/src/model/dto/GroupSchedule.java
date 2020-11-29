package model.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class GroupSchedule implements Serializable {
	private String g_id, groupsch_id, g_name;
	private String homework;
	private String groupsch_date;
	private String memo;
	private String title;
	
	public GroupSchedule() {}
	
	public GroupSchedule(String g_name, String g_id, String groupsch_id, String homework, String groupsch_date, String memo,
			String title) {
		super();
		this.g_name = g_name;
		this.g_id = g_id;
		this.groupsch_id = groupsch_id;
		this.homework = homework;
		this.groupsch_date = groupsch_date;
		this.memo = memo;
		this.title = title;
	}
	
	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
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

	public String getHomework() {
		return homework;
	}

	public void setHomework(String homework) {
		this.homework = homework;
	}

	public String getGroupsch_date() {
		return groupsch_date;
	}

	public void setGroupsch_date(String groupsch_date) {
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
