package com.example.mapper;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> list(int id, Criteria cri);
	public int totalCount(int id);
	public void insert(ReplyVO vo);
	public void delete(int b_reply_id);
}
