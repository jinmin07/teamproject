<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<style>
	#myfeed{
		width:680px;
		margin:0 auto;
	}
	.subcontent{
		color:#999;
		margin-left:2px;
		margin-bottom:10px;
		font-size:14px;
	}
	
	
	.name{
		margin-bottom:0px;
		font-size: 21px;
		font-weight: 600;
	}
	
	.content{
		font-size:16px;
		margin-bottom:30px;
	}
</style>

<h1>내 피드</h1>
<div id="myfeed"></div>
<script id="temp" type="text/x-handlebars-template">
	{{#each .}}
		<div class="box" style="border-bottom:1px solid #999; padding-bottom:3px; width:680px;">
			<div style="float:right; ">
				<a href="{{id}}" code= "{{tbl_code}}">
					<img src="/resources/delete.png" width=30 >
				</a>
			</div>
			<div class="main"> 
				<span class="name" >{{title}}</span>	
				<div class="subcontent">
					<span style="display:inline;">{{writer}}</span>
					<span style="display:inline; margin-left:5px;" class="tbl_code">{{printCategory tbl_code}}</span>
					<span style="display:inline; margin-left:5px;">{{regdate}}</span>
				</div>
			</div>
			<div class="content">
				<div class="image">
					<img src="{{printSrc tbl_code}}/display?fileName={{image}}" width=250 style="display:{{printImg image}}"/>
				</div>
				<p style="width:660px;">{{content}}</p>
			</div>
		</div>
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