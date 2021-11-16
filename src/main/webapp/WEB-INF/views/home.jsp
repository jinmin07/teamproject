<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>일맥상통</title>
	<link rel="stylesheet" href="/resources/home.css"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" >
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> 
	
</head>
<body>
	<div id="page">


	<!-- 맨위 상단 -->
		<div class="topnav" style="  overflow: hidden; color: #999999; margin-right:130px;">
				<div class="active">
					<a href="/#" >공지사항</a>
				</div>
				<div class="active">
					<a href="/#">자주 묻는 질문</a>
				</div>
			<!-- 로그인을 하지 않은 상태 -->    
				<c:if test="${user == null }">
					<div class="active">
						<a href="/member/insert">회원가입</a>
					</div>
					<div class="active">
						<a href="/member/login">로그인</a>
					</div>
					
				</c:if>
			<!-- 로그인 한 상태 -->
				<c:if test="${ user != null }">

					<div class="active">
						<a href="/member/logout">로그아웃</a>
					</div>
					<div class="active">
						<a href="/#"><strong style="color:black;">${user.u_name}</strong>님</a>
					</div>
				</c:if>
		</div>
		
		<!-- 메뉴 -->
		<header style="width: 100%; ">
			<div class="navigation-primary"
				style="position: relative;  ">
				<div class="navigation-primary__content">
					<div class="navigation-primary__left">
						<a class="navigation-logo" href="/"><h1>일맥상통</h1></a>
					</div>
					<nav class="navigation-primary__menu">
						<a class="navigation-primary__menu__item" href="/purchase/list" >공동구매</a> 
						<a class="navigation-primary__menu__item" href="/course/list">공동생활</a>
						<a class="navigation-primary__menu__item" href="/support/list">지원정책</a>
						<a class="navigation-primary__menu__item" href="/board/list	">커뮤니티</a>
					</nav>
					<div class="navigation-primary__right">
						<div class="navigation-bar-search">
							<input type="text" class="navigation-search__input__text"
								placeholder="통합검색" size="1" />
							<svg class="navigation-search__input__icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" preserveAspectRatio="xMidYMid meet">
							<path d="M22 22l-5-5"></path>
							<circle cx="11" cy="11" r="8"></circle></svg>
						</div>
						<a href="/mypage/subpage" style="color:inherit;width:27px;margin-left:20px;">
							<i class="far fa-user" style=" margin-top:16px;font-size: 35px;"></i>
						</a>
						<a href="/#" style="color:inherit; width:27px;margin-left:30px;">
							<i class="far fa-clipboard" style="margin-top:16px;font-size: 35px;"></i>
						</a>
						<a href="/#" style="color:inherit; width:27px; margin-left:30px;">
							<i class="far fa-bell" style="margin-top:16px;font-size: 35px;"></i>
						</a>
						
					</div>
				</div>
			</div>
	</header>
	<!-- 
	<div id="center">
			<div id="menu">
				<h4><a href="/purchase/list">공동구매</a></h4>
				<h4><a href="/cou/list">공동생활</a></h4>
				<h4><a href="/slist">지원정책</a></h4>
				<h4><a href="#">커뮤니티</a></h4>
				-->
				<!-- 로그인을 하지 않은 상태 -->             
               <!-- 
               <c:if test = "${user == null }">
				<h4 style="float:right"><a href="/member/login">로그인</a></h4>				
				<h4 style="float:right"><a href="/member/insert">회원가입</a></h4>		
				</c:if>  
				-->
				<!-- 로그인 한 상태 -->
				<!-- 
				 <c:if test="${ user != null }">
				 <h4 style="float:right"><a href="/member/logout">로그아웃</a></h4>
                 <h4 style="float:right">회원 : ${user.u_name}</h4>               
         		</c:if>
			</div>
			-->
			<div id="content">
				<jsp:include page="${pageName}"/>
			</div>
		</div>
		<div id="footer">
			<h3>Copyright ICIA All Rights Reserved.</h3>
		</div>
</body>
</html>