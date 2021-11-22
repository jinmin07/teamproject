package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class NoticeVO {
	private int n_id;
	private String tbl_code;
	private int tbl_id;
	private String content;
	private String sender;
	private String receiver;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="Asia/Seoul")
	private Date regdate;
	private int n_state;
	
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public String getTbl_code() {
		return tbl_code;
	}
	public void setTbl_code(String tbl_code) {
		this.tbl_code = tbl_code;
	}
	public int getTbl_id() {
		return tbl_id;
	}
	public void setTbl_id(int tbl_id) {
		this.tbl_id = tbl_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getN_state() {
		return n_state;
	}
	public void setN_state(int n_state) {
		this.n_state = n_state;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [n_id=" + n_id + ", tbl_code=" + tbl_code + ", tbl_id=" + tbl_id + ", content=" + content
				+ ", sender=" + sender + ", receiver=" + receiver + ", regdate=" + regdate + ", n_state=" + n_state
				+ "]";
	}
}
