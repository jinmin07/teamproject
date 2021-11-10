package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.PQueryVO;
import com.example.domain.PReplyVO;
import com.example.domain.ProductVO;
import com.example.domain.UserVO;
import com.example.mapper.ProductDAO;
import com.example.mapper.UserDAO;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	
	@Autowired
	ProductDAO pdao;
	// 파일 저장 루트 지정
	@Resource(name = "uploadPath")
	private String path;
	
	@Autowired
	UserDAO udao;

	//상품출력
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String List(Model model) {
		model.addAttribute("pageName", "purchase/list.jsp");
		logger.info("목록이 출력됩니다");
		return "home";
	}
	
	//상품정보 => JSON 
	@RequestMapping("/list.json")
	@ResponseBody
	public List<ProductVO> listJson() {
		return pdao.list();
	}
	
	@RequestMapping("/list_query.json")
	@ResponseBody
	public List<PQueryVO> list_query(int p_id){
		return pdao.list_query(p_id);
	}
	
	@RequestMapping("/list_reply.json")
	@ResponseBody
	public PReplyVO list_reply(int p_query_id) {
		return pdao.list_reply(p_query_id);
	}


	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ProductVO vo, MultipartHttpServletRequest multi) throws IllegalStateException, IOException {
		MultipartFile file = multi.getFile("file");

		if (!file.isEmpty()) {
			new File(path + "/" + vo.getP_image()).delete();
			String image = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + "/" + image));
			vo.setP_image(image);
		}

		pdao.update(vo);

		return "redirect:/";
	}

	// read page
	@RequestMapping("/read")
	public String read(UserVO user,Model model, String id,HttpServletRequest request) throws Exception {
		logger.info("read페이지로 진입합니다");
		UserVO uvo = udao.userLogin(user);
		model.addAttribute("user", uvo);
		model.addAttribute("vo", pdao.read(id));
		model.addAttribute("pageName", "purchase/read.jsp");
		
		return "home";
	}

	@RequestMapping(value = "/insert")
	public String insert(Model model) {
		String maxId = pdao.maxId();
		String id = String.valueOf(Integer.parseInt(maxId) + 1);
		model.addAttribute("id", id);
		model.addAttribute("pageName", "purchase/insert.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/delete",method = RequestMethod.POST)
	@ResponseBody
	public void delete(String id) {
		pdao.delete(id);
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPost(UserVO user, ProductVO vo, MultipartHttpServletRequest multi,HttpServletRequest request) throws Exception {
		System.out.println(vo.toString());
		
		UserVO lvo = udao.userLogin(user);
		
		
		HttpSession session = request.getSession();
		
		MultipartFile file = multi.getFile("file"); // 업로드한 파일 지정
		// 파일 이름 유니크하게
		String p_image = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		vo.setP_image(p_image);
		// 대표 파일 업로드 하기
		file.transferTo(new File(path + "/" + p_image));
		// 데이터 입력
		
		pdao.insert(vo);
		session.setAttribute("user", lvo);
		session.setMaxInactiveInterval(10000000);
		// new
		return "redirect:/";
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
	
	@RequestMapping("/list_member.json")
	@ResponseBody
	public List<HashMap<String,Object>> list_memeber(int p_id){
		return pdao.list_member(p_id);
	}
	
	
	@RequestMapping(value="/insert_member",method=RequestMethod.POST)
	@ResponseBody
	public int insert_member(int p_id,String p_member) throws Exception{
		int result = pdao.chk_member(p_id, p_member);
		if(result == 0) {
			pdao.insert_member(p_id, p_member);	
			pdao.p_cnt_member_increment(p_id);
		}
		return result;
	}
	
	
	
	@RequestMapping(value="/delete_member",method=RequestMethod.POST)
	@ResponseBody
	public void delete_member(int p_id,String p_member) {
		pdao.delete_member(p_id, p_member);
		pdao.p_cnt_member_decrement(p_id);
	}
	
	
	@RequestMapping("/purchase_member")
	public String purchase_member(int id,Model model) {
		model.addAttribute("id", id);
		return "/purchase/purchaseMembers";
	}
	
	@RequestMapping("/reply_insert")
	public String purchase_reply(String id,Model model) {
		ProductVO vo = pdao.read(id);
		model.addAttribute("vo", vo);
		model.addAttribute("pageName", "purchase/queryInsert.jsp");
		
		return "home";
	}
	
	@RequestMapping(value="/reply_insert", method = RequestMethod.POST)
	public String purchase_reply_insert(PQueryVO vo) {
		pdao.insert_query(vo);
		String url = "redirect:/read?id=" + vo.getP_id();
		return url;
	}
	
	@RequestMapping("/cnt_reply")
	@ResponseBody
	public int cnt_reply(int p_query_id) {
		PReplyVO pvo = pdao.list_reply(p_query_id);
		int result = 0;
		if(pvo != null) {
			result = 1;
		}
		return result;
	}
	
	
	
	

}