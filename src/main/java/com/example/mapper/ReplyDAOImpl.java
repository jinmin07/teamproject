package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Autowired
	SqlSession session;
	
	String namespace="com.example.mapper.ReplyMapper";

	@Override
	public List<ReplyVO> list(int id, Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("b_id", id);
		map.put("cri", cri);
		return session.selectList(namespace + ".list", map);
	}

	@Override
	public int totalCount(int id) {
		return session.selectOne(namespace + ".totalCount", id);
	}

	@Override
	public void insert(ReplyVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void delete(int b_reply_id) {
		session.delete(namespace + ".delete", b_reply_id);
	}

}
