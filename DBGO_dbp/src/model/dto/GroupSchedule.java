package model.dto;

import java.util.Date;

public class GroupSchedule {
	private String homework;
	private int g_id, groupsch_id;
	private Date gSchStartdate, gSchEndDate;
	
	private String memo;
	private String title;
	//private String category = null;
	
	public GroupSchedule() {super();}
	
	public GroupSchedule( int g_id, int groupsch_id, Date gSchStartdate, Date gSchEndDate,
			String memo,String homework,String title) {
		super();
		this.g_id = g_id;
		this.groupsch_id = groupsch_id;
		this.gSchStartdate = gSchStartdate;
		this.gSchEndDate= gSchEndDate;
		this.memo = memo;
		this.homework = homework;
		this.title = title;
	}
	public String getHomework() {		return homework;	}
	public void setHomework(String homework) {		this.homework = homework;	}	public int getG_id() {		return g_id;	}
	public void setG_id(int g_id) {		this.g_id = g_id;	}
	public int getGroupsch_id() {		return groupsch_id;	}
	public void setGroupsch_id(int groupsch_id) {		this.groupsch_id = groupsch_id;	}
	public Date getgSchStartDate() {		return gSchStartdate;	}
	public void setgSchStartDate(Date gSchStartdate) {		this.gSchStartdate = gSchStartdate;	}
	public Date getgSchEndDate() {		return gSchEndDate;	}
	public void setgSchEndDate(Date gSchEndDate) {		this.gSchEndDate = gSchEndDate;	}
	public String getMemo() {		return memo;	}
	public void setMemo(String memo) {		this.memo = memo;	}
	public String getTitle() {		return title;	}
	public void setTitle(String title) {		this.title = title;	}
}
