package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.MyfeedVO;
import com.example.domain.course.CReplyVO;
import com.example.mapper.CourseDAO;
import com.example.mapper.MypageDAO;

@Service
public class CourseServiceImpl implements CourseService {
	@Autowired
	CourseDAO dao;
	
	@Autowired
	MypageDAO mdao;
	
	@Transactional
	@Override
	public void course_insert_reply(CReplyVO vo) {
		dao.insert_reply(vo);
		dao.update_replystate_query(vo.getC_query_id());
	}

	@Transactional
	@Override
	public void course_member_add(int c_id, String c_member) {
		dao.insert_member(c_id, c_member);
		dao.update_cnt_course(c_id, 1);
	}

	@Transactional
	@Override
	public void course_member_del(int c_id, String c_member) {
		dao.delete_member(c_id, c_member);
		dao.update_cnt_course(c_id, -1);
	}

	@Transactional
	@Override
	public void course_delete(int id, String tbl_code) {
		int cnt_query = dao.cnt_query(id);
		if(cnt_query != 0){
			dao.query_state(id);
		}
		mdao.myfeed_delete_all(tbl_code, id);
		dao.delete_course(id);
	}

	@Transactional
	@Override
	public void course_insert_feed(MyfeedVO vo) {
		mdao.myfeed_insert(vo);
		dao.add_feed_cnt(vo.getPrimary_id(), 1);
	}
	
}
