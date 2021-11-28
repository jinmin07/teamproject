package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.MyfeedVO;
import com.example.domain.PReplyVO;
import com.example.domain.course.CReplyVO;
import com.example.mapper.CourseDAO;
import com.example.mapper.MypageDAO;
import com.example.mapper.ProductDAO;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	@Autowired
	ProductDAO dao;
	
	@Autowired
	MypageDAO mdao;
	
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

	@Transactional
	@Override
	public void purchase_delete(int id) {
		int cnt_query = dao.cnt_query(id);
		if(cnt_query != 0){
			dao.query_state(id);
		}
		mdao.myfeed_delete_all("P", id);
		dao.delete(id);
	}

	@Transactional
	@Override
	public void purchase_insert_feed(MyfeedVO vo) {
		mdao.myfeed_insert(vo);
		dao.add_feed_cnt(vo.getPrimary_id(), 1);
		
	}

	@Transactional
	@Override
	public int purchase_pay_state(String p_member, int p_id) {
		dao.pay_state(p_id, p_member);
		return dao.cnt_pay_rest(p_id);
	}

	@Override
	public int purchase_deal_state(int p_id, String p_member) {
		dao.deal_state(p_id, p_member);
		return dao.cnt_deal_rest(p_id);
	}
	
}
