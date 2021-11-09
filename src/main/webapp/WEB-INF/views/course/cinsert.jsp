<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>


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
    	<input type="date"  name="start" value="2021-11-25">&nbsp; ~ &nbsp;
    	<input type="date"  name="end" value="2021-12-30">

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
				<option  value="19">19</option>
				<option  value="29">29</option>
				<option  value="39">39</option>
				<option  value="49">49</option>
				<option  value="59">59</option>
				<option  value="69">69/option>
				<option  value="79">79</option>
				<option  value="89">89</option>
				<option  value="99">99</option>
				<option  value="109">109</option>
		</select>
		
		<h3>모집 성별</h3>
		<select name="c_gender">
				<option value="혼성">혼성</option>
				<option value="남성">남성</option>
				<option value="여성">여성</option>
		</select>
		
		<h3>한줄 소개</h3>
		<textarea id="c_content" name="c_content" style="height: 200px"></textarea>
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
	var c_place = $(frm.c_place).val();
	var c_tot_member = $(frm.c_tot_member).val();
	var date_start = $(frm.date_start).val();
	var date_end = $(frm.date_end).val();
	var c_time = $(frm.c_time).val();
	var c_fee = $(frm.c_fee).val();
	var c_age_min = $("select[name=c_age_min]").val();
	var c_age_max = $("select[name=c_age_max]").val();
	var c_gender = $("select[name=c_gender]").val();
	var c_content = $(frm.c_content).val();
	
	//if(title== "" || tbl_code=="" || c_local=="" || c_place=="" || c_tot_member=="" ||
		//	date_start == "" || date_end == "" || c_time == "" || c_fee == "" ||
	   		// c_age_min == "" || c_age_max == "" || c_gender == "" || c_content == ""){
		
		//alert(id);
		//alert(c_writer);
		//alert(title);
		//alert(tbl_code);
		//alert(c_local);
		//alert(c_place);
		//alert(c_tot_member);
		//alert(date_start);
		//alert(date_end);
		//alert(c_time);
		//alert(c_fee);
		//alert(c_age_min);
		//alert(c_age_max);
		//alert(c_gender);
		//alert(c_content);
	
		if(title== "" ){
		  alert("title");
		}if(tbl_code==""){
		  alert("tbl_code");
		}if(c_local==""){
		  alert("c_local");
		}if(c_place==""){
			alert("c_place");
		}if(c_tot_member==""){
			alert("c_tot_member");
		}if(date_start == ""){
			alert("date_start");
		}if(date_end == ""){
			alert("date_end");
		}if(c_time == ""){
			alert("c_time");
		}if(c_fee == ""){
			alert("c_fee");
		}if(c_age_min == ""){
			alert("c_age_min");
		}if(c_age_max == ""){
			alert("c_age_max");
		}if(c_gender == ""){
			alert("c_gender")
		}if(c_content == ""){
			alert("c_content");  	
		return;
	}
	
	if(!confirm("취미/스터디를 등록하실래요?")) return;
    frm.action="/cou/insert";
    frm.method="post";
    frm.submit();
    alert("등록 성공!!!");
    
    /* $.ajax({
   	 type: "post",
   	 url: "/cou/insert",
   	 data: {"id": id, "c_writer":c_writer,"title":title,"tbl_code":tbl_code,"c_local":c_local,"c_place":c_place,
   		 "c_tot_member":c_tot_member,"date_start":date_start, "date_end":date_end,"c_time":c_time, "c_fee":c_fee,
   		 "c_age_min":c_age_min, "c_age_max":c_age_max,"c_gender":c_gender, "c_content":c_content},
   	 success: function(data){
   		alert("등록 성공!!!");
   		location.href="/cou/list";
   	 },
   	 error:function(){  
   		 alert("신규등록 error");s
   	 }
   	  
    });
     */
    
});

		//세부 카테고리 1개만 checked
		$('input[type="checkbox"][name="tbl_code"]').click(function(){
	  		if($(this).prop('checked')){
	     		$('input[type="checkbox"][name="tbl_code"]').prop('checked',false);
	 			$(this).prop('checked',true);
	    }
	   });
</script>