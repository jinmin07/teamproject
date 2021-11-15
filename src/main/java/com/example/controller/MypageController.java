package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	MypageDAO mdao;
	
	@Autowired
	UserDAO udao;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value = "/subpage", method = RequestMethod.GET)
	public String home( Model model) {
		model.addAttribute("pageName", "subpage.jsp" );
		model.addAttribute("subpageName", "my_subpage.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/my_feed",method = RequestMethod.GET)
	public String myAttend(Model model) {
		model.addAttribute("pageName", "subpage.jsp" );
		model.addAttribute("subpageName", "mypage/my_feed.jsp");
		logger.info("내 피드 글을 출력됩니다");
		return "home";
	}
	
	@RequestMapping("/feedlist.json")
	@ResponseBody
	public List<MyfeedRefVO> myfeedlist(String user_id) throws Exception {
		List<MyfeedVO> feeds = mdao.myfeedlist(user_id);
		List<MyfeedRefVO> refFeeds = new ArrayList<MyfeedRefVO>();
		for(MyfeedVO vo: feeds){
			String tbl_code = vo.getTbl_code();
			String code = vo.getTbl_code().substring(0,1);
			if(code.equals("C")){
				tbl_code = "C";
			}
			refFeeds.add(mdao.myfeed_ref_list(tbl_code, vo.getPrimary_id()));
		}
		return refFeeds;
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
	
	
	@RequestMapping(value = "/my_profile",method = RequestMethod.GET)
	public String myProfile(Model model,String u_id) {
		model.addAttribute("pageName", "subpage.jsp");
		model.addAttribute("subpageName", "mypage/my_profile.jsp");
		model.addAttribute("vo", mdao.my_profile(u_id));
		logger.info("나의 설정으로 진입합니다");
		return "home";
	}
	
	@RequestMapping("/my_profile.json")
	@ResponseBody
	public UserVO my_profile_JSON(String u_id){
		return mdao.my_profile(u_id);
	}
	
	@RequestMapping("/list_purchase.json")
	@ResponseBody
	public List<PQueryVO> my_attend_list_purchase_JSON(String p_query_writer) throws Exception
	{
		return mdao.my_query_list_purchase(p_query_writer);
	}
	
	@RequestMapping("/list_course.json")
	@ResponseBody
	public List<CQueryVO> my_attend_list_course_JSON(String c_query_writer) throws Exception
	{
		return mdao.my_query_list_course(c_query_writer);
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