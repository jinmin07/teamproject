<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>문의하기</h1>
<div id="purchase_info">
	<h3>${vo.title}</h3>
	<h4>작성자 : ${vo.p_writer}</h4>
</div>
<hr/>
<form name="frm">	
	<input type="hidden" name="p_id" value="${vo.id}">
	<input type="hidden" name="title" value="${vo.title}">
	<input type="hidden" name="p_writer" value="${vo.p_writer}">
	<input type="hidden" name="p_query_writer" value="${user.u_id}">
	
	<textarea name="p_query_content" rows="10" cols="100"></textarea>
	<hr/>
	<div>
		비공개 : <input type="checkbox" name="p_openable" value="f"/>
		<input type="submit" value="등록"/>
		<input type="reset" value="취소"/>
	</div>
</form>
<script>
	$(frm).on("submit",function(e){
		e.preventDefault();
		var content = $(frm.p_query_content).val();
		if(content == ""){
			alert("내용을 입력해주세요.");
			return;
		}
		
		if(!confirm("문의글을 등록하시겠습니까?")) return;
		
		sock_notice.send("admin");
		frm.action = "/purchase/query_insert";
		frm.method = "post";
		frm.submit();
	});

</script>