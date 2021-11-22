package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.BoardVO;
import com.example.domain.MyfeedVO;
import com.example.domain.ReplyVO;
import com.example.mapper.AttachDAO;
import com.example.mapper.BoardDAO;
import com.example.mapper.MypageDAO;
import com.example.mapper.ReplyDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAO bdao;
	
	@Autowired
	AttachDAO adao;
	
	@Autowired
	MypageDAO mdao;
	
	@Autowired
	ReplyDAO rdao;
	
	@Transactional
	@Override
	public void delete(int id) {
		bdao.deleteReply(id);
		mdao.myfeed_delete_all("B", id);
		bdao.delete(id);
	}

	@Transactional
	@Override
	public BoardVO read(int id) {
		bdao.updateb_view(id);
		return bdao.read(id);
	}

	@Transactional
	@Override
	public void insert(BoardVO vo) {
		bdao.insert(vo);
		if(vo.getB_images() != null){
			for(String image:vo.getB_images()){
				adao.insert(image);
			}
		}
	}
	
	@Transactional
	@Override
	public void board_insert_feed(MyfeedVO vo) {
		mdao.myfeed_insert(vo);
		bdao.add_feed_cnt(vo.getPrimary_id(), 1);
	}

	@Transactional
	@Override
	public void board_insert_reply(ReplyVO vo) {
		rdao.insert(vo);
		bdao.add_cnt_reply(vo.getB_id(), 1);
	}

	@Transactional
	@Override
	public void board_delete_reply(ReplyVO vo) {
		rdao.delete(vo.getB_reply_id());
		bdao.add_cnt_reply(vo.getB_id(), -1);
	}
	
	@Transactional
	@Override
	public void insert_rec(int b_id, String user_id) {
		bdao.insert_rec(b_id, user_id);
		bdao.add_cnt_rec(b_id, 1);
	}

	@Transactional
	@Override
	public void delete_rec(int b_id, String user_id) {
		bdao.delete_rec(b_id, user_id);
		bdao.add_cnt_rec(b_id, -1);
		
	}

}
