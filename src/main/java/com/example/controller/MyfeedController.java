package com.example.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.MyfeedRefVO;
import com.example.domain.MyfeedVO;
import com.example.mapper.MypageDAO;

@Controller
public class MyfeedController {
	@Autowired
	MypageDAO mdao;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping("/myfeed")
	public String myAttend(Model model) {
		model.addAttribute("pageName", "my_feed.jsp" );
		logger.info("내 피드 글을 출력됩니다");
		return "home";
	}
	
	@RequestMapping("/myfeed/feedlist.json")
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
