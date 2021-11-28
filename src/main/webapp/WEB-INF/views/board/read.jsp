<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
   input[type=text] { width : 100%; margin : 10px; }
   textarea { margin : 10px; }
   #b_title {color:black; font-size: 30px;}
   #b_subinfo {color: gray; font-size: 15px; margin-bottom: 40px;}
   #b_image {margin-bottom: 20px;}
   #b_images { text-align: center;}
   #b_images img {
      width : 500px;
      margin-bottom: 20px;
   }
   #b_category {
      background: #35c5f0;
      color: white;
      width: 80px;
      margin: 10px auto;
      padding: 5px 10px;
      text-align: center;
   }
   input[type=button]{
      width:80px;
      height:40px;
      font-size: 15px;
      font-weight: 600;
      background:#fff;   
      border:2px solid #35c5f0;
      color: #35c5f0;
      cursor: pointer;
      margin-left: 15px;
   }
   #goList, button{
      width:80px;
      height:40px;
      font-size: 15px;
      font-weight: 600;
      color: #fff;
      background-color: #35c5f0;
      cursor: pointer;
      border:  none;
      margin-left: 15px;
   }
   #goList:hover{
   border-color: #09addb;
    background-color: #09addb;
   }
   #board_content {text-align: center; margin-bottom: 30px;}
   #b_content {font-size: 15px; width: 500; margin:20px auto; text-align: left;}
   #b_reply{width: 900px; margin:0 auto; }
   #total{font-size: 15px; margin-bottom: 0px;}
