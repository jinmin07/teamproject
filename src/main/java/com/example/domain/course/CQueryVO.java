package com.example.domain.course;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CQueryVO{
	private int c_query_id;
	private int c_id;
	private String c_query_writer;
	private String c_query_content;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date c_query_date;
	private String c_openable;
	private String c_reply_state;
	
	public String getC_reply_state() {
		return c_reply_state;
	}
	public void setC_reply_state(String c_reply_state) {
		this.c_reply_state = c_reply_state;
	}
	public int getC_query_id() {
		return c_query_id;
	}
	public void setC_query_id(int c_query_id) {
		this.c_query_id = c_query_id;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_query_writer() {
		return c_query_writer;
	}
	public void setC_query_writer(String c_query_writer) {
		this.c_query_writer = c_query_writer;
	}
	public String getC_query_content() {
		return c_query_content;
	}
	public void setC_query_content(String c_query_content) {
		this.c_query_content = c_query_content;
	}
	public Date getC_query_date() {
		return c_query_date;
	}
	public void setC_query_date(Date c_query_date) {
		this.c_query_date = c_query_date;
	}
	public String getC_openable() {
		return c_openable;
	}
	public void setC_openable(String c_openable) {
		this.c_openable = c_openable;
	}
	
	@Override
	public String toString() {
		return "CQueryVO [c_query_id=" + c_query_id + ", c_id=" + c_id + ", c_query_writer=" + c_query_writer
				+ ", c_query_content=" + c_query_content + ", c_query_date=" + c_query_date + ", c_openable="
				+ c_openable + ", c_reply_state=" + c_reply_state + "]";
	}
}
