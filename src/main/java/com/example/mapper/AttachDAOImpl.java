package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttachDAOImpl implements AttachDAO{
	
	@Autowired
	SqlSession session;
	
	String namespace="com.example.mapper.AttachMapper";
	
	@Override
	public List<String> list(int id) {
		return session.selectList(namespace + ".list", id);
	}

	@Override
	public void insert(String b_image) {
		session.insert(namespace + ".insert", b_image);
	}

	@Override
	public void delete(String b_image) {
		session.delete(namespace + ".delete", b_image);
	}

	@Override
	public void insert_old(int id, String b_image) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("b_image", b_image);
		session.insert(namespace + ".insert_old", map);
	}
	
}
