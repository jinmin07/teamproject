package com.example.service.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.course.CReplyVO;
import com.example.mapper.course.CourseDAO;

@Service
public class CourseServiceImpl implements CourseService {
	@Autowired
	CourseDAO dao;
	
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
	
}
