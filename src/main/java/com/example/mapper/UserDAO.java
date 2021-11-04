package com.example.mapper;

import com.example.domain.UserVO;

public interface UserDAO {
	public UserVO userLogin(UserVO user) throws Exception;
}
