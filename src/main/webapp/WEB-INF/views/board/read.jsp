<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	input[type=text] { width : 100%; margin : 10px; }
	textarea { margin : 10px; }
	#b_title {color:black; font-size: 30px;}
	#b_subinfo {color: gray; font-size: 15px; margin-bottom: 40px;}
	#b_images { width: 800px; margin:10px auto; text-align: center;}
	#b_images img {
		width : 500px;
		margin-bottom: 10px;
	}
	#b_category {
		background: #35c5f0;
		color: white;
		width: 80px;
		margin: 10px auto;
		padding: 5px 10px;
		text-align: center;
	}
	#board_content {text-align: center; margin-bottom: 30px;}
	#b_content {font-size: 15px; width: 500; margin:20px auto; text-align: left;}
	#b_reply{width: 900px; margin:0 auto; }
	#total{font-size: 15px; margin-bottom: 0px;}
</style>
<div id="board_content">
	<div id="b_category">${vo.b_category}</div>
	<h1 id="b_title">${vo.title}</h1>
	<p id="b_subinfo">${vo.b_writer} | <f:formatDate value="${vo.b_date}" pattern="yyyy-MM-dd"/> | 조회수 : ${vo.b_view}</p>
	<div>
		<img id="b_image" src = "/board/display?fileName=${vo.b_image}" width=500/>
		<input type = "file" name = "file" style="display : none;"/><br/>
	</div>
	<div id="b_images">
		<c:forEach items="${attList}" var="b_image">
			<div class="box">
				<img src="/board/display?fileName=${b_image}" />
			</div>
		</c:forEach>
	</div>
	<p id="b_content">${vo.b_content}</p>
	<c:if test="${vo.b_writer == user.u_id}">
		<div style="margin: 10px;">
			<input type="button" value="수정" onClick="location.href='/board/update?id=${vo.id}'"/>
			<input type="button" value="삭제" id="btnDelete"/>
		</div>
	</c:if>
	<c:if test="${vo.b_writer != user.u_id}">
		<div style="margin: 10px;">
			<input type="button" value="추천" id="btnLike"/>
			<input type="button" value="피드" id="btnFeed"/>
		</div>
	</c:if>
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
			<p>{{b_reply_content}}<a href="{{b_reply_id}}" style="display:{{printDel b_reply_writer}}">X</a></p>
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
	getList();
	
	
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
			data : {"b_reply_id" : b_reply_id},
			success : function(){
				alert("삭제성공!");
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
				alert("등록성공!");
				$("#txtReply").val("");
				getList();
			}
		});
	});
	
	$("#btnDelete").on("click", function() {
		if(!confirm(id + "을(를) 삭제하실래요?")) return;
	});

</script>

</html>