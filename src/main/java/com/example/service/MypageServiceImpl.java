package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.MyfeedVO;
import com.example.domain.PQueryVO;
import com.example.domain.UserVO;
import com.example.domain.course.CQueryVO;
import com.example.mapper.BoardDAO;
import com.example.mapper.CourseDAO;
import com.example.mapper.MypageDAO;
import com.example.mapper.ProductDAO;
import com.example.mapper.SupportDAO;
import com.example.mapper.UserDAO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDAO myPageDAO;
	
	@Autowired
	BoardDAO bdao;
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	CourseDAO cdao;
	
	@Autowired
	SupportDAO sdao;

	@Override
	public void my_profile_update(UserVO vo) {
		myPageDAO.my_profile_update(vo);
		
	}

	@Override
	public void passwordChange(UserVO vo) {
		myPageDAO.passwordChange(vo);
		
	}

	@Transactional
	@Override
	public void myfeed_delete(MyfeedVO vo) {
		myPageDAO.myfeed_delete(vo);
		String tbl_code = vo.getTbl_code();
		int id = vo.getPrimary_id();
		if(tbl_code.equals("P")){
			pdao.add_feed_cnt(id, -1);
		}else if(tbl_code.equals("S")){
			sdao.add_feed_cnt(id, -1);
		}else if(tbl_code.equals("B")){
			bdao.add_feed_cnt(id, -1);
		}else{
			cdao.add_feed_cnt(id, -1);
		}
	}



}
