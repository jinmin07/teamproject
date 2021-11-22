package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.SupportVO;

@Repository
public class SupportDAOImpl implements SupportDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.SupportMapper";

	@Override
	public List<SupportVO> list(Criteria cri) {
		return session.selectList(namespace+".list",cri);
	}

	@Override
	public void insert(SupportVO vo) {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public int maxCode() {
		return session.selectOne(namespace+".maxCode");
	}

	@Override
	public int totalCount(Criteria cri) {
		return session.selectOne(namespace+".totalCount",cri);
	}

	@Override
	public void s_view(int id) {
		session.update(namespace+".viewcnt",id);
	}

	@Override
	public SupportVO read(int id) {
		return session.selectOne(namespace+".read", id);
	}

	@Override
	public void delete(int id) {
		session.delete(namespace+".delete",id);
	}


	@Override
	public void update(SupportVO vo) {
		session.update(namespace+".update",vo);
	}
	
	@Override
	public void add_feed_cnt(int id, int value) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("value", value);
		session.update(namespace + ".add_feed_cnt", map);
	}
}
