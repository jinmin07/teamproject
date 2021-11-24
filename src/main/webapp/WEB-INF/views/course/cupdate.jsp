<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
form{
	width: 700px;
	margin : 0px auto;
}

input[type=text], select, #c_content {
	width: 580px;
	padding: 12px 20px;
	margin: 8px 0;
	display: block;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit], input[type=reset] {
	width: 100px;
	color: #fff;
    font-weight: 600;
    background-color: #35c5f0;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}	
input[type=submit]:hover, input[type=reset]:hover{
	border-color: #09addb;
    background-color: #09addb;
}


.sub {
	width: 600px;
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>



<form name="frm">
	<div class="sub">
		<input type="hidden" name="id" value="${vo.id}"/> 
		<input type="hidden" name="c_writer" value="${user.u_id}">
		<h3>모임명</h3>
		<input type="hidden" name="old_title" value="${vo.title}"/>
		<input type="text" name="title" value="${vo.title}">
		<div id="tbl_code">
			<h3>모집 분야</h3>
			<h4>스터디</h4>
			<input type="radio" id="tbl_code" name="tbl_code" value="CSL">어학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" id="tbl_code" name="tbl_code" value="CSJ">취업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="radio" id="tbl_code" name="tbl_code" value="CSI">재테크&nbsp;&nbsp; 
			<input type="radio" id="tbl_code" name="tbl_code" value="CSR">기타<br/>
			<h4>클래스</h4>
			<input type="radio" id="tbl_code" name="tbl_code" value="CCH">공예&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" id="tbl_code" name="tbl_code" value="CCC">쿠킹&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" id="tbl_code" name="tbl_code" value="CCE">운동&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" id="tbl_code" name="tbl_code" value="CCR">기타<br />
			<h4>소모임</h4>
			<input type="radio" id="tbl_code" name="tbl_code" value="CGA">공연예술&nbsp;
			<input type="radio" id="tbl_code" name="tbl_code" value="CGF">맛집탐방&nbsp;
			<input type="radio" id="tbl_code" name="tbl_code" value="CGT">여행&nbsp;
			<input type="radio" id="tbl_code" name="tbl_code" value="CGR">기타
		</div>
		
		<h3>모집 지역</h3>
		<select id= "c_local" name="c_local">
			<option value="전국">전국</option>
			<option value="서울">서울</option>
			<option value="인천">인천</option>
			<option value="경기">경기</option>
		</select>

		<h3>모임 장소</h3>
			<input type="text" name="c_place" value="${vo.c_place}">
		<h3>모집 인원</h3>
			<input type="text" name="c_tot_member" value="${vo.c_tot_member}">
		<h3>모임 일정</h3>
			<input type="date" name="start" value="${start}">&nbsp; ~ &nbsp; 
			<input type="date" name="end" value="${end}">
		<h3>모임 시간</h3>
			<input type="text" name="c_time" value="${vo.c_time}">
		<h3>모임 회비</h3>
			<input type="text" name="c_fee" value="${vo.c_fee}">
		<h3>모집 연령</h3>
		<select id="c_age_min" name="c_age_min">
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option value="40">40</option>
			<option value="50">50</option>
			<option value="60">60</option>
			<option value="70">70</option>
			<option value="80">80</option>
			<option value="90">90</option>
			<option value="100">100</option>
		</select> &nbsp; ~ &nbsp; 
		<select id="c_age_max" name="c_age_max">
			<option value="19">19</option>
			<option value="29">29</option>
			<option value="39">39</option>
			<option value="49">49</option>
			<option value="59">59</option>
			<option value="69">69</option>
			<option value="79">79</option>
			<option value="89">89</option>
			<option value="99">99</option>
			<option value="109">109</option>
		</select>

		<h3>모집 성별</h3>
		<select id="c_gender" name="c_gender">
			<option value="혼성">혼성</option>
			<option value="남성">남성</option>
			<option value="여성">여성</option>
		</select>

		<h3>한줄 소개</h3>
		<textarea id="c_content" name="c_content" style="height: 200px">${vo.c_content}</textarea>
		<div style="text-align: center;">
			<input type="submit" value="수정"> 
			<input type="reset" value="취소">
		</div>
	</div>
</form>



<script>
	//DB값 불러와서 radio 버튼 checked
	window.onload = function(){
		document.querySelector("#tbl_code input[value='${vo.tbl_code}']").setAttribute('checked', true);
	}

	//DB값 불러와서 지역 selected
	$("#c_local").val('${vo.c_local}').prop('selected', true);

	//DB값 불러와서 연령 selected
	$("#c_age_min").val('${vo.c_age_min}').prop('selected', true);
	$("#c_age_max").val('${vo.c_age_max}').prop('selected', true);


	//DB값 불러와서 성별 selected
	$("#c_gender").val('${vo.c_gender}').prop('selected', true);


	//course 수정하기
	$(frm).on("submit", function(e) {
		e.preventDefault();
		var id = $(frm.id).val();
		var c_writer = $(frm.c_writer).val();
		var title = $(frm.title).val();
		var tbl_code = $('input:radio[id="tbl_code"]:checked').val();
		var c_local = $("select[name=c_local]").val();
		var c_place = $(frm.c_place).val();
		var c_tot_member = $(frm.c_tot_member).val();
		var date_start = $(frm.start).val();
		var date_end = $(frm.end).val();
		var c_time = $(frm.c_time).val();
		var c_fee = $(frm.c_fee).val();
		var c_age_min = $("select[name=c_age_min]").val();
		var c_age_max = $("select[name=c_age_max]").val();
		var c_gender = $("select[name=c_gender]").val();
		var c_content = $(frm.c_content).val();
		

		if (!confirm("취미/스터디를 수정하실래요?")) return;
		
		
		sock_notice.send("admin");
		
		frm.action = "/course/update";
		frm.method = "post";
		frm.submit();

	});

	

</script>