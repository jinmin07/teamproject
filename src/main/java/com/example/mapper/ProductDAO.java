package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.PQueryVO;
import com.example.domain.PReplyVO;
import com.example.domain.ProductVO;

public interface ProductDAO {
	
public List<ProductVO> list(Criteria cri);
	
	public void insert(ProductVO vo);
	
	public String maxId();
	
	public ProductVO read(int id);	
	
	public int totCount();
	
	public void update(ProductVO vo);
	
	public List<HashMap<String,Object>> list_member(int p_id);
	
	public int chk_member(int p_id,String p_member);
	
	public void insert_member(int p_id,String p_member);
	
	public void delete_member(int p_id,String p_member);
	
	public void delete(int id);
	
	public List<PQueryVO> list_query(int p_id);
	
	public int cnt_query(int p_id);
	
	public void insert_query(PQueryVO vo);
	
	public PReplyVO list_reply(int p_query_id);
	
	public void update_replystate_query(int p_query_id);
	
	public void insert_reply(PReplyVO vo);
	
	public void update_cnt_purchase(int id, int value);
	
	public void delete_query(int p_query_id);
}