package com.example.domain.course;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CReplyVO extends CQueryVO {
	private int c_reply_id;
	private int c_query_id;
	private String c_reply_writer;
	private String c_reply_content;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date c_reply_date;
	public int getC_reply_id() {
		return c_reply_id;
	}
	public void setC_reply_id(int c_reply_id) {
		this.c_reply_id = c_reply_id;
	}
	public int getC_query_id() {
		return c_query_id;
	}
	public void setC_query_id(int c_query_id) {
		this.c_query_id = c_query_id;
	}
	public String getC_reply_writer() {
		return c_reply_writer;
	}
	public void setC_reply_writer(String c_reply_writer) {
		this.c_reply_writer = c_reply_writer;
	}
	public String getC_reply_content() {
		return c_reply_content;
	}
	public void setC_reply_content(String c_reply_content) {
		this.c_reply_content = c_reply_content;
	}
	public Date getC_reply_date() {
		return c_reply_date;
	}
	public void setC_reply_date(Date c_reply_date) {
		this.c_reply_date = c_reply_date;
	}
	
	@Override
	public String toString() {
		return "CReplyVO [c_reply_id=" + c_reply_id + ", c_query_id=" + c_query_id + ", c_reply_writer="
				+ c_reply_writer + ", c_reply_content=" + c_reply_content + ", c_reply_date=" + c_reply_date + "]";
	}
	 
}
