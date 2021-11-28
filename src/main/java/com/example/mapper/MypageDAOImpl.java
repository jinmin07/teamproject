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
	public void myfeed_delete(MyfeedVO vo) {
		session.delete(namespace + ".myfeed_delete", vo);
	}
	
	@Override
	public void myfeed_delete_all(String tbl_code, int primary_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("tbl_code", tbl_code);
		map.put("primary_id", primary_id);
		session.delete(namespace + ".myfeed_delete_all");
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

	@Override
	public List<HashMap<String, Object>> list_member(int id, String tbl_code) {
		HashMap<String, Object> map = new HashMap<>();
		if(tbl_code.substring(0,1).equals("C")){
			tbl_code = "C";
		}
		map.put("tbl_code", tbl_code);
		map.put("id", id);
		return session.selectList(namespace + ".list_member", map);
	}

	@Override
	public int chk_feed(MyfeedVO vo) {
		return session.selectOne(namespace+".chk_feed", vo);
	}

	@Override
	public void passwordChange(UserVO vo) {
		session.update(namespace + ".passwordChange",vo);
		
	}

	@Override
	public List<ProductVO> my_attend_purchase(String p_writer) {
		return session.selectList(namespace + ".my_attend_purchase",p_writer);
	}

	@Override
	public List<CourseVO> my_attend_course(String c_writer) {
		return session.selectList(namespace + ".my_attend_course",c_writer);
	}

	@Override
	public List<String> list_atte_member(int id, String tbl_code) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("tbl_code", tbl_code);
		map.put("id", id);
		return session.selectList(namespace +".list_atte_member", map);
	}

}
