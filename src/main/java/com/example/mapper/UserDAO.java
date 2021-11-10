package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import com.example.domain.UserVO;

public interface UserDAO {
	
	public List<UserVO> list();
	
	public void insert(UserVO vo) throws Exception;
	
	// 아이디 중복섬사
	public int idCheck(String u_id) throws Exception;
	
	//로그인
	public UserVO userLogin(UserVO user) throws Exception;

}
