package model.dto;

public class GroupInfo {
	private String g_id;
	private String g_name;
	
	public GroupInfo() {super();}
	
	public GroupInfo(String g_id, String g_name) {
		super();
		this.g_id = g_id;
		this.g_name = g_name;
	}

	public String getG_id() {
		return g_id;
	}

	public void setG_id(String g_id) {
		this.g_id = g_id;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}	
}
