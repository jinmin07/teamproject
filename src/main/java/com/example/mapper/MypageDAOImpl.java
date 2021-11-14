package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BoardVO;
import com.example.domain.MyfeedRefVO;
import com.example.domain.MyfeedVO;
import com.example.domain.PQueryVO;
import com.example.domain.ProductVO;
import com.example.domain.UserVO;
import com.example.domain.course.CQueryVO;
import com.example.domain.course.CourseVO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Autowired
	SqlSession session;
	
	String namespace="com.example.mapper.MypageMapper";
	
	@Override
	public List<MyfeedVO> myfeedlist(String user_id) {
		return session.selectList(namespace +".myfeedlist", user_id);
	}

	@Override
	public void myfeed_insert(MyfeedVO vo) {
		session.insert(namespace +".myfeed_insert", vo);
	}

	@Override
	public MyfeedRefVO myfeed_ref_list(String tbl_code, int id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("tbl_code", tbl_code);
		map.put("id", id);
		return session.selectOne(namespace + ".myfeed_ref_list", map);
	}
	
	@Override
	public List<PQueryVO> my_query_list_purchase(String p_query_writer) {
		return session.selectList(namespace + ".my_query_list_purchase", p_query_writer);
	}

	@Override
	public List<CQueryVO> my_query_list_course(String c_query_writer) {
		return session.selectList(namespace + ".my_query_list_course",c_query_writer);
	}

	@Override
	public UserVO my_profile(String u_id) {
		return session.selectOne(namespace + ".my_profile",u_id);
	}

	@Override
	public void my_profile_update(UserVO vo) {
		session.update(namespace + ".my_profile_update",vo);
	}

	@Override
	public List<ProductVO> my_writing_list_purchase(String p_writer) {
		return session.selectList(namespace + ".my_writing_list_purchase", p_writer);
	}

	@Override
	public List<CourseVO> my_writing_list_course(String c_writer) {
		return session.selectList(namespace + ".my_writing_list_course", c_writer);
	}

	@Override
	public List<BoardVO> my_writing_list_board(String b_writer) {
		return session.selectList(namespace + ".my_writing_list_board", b_writer);
	}
}
