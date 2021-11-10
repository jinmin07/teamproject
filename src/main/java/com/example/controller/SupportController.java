package com.example.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.SupportVO;
import com.example.mapper.SupportDAO;
import com.example.service.SupportService;

@Controller
public class SupportController {
	@Resource(name="uploadPath")
	private String path;
	
	@Autowired
	SupportDAO sdao;
	
	@Autowired
	SupportService service;
	
	@RequestMapping("/supdate")
	public String supdate(int id,Model model){
		model.addAttribute("vo",service.read(id));
		model.addAttribute("pageName","support/supdate.jsp");
		return "home";
	}
	
	@RequestMapping(value="/supdate",method=RequestMethod.POST)
	public String supdate(SupportVO vo,MultipartHttpServletRequest multi,String oldimage)throws Exception{
		MultipartFile file = multi.getFile("file");
		if (!file.isEmpty()) { 
			String oldImage = oldimage;
			if (!oldImage.equals(""))
				new File(path + "/" + oldImage).delete(); // ���� �̹����� ������ ����
			String image =System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path + "/" + image));
			vo.setS_image(image);
			sdao.update(vo);
			return "redirect:/slist";
		}else{
			vo.setS_image(oldimage);
			sdao.update(vo);
			return "redirect:/slist";
		}
	}	
	
	
	@RequestMapping("/sread")
	public String sread(int id,Model model){
		model.addAttribute("vo",service.read(id));
		model.addAttribute("pageName","support/sread.jsp");
		return "home";
	}
	
	
	@RequestMapping("/slist")
	public String list(Model model){
		model.addAttribute("pageName", "support/slist.jsp");
		return "home";
	}
	
	
	
	@RequestMapping("/sinsert")
	public String insert(Model model){
		int maxCode=sdao.maxCode();
		int id=maxCode+1;
		model.addAttribute("id",id);
		model.addAttribute("pageName","support/sinsert.jsp");
		return "home";
	}
	
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertPost(SupportVO vo,MultipartHttpServletRequest multi) throws Exception{
		//��ǥ�̹��� ���ε�
		MultipartFile file=multi.getFile("file");
		String image=System.currentTimeMillis()+"_"+file.getOriginalFilename();
		file.transferTo(new File(path+"/"+ image));
		vo.setS_image(image);
		
		sdao.insert(vo);
		return "redirect:/slist";
	}
	
	@RequestMapping("/list")
	public String getList(){
		return "support/slist";
	}

	@RequestMapping("support/list.json")
	@ResponseBody
	public HashMap<String,Object> listJSON(Criteria cri){
		HashMap<String,Object> map=new HashMap<>();
		cri.setPerPageNum(9);
		map.put("list", sdao.list(cri));
		map.put("cri",cri);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(sdao.totalCount(cri));
		map.put("pm", pm);
		return map;
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(int id){
		sdao.delete(id);
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(String S_image,int id){
	 String image=S_image;
	 File file= new File(path + "/"+ image);
	 if(file.exists()){
		 file.delete();
	 }
	 sdao.delete(id);
	 return "redirect:slist";
	}
	
	// �̹������� �������� ���
		@RequestMapping("/display")
		@ResponseBody
		public ResponseEntity<byte[]> display(String fileName) throws Exception {
			ResponseEntity<byte[]> result = null;
			// display fileName�� �ִ� ���
			if (!fileName.equals("")) {
				File file = new File(path + File.separator + fileName);
				HttpHeaders header = new HttpHeaders();
				header.add("Content-Type", Files.probeContentType(file.toPath()));
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			}
			return result;
		}
		
	
}