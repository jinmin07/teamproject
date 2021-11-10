package com.example.domain;
import java.util.ArrayList;
import java.util.Date;

public class ProductVO {
	
	private String id; //공동구매 번호
	private String tbl_code; //테이블 코드
	private String title; //공동구매 제목
	private String p_writer; //작성자
	private String p_local; //지역
	private String p_link; //링크
	private int p_price; //정가
	private int p_salePrice; //할인 가격
	private String p_image; //이미지
	private String p_category; //상품 카테고리
	private String date_start; // 모집시작일
	private String date_end; //모집마감일
	private int p_cnt_member; //모집된 인원
	private int p_tot_member;  //총 모집인원
	private int p_view; // 조회수
	private int p_cnt_feed; //피드수

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTbl_code() {
		return tbl_code;
	}
	public void setTbl_code(String tbl_code) {
		this.tbl_code = tbl_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getP_writer() {
		return p_writer;
	}
	public void setP_writer(String p_writer) {
		this.p_writer = p_writer;
	}
	public String getP_local() {
		return p_local;
	}
	public void setP_local(String p_local) {
		this.p_local = p_local;
	}
	public String getP_link() {
		return p_link;
	}
	public void setP_link(String p_link) {
		this.p_link = p_link;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_salePrice() {
		return p_salePrice;
	}
	public void setP_salePrice(int p_salePrice) {
		this.p_salePrice = p_salePrice;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getDate_start() {
		return date_start;
	}
	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}
	public String getDate_end() {
		return date_end;
	}
	public void setDate_end(String date_end) {
		this.date_end = date_end;
	}
	public int getP_cnt_member() {
		return p_cnt_member;
	}
	public void setP_cnt_member(int p_cnt_member) {
		this.p_cnt_member = p_cnt_member;
	}
	public int getP_tot_member() {
		return p_tot_member;
	}
	public void setP_tot_member(int p_tot_member) {
		this.p_tot_member = p_tot_member;
	}
	public int getP_view() {
		return p_view;
	}
	public void setP_view(int p_view) {
		this.p_view = p_view;
	}
	public int getP_cnt_feed() {
		return p_cnt_feed;
	}
	public void setP_cnt_feed(int p_cnt_feed) {
		this.p_cnt_feed = p_cnt_feed;
	}
	@Override
	public String toString() {
		return "ProductVO [id=" + id + ", tbl_code=" + tbl_code + ", title=" + title + ", p_writer=" + p_writer
				+ ", p_local=" + p_local + ", p_link=" + p_link + ", p_price=" + p_price
				+ ", p_salePrice=" + p_salePrice + ", p_image=" + p_image + ", p_category=" + p_category
				+ ", date_start=" + date_start + ", date_end=" + date_end + ", p_cnt_member=" + p_cnt_member
				+ ", p_tot_member=" + p_tot_member + ", p_view=" + p_view + ", p_cnt_feed=" + p_cnt_feed
				+ ", getId()=" + getId() + ", getTbl_code()=" + getTbl_code()
				+ ", getTitle()=" + getTitle() + ", getP_writer()=" + getP_writer() + ", getP_local()=" + getP_local()
				+ ", getP_link()=" + getP_link() + ", getP_price()=" + getP_price() + ", getP_salePrice()="
				+ getP_salePrice() + ", getP_image()=" + getP_image() + ", getP_category()=" + getP_category()
				+ ", getDate_start()=" + getDate_start() + ", getDate_end()=" + getDate_end() + ", getP_cnt_member()="
				+ getP_cnt_member() + ", getP_tot_member()=" + getP_tot_member() + ", getP_view()=" + getP_view()
				+ ", getP_cnt_feed()=" + getP_cnt_feed() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}