<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	input[type=text]{
		width: 100%;
		margin-bottom: 10px;
	}
	
	input[type=password]{
		width: 100%;
		margin-bottom: 10px;
	}
</style>

<div style="width:300px;margin:0px auto;margin-top:100px;margin-bottom:200px;">
	<h1>로그인</h1>
	<form name="frm">
		<input type="text" name="uid" placeholder="아이디"/>
		<input type="password" name="upass" placeholder="비밀번호"/>
		<div style="margin-bottom:10px;">
		</div>
		<input type="submit" value="login"/>
	</form>
</div>

<script>
	$(frm).on("submit", function(e){
		e.preventDefault();
		var uid=$(frm.uid).val();
		var upass=$(frm.upass).val();
		
		if(uid=="" || upass==""){
			alert("아이디와 비밀번호를 입력하세요!");
			return;
		}
		
		$.ajax({
			type: "post",
			url: "/login",
			data: {"uid": uid, "upass":upass},
			success: function(data){
				if(data==0){
					alert("아이디가 존재하지 않습니다!");
				}else if(data==2){
					alert("비밀번호가 일치하지 않습니다!")
				}else{
					location.href="/";
				}
			}
		});
	});

</script>










