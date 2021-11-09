<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>문의하기</h1>
<div style="text-align: left; margin-bottom: 10px;"> 취미/스터디 > ${category.category} > ${category.subcategory} </div>
<div id="course_info">
	<h3>${vo.title}</h3>
	<h4>작성자 : ${vo.c_writer}</h4>
</div>
<hr/>
<form name="frm">	
	<input type="hidden" name="c_id" value="${vo.id}">
	<input type="hidden" name="c_query_writer" value="${user.u_id}">
	
	<textarea name="c_query_content" rows="10" cols="100"></textarea>
	<hr/>
	<div>
		비공개 : <input type="checkbox" name="c_openable" value="f"/>
		<input type="submit" value="등록"/>
		<input type="reset" value="취소"/>
	</div>
</form>
<script>
	$(frm).on("submit",function(e){
		e.preventDefault();
		var content = $(frm.c_query_content).val();
		if(content == ""){
			alert("내용을 입력해주세요.");
			return;
		}
		
		if(!confirm("문의글을 등록하시겠습니까?")) return;
		
		frm.action = "query_insert";
		frm.method = "post";
		frm.submit();
	});

</script>