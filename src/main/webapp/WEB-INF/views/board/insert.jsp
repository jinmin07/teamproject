<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		form { width : 700px; padding : 20px; margin:0 auto;}
		input[type=submit],input[type=reset]{
			font-size:16px;
			margin:0px;
			padding: 5px 15px;
			font-family:"맑은고딕";
			font-weight: 600;
		}
		input[type=submit]:hover,input[type=reset]:hover{
			background: #dbb4b4;
		}
		.box {float: left;}
	</style>
</head>
<body>
	<h1>[글쓰기]</h1>
	<div>
		<form name = "frm" method = "post" enctype="multipart/form-data" style="overflow : hidden">
			<div style = "float : left; margin-left:75px;">
				<img id="b_image" src = "http://placehold.it/350x300" width=350/>
			</div>
			<input type = "text" name = "b_writer" value="${user.u_id}" readonly/>
			<select name = "b_category" style="margin-left:10px;">
				<option value="전체">전체</option>
				<option value="정보제공">정보제공</option>
				<option value="맛집추전">맛집추천</option>
				<option value="후기">후기</option>
			</select>
			<input type = "text" name = "title" placeholder = "제목을 입력하세요"/>
			<textarea rows="5" cols="50" name="b_content" placeholder = "내용을 입력하세요"></textarea>
			<input type = "file" name = "file" style="display : none;"/><br/>
			<div style="margin: 20px;">
				첨부파일추가 <input id="image_name" type="file" name="attFile" />
			</div>
			<div id="b_images" style="overflow: hidden;"></div>
			<hr/>
			<div style="text-align: center;">
				<input type="submit" value="등록"/>
				<input type="reset" value="취소"/>
			</div>
			<hr/>
		</form>
	</div>
</body>

<script>
	var user_id = "${user.u_id}";
	var id = "${id}";
	
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
	
	//첨부파일을 추가할 경우
	$(frm.attFile).on("change", function() {
		var file = $(frm.attFile)[0].files[0];
		if (file == null) return;
		var image_name = $("#image_name").val();
		
		var formData = new FormData();
		formData.append("file", file);
		formData.append("user_id",user_id );
		formData.append("id",id );

		$.ajax({
			type : "post",
			url : "/board/attInsert",
			data : formData,
			processData : false,
			contentType : false,
			success : function(data) {
				//alert(data);
				var str = '<div class = "box">';
				str += '<img src = ' +URL.createObjectURL(file) + ' width= 150/>';
				str += '<input type="text" name="b_images" value=' + data +' style="display : none;"/>';
				str += '<a href = "' + data + '">삭제</a>';
				str += '</div>';
				$("#b_images").append(str);
			}
		});
	});
	
	//첨부파일 삭제
	$("#b_images").on("click", ".box a", function(e) {
		e.preventDefault();
		var box = $(this).parent();
		var b_image = $(this).attr("href");
		$.ajax({
			type : "post",
			url : "/board/attDelete",
			data : {"b_image" : b_image},
			success : function() {
				box.remove();
			}
		});
	});
</script>
</html>