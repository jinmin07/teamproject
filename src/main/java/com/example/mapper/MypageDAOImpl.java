package com.example.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
