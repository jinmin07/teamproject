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
<h1>[정책수정]</h1>
<form name="frm" enctype="multipart/form-data" style="overflow: hidden; margin:0 auto;">
	<div style="float: left;">
		<input type="hidden" name="oldimage" value="${vo.s_image}"/>
		<img id="image" src="display?fileName=${vo.s_image}" width=300 height="300"  onerror="this.src='http://placehold.it/300x300'"/>
	</div>
	<div style="float: left; margin-left: 50px; width: 550px; margin-bottom:20px;">
		<input type="text" name="id" value="${vo.id}" hidden /><br />
		<input type="text" name="title" value="${vo.title}"/><br />
		<div  style="margin-bottom: 10px;">
			<tr>
				<td>성별</td>
				<td><input id="all" type="radio" name="s_gender" value="all"  /> 
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
				<td><input id="age0" type="radio" name="s_age" value="age0"  /> 
					<label>전체</label> 
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
			<select name="s_local" id="loc_select">
				<option id="서울시" value="서울시">서울시</option>
				<option id="인천시" value="인천시">인천시</option>
				<option id="경기도" value="경기도">경기도</option>
			</select>
			
			<td>카테고리</td>
			<select name="s_category" id="cat_select" >
				<option id="ca1" value="안전">안전</option>
				<option id="ca2" value="주거">주거</option>
				<option id="ca3" value="경제/일자리">경제/일자리</option>
				<option id="ca4" value="외로움">외로움</option>
				<option id="ca5" value="질병">질병</option>
				<option id="ca6" value="기타">기타</option>
			</select>
		</div>
		
	
		<textarea name="s_content" rows="6" cols="73" placeholder="내용" style="resize: none;">${vo.s_content}</textarea><br/>
		<input type="file" name="file" style="display: none;" /><br />
		
	</div>
	<div style="text-align:center;  margin-bottom:30px;   ">
			<input type="submit" value="정책수정"   style="margin-right:20px;"/> 
			<input type="reset" value="수정취소" />
	</div>
</form>
<script>
	$("input:radio[name='s_gender']:input[value='${vo.s_gender}']").attr("checked",true);	
	$("input:radio[name='s_age']:input[value='${vo.s_age}']").attr("checked",true);	
	
	//원래 정책 지역표시
	$("#loc_select").val("${vo.s_local}").prop("selected",true);
	//원래 정책 카테고리표시
	$("#cat_select").val("${vo.s_category}").prop("selected",true);
	
	$(frm).on("submit", function(e) {
		e.preventDefault();
		var title=$(frm.title).val();
		var content=$(frm.s_content).val();
		var image=$(frm.oldimage).val();
		if (title == "" || content == "" ) {
			alert("제목과 내용을 입력하세요!");
			return;
		}

		if (!confirm("정책을 수정하실래요?"))
			return
		alert("수정완료!");
		frm.data={"oldimage":image};
		frm.action = "update";
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

