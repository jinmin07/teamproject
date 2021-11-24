<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.ps_box,.mail_check_input_box {
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

	.id_input,.mail_input, .mail_check_input{
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

.mail_check_button, .mail_check_button_warn{
    background-color: #fff;
    border-color: #35c5f0;
    color: #35c5f0;
    font-size: 16px;
    margin: 0px;
    padding: 5px 10px;
    font-family: "맑은고딕";
    font-weight: 600;
    height: 50px;
    float:right;
}

#findId {
	background-color: #fff;
    border-color: #35c5f0;
    color: #35c5f0;
    font-size: 16px;
    font-family: "맑은고딕";
    font-weight: 600;
    height: 50px;
  	width: 200px;
}

.findIdDIV {
	margin-top: 20px;
	text-align: center;
}

button:hover{
	background-color: #effbff;
}
	
</style>
</head>
<body>
	<div style=" width:500px;margin-left:460px;margin-bottom:5px; font-size: 20px; font-weight: 600;font-size:30px;border-bottom:1px solid gray; "> 
		<span>비밀번호 찾기</span>
	</div>
	
	<div style="width:450px;padding-top:10px; padding-bottom:40px; margin:0 auto;">
		<h3 class="join_title" style="margin-top:20px;">아이디</h3> 
		<div>
			<span class="ps_box box_right_space" style="display: inline-block; width:450px;" >
				 <input type="text" class="id_input" placeholder="아이디를 입력해주세요."/>
			</span>		 
		</div>
		
		
		<h3 class="join_title" style="margin-top:20px;">이메일</h3> 
		<div>
			<span class="ps_box box_right_space" style="display: inline-block; width:357px;" >
				<input type="text" name="email" class="mail_input" maxlength="100" placeholder="이메일을 입력해주세요."/>
			</span>
			<button  class="mail_check_button">번호발송</button>
		</div>
		<div style="margin-top:20px;">
			<span class="mail_check_input_box" id="mail_check_input_box_false" style="display: inline-block; width:357px;">
				<input type="text"  name="mail_check_input" class="mail_check_input" placeholder="인증번호"/>
			</span>
			<button class="mail_check_button_warn">번호확인</button>
		</div>
		<div class = "findIdDIV" style="display: none;" >
			<button id="findId">비밀번호재설정</button>
		</div>
	</div>
</body>
<script>
var code = "";
var u_id = "${user.u_id}";
/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
    
    var email = $(".mail_input").val();            // 입력한 이메일
    var checkBox = $(".mail_check_input");        // 인증번호 입력란
    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
    
    $.ajax({
        type:"GET",
        url:"mailCheckFindPw?email=" + email,
        success:function(data){
            console.log("data : " + data);
            checkBox.attr("disabled",false);
            boxWrap.attr("id", "mail_check_input_box_true");
            code = data;
            alert("인증번호가 발송되었습니다.");
            $(".mail_check_input").focus();
        }
    });
});

/* 인증번호 비교 */
$(".mail_check_button_warn").click(function(){
    
    var inputCode = $(".mail_check_input").val();        // 입력코드    
    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
    
    if(inputCode == code){      
    	   console.log(inputCode);// 일치할 경우
    	   alert("인증번호가 일치합니다")
    	   $(".findIdDIV").show();
    } else {               
    		console.log(inputCode);// 일치하지 않을 경우
    		alert("인증번호가 일치하지 않습니다.")
    }    
    
});

$("#findId").on("click",function(e){
	e.preventDefault();
	var email = $(".mail_input").val(); 
	var id = $(".id_input").val();
	$.ajax({
		type : "post",
		url : "/member/findPw",
		data : {"u_id":id,"u_email":email},
		success : function(data){
			if(data == "x"){
				alert("귀하의 데이터는 존재하지 않습니다");
				$(".findIdDIV").hide();
				location.href = "/";
			}
			else{
				alert("비밀번호 변경창으로 이동합니다");
				$(".findIdDIV").hide();
				$.ajax({
					type : "post",
					url : "/member/newPasswordChange",
					data : {"u_id":data},
					success : function(){
						location.href = "/member/newPasswordChange?u_id="+data;
					}
				});
				
			}
			
		}
	});
});
</script>
</html>