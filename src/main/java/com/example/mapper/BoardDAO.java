package com.example.mapper;

import java.util.List;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardDAO {
	public List<BoardVO> list(Criteria cri);
	public void insert(BoardVO vo);
	public void update(BoardVO vo);
	public void delete(int id);
	public BoardVO read(int id);
	public int totalCount(Criteria cri);
	public void updateb_view(int id);
	public void deleteReply(int b_id);
	public void add_feed_cnt(int id, int value);
	public void add_cnt_reply(int id, int value);
	public void add_cnt_rec(int id, int value);
	public void insert_rec(int b_id, String user_id);
	public void delete_rec(int b_id, String user_id);
	public int chk_rec(int b_id, String user_id);
	
	public void addAttach(String fullName);
	public List<String> getAttach(int id);
	public void replaceAttach(int id, String fullName);
	public void deleteAttach(int id);
	public void attachcount(int id);
	public void newattachcount();
	public String maxCode();

}
