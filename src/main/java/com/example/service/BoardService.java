package com.example.service;

import com.example.domain.BoardVO;

public interface BoardService {
	public BoardVO read(int id);
	public void delete(int id);
	public void insert(BoardVO vo);
}
