package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
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

import com.example.domain.Criteria;
import com.example.domain.MyfeedVO;
import com.example.domain.NoticeVO;
import com.example.domain.PQueryVO;
import com.example.domain.PReplyVO;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;
import com.example.domain.UserVO;
import com.example.domain.course.CQueryVO;
import com.example.domain.course.CReplyVO;
import com.example.domain.course.CategoryVO;
import com.example.domain.course.CourseVO;
import com.example.mapper.MypageDAO;
import com.example.mapper.NoticeDAO;
import com.example.mapper.ProductDAO;
import com.example.mapper.UserDAO;
import com.example.service.PurchaseService;

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
   MypageDAO mdao;
   
   @Autowired
   UserDAO udao;
   
   @Autowired
   NoticeDAO ndao;
   
   @Autowired
   PurchaseService service;

   //상품출력
   @RequestMapping(value = "/list")
   public String List(Model model) {
      model.addAttribute("index", 1);
      model.addAttribute("pageName", "purchase/list.jsp");
      logger.info("목록이 출력됩니다");
      return "home";
   }
   
   //상품정보 => JSON 
   @RequestMapping("/list.json")
   @ResponseBody
   public HashMap<String,Object> listJson(Criteria cri) {   
      HashMap<String,Object> map=new HashMap<>();
      cri.setPerPageNum(9);
      map.put("list", pdao.list(cri));
      map.put("cri",cri);
      PageMaker pm=new PageMaker();
      pm.setCri(cri);
      pm.setTotalCount(pdao.totCount(cri));
      map.put("pm", pm);
      return map;
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


   @RequestMapping(value="/update",method = RequestMethod.GET)
   public String updateGET(int id,Model model) {
      ProductVO vo = pdao.list_purchase(id);
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
      String start = format.format(vo.getDate_start());
        String end = format.format(vo.getDate_end());
      
      model.addAttribute("start", start);
      model.addAttribute("end", end);

      model.addAttribute("vo", vo);
      model.addAttribute("index", 1);
      model.addAttribute("pageName", "purchase/update.jsp");
      
      return "home";
   }


   @RequestMapping(value = "/update", method = RequestMethod.POST)
   public String updatePOST(ProductVO vo, MultipartHttpServletRequest multi,String start,String end, String old_title) throws Exception {
      MultipartFile file = multi.getFile("file");
      if(!file.isEmpty()){
         new File(path + "purchaseimg/" + vo.getP_image()).delete();
         String image = System.currentTimeMillis() + "_" + file.getOriginalFilename();
         file.transferTo(new File(path + "purchaseimg/" + image));
         vo.setP_image(image);
      }
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date_start = sdf.parse(start);
      vo.setDate_start(date_start);
      Date date_end = sdf.parse(end);
      vo.setDate_end(date_end);
      System.out.println(vo.toString());
      pdao.update(vo);
      
      String content = "모집 신청하신 공동구매 [" + old_title + "] 진행 건이 작성자의 요청에 의해 수정되었습니다. 이용에 참고하시기 바랍니다.";
      NoticeVO nvo = new NoticeVO();
      List<HashMap<String, Object>> list = mdao.list_member(vo.getId(), vo.getTbl_code());
         nvo.setTbl_code(vo.getTbl_code());
         nvo.setTbl_id(vo.getId());
         nvo.setSender("admin");
         nvo.setContent(content);
      for(int i = 0; i< list.size(); i++){
         String member = (String)list.get(i).get("member");
         nvo.setReceiver(member);
         ndao.insert(nvo);
      }   
      
      String url = "redirect:/purchase/read?id=" +vo.getId();
      return url;
   }
   
   @RequestMapping(value = "/plus_point",method = {RequestMethod.GET,RequestMethod.POST})
   @ResponseBody
   public void plus_point(Model model,HttpServletRequest request) {
	   logger.info("포인트 부여 하는 메소드 입니다.");
	   
	   HttpSession session = request.getSession();
	   UserVO uvo = (UserVO) session.getAttribute("user");
	   
	   System.out.println(uvo.getU_point());
	   
	   udao.plus_point(uvo.getU_id(), uvo.getU_point());
   }
   @RequestMapping(value = "/minus_point",method = {RequestMethod.GET,RequestMethod.POST})
   @ResponseBody
   public void minus_point(Model model,HttpServletRequest request) {
	   logger.info("포인트 차감 하는 메소드 입니다.");
	   HttpSession session = request.getSession();
	   UserVO uvo = (UserVO) session.getAttribute("user");

	   System.out.println(uvo.getU_point());
	   
	   udao.minus_point(uvo.getU_id(), uvo.getU_point());
   }

   // read page
   @RequestMapping("/read")
   public String read(Model model, int id,HttpServletRequest request) throws Exception {
      logger.info("read페이지로 진입합니다");
      
      
      
      model.addAttribute("vo", pdao.read(id));
      model.addAttribute("cnt_query",pdao.cnt_query(id));
      
      DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
      //System.out.println("yyyy/MM/dd HH:mm:ss-> "+dtf.format(LocalDateTime.now()));

      
      HttpSession session = request.getSession();
      UserVO uvo = (UserVO) session.getAttribute("user");
      UserVO uuvo = new UserVO();
      ProductVO vo = new ProductVO();
      
      model.addAttribute("now", dtf.format(LocalDateTime.now()));
      model.addAttribute("user", uvo);
      model.addAttribute("chk_member", pdao.chk_member(id, uvo.getU_id()));
      model.addAttribute("index", 1);
      model.addAttribute("pageName", "purchase/read.jsp");
      return "home";
   }

   @RequestMapping(value = "/insert")
   public String insert(Model model) {
      model.addAttribute("index", 1);
      model.addAttribute("pageName", "purchase/insert.jsp");
      return "home";
   }
   
   @RequestMapping(value = "/delete",method = RequestMethod.POST)
   @ResponseBody
   public void delete(int id) {
      service.purchase_delete(id);
   }

   @RequestMapping(value = "/insert", method = RequestMethod.POST)
   public String insertPost(UserVO user, ProductVO vo, MultipartHttpServletRequest multi,HttpServletRequest request,String start,String end) throws Exception {
      System.out.println(vo.toString());
      
      UserVO lvo = udao.userLogin(user);
      
      HttpSession session = request.getSession();
      
      MultipartFile file = multi.getFile("file"); // 업로드한 파일 지정
      // 파일 이름 유니크하게
      String p_image = System.currentTimeMillis() + "_" + file.getOriginalFilename();
      vo.setP_image(p_image);
      // 대표 파일 업로드 하기
      file.transferTo(new File(path + "purchaseimg/" + p_image));
      // 데이터 입력
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      Date date_start = sdf.parse(start);
      vo.setDate_start(date_start);
      Date date_end = sdf.parse(end);
      vo.setDate_end(date_end);
      
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
      if (!fileName.equals("")) {
         File file = new File(path + "purchaseimg/" + File.separator + fileName);

         HttpHeaders header = new HttpHeaders();
         header.add("Content-Type", Files.probeContentType(file.toPath()));
         result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
      }
      return result;
   }
   
   @RequestMapping(value="/insert_member", method= {RequestMethod.POST,RequestMethod.GET})
   @ResponseBody
   public int insert_member(int p_id, String p_member) throws Exception{
      int result = pdao.chk_member(p_id, p_member);
      if(result==0){
         service.purchase_member_add(p_id, p_member);
      }
      return result;
   }
   
   @RequestMapping(value="/delete_member",method=RequestMethod.POST)
   @ResponseBody
   public void delete_member(int p_id,String p_member) {
      service.purchase_member_del(p_id, p_member);
   }
   
   
   @RequestMapping("/purchase_member")
   public String purchase_member(int id,Model model) {
      model.addAttribute("id", id);
      return "/purchase/purchaseMembers";
   }
   
   @RequestMapping("/reply_insert")
   public String purchase_reply(int id,Model model) {
      ProductVO vo = pdao.read(id);
      model.addAttribute("vo", vo);
      model.addAttribute("index", 1);
      model.addAttribute("pageName", "purchase/queryInsert.jsp");
      
      return "home";
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
   
   @RequestMapping("/query_insert")
   public String purchase_query(int id, Model model){
      ProductVO pvo = pdao.read(id);
      model.addAttribute("vo", pvo);
      model.addAttribute("index", 1);
      model.addAttribute("pageName", "purchase/queryInsert.jsp");
      return "home";
   }
   
   @RequestMapping(value="/query_insert", method=RequestMethod.POST)
   public String purchase_query_insert(PQueryVO vo, String p_writer, String title){
      NoticeVO nvo = new NoticeVO();
      nvo.setTbl_code("P");
      nvo.setTbl_id(vo.getP_id());
      nvo.setSender("admin");
      nvo.setContent("모집중인 공동구매 [" + title + "] 진행 건에 대한 문의글이 등록되었습니다.");
      nvo.setReceiver(p_writer);
      //System.out.println(nvo.toString());
      pdao.insert_query(vo);
      ndao.insert(nvo);
      
      String url = "redirect:/purchase/read?id=" +vo.getP_id();
      return url;
   }
   
   @RequestMapping(value="/delete_query", method=RequestMethod.POST)
   @ResponseBody
   public void delete_query(int p_query_id){
      pdao.delete_query(p_query_id);
      
   }
   
   @RequestMapping(value="/reply_insert", method=RequestMethod.POST)
   @ResponseBody
   public void purchase_reply_insert(PReplyVO vo){
      service.purchase_insert_reply(vo);
   }
   
   // myfeed insert
   @RequestMapping(value="/feed_insert", method=RequestMethod.POST)
   @ResponseBody
   public int myfeed_insert(MyfeedVO vo){
      int result = mdao.chk_feed(vo);
      if(result == 0){
         service.purchase_insert_feed(vo);
      }
      return result;
   }
}