package com.example.service;

import com.example.domain.MyfeedVO;
import com.example.domain.PReplyVO;
import com.example.domain.course.CReplyVO;

public interface PurchaseService {
	public void purchase_member_add(int p_id, String p_member);
	public void purchase_member_del(int p_id, String p_member);
	public void purchase_insert_reply(PReplyVO vo);
	public void purchase_delete(int id);
	public void purchase_insert_feed(MyfeedVO vo);
	public int purchase_pay_state(String p_member, int p_id);
	public int purchase_deal_state(int p_id, String p_member);
}
