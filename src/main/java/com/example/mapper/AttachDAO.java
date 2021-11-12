package com.example.mapper;

import java.util.List;

public interface AttachDAO {
	public List<String> list(int id);
	public void insert(int id, String b_image);
	public void delete(String b_image);
}
