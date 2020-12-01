package model.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("serial")
public class GroupInfo implements Serializable {
	private String g_id;
	private String g_name;
	private int numOfMembers;
	private List<String> members;
	
	public GroupInfo() {
		this.members = new ArrayList<>();
	}
	
	public GroupInfo(String g_id, String g_name) {
		super();
		this.g_id = g_id;
		this.g_name = g_name;
		this.members = new ArrayList<>();
	}

	public GroupInfo(String g_id, String g_name, int numOfMembers) {
		super();
		this.g_id = g_id;
		this.g_name = g_name;
		this.numOfMembers = numOfMembers;
		this.members = new ArrayList<>();
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

	public List<String> getMembers() {
		return members;
	}

	public void setMembers(List<String> members) {
		this.members = members;
	}

	
}
