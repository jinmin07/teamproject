<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>일맥상통</title>
	<link rel="icon" type="image/png" sizes="128x128" href="/resources/favicon.png"/>
	<link rel="stylesheet" href="/resources/home.css"/>
	<link rel="stylesheet" href="/resources/notice.css"/>	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" >
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>
	<div id="page">
	<!-- 맨위 상단 -->
		<div class="topnav" style="  overflow: hidden; color: #999999; margin-right:130px; ">
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
						<a href="/mypage/my_profile"><strong style="color:black; ">${user.u_name}</strong>님</a>
					</div>
				</c:if>
		</div>
		
		<!-- 메뉴 -->
		<header style="width: 100%; ">
			<div class="navigation-primary"
				style="position: relative;  ">
				<div class="navigation-primary__content">
					<div class="navigation-primary__left">
						<a class="navigation-logo" href="/">
							<img src="/resources/logo.png" width=154 />
						</a>
					</div>
					<nav id="nav_menu" class="navigation-primary__menu">
						<a class="navigation-primary__menu__item" href="/course/list">공동생활</a>
						<a class="navigation-primary__menu__item" href="/purchase/list" >공동구매</a> 
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
						<a href="/mypage/my_profile" style="color:inherit;width:27px;margin-left:20px;">
							<i class="far fa-user" style=" margin-top:16px;font-size: 35px;"></i>
						</a>
						<a href="/myfeed/list" style="color:inherit; width:27px;margin-left:30px;">
							<i class="far fa-clipboard" style="margin-top:16px;font-size: 35px;"></i>
						</a>
						<a href="/notice" style="color:inherit; width:27px; margin-left:30px;">
							<i class="far fa-bell" style="margin-top:16px;font-size: 35px;">
								<c:if test="${ user != null }">
									<span id="count">${count}</span>
								</c:if>
							</i>
						</a>
					</div>
				</div>
			</div>
		</header>
		<div id="content">
			<jsp:include page="${pageName}"/>
		</div>
		<div id="footer">
			<div class="footer_infor">
				<ul>
	    			<li>
	    				
	    			    <b>고객센터: </b>1234-1234 (평일 09:30~18:30/점심 12:00~13:00) <b>| FAX: </b>1234-567-8910 <b>| Email: </b>help@sangtong.com
	    			</li>
	    			<li>
	    				<b>상호명: </b>(주)일맥상통  <b>| 대표: </b>진민아  <b>| 주소:</b> 인천광역시 미추홀구 매소홀로 488번길 6-32 5층(학익동)
	    			</li>
	    			<li>
	    				<b>사업자등록번호: </b>123-45-56789 <b>| 통신판매업신고번호: </b>제2021-인천학익-02354호
	    			</li>
	    			<li>
	    				<h3 style="color: #424242;">Copyright ⓒ 일맥상통 Corp. All Right Reserved.</h3>
	    			</li>
    			</ul>
    		</div>
		</div>
		<div id="notice" class="notice">
 			<div class="heading">
 				<span class="n_id" style="display:none;">{{n_id}}</span>
 				<b id="notice_date" style="font-size:13px;">{{regdate}}</b>
 			</div>
			<div id="notice_content" class="body home" style="text-align:left;">
			</div>
 		</div>
	</div>
</body>
<script>
	$("#notice").hide();
	
	var index="${index}";
	if(index!=null || index!=""){
		$("#nav_menu a:nth-child(" + index + ")").css('color', '#35c5f0');
	}
	
	//notice 소켓생성
	var u_id="${user.u_id}";
	var sock_notice;
	if(u_id != ""){ //로그인되어있으면
      sock_notice = new SockJS("http://192.168.1.185:8088/sock_notice");
      sock_notice.onmessage = onNoticeMessage;
	}
	
   //서버에서 메시지를 받은 경우
   function onNoticeMessage(msg){
	   var items= msg.data.split("|");
	   if(items[0] == u_id){
		   var receiver = items[0];
		   var content = items[1];
		   var date = items[2];
		   $("#notice_date").html(date);
		   $("#notice_content").html(receiver +"님께 알림이 도착했습니다.");
		   $("#notice").show();
	   }
	   
      $.ajax({
    	  type: "get",
    	  url : "/notice/unreadCount",
    	  data: {"u_id": u_id},
    	  success : function(data){
    		  $("#count").html(data);
    	  }
      });
   }
</script>
</html>