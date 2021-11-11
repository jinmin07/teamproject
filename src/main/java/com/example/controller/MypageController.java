package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@RequestMapping(value = "/subpage", method = RequestMethod.GET)
	public String home( Model model) {
		model.addAttribute("pageName", "/mypage/subpage.jsp" );
		return "home";
	}
}
