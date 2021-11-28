package com.example.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.MyfeedVO;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;
import com.example.domain.UserVO;
import com.example.mapper.AttachDAO;
import com.example.mapper.BoardDAO;
import com.example.mapper.MypageDAO;
import com.example.service.BoardService;
import com.example.service.MypageService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Resource(name = "uploadPath")
	private String path;

	@Autowired
	BoardDAO bdao;

	@Autowired
	AttachDAO adao;
	
	@Autowired
	MypageDAO mdao;

	@Autowired
	BoardService service;
	
	@Autowired
	MypageService mservice;

	@RequestMapping("/list")
	public String login(Model model) {
		model.addAttribute("index", 4);
		model.addAttribute("pageName", "board/list.jsp");
		return "home";
	}

	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> list(Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(10);
		map.put("list", bdao.list(cri));

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(bdao.totalCount(cri));
		map.put("cri", cri);
		map.put("pm", pm);
		return map;
	}
	
	@RequestMapping("/insert")
	public String insert(BoardVO vo, Model model) {
		String maxCode = bdao.maxCode();
		int id = Integer.parseInt(maxCode) + 1;
		model.addAttribute("id", id);
		model.addAttribute("index", 4);
		model.addAttribute("pageName", "board/insert.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPost(BoardVO vo, MultipartHttpServletRequest multi) throws Exception {
		// 대표이미지 업로드
		MultipartFile file = multi.getFile("file");
		
		if(!file.isEmpty()){
			String b_image = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + "/boardimg/" + b_image));
			vo.setB_image(b_image);
		}
		// 데이터입력
		
		System.out.println(vo.toString());
		service.insert(vo);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(BoardVO vo, MultipartHttpServletRequest multi) throws Exception{
		MultipartFile file = multi.getFile("file");
		//이미지가 바뀐경우
		if(!file.isEmpty()){
			new File(path + "boardimg/" + vo.getB_image()).delete();
			String image = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + "boardimg/" + image));
			vo.setB_image(image);
		}
		bdao.update(vo);
		return "redirect:/board/list";
	}
	
	@RequestMapping("/read")
	public String read(HttpServletRequest request, int id, Model model) {
		model.addAttribute("vo", service.read(id));
		// 로그인 정보의 신청 여부 확인
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user");
		
		// 피드여부 확인 
		MyfeedVO fvo = new MyfeedVO();
		fvo.setPrimary_id(id);
		fvo.setTbl_code("B");
		fvo.setUser_id(uvo.getU_id());
		
		model.addAttribute("chk_feed", mdao.chk_feed(fvo));
		model.addAttribute("chk_rec", bdao.chk_rec(id, uvo.getU_id()));
		model.addAttribute("attList", adao.list(id));
		model.addAttribute("index", 4);
		model.addAttribute("pageName", "board/read.jsp");
		return "home";
	}
	
	@RequestMapping("/update")
	public String update(int id, Model model) {
		model.addAttribute("vo", bdao.read(id));
		model.addAttribute("attList", adao.list(id));
		model.addAttribute("index", 4);
		model.addAttribute("pageName", "board/update.jsp");
		return "home";
	}

	// 게시글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public void deletePost(int id, String b_image) throws Exception {
		List<String> attList = adao.list(id);
		if(attList != null){
			for(String image:attList){
				new File(path + "boardimg/" + image).delete();
				adao.delete(image);
			}
		}
		new File(path + "boardimg/" + b_image).delete();
		service.delete(id);
	}
	
	// 첨부파일 추가
	@RequestMapping(value = "/attInsert", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String attInsert(int id, String user_id, MultipartFile file) throws Exception {
		// 첨부파일 업로드
		File attPath = new File(path + "boardimg/" + user_id);
		if (!attPath.exists()) attPath.mkdir();
		String b_image = user_id + "/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
		file.transferTo(new File(path + "boardimg/" + b_image));

		String maxCode = bdao.maxCode();
		int max_id = Integer.parseInt(maxCode);
		
		if(id <= max_id){
			adao.insert_old(id, b_image);
		}
		return b_image;
	}
	
	// 첨부파일 삭제
	@RequestMapping(value = "/attDelete", method = RequestMethod.POST)
	@ResponseBody
	public void attDelete(String b_image) throws Exception {
		new File(path + "boardimg/" + b_image).delete();
		adao.delete(b_image);
	}
		
	// 이미지파일 브라우저에 출력
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName) throws Exception {
		ResponseEntity<byte[]> result = null;
		// display fileName이 있는 경우
		if (!fileName.equals("")) {
			File file = new File(path +"boardimg/" + File.separator + fileName);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
	
	// myfeed insert
	@RequestMapping(value="/feed_insert", method=RequestMethod.POST)
	@ResponseBody
	public void myfeed_insert(MyfeedVO vo){
		service.board_insert_feed(vo);
	}
	
	// myfeed del
	@RequestMapping(value="/feed_del", method=RequestMethod.POST)
	@ResponseBody
	public void myfeed_del(MyfeedVO vo){
		mservice.myfeed_delete(vo);
	}
	
	// board_recommand
	@RequestMapping(value="/rec", method=RequestMethod.POST)
	@ResponseBody
	public void board_rec(int b_id, String user_id){
		service.insert_rec(b_id, user_id);
	}
	
	// board_recommand_del
	@RequestMapping(value="/rec_del", method=RequestMethod.POST)
	@ResponseBody
	public void board_rec_Del(int b_id, String user_id){
		service.delete_rec(b_id, user_id);
	}
}
