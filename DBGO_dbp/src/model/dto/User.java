package model.dto;//

public class User {
	private int u_id;
	private String name = null;
	private String email = null;
	private String nickname = null;
	private String password  = null;
	
	public User() {
		
	}
	
	public User(int u_id, String name, String email, String nickname, String password) {
		super();
		this.u_id = u_id;
		this.name = name;
		this.email = email;
		this.nickname = nickname;
		this.password = password;
	}

	
	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
