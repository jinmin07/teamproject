package com.example.domain.course;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CourseVO extends CategoryVO {
	private int id;
	private String tbl_code;
	private String c_writer;
	private String title;
	private String c_local;
	private String c_place;
	private String c_gender;
	private int c_age_min;
	private int c_age_max;
	@JsonFormat(pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date c_date;
	private int c_cnt_member;
	private int c_tot_member;
	@JsonFormat(pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date date_start;
	@JsonFormat(pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date date_end;
	private String c_time;
	private String c_fee;
	private String c_content;
	private int c_state;
	private int c_view;
	private int c_cnt_feed;
	
	public int getC_state() {
		return c_state;
	}
	public void setC_state(int c_state) {
		this.c_state = c_state;
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
	public String getC_writer() {
		return c_writer;
	}
	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getC_local() {
		return c_local;
	}
	public void setC_local(String c_local) {
		this.c_local = c_local;
	}
	public String getC_place() {
		return c_place;
	}
	public void setC_place(String c_place) {
		this.c_place = c_place;
	}
	public String getC_gender() {
		return c_gender;
	}
	public void setC_gender(String c_gender) {
		this.c_gender = c_gender;
	}
	public int getC_age_min() {
		return c_age_min;
	}
	public void setC_age_min(int c_age_min) {
		this.c_age_min = c_age_min;
	}
	public int getC_age_max() {
		return c_age_max;
	}
	public void setC_age_max(int c_age_max) {
		this.c_age_max = c_age_max;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public int getC_cnt_member() {
		return c_cnt_member;
	}
	public void setC_cnt_member(int c_cnt_member) {
		this.c_cnt_member = c_cnt_member;
	}
	public int getC_tot_member() {
		return c_tot_member;
	}
	public void setC_tot_member(int c_tot_member) {
		this.c_tot_member = c_tot_member;
	}
	public Date getDate_start() {
		return date_start;
	}
	public void setDate_start(Date date_start) {
		this.date_start = date_start;
	}
	public Date getDate_end() {
		return date_end;
	}
	public void setDate_end(Date date_end) {
		this.date_end = date_end;
	}
	public String getC_time() {
		return c_time;
	}
	public void setC_time(String c_time) {
		this.c_time = c_time;
	}
	public String getC_fee() {
		return c_fee;
	}
	public void setC_fee(String c_fee) {
		this.c_fee = c_fee;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getC_view() {
		return c_view;
	}
	public void setC_view(int c_view) {
		this.c_view = c_view;
	}
	public int getC_cnt_feed() {
		return c_cnt_feed;
	}
	public void setC_cnt_feed(int c_cnt_feed) {
		this.c_cnt_feed = c_cnt_feed;
	}
	
	@Override
	public String toString() {
		return "CourseVO [id=" + id + ", tbl_code=" + tbl_code + ", c_writer=" + c_writer + ", title=" + title
				+ ", c_local=" + c_local + ", c_place=" + c_place + ", c_gender=" + c_gender + ", c_age_min="
				+ c_age_min + ", c_age_max=" + c_age_max + ", c_date=" + c_date + ", c_cnt_member=" + c_cnt_member
				+ ", c_tot_member=" + c_tot_member + ", date_start=" + date_start + ", date_end=" + date_end
				+ ", c_time=" + c_time + ", c_fee=" + c_fee + ", c_content=" + c_content + ", c_state=" + c_state
				+ ", c_view=" + c_view + ", c_cnt_feed=" + c_cnt_feed + "]";
	}
}
