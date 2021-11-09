package com.example.domain.course;

public class CategoryVO {
	private String tbl_code;
	private String category;
	private String subcategory;
	private String category_image;
	public String getTbl_code() {
		return tbl_code;
	}
	public void setTbl_code(String tbl_code) {
		this.tbl_code = tbl_code;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public String getCategory_image() {
		return category_image;
	}
	public void setCategory_image(String category_image) {
		this.category_image = category_image;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [tbl_code=" + tbl_code + ", category=" + category + ", subcategory=" + subcategory
				+ ", category_image=" + category_image + "]";
	}
}
