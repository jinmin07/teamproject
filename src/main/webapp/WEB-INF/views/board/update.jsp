<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글수정</title>
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
	<h1>[글수정]</h1>
	<form name = "frm" method = "post" enctype="multipart/form-data" style="overflow : hidden">
		<div style="overflow : hidden">
		<div style = "float : left;">
				<img id="b_image" src = "/board/display?fileName=${vo.b_image}" width=350/>
			</div>
			<div style = "float : left;">
				<h3>${vo.id} 번 글 작성자 : ${vo.b_writer} 날짜 : <f:formatDate value="${vo.b_date}" pattern="yy-MM-dd HH:mm:ss"/></h3>
				<input type = "hidden" name = "b_image" value = "${vo.b_image}"/>
				<select id="b_category" name = "b_category">
					<option value="전체">전체</option>
					<option value="정보제공">정보제공</option>
					<option value="맛집추전">맛집추천</option>
					<option value="후기">후기</option>
				</select>
				<input type = "hidden" name = "id" value = "${vo.id}"/><br/>
				<input type = "text" name = "title" value = "${vo.title}"/>
				<textarea rows="5" cols="50" name="b_content">${vo.b_content}</textarea>
				<input type = "file" name = "file" style="display : none;"/><br/>
				<div style="margin: 20px;">
					첨부파일추가 <input type="file" name="attFile" />
				</div>
				<div id="b_images" style="overflow: hidden;">
					<c:forEach items="${attList}" var="b_image">
						<div class="box">
							<img src="/board/display?fileName=${b_image}" width=150 />
							<a href="${b_image}">삭제</a>
						</div>
					</c:forEach>
				</div>
				<hr/>
				<div>
					<input type="submit" value="수정"/>
					<input type="reset" value="취소"/>
				</div>
			</div>
		</div>
	</form>
</body>

<script>
	$("#b_category").val('${vo.b_category}').prop('selected', true);	

	var page=1;
	var id = "${vo.id}";
	var u_id = "${vo.b_writer}";
	
	$(frm).on("submit", function(e) {
		e.preventDefault();
		var id = $(frm.id).val();
		var title = $(frm.title).val();
		var b_content = $(frm.b_content).val();
		var b_category = $(frm.b_category).val();
		
		if (title == "" || b_content == "") {
			alert("모든 내용을 입력해 주세요!");
			return;
		}

		if (!confirm("게시글을 수정하실래요?"))
			return;
		frm.action = "update";
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
		
	//첨부파일 삭제
	$("#b_images").on("click", ".box a", function(e) {
		e.preventDefault();
		if(!confirm("첨부 파일을 삭제하실래요?")) return;
		var box = $(this).parent();
		var b_image = $(this).attr("href");
		$.ajax({
			type : "post",
			url : "/board/attDelete",
			data : {"b_image" : b_image},
			success : function() {
				alert("삭제성공!");
				box.remove();
			}
		});
	});
	
	//첨부파일을 추가할 경우
	$(frm.attFile).on("change", function() {
		var file = $(frm.attFile)[0].files[0];
		if (file == null) return;

		if (!confirm("파일을 첨부하실래요?")) return;

		var formData = new FormData();
		formData.append("file", file);
		formData.append("id", id);

		$.ajax({
			type : "post",
			url : "/board/attInsert",
			data : formData,
			processData : false,
			contentType : false,
			success : function(data) {
				//alert(data);
				var str = '<div class = "box">';
				str += '<img src = "/board/display?fileName=' + data + '" width=150/>';
				str += '<a href = "' + data + '">삭제</a>';
				str += '</div>';
				$("#b_images").append(str);
			}
		});
	});

</script>

</html>