<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
form {
	width: 960px;
}

input[type=text] {
	width: 100%;
	margin-bottom: 20px;
	outline: none;
	border: none;
	border-bottom: 1px solid gray;
	font-size: 20px;
}

input[type=submit]{
	background-color: #35c5f0;
    border-color: #35c5f0;
    color: #fff;
	font-size:16px;
	margin:0px;
	padding: 5px 15px;
	font-family:"맑은고딕";
	font-weight: 600;
}
input[type=reset]{
	background-color: #fff;
    border-color: #35c5f0;
    color: #35c5f0;
	font-size:16px;
	margin:0px;
	padding: 5px 15px;
	font-family:"맑은고딕";
	font-weight: 600;
}
input[type=submit]:hover{
	border-color: #09addb;
    background-color: #09addb;
}

</style>
<h1>[정책등록]</h1>
<form name="frm" enctype="multipart/form-data" style="overflow: hidden; margin:0 auto;">
	<div style="float: left;">
		<img id="image" src="http://placehold.it/300x300" width=300 height=300 />
	</div>
	<div style="float: left; margin-left: 50px; width: 550px; margin-bottom:20px;">
		<input type="text" name="id" value="${id}" hidden /><br />
		<input type="text" name="title" placeholder="제목" /><br />
		<div  style="margin-bottom: 10px;">
			<tr>
				<td>성별</td>
				<td><input id="all" type="radio" name="s_gender" value="all" checked /> 
				<label>전체</label> 
				<input id="man" type="radio" name="s_gender" value="m"  /> 
				<label>남자</label> 
				<input id="woman" type="radio" name="s_gender" value="w" /> 
				<label>여자</label></td>
			</tr>
		</div>
		<div  style="margin-bottom: 10px;">
			<tr>
				<td>나이</td>
				<td><input id="age0" type="radio" name="s_age" value="age0" checked /> 
					<label for>전체</label> 
					<input id="age1" type="radio" name="s_age" value="age1"  /> 
					<label>20대 이하</label> 
					<input id="age2" type="radio" name="s_age" value="age2" /> 
					<label>20대~30대</label> 
					<input id="age3" type="radio" name="s_age" value="age3" /> 
					<label>40대~50대</label>
					<input id="age4" type="radio" name="s_age" value="age4" /> 
					<label>60대 이상</label></td>
			</tr>
		</div>

		<div style="margin-bottom:10px;">
			<td>지역</td>
			<select name="s_local">
				<option id="서울시">서울시</option>
				<option id="인천시">인천시</option>
				<option id="경기도">경기도</option>
			</select>
			
			<td>카테고리</td>
			<select name="s_category">
				<option id="ca1">안전</option>
				<option id="ca2">주거</option>
				<option id="ca3">경제/일자리</option>
				<option id="ca4">외로움</option>
				<option id="ca5">질병</option>
				<option id="ca6">기타</option>
			</select>
		</div>
		
	
		<textarea name="s_content" rows="6" cols="73" placeholder="내용" style="resize: none;"></textarea><br/>
		<input type="file" name="file" style="display: none;" /><br />
		
	</div>
	<div style="text-align:center;">
			<input type="submit" value="정책등록"  style="margin-right:20px;"/> 
			<input type="reset" value="등록취소" />
	</div>
</form>
<script>
	$(frm).on("submit", function(e) {
		e.preventDefault();
		var title=$(frm.title).val();
		var content=$(frm.s_content).val();
		if ( title == "" ||content=="" ) {
			alert("제목과 내용을 입력하세요!");
			return;
		}

		if (!confirm("정책을 등록하실래요?"))
			return;
		alert("등록완료!");
		frm.action = "insert";
		frm.method = "post";
		frm.submit();
	});

	$("#image").on("click", function() {
		$(frm.file).click();
	});

	$(frm.file).on("change", function(e) {
		var file = $(this)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
</script>
