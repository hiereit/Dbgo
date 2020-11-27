package model.dto;

public class User {
	private String u_id;
	private String name = null;
	private String email = null;
	private String password  = null;
	
	public User() {
		
	}
	
	public User(String u_id, String name, String email, String password) {
		super();
		this.u_id = u_id;
		this.name = name;
		this.email = email;
		this.password = password;
	}

	
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	/* 비밀번호 검사 */
	public boolean matchPassword(String password) {
		if (password == null) {
			return false;
		}
		return this.password.equals(password);
	}
	
	public boolean isSameUser(String userid) {
        return this.u_id.equals(userid);
    }
}
