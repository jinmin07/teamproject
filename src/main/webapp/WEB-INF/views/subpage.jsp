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
         margin-left: 100px;
      }
      
      .child{
         display:block;
         padding-top:6px;
         border-bottom: 1px solid #258ecd;
         color: #fff;
        font-weight: 300;
        background: #47a3da;
      }
      
      .child h3{
         margin-left:21px;
      }
      
      .child:hover{
          background: #258ecd;
      }
      
      .submenu{
          display:block;
          padding-top:6px;
          padding-left:8px;
         border-bottom: 1px solid #258ecd;
         color: #fff;
        font-weight: 300;
        background:#6AACD8;
      }
      
      .submenu:hover{
         background: #75BEEF;
      }
      
      .content{
         float:left;
         width : 950px;
      }
      
      
     
     .parent .top{
        color: #afdefa;
       font-size: 1.9em;
       padding: 20px;
       margin: 0;
       font-weight: 300;
       background: #0d77b6;
     }
     
     #writing,#attend,#query{
         display:block;
         border-bottom: 1px solid #258ecd;
         color: #fff;
        font-weight: 300;
        background: #47a3da;
     }
     
   </style>
</head>
<body>
   <div class="wrap">
      <div class="parent">
          <h3 class="top">My Page</h3>
         <div class = "child" style="cursor: pointer;" onClick="location.href='/mypage/my_profile';">
            <h3>내 프로필</h3>
         </div>
         <div class = "child" id="hover_writing">
            <h3>내가 쓴 글</h3>
            <div id="writing" style="display:none;">
               <div class = "submenu" style="cursor: pointer;" onClick="location.href='/mypage/my_writing/course';">
                  <h3 style="font-size: 16px; ">공동생활</h3>
               </div>
               <div class="submenu" style="cursor: pointer;" onClick="location.href='/mypage/my_writing/purchase';">
                  <h3 style="font-size: 16px;">공동구매</h3>
               </div>
               <div class="submenu" style="cursor: pointer;" onClick="location.href='/mypage/my_writing/board';">
                  <h3 style="font-size: 16px;">커뮤니티</h3>
               </div>
            </div>
         </div>
         <div class = "child" id="hover_attend">
            <h3>내가 참여한 글</h3>
            <div id="attend" style="display:none;">
                <div class="submenu" style="cursor: pointer;" onClick="location.href='/mypage/my_attend/course';">
                  <h3 style="font-size: 16px;">공동생활</h3>
               </div>
               <div class="submenu" style="cursor: pointer;" onClick="location.href='/mypage/my_attend/purchase';">
                  <h3 style="font-size: 16px;">공동구매</h3>
               </div>
            </div>
         </div>
         <div class = "child" id="hover_query">
            <h3>내가 문의한 글</h3>
            <div id="query" style="display:none;">
               <div class="submenu" style="cursor: pointer;" onClick="location.href='/mypage/my_query/course';">
                  <h3  style="font-size: 16px;">공동생활</h3>
               </div>
               <div class="submenu" style="cursor: pointer;" onClick="location.href='/mypage/my_query/purchase';">
                  <h3  style="font-size: 16px;">공동구매</h3>
               </div>
            </div>
         </div>
         <div class = "child" style="cursor: pointer;" onClick="location.href='/mypage/asking';">
            <h3>문의하기</h3>
         </div>
      </div>
      <div class="content" >
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