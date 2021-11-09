package com.example.service.course;

import com.example.domain.course.CReplyVO;

public interface CourseService {
	public void course_member_add(int c_id, String c_member);
	public void course_member_del(int c_id, String c_member);
	public void course_insert_reply(CReplyVO vo);
}
