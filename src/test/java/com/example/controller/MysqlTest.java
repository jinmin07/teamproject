package com.example.controller;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;
import com.example.domain.UserVO;
import com.example.mapper.MysqlMapper;
import com.example.mapper.ProductDAO;
import com.example.mapper.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class) //먼저 SpringJUnit4ClassRunner.class import한다. 
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MysqlTest {
	
	@Autowired
	private UserDAO udao;
	
	@Autowired
	private ProductDAO pdao;
	
	@Test
	public void list() {
		ProductVO vo = new ProductVO();
		vo.setP_category("p_food");
		pdao.list();
	}
	
	
//	@Test 
//	public void insert() {
//		UserVO vo = new UserVO();
//		vo.setU_id("user02");
//		vo.setU_pass("pass");
//		vo.setU_name("김여정");
//		vo.setU_age(21);
//		vo.setU_address("인천시 연수구");
//		vo.setU_email("root2@gmail.com");
//		vo.setU_gender("여");
//		vo.setU_phone("010-2345-6789");
//		dao.insert(vo);
//	}
	
	/*@Autowired
	JavaMailSenderImpl mailSender;

	@Test
	public void mailSendTest() throws Exception {

		String subject = "test 메일";
		String content = "메일 테스트입니다.";
		String from = "klmmms882912@naver.com";
		String to = "klmmms882912@naver.com";

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);


			mailSender.send(mail);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}*/
	
	/*
	@Test
	public void memberIdChk() throws Exception{
		String id = "user01";	// 존재하는 아이디
		String id2 = "user08";	// 존재하지 않는 아이디
		dao.idCheck(id);
		dao.idCheck(id2);
	}*/
	
	  /* 로그인 쿼리 mapper 메서드 테스트 */
//    @Test
//    public void userLogin() throws Exception{
//        
//    	UserVO user = new UserVO(); // UserVO 변수 선언 및 초기화
//        
//        /* 올바른 아이디 비번 입력경우 */
//        user.setU_id("user01");
//        user.setU_pass("pass");
//        
//        /* 올바른 않은 아이디 비번 입력경우 */
//        //member.setMemberId("test1123");
//        //member.setMemberPw("test1321321");
//        
//        dao.userLogin(user);
//        System.out.println("결과 값 : " + dao.userLogin(user));
//        
//    }
	
//	@Test
//	public void purchaseInsertTest() throws Exception{
//		ProductVO vo = new ProductVO();
//		UserVO uvo = new UserVO();
//		
//		uvo.setU_id("user21");
//		
//		vo.setTbl_code("p");
//		vo.setTitle("라면세트");
//		vo.setP_writer(uvo.getU_id());
//		vo.setP_link("www.wadiz.com");
//		vo.setP_local("인천시 남동구");
//		vo.setP_cnt_member(3);
//		vo.setP_tot_member(4);
//		vo.setP_price(30000);
//		vo.setP_salePrice(25000);
//		vo.setP_image("img01.jpg");
//		vo.setDate_start("2021-01-01");
//		vo.setDate_end("2021-01-02");
//		vo.setP_category("음식");
//		vo.setP_view(3);
//		vo.setP_cnt_feed(2);
//		
//		pdao.insert(vo);
//	}


}
