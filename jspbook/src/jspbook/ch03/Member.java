package jspbook.ch03;

import java.util.Objects;

public class Member {
	private int id;
	private String name;
	private String email;
	private String tel;

	public int getId() {
		return id;
	}
	public void getNewId() {
		if(tel!=null)
		id = Objects.hash(name, email, tel);
		System.out.println(toString());
	}
	public void setId(int id) {
		this.id = id;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", email=" + email + ", tel=" + tel + "]";
	}

}
