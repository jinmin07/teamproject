package com.example.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.AttachDAO;
import com.example.mapper.BoardDAO;
import com.example.service.BoardService;

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
	BoardService service;

	@RequestMapping("/list")
	public String login(Model model) {
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
		int id = (Integer.parseInt(maxCode.substring(1)) + 1);
		model.addAttribute("id", id);
		model.addAttribute("pageName", "board/insert.jsp");
		System.out.println(vo.toString());
		return "home";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPost(BoardVO vo, MultipartHttpServletRequest multi) throws Exception {
		// 대표이미지 업로드
		MultipartFile file = multi.getFile("file");
		String b_image = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		file.transferTo(new File(path + "/" + b_image));
		vo.setB_image(b_image);
		
		System.out.println(vo.toString());
		// 데이터입력
		bdao.insert(vo);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(BoardVO vo, MultipartHttpServletRequest multi) throws Exception{
		MultipartFile file = multi.getFile("file");
		//이미지가 바뀐경우
		if(!file.isEmpty()){
			new File(path + "/" + vo.getB_image()).delete();
			String image = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + "/" + image));
			vo.setB_image(image);
		}
		bdao.update(vo);
		return "redirect:/board/list";
	}
	
	@RequestMapping("/read")
	public String read(int id, Model model) {
		model.addAttribute("vo", service.read(id));
		model.addAttribute("attList", adao.list(id));
		model.addAttribute("pageName", "board/read.jsp");
		return "home";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletePost(int id) {
		System.out.println(id);
		service.delete(id);
		return "redirect:/board/list";
	}
	
	// 첨부파일 추가
	@RequestMapping(value = "/attInsert", method = RequestMethod.POST)
	@ResponseBody
	public String attInsert(int id, MultipartFile file) throws Exception {
		// 첨부파일 업로드
		File attPath = new File(path + "/" + id);
		if (!attPath.exists()) attPath.mkdir();
		String b_image = id + "/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
		file.transferTo(new File(path + "/" + b_image));

		// 첨부데이터 입력
		adao.insert(id, b_image);
		return b_image;
	}
	
	// 첨부파일 삭제
		@RequestMapping(value = "/attDelete", method = RequestMethod.POST)
		@ResponseBody
		public void attDelete(String b_image) throws Exception {
			new File(path + "/" + b_image).delete();
			adao.delete(b_image);
		}
		
	// 이미지파일 브라우저에 출력
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName) throws Exception {
		ResponseEntity<byte[]> result = null;
		// display fileName이 있는 경우
		if (!fileName.equals("")) {
			File file = new File(path + File.separator + fileName);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
}
