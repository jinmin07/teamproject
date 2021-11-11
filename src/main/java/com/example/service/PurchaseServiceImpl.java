package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.PReplyVO;
import com.example.domain.course.CReplyVO;
import com.example.mapper.ProductDAO;
import com.example.mapper.course.CourseDAO;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	@Autowired
	ProductDAO dao;
	
	@Transactional
	@Override
	public void purchase_insert_reply(PReplyVO vo) {
		dao.insert_reply(vo);
		dao.update_replystate_query(vo.getP_query_id());
	}

	@Transactional
	@Override
	public void purchase_member_add(int p_id, String p_member) {
		dao.insert_member(p_id, p_member);
		dao.update_cnt_purchase(p_id, 1);
	}

	@Transactional
	@Override
	public void purchase_member_del(int p_id, String p_member) {
		dao.delete_member(p_id, p_member);
		dao.update_cnt_purchase(p_id, -1);
	}
	
}