<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div>
			<div>
				<span>현재비밀번호를 입력해주세요</span> : <input id="presentPassword" type="password" name="presentPassword"/>
			</div>
			<div>
				<span>새로운 비밀번호를 입력해주세요:</span> <input id="newPassword" type="password" name="newPassword"/><br/>
				<span>새 비밀번호 확인:</span> <input id="newPasswordCheck" type="password" name="newPasswordChaeck"/>
				<input type="button" id="passwordChange" value="비밀번호변경"/>
			</div>
		</div>
</body>
<script>	
	var currentlyId = "${user.u_id}";
	var currentlyPassword = "${user.u_pass}";
	
	$("#passwordChange").on("click",function(e){
		e.preventDefault();
		var presentPassword = $("#presentPassword").val();
		var newPassword = $("#newPassword").val();
		var newPasswordCheck = $("#newPasswordCheck").val();
		
		if(currentlyPassword === presentPassword){
			if(newPassword === newPasswordCheck){
				alert("일치합니다");
				if(!confirm("비밀번호를 변경하시겠습니까?")) return;	
				$.ajax({
					type : "post",
					url : "/mypage/passwordChange",
					data : {"u_id":currentlyId,"u_pass":newPassword},
					success : function(){
						alert("비밀번호가 변경되었습니다");
						location.href = "/";
					}
				});
			}
			if(newPassword != newPasswordCheck){
				alert("비밀번호가 틀립니다");
				return;
			}
		}
		if(currentlyPassword != presentPassword){
			alert("현재 비밀번호가 다릅니다");
			return;
		}
	});
</script>
</html>