package com.example.service;

import com.example.domain.MyfeedVO;
import com.example.domain.course.CReplyVO;

public interface CourseService {
	public void course_member_add(int c_id, String c_member);
	public void course_member_del(int c_id, String c_member);
	public void course_insert_reply(CReplyVO vo);
	public void course_delete(int id, String tbl_code);
	public void course_insert_feed(MyfeedVO vo);
}
