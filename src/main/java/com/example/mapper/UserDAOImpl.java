package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	SqlSession session;
	
	String namespace = "com.example.mapper.UserMapper";

	@Override
	public List<UserVO> list() {
		return session.selectList(namespace + ".list");
	}

	@Override
	public void insert(UserVO vo) {
		session.insert(namespace + ".insert",vo);
		
	}

	@Override
	public int idCheck(String u_id) {
		return session.selectOne(namespace + ".idCheck",u_id);
	}

	@Override
	public UserVO userLogin(UserVO user) {
		return session.selectOne(namespace+".userLogin",user);
	}

	@Override
	public UserVO findId(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".findId",vo);
	}

	@Override
	public UserVO findPw(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".findPw",vo);
	}

	@Override
	public UserVO pick_up_u_pass(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".pick_up_u_pass",vo);
	}

}
