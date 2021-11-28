package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.PQueryVO;
import com.example.domain.PReplyVO;
import com.example.domain.ProductVO;

@Repository
public class ProductDAOImpl  implements ProductDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ProductMapper";
	
	@Override
	public List<ProductVO> list(Criteria cri) {
		
		return session.selectList(namespace + ".list",cri);
	}
	
	@Override
	public void insert(ProductVO vo) {
		session.insert(namespace + ".insert", vo);
	}
	
	@Override
	public String maxId() {
		return session.selectOne(namespace + ".maxId");
	}
	
	@Override
	public ProductVO read(int id) {
		return session.selectOne(namespace + ".read",id);
	}
	
	@Override
	public int totCount(Criteria cri) {
		return session.selectOne(namespace + ".totCount",cri);
	}
	
	@Override
	public void update(ProductVO vo) {
		session.update(namespace + ".update",vo);
	}

	@Override
	public int chk_member(int p_id, String p_member) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("p_id", p_id);
		map.put("p_member", p_member);
		return session.selectOne(namespace + ".chk_member",map);
	}

	@Override
	public void insert_member(int p_id, String p_member) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("p_id", p_id);
		map.put("p_member", p_member);
		session.insert(namespace + ".insert_member",map);
		
	}

	@Override
	public void delete_member(int p_id, String p_member) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("p_id", p_id);
		map.put("p_member", p_member);
		session.delete(namespace + ".delete_member",map);
	}
	
	@Override
	public void delete(int id) {
		session.delete(namespace + ".delete",id);
	}

	@Override
	public List<PQueryVO> list_query(int p_id) {
		return session.selectList(namespace + ".list_query",p_id);
	}

	@Override
	public int cnt_query(int p_id) {
		return session.selectOne(namespace + ".cnt_query" , p_id);
	}

	@Override
	public void insert_query(PQueryVO vo) {
		session.insert(namespace + ".insert_query" , vo);
	}

	@Override
	public PReplyVO list_reply(int p_query_id) {
		return session.selectOne(namespace + ".list_reply" , p_query_id);
	}

	@Override
	public void update_replystate_query(int c_query_id) {
		session.update(namespace + ".update_replystate_query" , c_query_id);
	}

	@Override
	public void insert_reply(PReplyVO vo) {
		session.insert(namespace + ".insert_reply", vo);
	}

	@Override
	public void update_cnt_purchase(int id, int value) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("value", value);
		session.update(namespace + ".update_cnt_purchase", map);
	}

	@Override
	public void delete_query(int p_query_id) {
		session.delete(namespace + ".delete_query",p_query_id);
		
	}

	@Override
	public void query_state(int p_id) {
		session.update(namespace + ".query_state", p_id);
	}

	@Override
	public void add_feed_cnt(int id, int value) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("value", value);
		session.update(namespace + ".add_feed_cnt", map);
	}

	@Override
	public ProductVO list_purchase(int id) {
		return session.selectOne(namespace + ".list_purchase",id);
	}

	@Override
	public void pay_state(int p_id, String p_member) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("p_id", p_id);
		map.put("p_member", p_member);
		session.update(namespace + ".pay_state", map);
	}

	@Override
	public void deal_state(int p_id, String p_member) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("p_id", p_id);
		map.put("p_member", p_member);
		session.update(namespace + ".deal_state", map);
	}

	@Override
	public int cnt_pay_rest(int p_id) {
		return session.selectOne(namespace + ".cnt_pay_rest", p_id);
	}

	@Override
	public int cnt_deal_rest(int p_id) {
		return session.selectOne(namespace + ".cnt_deal_rest", p_id);
	}

	@Override
	public int chk_pay(int p_id, String p_member) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("p_id", p_id);
		map.put("p_member", p_member);
		return session.selectOne(namespace+".chk_pay", map);
	}

	@Override
	public int chk_deal(int p_id, String p_member) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("p_id", p_id);
		map.put("p_member", p_member);
		return session.selectOne(namespace+".chk_deal", map);
	}
}