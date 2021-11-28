<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   <style>
      .writing_title {overflow: hidden;}
      .id {float: left; margin-right: 30px; font-size: 13px;}
      .c_category {float: left; margin-right: 30px; font-size: 13px;}
      .goList {float: right; margin-right: 30px; font-size: 13px;}
      .b_cnt_feed, .b_rec, .b_cnt_reply{float: right; margin-right: 30px; font-size: 13px; color: gray;}
      .c_view, .c_cnt_feed, .c_member{float: right; margin-right: 30px; font-size: 13px; color: gray;}
      .p_cnt_feed, .p_member{float: right; margin-right: 30px; font-size: 13px; color: gray;}
      .p_member_chat, .p_member_eval{float: right; margin-right: 5px; font-size: 13px;}
      .c_title, .p_title, .b_title {float: left; text-align: left;}
      .p_member_eval:hover{color:gray;}
      .b_date, .c_date, .p_date {border: 1px solid #35c5f0; padding: 5px; width: 90px; font-size: 14px;}
      .writing_title {margin-bottom: 10px;}
      button{background: #35c5f0; border:none;}
      button:hover{border-color: #09addb; background-color: #09addb;}
      
   </style>


<table id="tbl"></table>
   <script id="temp1" type="text/x-handlebars-template">
   {{#each .}}
   <tr class = "row" tbl_code="{{tbl_code}}" height=100 >
      <td width =150 class="writing_top" >
         <div class="p_date" style="{{printColorC p_date}}">{{p_date}}</div>
      </td>
      <td width=700 class="writing_middle">
         <div class="writing_title">
            <div class="id" width=100>{{id}}</div>
            <div class="p_member" width = 200>모집멤버 : {{p_cnt_member}}/{{p_tot_member}}</div>
            <div class="p_cnt_feed" width = 200>피드수 : {{p_cnt_feed}}</div>
         </div>
         <div class="writing_info">
            <div class="p_title" width=460>{{title}}</div>
           <div class="goList" width = 100><button onClick="location.href='/purchase/read?id={{id}}'">확인</button></div>
            <div class="p_member_eval" width = 130><button>멤버평가</button></div>            
         </div>
      </td>
   </tr>


   {{/each}}
   </script>

   <script>
      Handlebars.registerHelper("printColorC", function(p_date){
         if(p_date != ""){
            return "background: white ;color :#35c5f0;";
         }
      });
   </script>
      
   <script id="temp2" type="text/x-handlebars-template">
   {{#each .}}
   <tr class = "row" tbl_code="{{tbl_code}}" height=100 >
      <td width =150 class="writing_top" >
         <div class="c_date" style="{{printColorC c_date}}">{{c_date}}</div>
      </td>
      <td width=700 class="writing_middle">
         <div class="writing_title">
            <div class="id" width=100>{{id}}</div>
            <div class="c_category" width=200>{{category}} > {{subcategory}}</div>
            <div class="c_member" width = 200>모집멤버 : {{c_cnt_member}}/{{c_tot_member}}</div>
            <div class="c_cnt_feed" width = 200>피드수 : {{c_cnt_feed}}</div>
            <div class="c_view" width = 200>조회수 : {{c_view}}</div>
         </div>
         <div class="writing_info">
            <div class="c_title" width=460>{{title}}</div>
         <div class="goList" width = 100><button onClick="location.href='/course/read?id={{id}}'">확인</button></div>
            <div class="p_member_eval" width = 130><button>멤버평가</button></div>
            
         </div>
      </td>
   </tr>
   {{/each}}
   </script>
   
   <script>
      Handlebars.registerHelper("printColorC", function(c_date){
         if(c_date != ""){
            return "background: white ;color :#35c5f0;";
         }
      });
   </script>
      
   <script id="temp3" type="text/x-handlebars-template">
   {{#each .}}
   <tr class = "row" tbl_code="{{tbl_code}}" height=100 >
      <td width =150 class="writing_top" >
         <div class="b_date" style="{{printColorC b_date}}">{{b_date}}</div>
      </td>
      <td width=700 class="writing_middle">
         <div class="writing_title">
            <div class="id" width=100>{{id}}</div>
            <div class="b_cnt_feed" width = 200>피드수 : {{b_cnt_feed}}</div>
            <div class="b_rec" width = 200>추천수 : {{b_rec}}</div>
            <div class="b_cnt_reply" width = 200>댓글수 : {{b_cnt_reply}}</div>
         </div>
         <div class="writing_info">
         <div class="goList" width = 100><button onClick="location.href='/board/read?id={{id}}'">확인</button></div>
            <div class="b_title">{{title}}</div>
         </div>
      </td>
   </tr>
   {{/each}}
   </script>
   
   <script>
      Handlebars.registerHelper("printColorC", function(b_date){
         if(b_date != ""){
            return "background: white ;color :#35c5f0;";
         }
      });
   </script>
   
   
<script>   
   var url = "${url}"
   
   if(url == "/my_writing/purchase"){
      getListPurchase();
   }
   if(url == "/my_writing/course"){
      getListCourse();
   }
   if(url == "/my_writing/board"){
      getListBoard();
   }
   
   $("#tbl").on("click", ".p_member_eval button", function(){
      var id = $(this).parent().parent().parent().parent().find(".id").html();
      var tbl_code = $(this).parent().parent().parent().parent().attr("tbl_code");
      var url = "/mypage/members?tbl_code="+tbl_code+"&id=" + id;
      window.open(url,"", "width=590, height=400, top=200, left=900, location=no");
   });
   
   function getListPurchase() {
      var p_writer = "${user.u_id}";
      $.ajax({
         type : "get",
         url : "/mypage/list_writing_purchase.json",
         data : {"p_writer":p_writer},
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#temp1").html());
            $("#tbl").html(temp(data));
         }
      });
   }
   
   function getListCourse() {
      var c_writer = "${user.u_id}";
      $.ajax({
         type : "get",
         url : "/mypage/list_writing_course.json",
         data : {"c_writer":c_writer},
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#temp2").html());
            $("#tbl").html(temp(data));
         }
      });
   }
   
   function getListBoard() {
      var b_writer = "${user.u_id}";
      $.ajax({
         type : "get",
         url : "/mypage/list_writing_board.json",
         data : {"b_writer":b_writer},
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#temp3").html());
            $("#tbl").html(temp(data));
         }
      });
   }
</script>