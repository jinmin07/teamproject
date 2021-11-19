package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.PQueryVO;
import com.example.domain.UserVO;
import com.example.domain.course.CQueryVO;
import com.example.mapper.MypageDAO;
import com.example.mapper.UserDAO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDAO myPageDAO;

	@Override
	public void my_profile_update(UserVO vo) {
		myPageDAO.my_profile_update(vo);
		
	}

	@Override
	public void passwordChange(UserVO vo) {
		myPageDAO.passwordChange(vo);
		
	}



}
