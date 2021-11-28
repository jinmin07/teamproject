<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<form name = "frm" method = "post" enctype="multipart/form-data" style="overflow : hidden; margin:80px auto;">
	<div style = "float : left; margin-top: 5px; margin-bottom: 20px;">
		<img id="b_image" src = "/board/display?fileName=${vo.b_image}" width=350 height=350/>
	</div>
	<div style="float: left; margin-left: 30px; width: 580px; margin-bottom:20px;">
		<input type = "hidden" name = "b_image" value = "${vo.b_image}"/>
		<select id="b_category" name = "b_category">
			<option value="정보제공">정보제공</option>
			<option value="맛집추전">맛집추천</option>
			<option value="후기">후기</option>
		</select>
		<input type = "text" name = "title" value = "${vo.title}"/>
		<input type = "hidden" name = "id" value = "${vo.id}"/><br/>
		<textarea rows="15" cols="78" name="b_content" style="resize: none;">${vo.b_content}</textarea>
		<input type = "file" name = "file" style="display : none;"/><br/>
	</div>	
	<div style="margin: 20px; clear:both;">
		첨부파일추가 <input type="file" name="attFile" />
	</div>
	<div id="b_images" style="overflow: hidden;">
		<c:forEach items="${attList}" var="b_image">
			<div class="box">
				<img src="/board/display?fileName=${b_image}" width=185 />
				<a href="${b_image}">삭제</a>
			</div>
		</c:forEach>
	</div>
	<div style="text-align: center; margin-top: 20px;">
		<input type="submit" value="수정"/>
		<input type="reset" value="취소"/>
	</div>
</form>
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
				str += '<img src = "/board/display?fileName=' + data + '" width=185/>';
				str += '<a href = "' + data + '">삭제</a>';
				str += '</div>';
				$("#b_images").append(str);
			}
		});
	});

</script>

</html>