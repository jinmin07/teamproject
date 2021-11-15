<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<table id="tbl"></table>
	<script id="temp1" type="text/x-handlebars-template">
	<tr class="title">
		<td width="100">No.</td>
		<td width="450">제목</td>
		<td width="150">모집멤버</td>
		<td width="200">작성일</td>
		<td width="100">피드수</td>
		<td width="150">멤버평가</td>
		<td width="130">채팅</td>

	</tr>
	{{#each .}}
	<tr class = "row" tbl_code="{{tbl_code}}">
		<td class="id">{{id}}</td>
      	<td class="title">{{title}}</td>
      	<td class="p_member">{{p_cnt_member}}/{{p_tot_member}}</td>
		<td class="p_date">{{p_date}}</td>
		<td class="p_cnt_feed">{{p_cnt_feed}}</td>
		<td class="p_member_eval"><button>멤버평가</button></td>
		<td class="p_member_chat"><button>채팅</button></td>
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
		<td width="150">멤버평가</td>
		<td width="150">채팅</td>
	</tr>
	{{#each .}}
	<tr class = "row" tbl_code="{{tbl_code}}">
		<td class="id">{{id}}</td>
      	<td class="c_category">{{category}} > {{subcategory}}</td>
      	<td class="title">{{title}}</td>
      	<td class="c_member">{{c_cnt_member}}/{{c_tot_member}}</td>
		<td class="c_date">{{c_date}}</td>
		<td class="c_cnt_feed">{{c_cnt_feed}}</td>
		<td class="c_view">{{c_view}}</td>
		<td class="p_member_eval"><button>멤버평가</button></td>
		<td class="p_member_chat"><button>채팅</button></td>
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
		<td class="id">{{id}}</td>
      	<td class="title">{{title}}</td>
      	<td class="b_date">{{b_date}}</td>
		<td class="b_cnt_reply">{{b_cnt_reply}}</td>
		<td class="b_rec">{{b_rec}}</td>
		<td class="b_cnt_feed">{{b_cnt_feed}}</td>
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
	
	$("#tbl").on("click", ".p_member_eval button", function(){
		var id = $(this).parent().parent().find(".id").html();
		var tbl_code = $(this).parent().parent().attr("tbl_code");
		var url = "/mypage/members?tbl_code="+tbl_code+"&id=" + id;
		window.open(url,"", "width=400, height=400, top=200, left=900, location=no");
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