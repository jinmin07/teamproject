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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.UserVO;
import com.example.mapper.NoticeDAO;
import com.example.mapper.UserDAO;

@Controller
@RequestMapping("/member")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserDAO udao;
	
	@Autowired
	NoticeDAO ndao;

	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Autowired
	private JavaMailSender mailSender;

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
	
	@RequestMapping("/findId")
	public String findId(Model model) {
		model.addAttribute("pageName", "member/findId.jsp");
		logger.info("아이디 찾기창 진입");
		return "home";
	}
	@RequestMapping("/findPw")
	public String findPw(Model model) {
		model.addAttribute("pageName", "member/findPw.jsp");
		logger.info("비밀번호 찾기창 진입");
		return "home";
	}
	
	@RequestMapping(value="/findId",method = RequestMethod.POST)
	@ResponseBody
	public String findIdPOST(Model model,UserVO vo) throws Exception {
		String str = "x";
		UserVO user = udao.findId(vo);
		if(user != null) {
			str = user.getU_id();
		}
		
		return str;
	}
	
	@RequestMapping(value="/findPw",method = RequestMethod.POST)
	@ResponseBody
	public String findPwPOST(Model model,UserVO vo) throws Exception {
		String str = "x";
		UserVO user = udao.findPw(vo);
		if(user != null) {
			str = user.getU_id();
		}
		
		return str;
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
			String password = passEncoder.encode(vo.getU_pass());
			vo.setU_pass(password);
			
			System.out.println(vo.toString());
			udao.insert(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/newPasswordChange",method = RequestMethod.GET)
	public String newPassword(UserVO vo,Model model) throws Exception {
		model.addAttribute("pageName", "member/newPasswordChange.jsp");
		UserVO user = udao.pick_up_u_pass(vo);
		System.out.println(user.toString());
		model.addAttribute("pass", user);
		return "home";
	}
	
	@RequestMapping(value = "/newPasswordChange",method = RequestMethod.POST)
	public String newPasswordPOST(UserVO vo,Model model) throws Exception {
		logger.info("비밀번호 변경창 출력^^");
		return "/member/newPasswordChange";
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
		
		if(!passEncoder.matches(user.getU_pass(), lvo.getU_pass())){
			int result = 0;
			rttr.addFlashAttribute("result", result);
			logger.info("로그인 실패");
			return "redirect:/member/login";
		}

		System.out.println(lvo.getU_id());
		session.setAttribute("user", lvo); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
		
		
		session.setAttribute("count", ndao.noticeUnreadCount(lvo.getU_id()));

		logger.info("로그인 성공");
		Object dest = request.getSession().getAttribute("dest");

		//이전 요청이 없으면 시작페이지로 이동 
		if(dest==null) {
			return "redirect:/";
			//이전 요청이 있으면 그 페이지로 이동 
		}else {
			System.out.println(dest.toString());
			return "redirect:"+dest.toString();
		}
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
		String content = "홈페이지를 방문해주셔서 감사합니다" + "<br><br>" + "인증번호는 " + checkNum + " 입니다" + "<br>"
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
	
	@RequestMapping(value = "/mailCheckFindId", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckFindIdGET(String email) throws Exception {
		/* 인증번호 난수 발생 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		logger.info("인증번호" + checkNum);

		/* 이메일 보내기 */
		String setFrom = "klmmms882912@naver.com";
		String toMail = email;
		String title = "아이디 찾기 인증 메입입니다";
		String content = "아이디 찾기를 위한 인증번호 입니다" + "<br><br>" + "인증번호는 " + checkNum + " 입니다" + "<br>"
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
	
	@RequestMapping(value = "/mailCheckFindPw", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckFindPwGET(String email) throws Exception {
		/* 인증번호 난수 발생 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호" + checkNum);

		/* 이메일 보내기 */

		String setFrom = "klmmms882912@naver.com";
		String toMail = email;
		String title = "비밀번호 찾기 인증 메입입니다";
		String content = "비밀번호 찾기를 위한 인증번호 입니다" + "<br><br>" + "인증번호는 " + checkNum + " 입니다" + "<br>"
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