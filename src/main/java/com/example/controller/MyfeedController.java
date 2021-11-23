package com.example.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.BoardVO;
import com.example.domain.MyfeedRefVO;
import com.example.domain.MyfeedVO;
import com.example.mapper.MypageDAO;
import com.example.service.MypageService;

@Controller
@RequestMapping("/myfeed")
public class MyfeedController {
	@Autowired
	MypageDAO mdao;
	
	@Autowired
	MypageService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping("/list")
	public String myAttend(Model model) {
		model.addAttribute("pageName", "my_feed.jsp" );
		logger.info("내 피드 글을 출력됩니다");
		return "home";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteFeed(MyfeedVO vo) throws Exception {
		service.myfeed_delete(vo);
		return "redirect:/myfeed/list";
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
}
