package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.BoardVO;
import com.example.domain.MyfeedRefVO;
import com.example.domain.MyfeedVO;
import com.example.domain.PQueryVO;
import com.example.domain.ProductVO;
import com.example.domain.UserVO;
import com.example.domain.course.CQueryVO;
import com.example.domain.course.CourseVO;
import com.example.mapper.MypageDAO;
import com.example.mapper.UserDAO;
import com.example.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	MypageDAO mdao;
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	MypageService mservice;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value = "/subpage", method = RequestMethod.GET)
	public String home( Model model) {
		model.addAttribute("pageName", "subpage.jsp" );
		model.addAttribute("subpageName", "my_subpage.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/my_query",method = RequestMethod.GET)
	public String myQuery(Model model) {
		model.addAttribute("pageName", "subpage.jsp" );
		model.addAttribute("subpageName", "mypage/my_query.jsp");
		logger.info("내가 문의한 글이 출력됩니다");
		return "home";
	}
	
	@RequestMapping(value ="/my_query/purchase",method = RequestMethod.GET)
	public String myQueryPurchase(Model model) {
		model.addAttribute("pageName", "subpage.jsp");
		model.addAttribute("subpageName", "mypage/my_query.jsp");
		model.addAttribute("url", "/my_query/purchase");
		logger.info("공동구매 문의글 출력");
		return "home";
	}
	
	@RequestMapping(value ="/my_query/course",method = RequestMethod.GET)
	public String myQueryCourse(Model model) {
		model.addAttribute("pageName", "subpage.jsp");
		model.addAttribute("subpageName", "mypage/my_query.jsp");	
		model.addAttribute("url", "/my_query/course");
		logger.info("스터디 및 취미 문의글 출력");
		return "home";
	}
	
	@RequestMapping(value ="/my_writing/purchase",method = RequestMethod.GET)
	public String myWritingPurchase(Model model) {
		model.addAttribute("pageName", "subpage.jsp");
		model.addAttribute("subpageName", "mypage/my_writing.jsp");
		model.addAttribute("url", "/my_writing/purchase");
		logger.info("공동구매 리스트 출력");
		return "home";
	}
	
	@RequestMapping(value ="/my_writing/course",method = RequestMethod.GET)
	public String myWritingCourse(Model model) {
		model.addAttribute("pageName", "subpage.jsp");
		model.addAttribute("subpageName", "mypage/my_writing.jsp");	
		model.addAttribute("url", "/my_writing/course");
		logger.info("스터디 및 취미 리스트 출력");
		return "home";
	}
	
	@RequestMapping(value ="/my_writing/board",method = RequestMethod.GET)
	public String myWritingBoard(Model model) {
		model.addAttribute("pageName", "subpage.jsp");
		model.addAttribute("subpageName", "mypage/my_writing.jsp");	
		model.addAttribute("url", "/my_writing/board");
		logger.info("커뮤니티 출력");
		return "home";
	}
	
	@RequestMapping("/members")
	public String course_member(int id, String tbl_code, Model model){
		model.addAttribute("id", id);
		model.addAttribute("tbl_code", tbl_code);
		return "/mypage/members";
	}
	
	@RequestMapping("/list_member.json")
	@ResponseBody
	public List<HashMap<String, Object>> list_member(int id, String tbl_code){
		return mdao.list_member(id, tbl_code);
	}
	
	@RequestMapping(value = "/my_attend",method = RequestMethod.GET)
	public String myAttend(Model model) {
		model.addAttribute("pageName", "subpage.jsp");
		model.addAttribute("subpageName", "mypage/my_attend.jsp");
		logger.info("내가 참여한글");
		return "home";
	}
	
	@RequestMapping(value = "/my_attend/purchase",method = RequestMethod.GET)
	public String myAttendPurchase(Model model) {
		model.addAttribute("pageName", "subpage.jsp");
		model.addAttribute("subpageName", "mypage/my_attend.jsp");
		model.addAttribute("url", "/my_attend/purchase");
		logger.info("내가 참여한 공동구매");
		
		return "home";
	}
	
	@RequestMapping(value = "/my_attend/course",method = RequestMethod.GET)
	public String myAttendCourse(Model model) {
		model.addAttribute("pageName", "subpage.jsp");
		model.addAttribute("subpageName", "mypage/my_attend.jsp");
		model.addAttribute("url", "/my_attend/course");
		logger.info("내가 참여한 공동생활");
		
		return "home";
	}
	
	@RequestMapping(value = "/my_profile",method = RequestMethod.GET)
	public String myProfile(Model model,String u_id,HttpServletRequest request) throws Exception{
		model.addAttribute("pageName", "subpage.jsp");
		model.addAttribute("subpageName", "mypage/my_profile.jsp");
		
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user");
		model.addAttribute("user", uvo);
		logger.info("나의 설정으로 진입합니다");
		return "home";
	}
	
	@RequestMapping("/goPasswordChange")
	public String goPasswordChange(Model model,HttpServletRequest request) {
		logger.info("");
		model.addAttribute("pageName", "subpage.jsp");
		model.addAttribute("subpageName", "mypage/passwordChange.jsp");
		
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user");
		model.addAttribute("user", uvo);
		
		return "home";
		
	}
	@RequestMapping(value = "/passwordChange",method = RequestMethod.GET)
	public String passwordChangeGet() {
		
		return "mypage/passwordChange";
	}
	
	@RequestMapping(value = "/newPassword",method = RequestMethod.POST)
	@ResponseBody
	public void newPasswordChangePost(UserVO vo) throws Exception {
		logger.info("비밀번호 찾기 / 비밀번호 변경");
		String password = passEncoder.encode(vo.getU_pass());
		vo.setU_pass(password);

		mservice.passwordChange(vo);
	}
	
	@RequestMapping(value = "/passwordChange",method = RequestMethod.POST)
	@ResponseBody
	public int passwordChangePost(String old_pass, Model model,HttpServletRequest request,UserVO vo) throws Exception {
		logger.info("비밀번호 변경");
		HttpSession session = request.getSession();
		
		int result = 0;
		UserVO uvo = udao.userLogin(vo);
		
		if(passEncoder.matches(old_pass, uvo.getU_pass())){
			result = 1;
			String password = passEncoder.encode(vo.getU_pass());
			vo.setU_pass(password);
			
			mservice.passwordChange(vo);
			session.invalidate();
		}
		
		return result;
	}
	
	@RequestMapping(value = "/my_profile_update",method = RequestMethod.GET)
	public String my_profile_updateGet() {
		logger.info("내 정보 변경화면");
		return "mypage/my_profile";
	}
	
	@RequestMapping(value = "/my_profile_update",method = RequestMethod.POST)
	public String my_profile_updatePost(Model model,HttpServletRequest request,UserVO vo) throws Exception {
		logger.info("내 정보 변경 POST");
		HttpSession session = request.getSession();
		System.out.println(vo.toString());
		
		mservice.my_profile_update(vo);
		
		return "redirect:/mypage/my_profile";
		
	}
	
	@RequestMapping(value = "/evaluate_member",method = RequestMethod.POST)
	@ResponseBody
	public void evaluate_memberPost(String member, int value) throws Exception {
		udao.eval_member(member, value);		
	}
	
	@RequestMapping("/my_profile.json")
	@ResponseBody
	public UserVO my_profile_JSON(String u_id){
		return mdao.my_profile(u_id);
	}
	
	@RequestMapping("/list_purchase.json")
	@ResponseBody
	public List<PQueryVO> my_query_list_purchase_JSON(String p_query_writer) throws Exception
	{
		return mdao.my_query_list_purchase(p_query_writer);
	}
	
	@RequestMapping("/list_course.json")
	@ResponseBody
	public List<CQueryVO> my_query_list_course_JSON(String c_query_writer) throws Exception
	{
		return mdao.my_query_list_course(c_query_writer);
	}
	
	@RequestMapping("/attend_purchase.json")
	@ResponseBody
	public List<ProductVO> my_attend_list_puschase_JSON(String p_writer) throws Exception
	{
		return mdao.my_attend_purchase(p_writer);
	}
	
	@RequestMapping("/attend_course.json")
	@ResponseBody
	public List<CourseVO> my_attend_list_course_JSON(String c_writer) throws Exception
	{
		return mdao.my_attend_course(c_writer);
	}
	
	@RequestMapping("/list_writing_purchase.json")
	@ResponseBody
	public List<ProductVO> my_writing_list_purchase_JSON(String p_writer) throws Exception
	{
		return mdao.my_writing_list_purchase(p_writer);
	}
	
	@RequestMapping("/list_writing_course.json")
	@ResponseBody
	public List<CourseVO> my_writing_list_course_JSON(String c_writer) throws Exception
	{
		return mdao.my_writing_list_course(c_writer);
	}
	@RequestMapping("/list_writing_board.json")
	@ResponseBody
	public List<BoardVO> my_writing_list_board_JSON(String b_writer) throws Exception
	{
		return mdao.my_writing_list_board(b_writer);
	}
	
}