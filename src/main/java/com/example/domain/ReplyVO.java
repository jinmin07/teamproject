package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyVO {
	private int b_reply_id;
	private int b_id;
	private String b_reply_writer;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date b_reply_date;
	private String b_reply_content;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date updatedate;
	
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public int getB_reply_id() {
		return b_reply_id;
	}
	public void setB_reply_id(int b_reply_id) {
		this.b_reply_id = b_reply_id;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_reply_writer() {
		return b_reply_writer;
	}
	public void setB_reply_writer(String b_reply_writer) {
		this.b_reply_writer = b_reply_writer;
	}
	public Date getB_reply_date() {
		return b_reply_date;
	}
	public void setB_reply_date(Date b_reply_date) {
		this.b_reply_date = b_reply_date;
	}
	public String getB_reply_content() {
		return b_reply_content;
	}
	public void setB_reply_content(String b_reply_content) {
		this.b_reply_content = b_reply_content;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [b_reply_id=" + b_reply_id + ", b_id=" + b_id + ", b_reply_writer=" + b_reply_writer
				+ ", b_reply_date=" + b_reply_date + ", b_reply_content=" + b_reply_content + ", updatedate="
				+ updatedate + "]";
	}
}
