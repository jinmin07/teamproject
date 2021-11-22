package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.MyfeedVO;
import com.example.domain.SupportVO;
import com.example.mapper.MypageDAO;
import com.example.mapper.SupportDAO;

@Service
public class SupportServiceImpl implements SupportService {
	@Autowired
	SupportDAO sdao;
	
	@Autowired
	MypageDAO mdao;

	@Transactional
	@Override
	public SupportVO read(int id) {
		sdao.s_view(id);
		return sdao.read(id);
	}

	@Transactional
	@Override
	public void support_insert_feed(MyfeedVO vo) {
		mdao.myfeed_insert(vo);
		sdao.add_feed_cnt(vo.getPrimary_id(), 1);
	}

	@Transactional
	@Override
	public void delete(int id) {
		sdao.delete(id);
		mdao.myfeed_delete_all("S", id);
	}
}
