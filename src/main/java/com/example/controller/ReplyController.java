package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ReplyVO;
import com.example.mapper.ReplyDAO;
import com.example.service.BoardService;

@RestController
@RequestMapping("/board")
public class ReplyController {
	@Autowired
	ReplyDAO rdao;
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/reply/delete", method=RequestMethod.POST)
	public void delete(ReplyVO vo){
		service.board_delete_reply(vo);
	}
	
	@RequestMapping(value="/reply/insert", method=RequestMethod.POST)
	public void insert(ReplyVO vo){
		service.board_insert_reply(vo);
	}
	
	@RequestMapping("/reply.json")
	public HashMap<String, Object> list(int id, Criteria cri){
		HashMap<String, Object> map = new HashMap<>();
		
		cri.setPerPageNum(3);
		map.put("list", rdao.list(id, cri));
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(rdao.totalCount(id));
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
}
