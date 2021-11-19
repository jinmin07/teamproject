package com.example.service;

import com.example.domain.UserVO;

public interface MypageService {
	
	public void my_profile_update(UserVO vo);
	public void passwordChange(UserVO vo);

}
