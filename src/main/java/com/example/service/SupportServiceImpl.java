package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.SupportVO;
import com.example.mapper.SupportDAO;

@Service
public class SupportServiceImpl implements SupportService {
	@Autowired
	SupportDAO sdao;

	@Override
	public SupportVO read(int id) {
		sdao.s_view(id);
		return sdao.read(id);
	}

}
