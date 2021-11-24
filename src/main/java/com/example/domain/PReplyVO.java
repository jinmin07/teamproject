package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PReplyVO {

	private int p_reply_id;
	private int p_query_id;
	private String p_reply_writer;
	private String p_reply_content;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date c_reply_date;

	public int getP_reply_id() {
		return p_reply_id;
	}

	public void setP_reply_id(int p_reply_id) {
		this.p_reply_id = p_reply_id;
	}

	public int getP_query_id() {
		return p_query_id;
	}

	public void setP_query_id(int p_query_id) {
		this.p_query_id = p_query_id;
	}

	public String getP_reply_writer() {
		return p_reply_writer;
	}

	public void setP_reply_writer(String p_reply_writer) {
		this.p_reply_writer = p_reply_writer;
	}

	public String getP_reply_content() {
		return p_reply_content;
	}

	public void setP_reply_content(String p_reply_content) {
		this.p_reply_content = p_reply_content;
	}

	public Date getC_reply_date() {
		return c_reply_date;
	}

	public void setC_reply_date(Date c_reply_date) {
		this.c_reply_date = c_reply_date;
	}

}
