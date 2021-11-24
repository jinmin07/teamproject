package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	SqlSession session;
	
	String namespace="com.example.mapper.BoardMapper";

	@Override
	public List<BoardVO> list(Criteria cri) {
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public void insert(BoardVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void update(BoardVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int id) {
		session.delete(namespace + ".delete", id);
	}
	
	@Override
	public BoardVO read(int id) {
		return session.selectOne(namespace + ".read", id);
	}

	@Override
	public void addAttach(String fullName) {
		session.insert(namespace + ".addAttach", fullName);
	}

	@Override
	public List<String> getAttach(int id) {
		return session.selectList(namespace + ".getAttach", id);
	}

	@Override
	public void replaceAttach(int id, String fullName) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("bno", id);
		map.put("fullName", fullName);
		session.insert(namespace + ".replaceAttach", map);
	}

	@Override
	public void deleteAttach(int id) {
		session.delete(namespace + ".deleteAttach", id);
	}

	@Override
	public void attachcount(int id) {
		session.update(namespace + ".attachcount", id);
	}

	@Override
	public void newattachcount() {
		session.update(namespace + ".newattachcount");
	}

	@Override
	public int totalCount(Criteria cri) {
		return session.selectOne(namespace + ".totalCount", cri);
	}

	@Override
	public void updateb_view(int id) {
		session.update(namespace + ".updateb_view", id);
	}

	@Override
	public String maxCode() {
		return session.selectOne(namespace + ".maxCode");
	}

	@Override
	public void deleteReply(int b_id) {
		session.delete(namespace + ".delete_reply", b_id);
	}
	
	@Override
	public void add_feed_cnt(int id, int value) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("value", value);
		session.update(namespace + ".add_feed_cnt", map);
	}

	@Override
	public void add_cnt_reply(int id, int value) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("value", value);
		session.update(namespace +".add_cnt_reply", map);
	}

	@Override
	public void add_cnt_rec(int id, int value) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("value", value);
		session.update(namespace + ".add_cnt_rec", map);
	}

	@Override
	public void insert_rec(int b_id, String user_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("b_id", b_id);
		map.put("user_id", user_id);
		session.insert(namespace + ".insert_rec", map);
	}

	@Override
	public void delete_rec(int b_id, String user_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("b_id", b_id);
		map.put("user_id", user_id);
		session.insert(namespace + ".delete_rec", map);
	}

	@Override
	public int chk_rec(int b_id, String user_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("b_id", b_id);
		map.put("user_id", user_id);
		return session.selectOne(namespace + ".chk_rec", map);
	}
}
