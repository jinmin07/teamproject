<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

   <style>
   #condition button{
      font-size:16px;
      margin:0px;
      padding: 5px 15px;
      font-family:"맑은고딕";
      font-weight: 600;
   }
   #condition button:hover{
      background: #dbb4b4;
   }
   </style>
   <style>
<!-- 검색 CSS -->
   .listoption{
      margin:0 auto;
      width:1200px;
      margin-bottom: 30px;
       border-top: 1px solid #e5e5e5;
       border-bottom: 1px solid #e5e5e5;
       overflow: hidden;
   }
   
   .box3{
      height:101px;
      width: 500px;
      border-top: 1px solid #e5e5e5;
       border-bottom: 1px solid #e5e5e5;
       justify-content: flex-end;
          background-color: #F0FFFF;
          float:left;
          margin-left:120px;
   }
   
   .list{
      font-size: 14px;
   }
   
   .box3 .list .title{
      line-height: 32px;
      margin:5px 0px;
      font-weight:600;
   }
   
   
   .box3 .list .checkbox1{
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
   
   .checkbox2 label{
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
   
   .checkbox2 input:checked +label{
      color:white;
      border: 1px solid black;
      font-weight: 600;
      background-color: black;
   }
   .box4{
      height:101px;
      width:47%;
      background-color: #f7f8fa;
      display:-webkit-flex;
      border-top: 1px solid #e5e5e5;
       border-bottom: 1px solid #e5e5e5;
   }
   
   .box4 .list    {
      width:650px;
   }
   .box .box4 .list li{
      display: flex;
      display: -webkit-flex;
   }
   .box .list{
      margin:5px 0px;
      padding: 5px 5px 5px 10px;
       display: flex;
       display: -webkit-flex;
       flex-wrap: wrap;
       -webkit-flex-wrap: wrap;
   }
      
   .search{
      width: 100%;
       flex-wrap: wrap;
       -webkit-flex-wrap: wrap;
       padding-top:15px;
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
      width:100%; height:100%; display: block; border: 1px solid #999;
   }
   .search button {
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
      
<!-- 검색 CSS 끝-->   

   .view {
      width: 1024px;
      margin: 0 auto;
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
   
   .board_middle { text-align: left;}
   .board_bottom {text-align: right; color: gray; padding-right: 10px; font-size: 14px;}
   .board_top {font-size: 14px; color: gray;}
   .board_info {font-size: 13px; color: gray;}
   .board_title {font-size: 17px; margin-bottom: 10px; padding-left: 10px; font-weight: 550;}
   .board_writer{margin-bottom: 10px;}
   .row {padding: 10px;}
   .red {color: red; }
   .b_category {
      border: 1px solid #35c5f0;
      width: 60px;
      padding: 5px 10px;
   }
</style>
<!-- 리스트 검색 박스 시작 -->
   <div class="listoption">
      <div class="box box3" >
         <dl class="list" style="margin-top:20px;">
            <dt><h3 class="title">카테고리별</h3></dt>
            <dd>
               <div class="checkbox1" id="searchType" >
                     <p>
                        <input type="radio" id="allCate"  name="cate" value="전체" checked />
                        <label for="allCate">전체</label>
                     </p>
                     <p>
                        <input type="radio" id="cate1" name="cate" value="맛집추천" />
                        <label for="cate1">맛집추천</label>
                     </p>
                     <p>
                        <input type="radio" id="cate2" name="cate" value="후기" />
                        <label for="cate2">후기</label>
                     </p>
                     
                     <p>
                        <input type="radio" id="cate3" name="cate" value="정보제공" />
                        <label for="cate3">정보제공</label>
                     </p>
               </div>
            </dd>
         </dl>
      </div>
      
      <div class="box box4">
         <ul class="list">
            <li class="search">
               <div class="insearch">
                  <input type="text" class="txt" id="keyword" name="searchtxt" placeholder="검색"/>
               </div>
               <button type="button" id="searchbtn" style="">조회</button>            
            </li>
         </ul>
      </div>
   </div>

<!-- 리스트 검색 박스  끝-->

<div class="view">
   <div style="width: 1024px; text-align:left; margin-left:200px; padding-bottom:7px; border-bottom:1px dotted gray; margin-bottom:15px;">
      <div style="display: inline-block; ">
         <h4 id="total" style=" margin-bottom:5px; "></h4>
      </div>
      <div style="display: inline-block; float: right; margin-top: 20px; margin-right: 15px;">
         <button onClick="location.href='/board/insert'">등록</button>
      </div>
   </div>
</div>


<table id="tbl"></table>
<script id="temp" type="text/x-handlebars-template">
   {{#each list}}
   <tr class = "row" onClick="location.href='/board/read?id={{id}}'" height=100>
      <td width =130 class="board_top" >
         <div class="b_category" style="{{printColor b_category}}">{{b_category}}</div>
      </td>
      <td width=600 class="board_middle">
         <div class="board_title">{{title}} <span class="red board_title">({{b_cnt_reply}})</span></div>
         <div class="board_info">
            조회수 : <span class="red board_info">{{b_view}}</span> | 
            추천수 : <span class="red board_info">{{b_rec}}</span> | 
            피드수 : <span class="red board_info">{{b_cnt_feed}}</span>
         </div>
      </td>
         <td width = 150 class="board_bottom">
         <div class="board_writer">{{b_writer}}</div>
         <div>{{b_date}}</div>
      </td>
   </tr>
   {{/each}}
</script>
<script>
   Handlebars.registerHelper("printColor", function(b_category){
      if(b_category == "공지"){
         return "background: #35c5f0 ;color : white;";
      }else{
         return "background: white ;color :#35c5f0;";
      }
   });
</script>

<div style="text-align: center; margin-bottom:10px;">
   <div id="pagination" class="pagination" ></div>
</div>
<script src="/resources/pagination.js"></script>

<script>
   $("#searchType").on("change", function(){
      page = 1;
      getList();
   });
   
   var page = 1;
   getList();

   $("#keyword").on("keypress", function(e) {
      if (e.keyCode == 13) {
         page = 1;
         getList();
      }
   });

   function getList() {
      var keyword = $("#keyword").val();
      var searchType = $(".checkbox1 input[type=radio]:checked").val();
      
      
      $.ajax({
         type : "get",
         url : "/board/list.json",
         dataType : "json",
         data : {
            "page" : page,
            "keyword" : keyword,
            "searchType" : searchType
         },
         success : function(data) {
            var temp = Handlebars.compile($("#temp").html());
            $("#tbl").html(temp(data));
            $("#total").html(data.pm.totalCount +"개의 게시글이 있습니다.");
            $("#pagination").html(getPagination(data));
         }
      });
   }
   $("#pagination").on("click", "a", function(e) {
      e.preventDefault();
      page = $(this).attr("href");
      getList();
   });
</script>