</style>
<div id="board_content">
   <div id="b_category">${vo.b_category}</div>
   <h1 id="b_title">${vo.title}</h1>
   <p id="b_subinfo">${vo.b_writer} | <f:formatDate value="${vo.b_date}" pattern="yyyy-MM-dd"/> | 조회수 : ${vo.b_view} | 추천수: ${vo.b_rec}</p>
   <c:if test="${vo.b_image !=null}">
   		<c:if test="${vo.b_image !=''}">
		   <div id="main_image">
		      <img id="b_image" src = "/board/display?fileName=${vo.b_image}" width=500/>
		      <input type = "file" name = "file" style="display : none;"/><br/>
		   </div>
	   </c:if>
	</c:if>	   
   <div id="b_images">
      <c:forEach items="${attList}" var="b_image">
         <div class="box">
            <img src="/board/display?fileName=${b_image}" />
         </div>
      </c:forEach>
   </div>
   <p id="b_content">${vo.b_content}</p>
   <div class="button_box" style="margin: 10px;">
      <c:if test="${vo.b_writer == user.u_id}">
         <input type="button" value="수정" onClick="location.href='/board/update?id=${vo.id}'"/>
         <input type="button" value="삭제" id="btnDelete"/>
      </c:if>
      <c:if test="${vo.b_writer != user.u_id}">
         <c:if test="${chk_rec == 0}">
            <input type="button" value="추천" id="btnLike"/>
         </c:if>
         <c:if test="${chk_rec != 0}">
            <input type="button" value="추천취소" id="btnLikeDel" style="padding-left:8px;"/>
         </c:if>
		<c:if test="${chk_feed  == 0}">
			<input type="button" value="피드♡" id="myfeed_insert"/>
		</c:if>
		<c:if test="${chk_feed  != 0}">
			<input type="button" value="피드♥" id="myfeed_del"/>
		</c:if>
      </c:if>
      <input type="button" onClick="location.href='/board/list'" value="목록" id="goList"/>
   </div>
   <div id="b_reply">
      <div id="insert" style="overflow: hidden;">
         <h3 style="float: left;">한줄 의견을 나눠 보세요</h3>
         <p id = "total" style="float: right;"></p>
         <hr style="clear: both;"/>
         <textarea id="txtReply" rows="4" cols="105" placeholder="댓글을 입력해주세요." style="margin-bottom:5px; resize: none; float: left;"></textarea>
         <button id="btnInsert" style="float: left; margin:10px 0; width:80px; height: 85px;">등록</button>
      </div>
      <div style="text-align:left"></div>
      <div id="replies" style="text-align:left"></div>
      <script id="temp2" type="text/x-handlebars-template">
      {{#each list}}
      <div class="box" style="text-align:left;border-bottom:1px dotted gray;">
         <h5>{{b_reply_writer}} | {{b_reply_date}}</h5>
         <p>
            {{b_reply_content}}
            <a href="{{b_reply_id}}" style="display:{{printDel b_reply_writer}}; color:gray; float:right; margin-right: 50px;">삭제</a>
         </p>
      </div>
      {{/each}}
      </script>
      <div id="pagination" class="pagination"></div>
      <script src="/resources/pagination.js"></script>
   
      <script>
         Handlebars.registerHelper("printDel", function(b_reply_writer){
            if(b_reply_writer != "${user.u_id}") return "none";
         });
      </script>
   </div>
</div>
<script>
   var page=1;
   var id = "${vo.id}";
   var u_id = "${user.u_id}";
   var url = "/board/read?id=" + id;
   getList();
   
   //좋아요 기능
   $("#btnLike").on("click", function(){
      $.ajax({
         type: "post",
         url: "/board/rec",
         data: {"b_id": id, "user_id" : u_id},
         success: function(){
            location.href=url;
         }
      });
   });
   
   //좋아요 기능
   $("#btnLikeDel").on("click", function(){
      $.ajax({
         type: "post",
         url: "/board/rec_del",
         data: {"b_id": id, "user_id" : u_id},
         success: function(){
            location.href=url;
         }
      });
   });
   
   //마이피드로 옮기기
   $("#myfeed_insert").on("click", function(){
      var tbl_code = "${vo.tbl_code}";
      if(!confirm("내 피드로 옮기시겠습니까?")) return;
      $.ajax({
         type: "post",
         url: "/board/feed_insert",
         data: {"user_id": u_id, "tbl_code": tbl_code, "primary_id": id},
         success: function(){
             location.href=url;
         }
      });
   });
   
   //마이피드로 옮기기
   $("#myfeed_del").on("click", function(){
      var tbl_code = "${vo.tbl_code}";
      if(!confirm("내 피드에서 삭제하시겠습니까?")) return;
      $.ajax({
         type: "post",
         url: "/board/feed_del",
         data: {"user_id": u_id, "tbl_code": tbl_code, "primary_id": id},
         success: function(){
             location.href=url;
         }
      });
   });
   
   function getList(){
      $.ajax({
         type : "get",
         url : "/board/reply.json",
         dataType : "json",
         data : {"page" : page, "id" : id},
         success : function(data){
            var temp = Handlebars.compile($("#temp2").html());
            $("#replies").html(temp(data));
            $("#pagination").html(getPagination(data));
            $("#total").html("총 " + data.pm.totalCount + " 개의 의견이 있습니다.");
         }
      });
   }
   $("#pagination").on("click", "a", function(e) {
      e.preventDefault();
      page = $(this).attr("href");
      getList();
   });

   $("#replies").on("click", ".box a", function(e){
	      e.preventDefault();
	      var b_reply_id = $(this).attr("href");
	      if(!confirm("삭제하실래요?")) return;
	      
	      $.ajax({
	         type : "post",
	         url : "/board/reply/delete",
	         data : {"b_id" : id, "b_reply_id" : b_reply_id},
	         success : function(){
	            alert("댓글이 삭제되었습니다.");
	            getList();
	         }
	      });
	   });
   
   
   $("#btnInsert").on("click", function() {
      var b_reply_content=$("#txtReply").val();
      if(b_reply_content == ""){
         alert("내용을 입력하세요!");
         $("#txtReply").focus();
         return;
      }
      if(!confirm("댓글을 입력하실래요?")) return;
      $.ajax({
         type : "post",
         url : "/board/reply/insert",
         data : {"b_id" : id, "b_reply_content" : b_reply_content, "b_reply_writer" : u_id},
         success : function(){
            alert("댓글이 등록되었습니다.");
            $("#txtReply").val("");
            getList();
         }
      });
   });
   
   $("#btnDelete").on("click", function() {
      if(!confirm("게시글을 삭제하실래요?")) return;
      var b_image = "${vo.b_image}"
      
      $.ajax({
         type: "post",
         url :"/board/delete",
         data : {"id" : id, "b_image" : b_image},
         success : function(){
            alert("삭제가 완료되었습니다.");
            location.href="/board/list";
         }
      });
   });

</script>

</html>