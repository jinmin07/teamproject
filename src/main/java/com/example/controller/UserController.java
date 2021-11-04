package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.UserVO;
import com.example.mapper.UserDAO;

@Controller
@RequestMapping("/member")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserDAO udao;

	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("pageName", "login.jsp");
		return "/member/login";
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {

		logger.info("로그인 페이지 진입");

	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception {

		System.out.println("login 메서드 진입");
		System.out.println("전달된 데이터 : " + user.toString());

		HttpSession session = request.getSession();

		UserVO lvo = udao.userLogin(user);

		if (lvo == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우

			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";

		}

		session.setAttribute("user", lvo); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)

		return "redirect:/";

	}

}