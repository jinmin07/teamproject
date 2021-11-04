<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>학사관리</title>
	<link rel="stylesheet" href="/resources/home.css"/>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> 
</head>
<body>
	<div id="page">
		<div id="header">
			<h1>프로젝트</h1>
		</div>
		<div id="center">
			<div id="menu">
				<h4><a href="#">공동구매</a></h4>
				<h4><a href="#">공동생활</a></h4>
				<h4><a href="/slist">지원정책</a></h4>
				<h4><a href="#">커뮤니티</a></h4>
				<!-- 로그인을 하지 않은 상태 -->             
                <c:if test = "${user == null }">
				<h4 style="float:right"><a href="/member/login">로그인</a></h4>				
				<h4 style="float:right"><a href="/member/insert">회원가입</a></h4>		
				</c:if>  
				<!-- 로그인 한 상태 -->
				 <c:if test="${ user != null }">
                 <span>회원 : ${user.u_name}</span>
         </c:if>		
			</div>
			<div id="content">
				<jsp:include page="${pageName}"/>
			</div>
		</div>
		<div id="footer">
			<h3>Copyright ICIA All Rights Reserved.</h3>
		</div>
	</div>
</body>
</html>