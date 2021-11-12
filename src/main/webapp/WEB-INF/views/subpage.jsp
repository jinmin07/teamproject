<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.wrap {
			overflow: hidden;
		}
		.parent{
			float:left;
			margin:10px 10px; 
			padding:10px;
			width:200px;
		}
		
		.child{
		    border-bottom:1px solid gray;
			display:block;
			padding:10px;
		}
		.content{
			float:left;
			width : 600px;
		}
	</style>
</head>
<body>
	<div class="wrap">
		<h1>마이페이지</h1>
		<div class="parent">
			<div class = "child">
				<h3><a href="/mypage/my_feed">내 피드</a></h3>
			</div>
			<div class = "child">
				<h3><a href="/mypage/my_writing">내가 쓴 글보기</a></h3>
			</div>
			<div class = "child">
				<h3><a href="/mypage/my_attend">내가 참여한 글 보기</a></h3>
			</div>
			<div class = "child">
				<h3><a href="/mypage/my_query">내가 문의한 글 보기</a></h3>
			</div>
			<div class = "child">
				<h3><a href="/mypage/my_profile">내 프로필 보기</a></h3>
			</div>
		</div>
		<div class="content">
			<jsp:include page="${subPageName}"/>
		</div>
	</div>
</body>
</html>