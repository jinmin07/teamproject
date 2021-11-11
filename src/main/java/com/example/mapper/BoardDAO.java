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
	
	public void addAttach(String fullName);
	public List<String> getAttach(int id);
	public void replaceAttach(int id, String fullName);
	public void deleteAttach(int id);
	public void attachcount(int id);
	public void newattachcount();

}
