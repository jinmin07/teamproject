package com.example.mapper;

import java.util.List;

public interface AttachDAO {
	public List<String> list(int id);
	public void insert(String b_image);
	public void insert_old(int id, String b_image);
	public void delete(String b_image);
}
