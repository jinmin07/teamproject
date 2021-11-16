<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="/resources/login.css">
</head>
<body style="padding-top:180px; width:800px; margin:0 auto;">


	<a class="navigation-logo"  href="/">	<h1>일맥상통</h1></a>
	<div class="statusbox"></div>
	<div class="wrapper">
		<form id="login_form" method="post">
			<div class="logo_wrap">
				<h2>로그인</h2>
			</div>
			<div class="login_wrap">
				<div class="id_wrap" >
					<div class="id_input_box">
						<input class="id_input" name="u_id">
					</div>
				</div>
				<div class="pw_wrap">
					<div class="pw_input_box">
						<input class="pw_iput" type="password" name="u_pass">
					</div>
				</div>
				<c:if test = "${result == 0 }">
                <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
        </c:if>
				<div class="login_button_wrap">
					<input type="button" class="login_button" value="로그인">
				</div>
			</div>
		</form>
	</div>
</body>
<script>
 	$(".login_button").on("click",function(){
 		
 		 $("#login_form").attr("action", "/member/login");
         $("#login_form").submit();
 	});
 	
 	//엔터키 클릭시 로그인
 	$(".pw_iput").on("keypress",function(e){
		if(e.keyCode==13){
			 $("#login_form").attr("action", "/member/login");
	         $("#login_form").submit();
		}
 	}); 	
</script>
</html>