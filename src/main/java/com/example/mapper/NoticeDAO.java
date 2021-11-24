package com.example.mapper;

import java.util.List;

import com.example.domain.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> list(String receiver);
	public int noticeUnreadCount(String u_id);
	public void noticeReadDate(String u_id);
	public void insert(NoticeVO vo);
	public void delete(int n_id);

}
