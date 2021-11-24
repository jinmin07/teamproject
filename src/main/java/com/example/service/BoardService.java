package com.example.service;

import com.example.domain.BoardVO;
import com.example.domain.MyfeedVO;
import com.example.domain.ReplyVO;

public interface BoardService {
	public BoardVO read(int id);
	public void delete(int id);
	public void insert(BoardVO vo);
	public void board_insert_feed(MyfeedVO vo);
	public void board_insert_reply(ReplyVO vo);
	public void board_delete_reply(ReplyVO vo);
	public void insert_rec(int b_id, String user_id);
	public void delete_rec(int b_id, String user_id);
}
