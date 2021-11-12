<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글쓰기</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		input[type=text] { width : 100%; margin : 10px; }
		textarea { width : 100%; margin : 10px; }
		form { width : 500px; padding : 20px; }
	</style>
</head>
<body>
	<h1>[글쓰기]</h1>
	<div>
		<form name = "frm" method = "post" enctype="multipart/form-data" style="overflow : hidden">
			<div style = "float : left;">
				<img id="b_image" src = "http://placehold.it/350x300" width=350/>
			</div>
			<input type = "text" name = "b_writer" value="${user.u_id}" readonly/>
			<select name = "b_category">
				<option>[전체]</option>
				<option>[정보제공]</option>
				<option>[맛집추천]</option>
				<option>[후기]</option>
			</select>
			<input type = "text" name = "title" placeholder = "제목을 입력하세요"/>
			<textarea rows="5" cols="50" name="b_content" placeholder = "내용을 입력하세요"></textarea>
			<input type = "file" name = "file" style="display : none;"/><br/>
			<hr/>
				<input type="submit" value="등록"/>
				<input type="reset" value="취소"/>
			<hr/>
		</form>
	</div>
</body>

<script>
$(frm).on("submit", function(e) {
	e.preventDefault();
	var file = $(frm.file)[0].files[0];
	var b_writer = $(frm.b_writer).val();
	var b_category = $(frm.b_category).val();
	var title = $(frm.title).val();
	var b_content = $(frm.b_content).val();
	
	if(title == "" || b_content == ""){
		alert("모든 내용을 입력해 주세요!");
		return;
	}
	
	if(!confirm("글을 등록하실래요?")) return;
	frm.action = "insert";
	frm.method = "post";
	frm.submit();
});

$("#b_image").on("click", function() {
	$(frm.file).click();
});

$(frm.file).on("change", function(e) {
	var file = $(this)[0].files[0];
	$("#b_image").attr("src", URL.createObjectURL(file));
});
</script>
</html>