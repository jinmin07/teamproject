package com.example.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BoardVO {
	private int id;
	private String tbl_code;
	private String b_category;
	private String title;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date b_date;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date updatedate;
	private String b_writer;
	private String b_content;
	private int b_view;
	private int b_cnt_reply;
	private int b_cnt_feed;
	private int b_rec;
	
	//파일 업로드에 필요한 변수
	private String b_image;
	public int getB_cnt_feed() {
		return b_cnt_feed;
	}
	public void setB_cnt_feed(int b_cnt_feed) {
		this.b_cnt_feed = b_cnt_feed;
	}
	private ArrayList<String> b_images;
	private int attachcount;
	
	
	
	public ArrayList<String> getB_images() {
		return b_images;
	}
	public void setB_images(ArrayList<String> b_images) {
		this.b_images = b_images;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public int getAttachcount() {
		return attachcount;
	}
	public void setAttachcount(int attachcount) {
		this.attachcount = attachcount;
	}
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
	public String getB_category() {
		return b_category;
	}
	public void setB_category(String b_category) {
		this.b_category = b_category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_view() {
		return b_view;
	}
	public void setB_view(int b_view) {
		this.b_view = b_view;
	}
	public int getB_cnt_reply() {
		return b_cnt_reply;
	}
	public void setB_cnt_reply(int b_cnt_reply) {
		this.b_cnt_reply = b_cnt_reply;
	}
	public String getB_image() {
		return b_image;
	}
	public void setB_image(String b_image) {
		this.b_image = b_image;
	}
	public int getB_rec() {
		return b_rec;
	}
	public void setB_rec(int b_rec) {
		this.b_rec = b_rec;
	}
	
	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", tbl_code=" + tbl_code + ", b_category=" + b_category + ", title=" + title
				+ ", b_date=" + b_date + ", updatedate=" + updatedate + ", b_writer=" + b_writer + ", b_content="
				+ b_content + ", b_view=" + b_view + ", b_cnt_reply=" + b_cnt_reply + ", b_cnt_feed=" + b_cnt_feed
				+ ", b_rec=" + b_rec + ", b_image=" + b_image + ", b_images=" + b_images + ", attachcount="
				+ attachcount + "]";
	}
}


/*
id int(11),
tbl_code varchar(5),
b_category varchar(20),
title varchar(200),
b_date datetime,
b_writer varchar(20),
b_content varchar(4000),
b_view int(11),
b_cnt_reply int(11),
b_image varchar(40),
b_rec int(11),
primary key(b_id)
*/