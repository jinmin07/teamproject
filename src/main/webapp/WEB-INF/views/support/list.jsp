<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<style>
   .gallerylist{
      width:960px;
      margin:0  auto;
   }
   ul{
      font-size: 0;
   }
   
   .view ul > li {
      display:inline-block;
      vertical-align: top;
      width:33.3%;
   }
   
   .listoption ul>li{
      list-style-type: none;
   }
   
   ul >li >a{
      display :block;
      width:240px;
      text-decoration: none;
      margin:5px;
   }
   
   ul > li >a .img_box{
      position: relative;
      overflow: hidden;
      width:240px;
      height:215px;
   }
   
   ul > li>a .img_box .top{
      position: absolute;
      bottom:170%;
      left:30px;
      z-index:2;
      color:#fff;
      font-size:15px;
      transition:all .35s;
   }
   
   ul > li>a .img_box .center{
      position: absolute;
      width:200px;
      bottom:150%;
      left:30px;
      z-index:2;
      color:#fff;
      font-size:15px;
      font-weight: 900;
      transition:all .35s;
   }
   
   ul> li >a .img_box .bottom{
      padding-top:30px;
      position: absolute;
      top:150%;
      left:30px;
      z-index:2;
      color:#fff;
      font-size: 12px;
      transition:all .35s;
   }
   
   ul > li >a .img_box img{
      width:100%;
   }
   
   ul>li>a:hover .top{top:27%;}
   ul>li>a:hover .center{top:45%;}
   ul>li>a:hover .bottom{top:62%;}
   
   ul>li>a .img_box::after{
      content:'';
      display:block;
      position:absolute;
      top:0;
      left:0;
      width:240px;
      height:215px;
      background: rgba(0,0,0,.78);
      z-index:1;
      opacity:0;
      transition:all .35s;
   }
   
   ul>li>a:hover .img_box::after{
      opacity:1;
   }
   
   .listoption{
      margin:0 auto;
      width:1200px;
      margin-bottom: 30px;
       overflow: hidden;
   }
   
   .box3{
      height:242px;
      width: 450px;
       border-top: 1px solid #e5e5e5;
       border-bottom: 1px solid #e5e5e5;
       justify-content: flex-end;
          background-color: #F0FFFF;
          float:left;
   }
   
   .list{
      font-size: 14px;
   }
   
   .box3 .list .title ,.box4 .list .title{
      line-height: 32px;
      margin:5px 0px;
      font-weight:600;
      text-align: left;
   }
   
   .box4 .list .title{
      margin: 5px 0;
       width: auto;
       line-height: 28px;
   }
   
   .box3 .list .checkbox1, .box4 .list .checkbox2, .box4 .gender .checkbox3 ,.box4 .cate .checkbox4{
      margin-left:10px;
      position: relative;
       display: flex;
       display: -webkit-flex;
       flex-wrap: wrap;
       -webkit-flex-wrap: wrap;
       align-items: center;
   }
   
   p{
      margin:5px;
      display:block
   }
   
       input[type=radio] {
       border: 0;
       clip: rect(0 0 0 0);
       height: 1px;
       margin: -1px;
       overflow: hidden;
       padding: 0;
       position: absolute;
       width: 0;
   }
   
   .checkbox1 input+label {
      position: relative;
      display: block;
      cursor: pointer;
      font-size: 15px;
      width:72px;
      line-height: 30px;
      text-align: center;
       border: 1px solid #333;
   }
   
   .checkbox2 label, .checkbox3 label ,.checkbox4 label{
      cursor: pointer;
       padding: 5px 8px;
       width: 56px;
       line-height: 26px;
       text-align: center;
       border: 1px solid #bdbdbd;
       color:#bdbdbd;
   }
   
   .checkbox1 input:checked +label{
      color: #fff; 
       font-weight: 600;
       background-color: #6b6ce2;
       border-color: #6b6ce2;
   }
   
   .checkbox2 input:checked +label, .checkbox3 input:checked +label,.checkbox4 input:checked +label{
      color:white;
      border: 1px solid black;
      font-weight: 600;
      background-color: black;
   }
   
   
   .box4{
      height:242px;
      width:62%;
      border-top: 1px solid #e5e5e5;
      border-bottom: 1px solid #e5e5e5;
      background-color:  #f7f8fa;
      display:-webkit-flex;
   }
   
   .box4 .list    {
      width:750px;
       
   }
   
   .box .box4 .list li{
      display: flex;
      display: -webkit-flex;
   }
   
   
   .box4 .list .age{
      padding-bottom:10px;
      width:484px;
      border-bottom: 1px solid #dbdbdb;
      border-right: 1px solid #dbdbdb;
      display: block;
   }
   
   .box4 .list .gender{
      padding-bottom:10px;
      padding-left:15px;
      width:200px;
      border-bottom: 1px solid #dbdbdb;
   }
   
   .view{
      width:1024px;
      margin:0 auto;
   }
   
   .box .list{
      margin:5px 0px;
      padding: 5px 5px 5px 10px;
       display: flex;
       display: -webkit-flex;
       flex-wrap: wrap;
       -webkit-flex-wrap: wrap;
   }
   
   .cate{
      padding:10px 0; 
      width:100%;
   }
   
   .search{
      width: 100%;
       flex-wrap: wrap;
       -webkit-flex-wrap: wrap;
   }
   
   .search .insearch{
      display:inline-block;
      width: calc(100% - 125px);
       height: 42px;
   }
   
   .insearch input{
      padding: 0 10px;
       background-color: transparent;
   }
   
   .txt{
      width:100%;height: 100%; display: block; border: 1px solid #999;
   }
   
   .search button{
      margin-left: 10px;
       width: 95px;
       height: 42px;
       color: #fff;
       font-weight: 600;
       background-color: #35c5f0;
       cursor: pointer;
       padding: 0;
       font-size: 16px;
   }
   
   .search button:hover{
      border-color: #09addb;
       background-color: #09addb;
   }
   
   .view button{
      width:80px;
      font-size:16px;
      margin:0px;
      padding: 5px 15px;
      font-family:"맑은고딕";
      font-weight: 600;
      color: #fff;
       background-color: #35c5f0;
   }
   .view button:hover{
      background-color: #09addb;
   }
   
   
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>지원정책</title>
</head>
<body>
   <div class="listoption">
      <div class="box box3" >
         <dl class="list">
            <dt ><h3 class="title">지역별</h3></dt>
            <dd>
               <div class="checkbox1"  >
                  <p>
                     <input type="radio" id="allCheck"  name="local" value="all"  checked />
                     <label for="allCheck">전체</label>
                  </p>
                  <p>
                     <input type="radio" id="seoul" name="local" value="seoul"/>
                     <label for="seoul">서울시</label>
                  </p>
                  <p>
                     <input type="radio" id="incheon" name="local" value="incheon"/>
                     <label for="incheon">인천시</label>
                  </p>
                  <p>
                     <input type="radio" id="gyeonggi" name="local" value="gyeonggi"/>
                     <label for="gyeonggi">경기도</label>
                  </p>
               </div>
            </dd>
         </dl>
      </div>
      <div class="box box4">
         <ul class="list">
            <li class="age">
               <h3 class="title">연령별</h3>
               <div class="checkbox2" >
                  <p>
                     <input type="radio" id="allAge" name="age" value="allAge"  checked/>
                     <label for="allAge">전체</label>
                  </p>
                  <p>
                     <input type="radio" id="age1" name="age" value="age1"/>
                     <label for="age1">20대 이하</label>
                  </p>
                  <p>
                     <input type="radio" id="age2" name="age" value="age2"/>
                     <label for="age2">20대~30대</label>
                  </p>
                  <p>
                     <input type="radio" id="age3" name="age" value="age3"/>
                     <label for="age3">40대~50대</label>
                  </p>
                  <p>
                     <input type="radio" id="age4" name="age" value="age4"/>
                     <label for="age4">60대 이상</label>
                  </p>
               </div>
            </li> 
            
            <li class="gender">
               <h3 class="title">성별</h3>
               <div class="checkbox3" >
                  <p>
                     <input type="radio" id="allGender" name="gender" value="allGender" checked/>
                     <label for="allGender">전체</label>
                  </p>
                  <p>
                     <input type="radio" id="man" name="gender" value="m"/>
                     <label for="man">남성</label>
                  </p>
                  <p>
                     <input type="radio" id="woman" name="gender" value="w"/>
                     <label for="woman">여성</label>
                  </p>
               </div>
            </li>
            <li class="cate" >
               <h3 class="title">카테고리별</h3>
                  <div class="checkbox4" >
                     <p>
                        <input type="radio" id="allCate"  name="cate" value="allCate" checked />
                        <label for="allCate">전체</label>
                     </p>
                     <p>
                        <input type="radio" id="ca1" name="cate" value="ca1" />
                        <label for="ca1">안전</label>
                     </p>
                     <p>
                        <input type="radio" id="ca2" name="cate" value="ca2"/>
                        <label for="ca2">주거</label>
                     </p>
                     <p>
                        <input type="radio" id="ca3" name="cate" value="ca3"/>
                        <label for="ca3">경제/일자리</label>
                     </p>
                     <p>
                        <input type="radio" id="ca4" name="cate" value="ca4"/>
                        <label for="ca4">외로움</label>
                     </p>
                     <p>
                        <input type="radio" id="ca5" name="cate" value="ca5"/>
                        <label for="ca5">질병</label>
                     </p>
                     <p>
                        <input type="radio" id="ca6" name="cate" value="ca6"/>
                        <label for="ca6">기타</label>
                     </p>
                  </div>
            </li>
            
            <li class="search">
               <div class="insearch">
                  <input type="text" class="txt" id="searchtxt" name="searchtxt" placeholder="제목 검색"/>
               </div>
               <button type="button" id="searchbtn" style="">조회</button>
               
            
            </li>
            
         </ul>
      </div>
   </div>
   
   <div class="view">
      <div style="text-align: left; margin-left: 10px; padding-bottom: 10px;  border-bottom: 1px dotted gray;">
         <div style="display: inline-block;">
            <h4 id="total" style="margin-bottom:5px;"></h4>
         </div>
         <div style="display: inline-block; float: right; margin-top:20px; margin-right:15px;">
            <c:if test="${user.u_id eq 'admin'}">
               <button onClick="location.href='insert'" >등록</button>
            </c:if> 
         </div>
      </div>


      <div id="tbl"></div>
   </div>
   <script id="temp" type="text/x-handlebars-template">
      <div class="gallerylist">
         <ul>
   
      {{#each list}}
         <li>
               <a href="read?id={{id}}">
            <div class="img_box">
               <div class="top">{{s_local}}</div>
               <div class="center">{{title}}</div>
               <div class="bottom">{{s_date}}</div>
               <img src="display?fileName={{s_image}}" width=200 onerror="this.src='http://placehold.it/240x215'"/>
            </div>
            </a>
         </li>
   {{/each}}
   </ul>
</div>
</script>

<div style="text-align: center; margin-bottom:10px;">
   <div id="pagination" class="pagination"></div>
</div>
<script src="/resources/pagination.js"></script>
   <script>
      var page = 1;
      getList();
      
      //엔터키 클릭시 검색
      $("#searchtxt").on("keypress",function(e){
         if(e.keyCode==13){
            page=1;
            getList();
         }
      });
      
      $("#searchbtn").on("click",function(){
         page=1;
         getList();
      });
   
      function getList() {
         var keyword=$("#searchtxt").val();
         var searchType=$(".checkbox1 input[type=radio]:checked").val();
         var ageType=$(".checkbox2 input[type=radio]:checked").val();
         var genderType=$(".checkbox3 input[type=radio]:checked").val();
         var catType=$(".checkbox4 input[type=radio]:checked").val();
         
         $.ajax({
            type : "get",
            url : "/support/list.json",
            dataType : "json",
            data : {"page" : page,"keyword":keyword,"searchType":searchType,"ageType":ageType,"genderType":genderType,"catType":catType},
            success : function(data) {
               var temp = Handlebars.compile($("#temp").html());
               $("#tbl").html(temp(data));
               $("#pagination").html(getPagination(data));
               $("#total").html(data.pm.totalCount+"개의 게시물이 있습니다.");
            }
         })
      }
      
      $("#pagination").on("click","a",function(e){
         e.preventDefault();
         page=$(this).attr("href");
         getList();
      });
   </script>
</body>
</html>