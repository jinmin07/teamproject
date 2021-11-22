package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.BoardVO;
import com.example.domain.MyfeedVO;
import com.example.mapper.AttachDAO;
import com.example.mapper.BoardDAO;
import com.example.mapper.MypageDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAO bdao;
	
	@Autowired
	AttachDAO adao;
	
	@Autowired
	MypageDAO mdao;
	
	@Transactional
	@Override
	public void delete(int id) {
		bdao.deleteReply(id);
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
		bdao.add_feed_cnt(vo.getPrimary_id());
	}
}
