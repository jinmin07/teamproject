package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PQueryVO {

	private int p_query_id;
	private int p_id;
	private String p_query_writer;
	private String p_query_content;
	@JsonFormat(pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date c_query_date;
	private String p_openable;
	private String p_reply_state;

	public int getP_query_id() {
		return p_query_id;
	}

	public void setP_query_id(int p_query_id) {
		this.p_query_id = p_query_id;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getP_query_writer() {
		return p_query_writer;
	}

	public void setP_query_writer(String p_query_writer) {
		this.p_query_writer = p_query_writer;
	}

	public String getP_query_content() {
		return p_query_content;
	}

	public void setP_query_content(String p_query_content) {
		this.p_query_content = p_query_content;
	}

	public Date getC_query_date() {
		return c_query_date;
	}

	public void setC_query_date(Date c_query_date) {
		this.c_query_date = c_query_date;
	}

	public String getP_openable() {
		return p_openable;
	}

	public void setP_openable(String p_openable) {
		this.p_openable = p_openable;
	}

	public String getP_reply_state() {
		return p_reply_state;
	}

	public void setP_reply_state(String p_reply_state) {
		this.p_reply_state = p_reply_state;
	}

}
