package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.BoardVO;
import com.example.mapper.AttachDAO;
import com.example.mapper.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAO bdao;
	
	@Autowired
	AttachDAO adao;
	
	@Transactional
	@Override
	public void delete(int id) {
		bdao.deleteAttach(id);
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
}
