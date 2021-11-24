<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 재설정</title>
	<style>
		.ps_box {
			display: block;
			position: relative;
			width: 460px;
			height: 51px;
			border: solid 1px #dadada;
			padding: 10px 110px 10px 14px;
			background: #fff;
			box-sizing: border-box;
			vertical-align: top;
		}
		input[type=password]{
			display: block;
			position: relative;
			height: 29px;
			line-height: 29px;
			border: none;
			background: #fff;
			font-size: 15px;
			box-sizing: border-box;
			z-index: 10;
			width: 327px;
		}
	
		input:focus {outline:none;}
		
		#passwordChange {
			background-color: #fff;
		    border-color: #35c5f0;
		    color: #35c5f0;
		    font-size: 16px;
		    font-family: "맑은고딕";
		    font-weight: 600;
		    height: 50px;
		  	width: 200px;
		}
		.pass_chan{
			margin-top: 20px;
			text-align: center;
		}
	
	</style>
</head>
<body>
	<div style=" width:500px;margin-left:225px;margin-bottom:5px; font-size: 20px; font-weight: 600;font-size:30px;border-bottom:1px solid gray; "> 
		<span>비밀번호 재설정</span>
	</div>
	<div style="width:450px;padding-top:10px; padding-bottom:40px; margin:0 auto;">
		<h3 class="join_title" style="margin-top:20px;">현재 비밀번호</h3> 
		<div>
			<span class="ps_box box_right_space" style="display: inline-block; width:450px;" >
				 <input type="password" id="presentPassword" name="presentPassword" placeholder="현재 비밀번호를 입력해주세요."/>
			</span>		 
		</div>
		<h3 class="join_title" style="margin-top:20px;">새로운 비밀번호</h3> 
		<div>
			<span class="ps_box box_right_space" style="display: inline-block; width:450px;" >
				 <input id="newPassword" type="password" name="newPassword" placeholder="새로운 비밀번호를 입력해주세요."/>
			</span>		 
		</div>
		<h3 class="join_title" style="margin-top:20px;">비밀번호 확인</h3> 
		<div>
			<span class="ps_box box_right_space" style="display: inline-block; width:450px;" >
				 <input id="newPasswordCheck" type="password" name="newPasswordChaeck" placeholder="새로운  비밀번호를 재입력해주세요."/>
			</span>		 
		</div>
		<div class = "pass_chan" >
			<input type="button" id="passwordChange" value="비밀번호변경"/>
		</div>
	</div>
</body>
<script>	
	var currentlyId = "${user.u_id}";
	
	$("#passwordChange").on("click",function(e){
		e.preventDefault();
		var presentPassword = $("#presentPassword").val();
		var newPassword = $("#newPassword").val();
		var newPasswordCheck = $("#newPasswordCheck").val();
		
		if(newPassword === newPasswordCheck){
			if(!confirm("비밀번호를 변경하시겠습니까?")) return;	
			$.ajax({
				type : "post",
				url : "/mypage/passwordChange",
				data : {"u_id":currentlyId,"u_pass":newPassword, "old_pass": presentPassword},
				success : function(data){
					if(data == 1){
					alert("비밀번호가 변경되었습니다.");
					location.href = "/";
					} else {
						alert("현재 비밀번호가 틀립니다. 확인 부탁드립니다.");
						return;
					}
				}
			});
		}else if(newPassword != newPasswordCheck){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
	});
</script>
</html>