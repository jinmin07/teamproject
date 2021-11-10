package com.example.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.UserVO;
import com.example.mapper.UserDAO;

@Controller
@RequestMapping("/member")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserDAO udao;

	@Autowired
	JavaMailSender mailSender;

	@RequestMapping("/list")
	public String list(Model model) {

		model.addAttribute("pageName", "list.jsp");

		return "/list";
	}

	@RequestMapping("/list.json")
	@ResponseBody
	public List<UserVO> listJSON() {
		return udao.list();

	}

	@RequestMapping("/insert")
	public String insert(Model model) {
		model.addAttribute("pageName", "member/insert.jsp");
		return "home";
	}

	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("pageName", "/login.jsp");
		return "/member/login";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public void insertPost(UserVO vo) {
		try {
			udao.insert(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void joinGET() {

		logger.info("로그인 페이지 진입");

	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String u_id) throws Exception {

		logger.info("memberIdChk() 진입");
		int result = udao.idCheck(u_id);

		logger.info("결과값 = " + result);

		if (result != 0) {

			return "fail"; // 중복 아이디가 존재

		} else {

			return "success"; // 중복 아이디 x

		}

	} // memberIdChkPOST() 종료

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception {

		System.out.println("login 메서드 진입");
		System.out.println("전달된 데이터 : " + user);

		HttpSession session = request.getSession();

		UserVO lvo = udao.userLogin(user);

		if (lvo == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우

			int result = 0;
			rttr.addFlashAttribute("result", result);
			logger.info("로그인 실패");
			return "redirect:/member/login";

		}

		session.setAttribute("user", lvo); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
		logger.info("로그인 성공");
		session.setMaxInactiveInterval(10000000);

		return "redirect:/";

	}
	
	/* 메인페이지 로그아웃 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {
		logger.info("logoutMainGET메서드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/";

	}

	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* 인증번호 난수 발생 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		logger.info("인증번호" + checkNum);

		/* 이메일 보내기 */

		String setFrom = "klmmms882912@naver.com";
		String toMail = email;
		String title = "회원가입 인증 메입입니다";
		String content = "홈페이지를 방문해주셔서 감사합니다" + "<br><br>" + "인증번호는" + checkNum + "입니다" + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입해주세요";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;
	}
}
