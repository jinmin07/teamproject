<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   <style>
      .attend_title {overflow: hidden;}
      .id {float: left; margin-right: 30px; font-size: 13px;}
      .goList {float: right; margin-right: 30px; font-size: 13px;}
      .c_writer, .p_writer{float: right; margin-right: 30px; font-size: 13px; color: gray;}
      .c_member_eval, .p_member_eval {float: right; margin-right: 30px; font-size: 13px;}
      .c_title, .p_title {text-align: left;}
      .c_member_eval:hover, .p_member_eval:hover{color:gray;}
      .tbl_code {border: 1px solid #35c5f0; padding: 5px; width: 90px; font-size: 14px;}
      .attend_title {margin-bottom: 10px;}
      
   </style>
   
   <table id="tbl"></table>
   <script id="temp1" type="text/x-handlebars-template">
   {{#each .}}
   <tr class = "row" tbl_code="{{tbl_code}}" height=100>
      <td width =150 class="attend_top" >
         <div class="tbl_code" style="{{printColorC tbl_code}}">{{tbl_code}}</div>
      </td>
      <td width=700 class="attend_middle">
         <div class="attend_title">
            <div class="id" width=100>{{id}}</div>
            <div class="goList" width = 100><a href='/purchase/read?id={{id}}'>확인</a></div>
            <div class="p_member_eval" width = 130><button>멤버평가</button></div>
            <div class="p_writer" width = 200>작성자 : {{p_writer}}</div>
            
         </div>
         <div class="attend_info">
            <div class="p_title">{{title}}</div>
         </div>
      </td>
   </tr>
   {{/each}}
   </script>
   
   <script>
      Handlebars.registerHelper("printColorC", function(tbl_code){
         if(tbl_code != ""){
            return "background: white ;color :#35c5f0;";
         }
      });
   </script>
      
   <script id="temp2" type="text/x-handlebars-template">
   {{#each .}}
   <tr class = "row" tbl_code="{{tbl_code}}" height=100 >
      <td width =150 class="attend_top" >
         <div class="tbl_code" style="{{printColorC tbl_code}}">{{tbl_code}}</div>
      </td>
      <td width=700 class="attend_middle">
         <div class="attend_title">
            <div class="id" width=100>{{id}}</div>
            <div class="goList" width = 100><a href='/course/read?id={{id}}'>확인</a></div>
            <div class="c_member_eval" width = 130><button>멤버평가</button></div>
            <div class="c_writer" width = 200>작성자 : {{c_writer}}</div>
         </div>
         <div class="attend_info">
            <div class="c_title">{{title}}</div>
         </div>
      </td>
   </tr>
   {{/each}}

   </script>
   
   <script>
      Handlebars.registerHelper("printColorC", function(tbl_code){
         if(tbl_code != ""){
            return "background: white ;color :#35c5f0;";
         }
      });
   </script>
   
<script>
   var url = "${url}";

   if (url == "/my_attend/purchase") {
      getAttendPurchase();
   }
   if (url == "/my_attend/course") {
      getAttendCourse();
   }

   function getAttendPurchase() {
      var p_writer = "${user.u_id}";
      $.ajax({
         type : "get",
         url : "/mypage/attend_purchase.json",
         data : {
            "p_writer" : p_writer
         },
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#temp1").html());
            $("#tbl").html(temp(data));
         }
      });
   }
   
   $("#tbl").on("click", ".p_member_eval button", function(){
      var id = $(this).parent().parent().find(".id").html();
      var tbl_code = $(this).parent().parent().parent().parent().attr("tbl_code");
      var p_writer = $(this).parent().parent().find(".p_writer").html();
      var url = "/mypage/members?tbl_code="+tbl_code+"&id=" + id+"&p_writer=" + p_writer;
      window.open(url,"", "width=400, height=400, top=200, left=900, location=no");
   });
   
   $("#tbl").on("click", ".c_member_eval button", function(){
      var id = $(this).parent().parent().find(".id").html();
      var tbl_code = $(this).parent().parent().parent().parent().attr("tbl_code");
      var p_writer = $(this).parent().parent().find(".p_writer").html();
      var url = "/mypage/members?tbl_code="+tbl_code+"&id=" + id;
      window.open(url,"", "width=500, height=400, top=200, left=900, location=no");
   });

   function getAttendCourse() {
      var c_writer = "${user.u_id}";
      $.ajax({
         type : "get",
         url : "/mypage/attend_course.json",
         data : {
            "c_writer" : c_writer
         },
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#temp2").html());
            $("#tbl").html(temp(data));
         }
      });
   }
</script>