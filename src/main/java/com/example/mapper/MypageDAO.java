package com.example.mapper;

import java.util.List;

import com.example.domain.MyfeedRefVO;
import com.example.domain.MyfeedVO;
import com.example.domain.PQueryVO;
import com.example.domain.UserVO;
import com.example.domain.course.CQueryVO;

public interface MypageDAO {
	public List<PQueryVO> my_query_list_purchase(String p_query_writer);
	public List<CQueryVO> my_query_list_course(String c_query_writer);
	public UserVO my_profile(String u_id);
	public void my_profile_update(UserVO vo);
	public List<MyfeedVO> myfeedlist(String user_id);
	public void myfeed_insert(MyfeedVO vo);
	public MyfeedRefVO myfeed_ref_list(String tbl_code, int id);
}
