package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.BoardDAO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardDAO bdao;
	
	@RequestMapping("/list")
	public String login(Model model) {
		model.addAttribute("pageName", "board/list.jsp");
		return "home";
	}
		
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> list(Criteria cri){
		HashMap<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(10);
		map.put("list", bdao.list(cri));
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(bdao.totalCount(cri));
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
}
