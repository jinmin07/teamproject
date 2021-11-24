package com.example.service;

import com.example.domain.MyfeedVO;
import com.example.domain.SupportVO;

public interface SupportService {
	public SupportVO read(int id);
	public void support_insert_feed(MyfeedVO vo);
	public void delete(int id);

}
