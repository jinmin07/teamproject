package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import com.example.domain.BoardVO;
import com.example.domain.MyfeedRefVO;
import com.example.domain.MyfeedVO;
import com.example.domain.PQueryVO;
import com.example.domain.ProductVO;
import com.example.domain.UserVO;
import com.example.domain.course.CQueryVO;
import com.example.domain.course.CourseVO;

public interface MypageDAO {
	public List<PQueryVO> my_query_list_purchase(String p_query_writer);
	public List<CQueryVO> my_query_list_course(String c_query_writer);
	public List<ProductVO> my_writing_list_purchase(String p_writer);
	public List<CourseVO> my_writing_list_course(String c_writer);
	public List<BoardVO> my_writing_list_board(String b_writer);
	public List<HashMap<String, Object>> list_member(int id, String tbl_code);
	public List<String> list_atte_member(int id, String tbl_code);
	public UserVO my_profile(String u_id);
	public void my_profile_update(UserVO vo);
	public List<MyfeedVO> myfeedlist(String user_id);
	public int chk_feed(MyfeedVO vo);
	public void myfeed_insert(MyfeedVO vo);
	public void myfeed_delete(MyfeedVO vo);
	public void myfeed_delete_all(String tbl_code, int primary_id);
	public MyfeedRefVO myfeed_ref_list(String tbl_code, int id);
	public void passwordChange(UserVO vo);
	public List<ProductVO> my_attend_purchase(String p_writer);
	public List<CourseVO> my_attend_course(String c_writer);
	
}
