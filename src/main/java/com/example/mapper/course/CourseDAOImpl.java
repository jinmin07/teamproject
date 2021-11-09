package com.example.mapper.course;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.course.CourseVO;
import com.example.domain.Criteria;
import com.example.domain.course.CQueryVO;
import com.example.domain.course.CReplyVO;
import com.example.domain.course.CategoryVO;

@Repository
public class CourseDAOImpl implements CourseDAO {
	@Autowired
	SqlSession session;
	
	String namespace="com.example.mapper.course.CourseMapper";
	
	@Override
	public CategoryVO list_category(String tbl_code) {
		return session.selectOne(namespace + ".list_category", tbl_code);
	}

	@Override
	public List<HashMap<String, Object>> list_member(int c_id) {
		return session.selectList(namespace + ".list_member", c_id);
	}

	@Override
	public List<CQueryVO> list_query(int c_id) {
		return session.selectList(namespace + ".list_query", c_id);
	}

	@Override
	public CReplyVO list_reply(int c_query_id) {
		return session.selectOne(namespace + ".list_reply", c_query_id);
	}

	@Override
	public List<CourseVO> list() {
		return session.selectList(namespace + ".list");
	}

	@Override
	public CourseVO list_course(int id) {
		return session.selectOne(namespace + ".list_course", id);
	}

	@Override
	public void insert_member(int c_id, String c_member) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("c_id", c_id);
		map.put("c_member", c_member);
		session.insert(namespace + ".insert_member", map);
	}

	@Override
	public void delete_member(int c_id, String c_member) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("c_id", c_id);
		map.put("c_member", c_member);
		session.delete(namespace + ".delete_member", map);
	}

	@Override
	public int chk_member(int c_id, String c_member) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("c_id", c_id);
		map.put("c_member", c_member);
		return session.selectOne(namespace +".chk_member", map);
	}

	@Override
	public void insert_query(CQueryVO vo) {
		session.insert(namespace + ".insert_query", vo);
	}

	@Override
	public int cnt_query(int c_id) {
		return session.selectOne(namespace + ".cnt_query", c_id);
	}

	@Override
	public void update_cnt_course(int id, int value) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("value", value);
		session.update(namespace + ".update_cnt_course", map);
	}
		
	@Override
	public void update_replystate_query(int c_query_id) {
		session.update(namespace + ".update_replystate_query", c_query_id);
	}

	@Override
	public void insert_reply(CReplyVO vo) {
		session.insert(namespace + ".insert_reply", vo);
	}
	
	
	@Override
	public List<CourseVO> list(Criteria cri) {
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public void insert(CourseVO vo) {
		session.insert(namespace + ".insert", vo);
		
	}

	@Override
	public int maxCode() {
		return session.selectOne(namespace+".maxCode");
	}

	@Override
	public int totalCount(Criteria cri) {
		return session.selectOne(namespace+".totalCount",cri);
	}


}
