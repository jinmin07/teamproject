<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		table {border-collapse:collapse; margin: 10px auto;}
		td{border-bottom: solid 1px lightgray; padding: 5px; text-align:center;}
		.title{background:gray; color: white;}
		.row:hover { background: lightgray; color:white; curson:pointer;}
		h3 {text-align: center;}
	</style>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>신청명단</title>
</head>
<body>
	<h3>신청명단</h3>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
	<tr class="title">
		<td width=100>아이디</td>
		<td width=100>이름</td>
		<td width=100>성별</td>
		<td width=100>호감지수</td>
		<td width=100>신청거절</td>
	</tr>
	{{#each .}}
		<tr class="row">
			<td class="p_member">{{member}}</td>
			<td class="u_name">{{u_name}}</td>
			<td class="u_gender">{{u_gender}}</td>
			<td class="u_score">{{u_score}}</td>
			<td><button class="btn_member_out">거절</button></td>
		</tr>
	{{/each}}
	</script>
	<div style="margin: 0 auto; text-align:center;">
		<button id="close">닫기</button>
	</div>
</body>

<script>
	var p_id="${id}";
	getList();
	
	$("#tbl").on("click", ".btn_member_out", function(){
		var p_member = $(this).parent().parent().find(".p_member").html();
		if(!confirm(p_member+"님을 거절하시겠습니까?")) return;
		
		$.ajax({
			type:"post",
			url: "/purchase/delete_member",
			data: {"p_id": p_id, "p_member" : p_member},
			success : function(){
				alert("거절이 완료되었습니다.");
				getList();		
				location.href = "/purchase/list";
			}
		});
		
		
	});
	
	$("#close").on("click", function(){
		window.close();
	});

	
	function getList(){
		$.ajax({
			type:"get",
			url: "/mypage/list_member.json",
			dataType:"json",
			data: {"id": p_id, "tbl_code": "P"},
			success : function(data){
				var temp = Handlebars.compile($('#temp').html());
				$('#tbl').html(temp(data));
			}
		});
	}
</script>
</html>