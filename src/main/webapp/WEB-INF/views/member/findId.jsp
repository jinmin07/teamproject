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
		<div>이름을 입력해주세요 : <input type="text" class="name_input" placeholder="이름을 입력해주세요"/></div>
		<h3 class="join_title" style="margin-top:20px;">이메일</h3> 
		<div>
			<span class="ps_box box_right_space" style="display: inline-block; width:357px;" >
				<input type="text" name="email" class="mail_input" maxlength="100" placeholder="이메일"/>
			</span>
			<button  class="mail_check_button">번호발송</button>
		</div>
		<div style="margin-top:20px;">
			<span class="mail_check_input_box" id="mail_check_input_box_false" style="display: inline-block; width:357px;">
				<input type="text"  name="mail_check_input" class="mail_check_input" placeholder="인증번호"/>
			</span>
			<button class="mail_check_button_warn">번호확인</button>
		</div>
	</div>
	<div class = "findIdDIV" style="display:none;"><button id="findId">아이디 찾기</button></div>
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
	        url:"mailCheckFindId?email=" + email,
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
	    	   alert("인증번호가 일치합니다.")
	    	   $(".findIdDIV").show();
	    } else {               
	    		console.log(inputCode);// 일치하지 않을 경우
	    		alert("인증번호가 일치하지 않습니다.")
	    }    
	});

	$("#findId").on("click",function(e){
		e.preventDefault();
		var email = $(".mail_input").val(); 
		var name = $(".name_input").val();
		$.ajax({
			type : "post",
			url : "/member/findId",
			data : {"u_name":name,"u_email":email},
			success : function(data){
				if(data == "x"){
					alert("귀하의 데이터는 존재하지 않습니다");
					$(".findIdDIV").hide();
					location.href = "/";
				}
				else{
					alert("귀하의 아이디는 " + data + " 입니다");
					$(".findIdDIV").hide();
					location.href = "/";
				}
			}
		});
	});
</script>
</html>