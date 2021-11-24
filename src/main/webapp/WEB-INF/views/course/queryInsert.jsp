<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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
	
</style>		
		 
<h1>문의하기</h1>
<div style="width: 700px; margin : 0px auto;">
<div style="text-align: left; margin-bottom: 10px;"> 취미/스터디 > ${category.category} > ${category.subcategory} </div>
<div id="course_info">
	<h3>${vo.title}</h3>
	<h4>작성자 : ${vo.c_writer}</h4>
</div>
<hr/>
<form name="frm">	
	<input type="hidden" name="c_id" value="${vo.id}">
	<input type="hidden" name="tbl_code" value="${vo.tbl_code}">
	<input type="hidden" name="title" value="${vo.title}">
	<input type="hidden" name="c_writer" value="${vo.c_writer}">
	<input type="hidden" name="c_query_writer" value="${user.u_id}">
	
	<textarea name="c_query_content" rows="10" cols="96" style="resize: none;"></textarea>
	<hr/>
	<div style="text-align: center;">
		비공개 : <input type="checkbox" name="c_openable" value="f"/> &nbsp;&nbsp;
		<input type="submit" value="등록"/>
		<input type="reset" value="취소"/>
	</div>
</form>
</div>
<script>
	$(frm).on("submit",function(e){
		e.preventDefault();
		var content = $(frm.c_query_content).val();
		if(content == ""){
			alert("내용을 입력해주세요.");
			return;
		}
		
		if(!confirm("문의글을 등록하시겠습니까?")) return;
		
		sock_notice.send("admin");
		frm.action = "query_insert";
		frm.method = "post";
		frm.submit();
	});

</script>