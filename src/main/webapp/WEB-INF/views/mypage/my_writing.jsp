<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<table id="tbl"></table>
	<script id="temp1" type="text/x-handlebars-template">
	<tr class="title">
		<td width="100">No.</td>
		<td width="450">제목</td>
		<td width="100">모집멤버</td>
		<td width="200">작성일</td>
		<td width="100">피드수</td>
	</tr>
	{{#each .}}
	<tr class = "row" onClick="location.href='/purchase/read?id={{id}}'">
		<td width=100 class="p_id">{{id}}</td>
      	<td width=450 class="title">{{title}}</td>
      	<td width=100 class="p_member">{{p_cnt_member}}/{{p_tot_member}}</td>
		<td width=200 class="p_date">{{p_date}}</td>
		<td width=100 class="p_cnt_feed">{{p_cnt_feed}}</td>
	</tr>
	{{/each}}
	</script>
	<script id="temp2" type="text/x-handlebars-template">
	<tr class="title">
		<td width="100">No.</td>
		<td width="250">카테고리</td>
		<td width="450">제목</td>
		<td width="100">모집멤버</td>
		<td width="200">작성일</td>
		<td width="100">조회수</td>
		<td width="100">피드수</td>
	</tr>
	{{#each .}}
	<tr class = "row" onClick="location.href='/cou/read?id={{id}}'">
		<td class="c_id">{{id}}</td>
      	<td class="c_category">{{category}} > {{subcategory}}</td>
      	<td class="title">{{title}}</td>
      	<td class="c_member">{{c_cnt_member}}/{{c_tot_member}}</td>
		<td class="c_date">{{c_date}}</td>
		<td class="c_cnt_feed">{{c_cnt_feed}}</td>
		<td class="c_view">{{c_view}}</td>
	</tr>
	{{/each}}
	</script>
	<script id="temp3" type="text/x-handlebars-template">
	<tr class="title">
		<td width="100">No.</td>
		<td width="300">제목</td>
		<td width="100">작성일</td>
		<td width="200">댓글수</td>
		<td width="100">추천수</td>
		<td width="100">피드수</td>
	</tr>
	{{#each .}}
	<tr class = "row" onClick="location.href='/board/read?id={{id}}'">
		<td width=100 class="b_id">{{id}}</td>
      	<td width=300 class="title">{{title}}</td>
      	<td width=100 class="b_date">{{b_date}}</td>
		<td width=200 class="b_cnt_reply">{{b_cnt_reply}}</td>
		<td width=100 class="b_rec">{{b_rec}}</td>
		<td width=100 class="b_cnt_feed">{{b_cnt_feed}}</td>
	</tr>
	{{/each}}
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