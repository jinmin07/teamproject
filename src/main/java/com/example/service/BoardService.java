package com.example.service;

import com.example.domain.BoardVO;
import com.example.domain.MyfeedVO;

public interface BoardService {
	public BoardVO read(int id);
	public void delete(int id);
	public void insert(BoardVO vo);
	public void board_insert_feed(MyfeedVO vo);
}
