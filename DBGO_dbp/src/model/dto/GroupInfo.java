package model.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class GroupInfo implements Serializable {
	private String g_id;
	private String g_name;
	private int numOfMembers;
	
	public GroupInfo() {}

	public GroupInfo(String g_id, String g_name, int numOfMembers) {
		super();
		this.g_id = g_id;
		this.g_name = g_name;
		this.numOfMembers = numOfMembers;
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

	public int getNumOfMembers() {
		return numOfMembers;
	}

	public void setNumOfMembers(int numOfMembers) {
		this.numOfMembers = numOfMembers;
	}

}
