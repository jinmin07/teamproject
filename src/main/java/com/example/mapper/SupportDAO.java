package com.example.mapper;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.SupportVO;

public interface SupportDAO {
	public List<SupportVO> list(Criteria cri);
	public void insert (SupportVO vo);
	public int maxCode();
	public int totalCount(Criteria cri);
	public void s_view(int id);
	public SupportVO read(int id);
	public void delete(int id);
	public void update(SupportVO vo);
	public void add_feed_cnt(int id, int value);
}
