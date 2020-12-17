package model.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Schedule implements Serializable {
	private String memo, title, category, start_date, end_date, u_id, sch_id;

	public Schedule() {
		super();
	}

	public Schedule(String start_date, String title) {
		super();
		this.start_date = start_date;
		this.title = title;
	}	

	public Schedule(String sch_id, String start_date, String end_date, String memo, 
			String title, String category, String u_id) {
		super();
		this.sch_id = sch_id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.memo = memo;
		this.title = title;
		this.category = category;
		this.u_id = u_id;
	}	

	public String getSch_id() {
		return sch_id;
	}

	public void setSch_id(String sch_id) {
		this.sch_id = sch_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_id() {
		return u_id;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getMemo() {		return memo;	}
	public void setMemo(String memo) {		this.memo = memo;	}
	public String getTitle() {		return title;	}
	public void setTitle(String title) {		this.title = title;	}
	public String getCategory() {		return category;	}
	public void setCategory(String category) {		this.category = category;	}
	public String toString() {
		return "";
	}
}