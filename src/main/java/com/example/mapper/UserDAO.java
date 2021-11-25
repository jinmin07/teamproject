package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import com.example.domain.UserVO;

public interface UserDAO {
	
public List<UserVO> list();
	public void insert(UserVO vo) throws Exception;
	
	public int idCheck(String u_id) throws Exception;
	
	public UserVO userLogin(UserVO user) throws Exception;
	
	public UserVO findId(UserVO vo) throws Exception;

	public UserVO findPw(UserVO vo) throws Exception;
	
	public UserVO pick_up_u_pass(UserVO vo) throws Exception;
	
	public void plus_point(String u_id, int point);
	
	public void minus_point(String u_id, int point);

	public void eval_member(String u_id, int value);
}