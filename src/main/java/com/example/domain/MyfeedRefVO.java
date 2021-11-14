package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MyfeedRefVO {
	private int id;
	private String tbl_code;
	private String writer;
	private String title;
	@JsonFormat(pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date regdate;
	private String image;
	private String content;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTbl_code() {
		return tbl_code;
	}
	public void setTbl_code(String tbl_code) {
		this.tbl_code = tbl_code;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "MyfeedVO [id=" + id + ", tbl_code=" + tbl_code + ", writer=" + writer + ", title=" + title
				+ ", regdate=" + regdate + ", image=" + image + ", content=" + content + "]";
	}
}
