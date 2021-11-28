package com.example.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.example.mapper.CourseDAO;
import com.example.mapper.MypageDAO;
import com.example.mapper.NoticeDAO;
import com.example.service.CourseService;
import com.example.service.MypageService;
import com.example.domain.Criteria;
import com.example.domain.MyfeedVO;
import com.example.domain.NoticeVO;
import com.example.domain.PageMaker;
import com.example.domain.UserVO;
import com.example.domain.course.CQueryVO;
import com.example.domain.course.CReplyVO;
import com.example.domain.course.CategoryVO;

@Controller
public class CourseController {
	@Autowired
	CourseDAO dao;
	
	@Autowired
	MypageDAO mdao;
	
	@Autowired
	NoticeDAO ndao;
	
	@Autowired
	CourseService service;
	
	@Autowired
	MypageService mservice;
	
	@RequestMapping(value = "/course/read")
	public String course_read(HttpServletRequest request, Model model, int id) {
		CourseVO cvo = dao.list_course(id);
		CategoryVO category = dao.list_category(cvo.getTbl_code());
		//조회수 증가
		dao.add_view_cnt(id);
		//course 테이블 list
		model.addAttribute("vo", cvo);
		//해당 course category
		model.addAttribute("category", category);
		//문의 갯수
		model.addAttribute("cnt_query", dao.cnt_query(id));
		//신청여부 확인
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user");
		
		// 피드여부 확인
		MyfeedVO fvo = new MyfeedVO();
		fvo.setPrimary_id(id);
		fvo.setTbl_code(cvo.getTbl_code());
		fvo.setUser_id(uvo.getU_id());
		
		model.addAttribute("chk_feed", mdao.chk_feed(fvo));
		model.addAttribute("chk_member", dao.chk_member(id, uvo.getU_id()));
		model.addAttribute("index", 1);
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
		model.addAttribute("index", 1);
		model.addAttribute("pageName", "course/queryInsert.jsp");
		return "home";
	}
	
	@RequestMapping(value="/query_insert", method=RequestMethod.POST)
	public String course_query_insert(CQueryVO vo, String c_writer, String title, String tbl_code){
		NoticeVO nvo = new NoticeVO();
		nvo.setTbl_code(tbl_code);
		nvo.setTbl_id(vo.getC_id());
		nvo.setSender("admin");
		nvo.setContent("모집중인 공동생활 [" + title + "] 진행 건에 대한 문의글이 등록되었습니다.");
		nvo.setReceiver(c_writer);
		//System.out.println(nvo.toString());
		
		dao.insert_query(vo);
		ndao.insert(nvo);
		String url = "redirect:/course/read?id=" +vo.getC_id();
		return url;
	}
	
	@RequestMapping(value="/delete_query", method=RequestMethod.POST)
	@ResponseBody
	public void delete_query(int c_query_id){
		dao.delete_query(c_query_id);
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
	
	//course insert
	@RequestMapping(value="/course/insert", method = RequestMethod.POST)
	public String insertPost(CourseVO vo, String start, String end)throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date_start = sdf.parse(start);
		vo.setDate_start(date_start);
		Date date_end = sdf.parse(end);
		vo.setDate_end(date_end);
		dao.insert(vo);
		return "redirect:/course/list";
	}

	//course insert 페이지
	@RequestMapping("/course/insert")
	public String insert(Model model){
		model.addAttribute("index", 1);
		model.addAttribute("pageName", "course/cinsert.jsp");
		return "home";
	}

	//course list 정보
	@RequestMapping("/course/list.json")
	@ResponseBody
	public HashMap<String, Object> listJson(Criteria cri){
		HashMap<String, Object> map = new HashMap<>();
		cri.setPerPageNum(9);
		map.put("cri",cri);
		map.put("list", dao.list(cri));
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(dao.totalCount(cri));
		map.put("pm", pm);
		return map;
	}
	
	// course list 페이지
	@RequestMapping("/course/list")
	public String list(Model model) {
		model.addAttribute("index", 1);
		model.addAttribute("pageName", "course/clist.jsp");
		return "home";
	}
	
	@RequestMapping(value="/delete_course", method=RequestMethod.POST)
	@ResponseBody
	public void delete_course(int c_id, String tbl_code){
		service.course_delete(c_id, tbl_code);
	}

	
	// course 수정페이지
	@RequestMapping("/course/update")
	public String update_course( int id, Model model,Date date_start, Date date_end){
		CourseVO vo = dao.list_course(id);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String start = format.format(vo.getDate_start());
        String end = format.format(vo.getDate_end());
      
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("vo",dao.list_course(id));
		model.addAttribute("index", 1);
		model.addAttribute("pageName", "course/cupdate.jsp");
		return "home";
	}
	
	// course 수정
	@RequestMapping(value="/course/update", method=RequestMethod.POST)
	public String update_coursePost(CourseVO vo, String start, String end, String old_title)throws Exception{
		//System.out.println(vo.toString());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date_start = sdf.parse(start);
		vo.setDate_start(date_start);
		Date date_end = sdf.parse(end);
		vo.setDate_end(date_end);
		
		dao.update_course(vo);
		
		String content = "모집 신청하신 공동생활 [" + old_title + "] 진행 건이 작성자의 요청에 의해 수정되었습니다. 이용에 참고하시기 바랍니다.";
		NoticeVO nvo = new NoticeVO();
		List<HashMap<String, Object>> list = mdao.list_member(vo.getId(), vo.getTbl_code());
			nvo.setTbl_code(vo.getTbl_code());
			nvo.setTbl_id(vo.getId());
			nvo.setSender("admin");
			nvo.setContent(content);
			//System.out.println(nvo.toString());
		for(int i = 0; i< list.size(); i++){
			String member = (String)list.get(i).get("member");
			nvo.setReceiver(member);
			//System.out.println(nvo.toString());
			ndao.insert(nvo);
		}
		String url = "redirect:/course/read?id=" +vo.getId();
		return url;
	}
	
	// myfeed insert
	@RequestMapping(value="/course/feed_insert", method=RequestMethod.POST)
	@ResponseBody
	public void myfeed_insert(MyfeedVO vo){
		service.course_insert_feed(vo);
	}
	
	// myfeed del
	@RequestMapping(value="/course/feed_del", method=RequestMethod.POST)
	@ResponseBody
	public void myfeed_del(MyfeedVO vo){
		mservice.myfeed_delete(vo);
	}
	
}
