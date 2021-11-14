package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MyfeedVO {
	private int f_id;
	private String user_id;
	private String tbl_code;
	private int primary_id;
	@JsonFormat(pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date f_date;
	
	public int getF_id() {
		return f_id;
	}
	public void setF_id(int f_id) {
		this.f_id = f_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTbl_code() {
		return tbl_code;
	}
	public void setTbl_code(String tbl_code) {
		this.tbl_code = tbl_code;
	}
	public int getPrimary_id() {
		return primary_id;
	}
	public void setPrimary_id(int primary_id) {
		this.primary_id = primary_id;
	}
	public Date getF_date() {
		return f_date;
	}
	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}
	
	@Override
	public String toString() {
		return "MyfeedVO [f_id=" + f_id + ", user_id=" + user_id + ", tbl_code=" + tbl_code + ", primary_id="
				+ primary_id + ", f_date=" + f_date + "]";
	}
}
