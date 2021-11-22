<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<style>

</style>

<h1>내 피드</h1>
<div id="myfeed"></div>
<script id="temp" type="text/x-handlebars-template">
	{{#each .}}
		<div class="box">
			<div classs="main"> 
				<h3>{{title}}</h3>
				<h5>{{writer}}</h5>
				<h5 class="tbl_code">{{printCategory tbl_code}}</h5>
				<h5>{{regdate}}</h5>
			</div>
			<div class="content">
				<div class="image">
					<img src="{{printSrc tbl_code}}/display?fileName={{image}}" width=140 style="display:{{printImg image}}"/>
				</div>
				<p>{{content}}</p>
				<a href="{{id}}" code= "{{tbl_code}}">삭제</a>
			</div>
		</div>
		<hr/>
	{{/each}}
</script>
<script>
	Handlebars.registerHelper("printCategory", function(tbl_code){
		if(tbl_code == "P"){
			return "공동구매";
		}else if(tbl_code == "B"){
			return "커뮤니티";
		}else if(tbl_code.indexOf("C")!=-1){
			return "공동생활";
		}else{
			return "지원정책";
		}
	});
</script>
<script>
	Handlebars.registerHelper("printImg", function(image){
		if(image == null){
			return "none";
		}
	});
</script>
<script>
	Handlebars.registerHelper("printSrc", function(tbl_code){
		if(tbl_code == "P"){
			return "/purchase";
		}else if(tbl_code == "B"){
			return "/board";
		}else if(tbl_code == "S"){
			return "/support";
		}
	});
</script>
<script>
	var user_id = "${user.u_id}";
	
	$("#myfeed").on("click", ".box a", function(e){
		e.preventDefault();
		var tbl_code = $(this).attr("code");
		var primary_id = $(this).attr("href");
		if(!confirm("삭제하시겠습니까?")) return;
		
		$.ajax({
			type : "post",
			url : "/myfeed/delete",
			data : {"user_id" : user_id, "tbl_code" : tbl_code, "primary_id" : primary_id},
			success : function() {
				alert("삭제가 완료되었습니다.");
				location.href="/myfeed/list";
			}
		});
	});

	getList();
	function getList() {
		$.ajax({
			type : "get",
			url : "/myfeed/feedlist.json",
			data : {"user_id" : user_id},
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#myfeed").html(temp(data));
			}
		});
	}
	
</script>