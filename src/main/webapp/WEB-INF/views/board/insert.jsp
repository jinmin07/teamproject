<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	form { width: 960px;}
	input[type=text] {
		width: 480px;
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
	.box {float: left; width: 190; text-align: center;}
</style>
<form name = "frm" method = "post" enctype="multipart/form-data" accept-charset="UTF-8" style="overflow : hidden; margin:80px auto;">
	<div style = "float : left; margin-top: 5px; margin-bottom: 20px;">
		<img id="b_image" src = "http://placehold.it/350x350" width=350 height=350/>
	</div>
	<div style="float: left; margin-left: 30px; width: 580px; margin-bottom:20px;">
		<input type = "text" name = "b_writer" value="${user.u_id}" hidden/>
		<select name = "b_category">
			<option value="정보제공">정보제공</option>
			<option value="맛집추천">맛집추천</option>
			<option value="후기">후기</option>
		</select>
		<input type = "text" name = "title" placeholder = "제목을 입력하세요"/>
		<textarea rows="15" cols="76" name="b_content" placeholder = "내용을 입력하세요" style="resize: none;"></textarea>
		<input type = "file" name = "file" style="display : none;"/><br/>
	</div>
	<div style="margin: 20px; clear:both;">
		첨부파일추가 <input id="image_name" type="file" name="attFile" />
	</div>
	<div id="b_images" style="overflow: hidden;"></div>
	<div style="text-align: center;">
		<input type="submit" value="등록"/>
		<input type="reset" value="취소"/>
	</div>
</form>

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
				var str = '<div class = "box">';
				str += '<img src = ' +URL.createObjectURL(file) + ' width= 185/>';
				str += '<input type="text" name="b_images" value=' + data +' style="display:none;"/>';
				str += '<a href = "' + data + '"> 삭제 </a>';
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