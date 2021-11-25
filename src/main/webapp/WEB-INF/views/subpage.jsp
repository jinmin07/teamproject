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
         width : 950px;
         margin-left: 50px;
      }
      a:hover{
		color:#35c5f0;
	  }
   </style>
</head>
<body>
   <div class="wrap">
   <h1></h1>
      <div class="parent">
         <div class = "child">
            <h3><a href="/mypage/my_profile">내 프로필</a></h3>
         </div>
         <div class = "child" id="hover_writing">
            <h3>내가 쓴 글보기</h3>
            <div id="writing" style="display:none;">
            	<h3><a href="/mypage/my_writing/course">공동생활</a></h3>
            	<h3><a href="/mypage/my_writing/purchase">공동구매</a></h3>
            	<h3><a href="/mypage/my_writing/board">커뮤니티</a></h3>
            </div>
         </div>
         <div class = "child" id="hover_attend">
            <h3>내가 참여한 글 보기</h3>
            <div id="attend" style="display:none;">
            	<h3><a href="/mypage/my_attend/course">공동생활</a></h3>
            	<h3><a href="/mypage/my_attend/purchase">공동구매</a></h3>
            </div>
         </div>
         <div class = "child" id="hover_query">
            <h3>내가 문의한 글 보기</h3>
            <div id="query" style="display:none;">
            	<h3><a href="/mypage/my_query/course">공동생활</a></h3>
            	<h3><a href="/mypage/my_query/purchase">공동구매</a></h3>
            </div>
         </div>
         <div class = "child">
            <h3><a href="/mypage/asking">문의하기</a></h3>
         </div>
      </div>
      <div class="content">
      	 <jsp:include page="${subpageName}"/>
      </div>
   </div>
</body>
<script>
	$("#hover_writing").hover(function(){
		$("#writing").show();
	},function(){
		$("#writing").hide();
	});
	
	$("#hover_query").hover(function(){
		$("#query").show();
	},function(){
		$("#query").hide();
	});
	
	$("#hover_attend").hover(function(){
		$("#attend").show();
	},function(){
		$("#attend").hide();
	});
</script>
</html>