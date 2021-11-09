<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>


input[type=text], select, #content {
	width: 580px;
	padding: 12px 20px;
	margin: 8px 0;
	display: block;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit], input[type=reset] {
	width: 100px;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}


.row {
	width: 600px;
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>

<form name="frm">
	<div class="row">
		<input type="text" name="id" value="${id}">
		<input type="text" name="c_writer" value="${user.u_id}">
		<h3>모임명</h3>
		<input type="text" name="title">
		<div id="tbl_code">
		<h3>모집 분야</h3>
			<h4>스터디</h4>
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CSL">어학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CSJ">취업 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CSI">재테크&nbsp;&nbsp;
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CSR">기타<br/>
			<h4>클래스</h4>
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CCH">공예&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CCC">쿠킹&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CCE">운동&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CCR">기타<br/>
			<h4>소모임</h4>
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CGA">공연예술&nbsp;
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CGF">맛집탐방&nbsp;
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CGT">여행&nbsp;
			<input type="checkbox" id="tbl_code" name="tbl_code" value="CGR">기타
		</div>	
		<h3>모집 지역</h3>
		<select name="c_local" >
				<option  value="전국">전국</option>
				<option  value="서울">서울</option>
				<option  value="인천">인천</option>
				<option  value="경기">경기</option>
		</select>
		
		<h3>모임 장소</h3>
		<input type="text" name="c_place">
		<h3>모집 인원</h3>
		<input type="text" name="c_tot_member" >
		<h3>모임 기간</h3>
    	<input type="date"  name="date_start" value="2021-11-25">&nbsp; ~ &nbsp;
    	<input type="date"  name="date_end" value="2021-12-30">

		<h3>모임 시간</h3>
		<input type="text" name="c_time" >
		<h3>모임 회비</h3>
		<input type="text" name="c_fee">
		<h3>모집 연령</h3>
		<select name="c_age_min" >
				<option  value="10">10</option>
				<option  value="20">20</option>
				<option  value="30">30</option>
				<option  value="40">40</option>
				<option  value="50">50</option>
				<option  value="60">60</option>
				<option  value="70">70</option>
				<option  value="80">80</option>
				<option  value="90">90</option>
				<option  value="100">100</option>
		</select>
		&nbsp; ~ &nbsp;
		<select name="c_age_max" >
				<option  value="10">10</option>
				<option  value="20">20</option>
				<option  value="30">30</option>
				<option  value="40">40</option>
				<option  value="50">50</option>
				<option  value="60">60</option>
				<option  value="70">70</option>
				<option  value="80">80</option>
				<option  value="90">90</option>
				<option  value="100">100</option>
		</select>
		
		<h3>모집 성별</h3>
		<select name="c_gender">
				<option value="혼성">혼성</option>
				<option value="남성">남성</option>
				<option value="여성">여성</option>
		</select>
		
		<h3>한줄 소개</h3>
		<textarea id="content" name="content" style="height: 200px"></textarea>
		<div>	
			<input type="submit" value="등록">
			<input type="reset" value="취소">	
		</div>
	</div>
</form>

<script>


$(frm).on("submit", function(e){
	e.preventDefault();
	var id = $(frm.id).val();
	var c_writer = $(frm.c_writer).val();
	var title = $(frm.title).val();
	var tbl_code = $('input:checkbox[id="tbl_code"]:checked').val();
	var c_local = $("select[name=c_local]").val();
	var c_place = $(frm.c_plcae).val();
	var c_tot_member = $(frm.c_tot_member).val();
	var date_start = $(frm.date_start).val();
	var date_end = $(frm.date_end)
	var c_time = $(frm.c_tiem).val();
	var c_fee = $(frm.c_fee).val();
	var c_age_min = $("select[name=c_age_min]").val();
	var c_age_max = $("select[name=c_age_max]").val();
	var c_gender = $("select[name=c_gender]").val();
	var c_content = $(frm.c_content).val();
	
	if(title=="" || tbl_code || c_local=="" ){
		alert("정보를 입력하세요!");
		return;
	}
	
	if(!confirm("취미/스터디를 등록하실래요?")) return;
    frm.action="/cou/insert";
    frm.method="post";
    frm.submit();
});


		//세부 카테고리 1개만 checked
		$('input[type="checkbox"][name="tbl_code"]').click(function(){
	  		if($(this).prop('checked')){
	     		$('input[type="checkbox"][name="tbl_code"]').prop('checked',false);
	 			$(this).prop('checked',true);
	    }
	   });



</script>