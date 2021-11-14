<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="tbl"></table>
	<script id="temp1" type="text/x-handlebars-template">
	<tr class="title">
		<td width="100">No.</td>
		<td width="300">내용</td>
		<td width="100">작성자</td>
		<td width="200">작성일</td>
		<td width="100">답변여부</td>
	</tr>
	{{#each .}}
	<tr class = "row" onClick="location.href='/purchase/read?id={{p_id}}'">
		<td width=100 class="p_query_id">{{p_query_id}}</td>
      	<td width=300 class="p_query_content">{{p_query_content}}</td>
      	<td width=100 class="p_query_writer">{{p_query_writer}}</td>
		<td width=200 class="p_query_date">{{p_query_date}}</td>
		<td width=100 class="p_query_state">{{p_reply_state}}</td>
	</tr>
	{{/each}}
	</script>
	<script id="temp2" type="text/x-handlebars-template">
	<tr class="title">
		<td width="100">No.</td>
		<td width="300">내용</td>
		<td width="100">작성자</td>
		<td width="200">작성일</td>
		<td width="100">답변여부</td>
	</tr>
	{{#each .}}
	<tr class = "row" onClick="location.href='/cou/read?id={{c_id}}'">
		<td width=100 class="c_query_id">{{c_query_id}}</td>
      	<td width=300 class="c_query_content">{{c_query_content}}</td>
      	<td width=100 class="c_query_writer">{{c_query_writer}}</td>
		<td width=200 class="c_query_date">{{c_query_date}}</td>
		<td width=100 class="c_query_state">{{c_reply_state}}</td>
	</tr>
	{{/each}}
	</script>
</body>
<script>
	getListPurchase();
	getListCourse();
	
	var url = "${url}"
	
	if(url == "/my_query/purchase"){
		getListPurchase;
	}
	if(url == "/my_query/course"){
		getListCourse;
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