package com.example.domain;

public class UserVO {
	
	private String u_id;
	private String u_pass;
	private int u_age;
	private String u_name;
	private String u_addr1;
	private String u_addr2;
	private String u_addr3;
	private String u_gender;
	private String u_email;
	private String u_phone;
	private int u_score;
	private int u_point;
	
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int u_point) {
		this.u_point = u_point;
	}
	
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pass() {
		return u_pass;
	}
	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}
	public int getU_age() {
		return u_age;
	}
	public void setU_age(int u_age) {
		this.u_age = u_age;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_addr1() {
		return u_addr1;
	}
	public void setU_addr1(String u_addr1) {
		this.u_addr1 = u_addr1;
	}
	public String getU_addr2() {
		return u_addr2;
	}
	public void setU_addr2(String u_addr2) {
		this.u_addr2 = u_addr2;
	}
	public String getU_addr3() {
		return u_addr3;
	}
	public void setU_addr3(String u_addr3) {
		this.u_addr3 = u_addr3;
	}
	public String getU_gender() {
		return u_gender;
	}
	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public int getU_score() {
		return u_score;
	}
	public void setU_score(int u_score) {
		this.u_score = u_score;
	}
	@Override
	public String toString() {
		return "UserVO [u_id=" + u_id + ", u_pass=" + u_pass + ", u_age=" + u_age + ", u_name=" + u_name + ", u_addr1="
				+ u_addr1 + ", u_addr2=" + u_addr2 + ", u_addr3=" + u_addr3 + ", u_gender=" + u_gender + ", u_email="
				+ u_email + ", u_phone=" + u_phone + ", u_score=" + u_score + "]";
	}
}