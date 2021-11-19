<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table>
			<tr>
				<td>아이디</td>
				<td><input id="u_id" type="text" value="${user.u_id}" readonly/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><button id="passwordChange">비밀번호변경</button></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input id="u_name" type="text" value="${user.u_name}"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input id="u_gender" type="text" value="${user.u_gender}"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input id="u_email" type="text" value="${user.u_email}"/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input id="u_phone" type="text" value="${user.u_phone}"/></td>
			</tr>
		</table>
		<div class="address_wrap">
			<div class="address_name">주소</div>
			<div class="address_input_1_wrap">
				<div class="address_input_1_box">
					<input type="hidden" id="u_addr1" class="address_input_2" name="addr1" value="${user.u_addr1}"/>
				</div>
			</div>
			<div class="address_input_2_wrap">
				<div class="address_input_2_box">
					<input  id="u_addr2" class="address_input_2" name="addr2" value="${user.u_addr2}"/>
				</div>
			</div>
			<div class="address_input_3_wrap">
				<div class="address_input_3_box">
					<input id="u_addr3" class="address_input_3" name="addr3" value="${user.u_addr3 }"/>
				</div>
			</div>
			<div class="address_button" onclick="execution_daum_address()">
				<button>주소찾기</button>
			</div>
		</div>
		<div>
			<input type="button" id="update" value="회원정보수정"/>
			<input type="reset" id="reset" value="수정취소"/>
		</div>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var u_id = "${user.u_id}";
	var u_pass = "${user.u_pass}";
	
	$("#update").on("click",function(e){
		e.preventDefault();
		var u_id = $("#u_id").val();
		var u_name = $("#u_name").val();
		var u_gender = $("#u_gender").val();
		var u_email = $("#u_email").val();
		var u_phone = $("#u_phone").val();
		var u_addr1 = $("#u_addr1").val();
		var u_addr2 = $("#u_addr2").val();
		var u_addr3 = $("#u_addr3").val();
		
		if(!confirm("회원정보를 수정하시겠습니까?")) return;
		
		
	$.ajax({
			type : "post",
			url : "/mypage/my_profile_update",
			data : {
				"u_id" : u_id,
				"u_name" : u_name,
				"u_gender" : u_gender,
				"u_email" : u_email,
				"u_phone" : u_phone,
				"u_addr1" : u_addr1,
				"u_addr2" : u_addr2,
				"u_addr3" : u_addr3
			},
			success : function(){
				alert("수정되었습니다.");
				location.href = "/";
			}
		});

	})

	$("#passwordChange").on("click", function(e) {
		e.preventDefault();
		location.href = "/mypage/goPasswordChange";

		/* $.ajax({
			type : "get",
			url : "/mypage/goPasswordChange",			
			success : function(){
				alert("비밀번호 변경창으로 이동합니다");
			}
		}); */
	});

	/* 다음 주소 연동*/
	function execution_daum_address() {
		new daum.Postcode({
			oncomplete : function(data) {

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					addr += extraAddr;

				} else {
					addr += ' ';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$(".address_input_1").val(data.zonecode);
				$(".address_input_2").val(addr);
				// 커서를 상세주소 필드로 이동한다.
				$(".address_input_3").attr("readonly", false);
				$(".address_input_3").focus();

			}
		}).open();
	}
</script>
</html>