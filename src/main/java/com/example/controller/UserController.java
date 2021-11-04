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

	// �α��� ������ �̵�
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {

		logger.info("�α��� ������ ����");

	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception {

		System.out.println("login �޼��� ����");
		System.out.println("���޵� ������ : " + user.toString());

		HttpSession session = request.getSession();

		UserVO lvo = udao.userLogin(user);

		if (lvo == null) { // ��ġ���� �ʴ� ���̵�, ��й�ȣ �Է� ���

			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";

		}

		session.setAttribute("user", lvo); // ��ġ�ϴ� ���̵�, ��й�ȣ ��� (�α��� ����)

		return "redirect:/";

	}

}