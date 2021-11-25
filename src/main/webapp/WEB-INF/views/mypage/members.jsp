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
	<title>신청멤버</title>
</head>
<body>
	<h3>신청멤버</h3>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
	<tr class="title">
		<td width=100>아이디</td>
		<td width=100>이름</td>
		<td width=80>성별</td>
		<td width=80>호감지수</td>
		<td width=250>평가</td>
	</tr>
	{{#each .}}
		<tr class="sub">
			<td class="member">{{member}}</td>
			<td class="u_name">{{u_name}}</td>
			<td class="u_gender">{{u_gender}}</td>
			<td class="u_score">{{u_score}}</td>
			<td class="eval">
				<select class = "score_eval">
					<option value="1">다음에도 같이할래요</option>
					<option value="0">한번으로 좋았어요</option>
					<option value="-1">다음엔 같이 안할래요</option>
					<option value="-10">No-Show 멤버예요</option>
				</select>
				<button class="btn_member_eval">평가</button>
			</td>
		</tr>
	{{/each}}
	</script>
	<div style="margin: 0 auto; text-align:center;">
		<button id="close">닫기</button>
	</div>
</body>

<script>
	var tbl_code="${tbl_code}";
	var id= "${id}";
	
	getList();
	
	$("#tbl").on("click", ".btn_member_eval", function(){
		var name = $(this).parent().parent().find(".u_name").html();
		var member = $(this).parent().parent().find(".member").html();
		var value = $(this).parent().find(".score_eval").val();
		if(!confirm(name+"님의 평가를 저장하시겠습니까?")) return;
		$.ajax({
			type:"post",
			url: "/mypage/evaluate_member",
			data: {"value": value, "member" : member},
			success : function(){
				alert("평가가 완료되었습니다.");
				window.close();
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
			data: {"id": id, "tbl_code": tbl_code},
			success : function(data){
				var temp = Handlebars.compile($('#temp').html());
				$('#tbl').html(temp(data));
			}
		});
	}
</script>
</html>