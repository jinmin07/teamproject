package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.NoticeVO;
import com.example.mapper.MypageDAO;
import com.example.mapper.NoticeDAO;

@RestController
public class NoticeController {
	@Autowired
	NoticeDAO dao;
	
	@Autowired
	MypageDAO mdao;
	
	@RequestMapping("/notice.json")
	public List<NoticeVO> noticeJSON(String u_id){
		return dao.list(u_id);
	}
	
	@RequestMapping(value="/notice/insert", method=RequestMethod.POST)
	public void insert(NoticeVO vo){
		List<HashMap<String, Object>> list = mdao.list_member(vo.getTbl_id(), vo.getTbl_code());
		for(int i = 0; i< list.size(); i++){
			String member = (String)list.get(i).get("member");
			vo.setReceiver(member);
			System.out.println(vo.toString());
			dao.insert(vo);
		}
	}
	
	@RequestMapping(value="/notice/delete", method=RequestMethod.POST)
	public void delete(int n_id){
		dao.delete(n_id);
	}
	
	@RequestMapping(value="/notice/unreadCount")
	public int unReadCount(String u_id){
		return dao.noticeUnreadCount(u_id);
	}
}