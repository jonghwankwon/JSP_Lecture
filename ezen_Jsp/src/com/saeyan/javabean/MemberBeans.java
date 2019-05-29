package com.saeyan.javabean;

public class MemberBeans {
	private String name;
	private String userid;

//	MemberBeans(String name, String userid) {
//		super();
//		this.name = name;
//		this.userid = userid;
//	}
	
	public String getName() {
		return name;
	}
	public String getUserid() {
		return userid;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "MemberBeans [name=" + name + ", userid=" + userid + "]";
	}
	
	
}
