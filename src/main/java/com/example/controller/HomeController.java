package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.UserVO;
import com.example.mapper.NoticeDAO;

@Controller
public class HomeController {
	@Autowired
	NoticeDAO ndao;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model) {
		model.addAttribute("pageName", "about.jsp" );
		return "home";
	}
	
	@RequestMapping("/notice")
	public String notice(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user");
		String u_id = uvo.getU_id();
		ndao.noticeReadDate(u_id);
		session.setAttribute("count", ndao.noticeUnreadCount(u_id));
		model.addAttribute("pageName", "notice.jsp");
		
		return "home";
	}

}
