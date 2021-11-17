<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글정보</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		input[type=text] { width : 100%; margin : 10px; }
		textarea { width : 100%; margin : 10px; }
		form { width : 800px; padding : 20px; }
		#b_images img {
			width : 160px;
			border-radius : 10px;
		}
		
		#b_images .box {
			width : 170px;
			height : 200px;
			float : left;
			margin-left : 20px;
		}
	</style>
</head>
<body>
<h1>[글정보]</h1>
<div>
	<div>
		<img id="b_image" src = "/board/display?fileName=${vo.b_image}" width=350/>
	</div>
	<div>
		<h3>${vo.id} 번 글 작성자 : ${vo.b_writer} 날짜 : <f:formatDate value="${vo.b_date}" pattern="yy-MM-dd HH:mm:ss"/></h3>
		<input type = "hidden" name = "b_image" value = "${vo.b_image}"/>
		<h4>${vo.b_category}</h4>
		<h2>${vo.title}</h2>
		<p>${vo.b_content}</p>
		<input type = "file" name = "file" style="display : none;"/><br/>
		<div id="b_images" style="overflow: hidden;">
			<c:forEach items="${attList}" var="b_image">
				<div class="box">
					<img src="/board/display?fileName=${b_image}" />
				</div>
			</c:forEach>
		</div>
	</div>
	<c:if test="${vo.b_writer==user.u_id}">
		<div style="clear:both; margin: 10px;">
			<input type="button" value="수정" onClick="location.href='/board/update?id=${vo.id}'"/>
			<input type="button" value="삭제" id="btnDelete"/>
		</div>
	</c:if>
</div>
<hr/>
</body>
<div style="clear:both;">
	<div style="text-align:left"><h3><span id="total"></span>개의 댓글</h3></div>
	<div id="replies" style="text-align:left"></div>
	<script id="temp2" type="text/x-handlebars-template">
		{{#each list}}
		<div class="box" style="text-align:left;border-bottom:1px dotted gray;">
			<h5>[{{b_reply_id}}] {{b_reply_writer}} : {{b_reply_date}}</h5>
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

	<div id="insert">
		<textarea id="txtReply" rows="5" cols="120" style="width:100%; margin-bottom:5px;"></textarea>
		<button id="btnInsert">댓글등록</button>
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
				$("#total").html(data.pm.totalCount);
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