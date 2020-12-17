package model.dto;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Comparator;
import java.util.Date;

@SuppressWarnings("serial")
public class Diary implements Serializable {
	private String d_id;
	private String d_date;
	private String content;
	private String u_id;

	public Diary() {
		super();
	}

	public String getD_id() {
		return d_id;
	}

	public void setD_id(String d_id) {
		this.d_id = d_id;
	}

	public String getD_date() {
		return d_date;
	}

	public void setD_date(String d_date) {
		this.d_date = d_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public static class SortByDate implements Comparator<Diary> {
		@Override
		public int compare(Diary s1, Diary s2) {
			DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");  // 주의: 월을 나타내는 MM은 대문자
			Date d1 = null, d2 = null;
			try {
				d1 = df.parse(s1.getD_date());
				d2 = df.parse(s2.getD_date());

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}   
			return d2.compareTo(d1);
		}
	}
}