package com.example.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
public class SupportVO {
	private int id;
	private String s_local;
	private String s_age;
	private String s_gender;
	private String s_category;
	private String title;
	private String s_content;
	@JsonFormat(pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date s_date;
	private String s_image;
	private String tbl_code;
	private int s_view;
	private int s_cnt_feed;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getS_local() {
		return s_local;
	}
	public void setS_local(String s_local) {
		this.s_local = s_local;
	}
	public String getS_age() {
		return s_age;
	}
	public void setS_age(String s_age) {
		this.s_age = s_age;
	}
	public String getS_gender() {
		return s_gender;
	}
	public void setS_gender(String s_gender) {
		this.s_gender = s_gender;
	}
	public String getS_category() {
		return s_category;
	}
	public void setS_category(String s_category) {
		this.s_category = s_category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public String getS_image() {
		return s_image;
	}
	public void setS_image(String s_image) {
		this.s_image = s_image;
	}
	public String getTbl_code() {
		return tbl_code;
	}
	public void setTbl_code(String tbl_code) {
		this.tbl_code = tbl_code;
	}
	public int getS_view() {
		return s_view;
	}
	public void setS_view(int s_view) {
		this.s_view = s_view;
	}
	public int getS_cnt_feed() {
		return s_cnt_feed;
	}
	public void setS_cnt_feed(int s_cnt_feed) {
		this.s_cnt_feed = s_cnt_feed;
	}
	@Override
	public String toString() {
		return "SupportVO [id=" + id + ", s_local=" + s_local + ", s_age=" + s_age + ", s_gender=" + s_gender
				+ ", s_category=" + s_category + ", title=" + title + ", s_content=" + s_content + ", s_date=" + s_date
				+ ", s_image=" + s_image + ", tbl_code=" + tbl_code + ", s_view=" + s_view + ", s_cnt_feed="
				+ s_cnt_feed + "]";
	}
	
}