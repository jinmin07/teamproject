package com.example.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.MyfeedVO;
import com.example.domain.PQueryVO;
import com.example.mapper.MypageDAO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	MypageDAO mdao;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value = "/subpage", method = RequestMethod.GET)
	public String home( Model model) {
		model.addAttribute("pageName", "subpage.jsp" );
		model.addAttribute("subpageName", "my_subpage.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/my_attend",method = RequestMethod.GET)
	public String myAttend(Model model) {
		model.addAttribute("pageName", "subpage.jsp" );
		model.addAttribute("subpageName", "mypage/my_feed.jsp");
		logger.info("내 피드 글을 출력됩니다");
		return "home";
	}
	
	@RequestMapping("/feedlist.json")
	@ResponseBody
	public List<MyfeedVO> myfeedlist(String user_id){
		return mdao.myfeedlist(user_id);
	}
}