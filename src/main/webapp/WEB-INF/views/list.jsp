<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> 
</head>
<body>
	<h1>목록</h1>
	<table id="tbl" border=1></table>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<tr>
				<td width=100>{{u_id}}</td>
				<td width=300>{{u_pass}}</td>
				<td width=200>{{u_name}}</td>
				<td width=100>{{u_age}}</td>
				<td width=100>{{u_address}}</td>
			</tr>
		{{/each}}
	</script>
</body>
<script>
getList();
function getList(){
	$.ajax({
		type:"get",
		url: "/list.json",
		dataType:"json",
		success:function(data){
			var temp = Handlebars.compile($("#temp").html());
			$("#tbl").html(temp(data));
		}
	});
}
</script>
</html>