package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import com.example.domain.course.CourseVO;
import com.example.domain.Criteria;
import com.example.domain.course.CQueryVO;
import com.example.domain.course.CReplyVO;
import com.example.domain.course.CategoryVO;

public interface CourseDAO {
	public List<CourseVO> list();
	public CourseVO list_course(int id);
	public void delete_course(int id);
	public CategoryVO list_category(String tbl_code);
	public int chk_member(int c_id, String c_member);
	public void insert_member(int c_id, String c_member);
	public void delete_member(int c_id, String c_member);
	public int cnt_query(int c_id);
	public List<CQueryVO> list_query(int c_id);
	public void insert_query(CQueryVO vo);
	public void delete_query(int c_query_id);
	public CReplyVO list_reply(int c_query_id);
	public void insert_reply(CReplyVO vo);
	public void update_cnt_course(int id, int value);
	public void update_replystate_query(int c_query_id);
	public void add_view_cnt(int id);
	public void add_feed_cnt(int id, int value);
	public void query_state(int c_id);
	
	public List<CourseVO> list(Criteria cri);
	public void insert(CourseVO vo);
	public int totalCount(Criteria cri);
	public void update_course(CourseVO vo);

}
