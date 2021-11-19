<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %> 
	<table id="tbl"></table>
	<script id="temp1" type="text/x-handlebars-template">
	<tr class="title">
		<td width="100">코드</td>
		<td width="100">No.</td>
		<td width="100">작성자</td>
		<td width="300">제목</td>
		<td width="200">멤버평가</td>
		<td width="200">채팅하기</td>
	</tr>
	{{#each .}}
	<tr class = "row" tbl_code="{{tbl_code}}">
		<td class="tbl_code">{{tbl_code}}</td>
		<td class="id">{{id}}</td>
		<td class="p_writer">{{p_writer}}</td>
      	<td class="p_title">{{title}}</td>
		<td class="p_member_eval"><button>멤버평가</button></td>
		<td class="p_member_chat"><button>채팅하기</button></td>
	</tr>
	{{/each}}
	</script>
	<script id="temp2" type="text/x-handlebars-template">
	<tr class="title">
		<td width="100">코드</td>
		<td width="100">No.</td>
		<td width="100">작성자</td>
		<td width="300">제목</td>
		<td width="200">멤버평가</td>
		<td width="200">채팅하기</td>
	</tr>
	{{#each .}}
	<tr class = "row" tbl_code="{{tbl_code}}">
		<td class="tbl_code">{{tbl_code}}</td>
		<td class="id">{{id}}</td>
		<td class="c_writer">{{c_writer}}</td>
      	<td class="c_title">{{title}}</td>
		<td class="c_member_eval"><button>멤버평가</button></td>
		<td class="c_member_chat"><button>채팅하기</button></td>
	</tr>
	{{/each}}
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
		var tbl_code = $(this).parent().parent().attr("tbl_code");
		var p_writer = $(this).parent().parent().find(".p_writer").html();
		var url = "/mypage/members?tbl_code="+tbl_code+"&id=" + id+"&p_writer=" + p_writer;
		window.open(url,"", "width=400, height=400, top=200, left=900, location=no");
	});
	
	$("#tbl").on("click", ".c_member_eval button", function(){
		var id = $(this).parent().parent().find(".id").html();
		var tbl_code = $(this).parent().parent().attr("tbl_code");
		var p_writer = $(this).parent().parent().find(".p_writer").html();
		var url = "/mypage/members?tbl_code="+tbl_code+"&id=" + id;
		window.open(url,"", "width=400, height=400, top=200, left=900, location=no");
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