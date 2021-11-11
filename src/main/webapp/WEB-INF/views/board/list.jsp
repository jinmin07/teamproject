<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>[글목록]</h1>

<a href="/board/insert" style="float:right">글쓰기</a>
<div id="condition">
	<select id="searchType">
		<option value="title">제목</option>
		<option value="b_content">내용</option>
		<option value="b_writer">작성자</option>
	</select> 
	<input type="text" id="keyword" placeholder="검색어" /> 
	검색수 : <span id="totalCount"></span>
</div>

<table id="tbl"></table>
<script id="temp" type="text/x-handlebars-template">
	<tr class="title">
		<td width="100">No.</td>
		<td width="300">제목</td>
		<td width="100">작성자</td>
		<td width="200">작성일</td>
		<td width="100">조회수</td>
	</tr>
	{{#each list}}
	<tr class = "row" onClick="location.href='/board/read?id={{id}}'">
		<td width=100>{{id}}</td>
      	<td width=300>{{title}}</td>
      	<td width=100>{{b_writer}}</td>
		<td width=200>{{b_date}}</td>
		<td width=100>{{b_view}}</td>
	</tr>
	{{/each}}
</script>

<div id="pagination" class="pagination"></div>
<script src="/resources/pagination.js"></script>

<script>
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
		var searchType = $("#searchType").val();

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
				
				$("#totalCount").html(data.pm.totalCount);
				
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
