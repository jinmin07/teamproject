package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.MyfeedRefVO;
import com.example.domain.MyfeedVO;

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

}
