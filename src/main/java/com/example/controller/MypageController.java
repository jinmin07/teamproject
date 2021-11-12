package com.example.controller;

import java.util.ArrayList;
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

import com.example.domain.MyfeedRefVO;
import com.example.domain.MyfeedVO;
import com.example.mapper.MypageDAO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	MypageDAO mdao;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value = "/subpage", method = RequestMethod.GET)
	public String home( Model model) {
		model.addAttribute("pageName", "subpage.jsp" );
		model.addAttribute("subpageName", "my_subpage.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/my_attend",method = RequestMethod.GET)
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
			System.out.println(tbl_code +"/" + vo.getPrimary_id());
			if(code.equals("C")){
				tbl_code = "C";
			}
			refFeeds.add(mdao.myfeed_ref_list(tbl_code, vo.getPrimary_id()));
		}
		return refFeeds;
	}
}