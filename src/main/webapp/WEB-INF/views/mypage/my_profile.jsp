<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.address_input_1_box{
   display: block;
   position: relative;
   width: 580px;
   height: 51px;
   border: solid 1px #dadada;
   padding: 10px 110px 10px 14px;
   background: #fff;
   box-sizing: border-box;
   vertical-align: top;}

.ps_box ,#u_gender{
         display: block;
         position: relative;
         width: 580px;
         height: 51px;
         border: solid 1px #dadada;
         padding: 10px 110px 10px 14px;
         background: #fff;
         box-sizing: border-box;
         vertical-align: top;
      }
      
 select, #p_content {
   width: 580px;
   padding: 12px 20px;
   margin: 8px 0;
   display: block;
   border-radius: 4px;
   box-sizing: border-box;
}


input[type=text]{
   display: block;
   height: 29px;
   line-height: 29px;
   border: none;
   background: #fff;
   font-size: 15px;
   box-sizing: border-box;
   z-index: 10;
   width: 550px;
}
input[type=date]{
   width: 580px;
   padding: 12px 20px;
   margin: 8px 0;
   display: block;
   border-radius: 4px;
   box-sizing: border-box;
}

input[type=button], input[type=reset] {
   width: 100px;
   padding: 14px 20px;
   margin: 0px auto;
   border: none;
   border-radius: 4px;
   cursor: pointer;
   text-align:center;
}

button{
   display:flex;
   justify-content: center;
   align-items: center;
   width: 100px;
   padding: 14px 20px;
   margin: 0px auto;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}
#u_addr1 {
   width: 410px;
}

#passwordChange {
   width: 580px;
   background: #35c5f0;
}

#passwordChange:hover{
   border-color: #09addb;
    background-color: #09addb;
}

#chan_add {
   width: 100px;
   background-color: #fff;
    border: 2px solid #35c5f0;
    color: #35c5f0;
}

#chan_add:hover{
   background-color: #effbff;
}

#update, #reset {
   background: #35c5f0;
   width: 285px;
}

#update:hover, #reset:hover{
   border-color: #09addb;
    background-color: #09addb;
}

.register{
   width: 580px;
   margin-top: 20px;
   text-align: center;
}

.sub {
   margin-top:10px;
   margin: 0px auto;
   width: 600px;
   border-radius: 5px;
   padding: 20px;
}

input:focus, select:focus {outline:none;}

</style>
<title>Insert title here</title>
</head>
<body>
      <div class="sub">
         <h3>아이디</h3>
         <div>
            <span class="ps_box box_right_space" style="display: inline-block; " >
               <input type="text" id="u_id" value="${user.u_id}" readonly/>
            </span>
         </div>
         <h3>비밀번호</h3>
         <input type="button" id="passwordChange" value="비밀번호변경"/>
         <h3>이름</h3>
         <div>
            <span class="ps_box box_right_space" style="display: inline-block; " >
               <input type="text" id="u_name" value="${user.u_name}" placeholder="이름 입력란입니다."/>
            </span>
         </div>
         <h3>성별</h3>
         <select id="u_gender">
            <option value="남자">남자</option>
            <option value="여자">여자</option>
         </select>
         
         <h3>보유 포인트</h3>
         <div>
            <span class="ps_box box_right_space" style="display: inline-block; " >
               <input type="text" id="u_point" value="${user.u_point}" readonly/>
            </span>
         </div>
         <h3>이메일</h3>
         <div>
            <span class="ps_box box_right_space" style="display: inline-block; " >
               <input type="text" id="u_email" value="${user.u_email}" placeholder="이메일 입력란입니다."/>
            </span>
         </div>
         <h3>핸드폰 번호</h3>
         <div>
            <span class="ps_box box_right_space" style="display: inline-block; " >
               <input type="text" id="u_phone" name="u_phone" value="${user.u_phone}" placeholder="전화번호 입력란입니다." maxlength="13"/>
            </span>
         </div>
         <h3>주소</h3>
         <div class="address_wrap" >
            <div class="address_wrap1" style="overflow: hidden;" >
               <div class="address_input_1_box" style=" width:475px; display:inline-block;">
                  <input  type="text" class="address_input_1" id="u_addr1" name="addr1" value="${user.u_addr1}" />
               </div>
               <button style="display:inline;" type="button" id="chan_add" onclick="execution_daum_address()">주소변경</button>
            </div>
            
            <div class="address_input_1_box" style="margin-top:10px;">
               <input type="text" class="address_input_2" id="u_addr2" name="u_addr2" value="${user.u_addr2}"/>
            </div>
            <div class="address_input_1_box" style="margin-top:10px;">
               <input type="text" class="address_input_3" id="u_addr3" name="u_addr3" value="${user.u_addr3}"/>
            </div>
         </div>
         
         
         
         
         
         <div class="register">
            <input type="button" id="update" value="정보수정"/>
            <input type="reset" id="reset" value="수정취소"/>
         </div>
      </div>   
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   var u_id = "${user.u_id}";
   var u_pass = "${user.u_pass}";
   
 //DB값 불러와서 지역 selected
	$("#u_gender").val('${user.u_gender}').prop('selected', true);
   
   
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
   
   
   
 //핸드폰번호 자동 하이픈
   function autoHypenPhone(str){
           str = str.replace(/[^0-9]/g, '');
           var tmp = '';
           if( str.length < 4){
               return str;
           }else if(str.length < 7){
               tmp += str.substr(0, 3);
               tmp += '-';
               tmp += str.substr(3);
               return tmp;
           }else if(str.length < 11){
               tmp += str.substr(0, 3);
               tmp += '-';
               tmp += str.substr(3, 3);
               tmp += '-';
               tmp += str.substr(6);
               return tmp;
           }else{              
               tmp += str.substr(0, 3);
               tmp += '-';
               tmp += str.substr(3, 4);
               tmp += '-';
               tmp += str.substr(7);
               return tmp;
           }
           return str;
       }

      var cellPhone = document.getElementById('u_phone');
      cellPhone.onkeyup = function(event){
              event = event || window.event;
              var _val = this.value.trim();
              this.value = autoHypenPhone(_val) ;
      }
</script>
</html>