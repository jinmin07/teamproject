package com.example.controller.course;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.domain.course.CourseVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.UserVO;
import com.example.domain.course.CQueryVO;
import com.example.domain.course.CReplyVO;
import com.example.domain.course.CategoryVO;
import com.example.mapper.course.CourseDAO;
import com.example.service.course.CourseService;

@Controller
public class CourseController {
	@Autowired
	CourseDAO dao;
	
	@Autowired
	CourseService service;
	
	@RequestMapping(value = "/cou/read")
	public String course_read(HttpServletRequest request, Model model, int id) {
		CourseVO cvo = dao.list_course(id);
		CategoryVO category = dao.list_category(cvo.getTbl_code());
		//course 테이블 list
		model.addAttribute("vo", cvo);
		//해당 course category
		model.addAttribute("category", category);
		//문의 갯수
		model.addAttribute("cnt_query", dao.cnt_query(id));
		//신청여부 확인
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user");
		model.addAttribute("chk_member", dao.chk_member(id, uvo.getU_id()));
		model.addAttribute("pageName", "course/read.jsp" );
		return "home";
	}
	
	@RequestMapping("/list_course.json")
	@ResponseBody
	public CourseVO list_course(int id){
		return dao.list_course(id);
	}
	
	@RequestMapping("/list_category.json")
	@ResponseBody
	public CategoryVO list_category(String tbl_code){
		return dao.list_category(tbl_code);
	}
	
	@RequestMapping("/list_member.json")
	@ResponseBody
	public List<HashMap<String, Object>> list_member(int c_id){
		return dao.list_member(c_id);
	}
	
	@RequestMapping("/list_query.json")
	@ResponseBody
	public List<CQueryVO> list_query(int c_id){
		return dao.list_query(c_id);
	}
	
	@RequestMapping("/list_reply.json")
	@ResponseBody
	public CReplyVO list_reply(int c_query_id){
		return dao.list_reply(c_query_id);
	}
	
	@RequestMapping(value="/insert_member", method=RequestMethod.POST)
	@ResponseBody
	public int insert_member(int c_id, String c_member) throws Exception{
		int result = dao.chk_member(c_id, c_member);
		if(result==0){
			service.course_member_add(c_id, c_member);
		}
		return result;
	}
	
	@RequestMapping(value="/delete_member", method=RequestMethod.POST)
	@ResponseBody
	public void delete_member(int c_id, String c_member){
		service.course_member_del(c_id, c_member);
	}
	
	@RequestMapping("/course_member")
	public String course_member(int id, Model model){
		model.addAttribute("id", id);
		return "/course/courseMembers";
	}
	
	@RequestMapping("/query_insert")
	public String course_query(int id, Model model){
		CourseVO cvo = dao.list_course(id);
		CategoryVO category = dao.list_category(cvo.getTbl_code());
		model.addAttribute("vo", cvo);
		model.addAttribute("category", category);
		model.addAttribute("pageName", "course/queryInsert.jsp");
		return "home";
	}
	@RequestMapping(value="/query_insert", method=RequestMethod.POST)
	public String course_query_insert(CQueryVO vo){
		dao.insert_query(vo);
		String url = "redirect:/cou/read?id=" +vo.getC_id();
		return url;
	}
	
	@RequestMapping("/cnt_reply")
	@ResponseBody
	public int cnt_reply(int c_query_id){
		CReplyVO cvo = dao.list_reply(c_query_id);
		int result=0;
		if(cvo != null){
			result = 1;
		}
		return result;
	}
	
	@RequestMapping(value="/cou_reply_insert", method=RequestMethod.POST)
	@ResponseBody
	public void course_reply_insert(CReplyVO vo){
		service.course_insert_reply(vo);
	}
	
	@RequestMapping(value="/cou/insert", method = RequestMethod.POST)
	public String insertPost(CourseVO vo)throws Exception{
		dao.insert(vo);
		return "redirect:/cou/list";
	}

	
	@RequestMapping("/cou/insert")
	public String insert(Model model){
		int maxCode=dao.maxCode();
		int id = maxCode +1;
		model.addAttribute("id", id);
		model.addAttribute("pageName", "course/cinsert.jsp");
		return "home";
	}

	
	@RequestMapping("/cou/list.json")
	@ResponseBody
	public HashMap<String, Object> listJson(Criteria cri){
		HashMap<String, Object> map = new HashMap<>();
		cri.setPerPageNum(12);
		map.put("cri",cri);
		map.put("list", dao.list(cri));
		
		System.out.println(cri.toString());
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(dao.totalCount(cri));
		map.put("pm", pm);
		return map;
	}
	
	
	@RequestMapping("/cou/list")
	public String list(Model model) {
		model.addAttribute("pageName", "course/clist.jsp");
		return "home";
	}
	

	
	

}
