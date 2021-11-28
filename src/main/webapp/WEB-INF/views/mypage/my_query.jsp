<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>내가 문의한 글</title>
   <style>
      .query_title {overflow: hidden;}
      .query_id {float: left; margin-right: 30px; font-size: 13px;}
      .query_date{float: right; margin-right: 30px; font-size: 13px; color: gray;}
      .goList {float: right; margin-right: 30px; font-size: 13px;}
      .query_cont {text-align: left;}
      .goList a:hover{color:gray;}
      .reply_state {border: 1px solid #35c5f0; padding: 5px; width: 90px; font-size: 14px;}
      .query_title {margin-bottom: 10px;}
      button{background: #35c5f0; border:none;}
        button:hover{border-color: #09addb; background-color: #09addb;}
   </style>
</head>
<body>
   <table id="tbl"></table>
   <script id="temp1" type="text/x-handlebars-template">
   {{#each .}}
   <tr class = "row" height=100>
      <td width =150 class="query_top" >
         <div class="reply_state" style="{{printColorP p_reply_state}}">{{p_reply_state}}</div>
      </td>
      <td width=700 class="query_middle">
         <div class="query_title">
            <div class="query_id" width=100>{{p_query_id}}</div>
            <div class="goList" width = 100><a href='/purchase/read?id={{p_id}}'>확인</a></div>
            <div class="query_date" width = 250>{{p_query_date}}</div>
         </div>
         <div class="query_info" width=200>
            <div class="query_cont">{{p_query_content}}</div>
         </div>
      </td>
   </tr>
   {{/each}}
   </script>
   <script>
      Handlebars.registerHelper("printColorP", function(p_reply_state){
         if(p_reply_state == "답변완료"){
            return "background: #35c5f0 ;color : white;";
         }else{
            return "background: white ;color :#35c5f0;";
         }
      });
   </script>
   <script id="temp2" type="text/x-handlebars-template">
   {{#each .}}
   <tr class = "row" height=100>
      <td width =150 class="query_top" >
         <div class="reply_state" style="{{printColorC c_reply_state}}">{{c_reply_state}}</div>
      </td>
      <td width=700 class="query_middle">
         <div class="query_title">
            <div class="query_id" width=100>{{c_query_id}}</div>
            <div class="goList" width = 100><button onClick="location.href='/course/read?id={{c_id}}'">확인</button></div>
            <div class="query_date" width = 250>{{c_query_date}}</div>
         </div>
         <div class="query_info" >
            <div class="query_cont">{{c_query_content}}</div>
         </div>
      </td>
   </tr>
   {{/each}}
   </script>
      <script>
      Handlebars.registerHelper("printColorC", function(c_reply_state){
         if(c_reply_state == "답변완료"){
            return "background: #35c5f0 ;color : white;";
         }else{
            return "background: white ;color :#35c5f0;";
         }
      });
   </script>
</body>
<script>
   var url = "${url}"
   
   if(url == "/my_query/purchase"){
      getListPurchase();
   }
   if(url == "/my_query/course"){
      getListCourse();
   }
   
   function getListPurchase() {
      var p_query_writer = "${user.u_id}";
      $.ajax({
         type : "get",
         url : "/mypage/list_purchase.json",
         data : {"p_query_writer":p_query_writer},
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#temp1").html());
            $("#tbl").html(temp(data));
         }
      });
   }
   
   function getListCourse() {
      var c_query_writer = "${user.u_id}";
      $.ajax({
         type : "get",
         url : "/mypage/list_course.json",
         data : {"c_query_writer":c_query_writer},
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#temp2").html());
            $("#tbl").html(temp(data));
         }
      });
   }

</script>
</html>