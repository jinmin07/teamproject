<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/home.css"/>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   
   <style>
form {
   width: 600px;
   margin: 0 auto;
   border-top: 1px solid gray;
   padding-top: 5px;
   padding-left: 100px;
}

button, input[type=button] {
   background-color: #fff;
    border-color: #35c5f0;
    color: #35c5f0;
   font-size: 16px;
   margin: 0px;
   padding: 5px 10px;
   font-family: "맑은고딕";
   font-weight: 600;
}
 input[type=submit] {
   background-color: #35c5f0;
    border-color: #35c5f0;
    color: #fff;
   font-size: 16px;
   margin: 0px;
   padding: 5px 10px;
   font-family: "맑은고딕";
   font-weight: 600;
}

input[type=button]:hover{
   background-color: #effbff;
}

input[type=submit]:hover{
	border-color: #09addb;
    background-color: #09addb;
}

button:hover {
	background-color: #effbff;
}

input:focus, select:focus {outline:none;}

.join_title {
   margin: 19px 0 8px;
   font-size: 14px;
   font-weight: 700;
}


.ps_box, .ps_box_disable, .address_input_1_box, .address_input_2_box,.address_input_3_box, .mail_check_input_box{
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

.id_input, .address_input_1,.mail_input,.mail_check_input{
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

.id_check,#address_button,#mail_check_button,#mail_check_button_warn{
   float: right;
   margin-right: 140px;
   height: 50px;
   display: inline;
}

.pw_input, .name_input, .age_input, .address_input_2,.address_input_3,.gender_input,.phone_input{
   display: block;
   position: relative;
   width: 435px;
   height: 29px;
   line-height: 29px;
   border: none;
   background: #fff;
   font-size: 15px;
   box-sizing: border-box;
   z-index: 10;
}



</style>
</head>
<body>
   <span style="margin-left:360px;margin-bottom:5px; font-size: 20px; font-weight: 600;font-size:30px;">회원가입</span>
   <form name="frm">
      <h3 class="join_title" >아이디</h3> 
      <div>
         <span class="ps_box box_right_space" style="display: inline-block; width:357px;" >
            <input type="text" name="id" class="id_input" maxlength="20" >
         </span>
         <button type="button" class="id_check" >중복확인</button>      
      </div>
      
      <h3 class="join_title" style="margin-top:20px;">비밀번호</h3> 
      <span class="ps_box box_right_space" >
         <input type="password" name="pass" class="pw_input"  maxlength="20"/>
      </span>
      
      <h3 class="join_title" style="margin-top:20px;">이름</h3> 
      <span class="ps_box box_right_space" >
         <input type="text" name="name" class="name_input" maxlength="40"/>
      </span>
      
      <h3 class="join_title" style="margin-top:20px;">나이</h3> 
      <span class="ps_box box_right_space" >
         <input type="text" name="age" class="age_input" maxlength="3" />
      </span> 
      
      <h3 class="join_title" style="margin-top:20px;">주소</h3> 
      <div class="address_wrap" >
         <div class="address_input_1_wrap" >
            <div class="address_input_1_box" style=" width:357px; display:inline-block;">
               <input class="address_input_1" name="addr1" placeholder="우편번호" />
            </div>   
            <button type="button" id ="address_button" onclick="execution_daum_address()">주소찾기</button>
         </div>
         <div class="address_input_2_wrap" style="margin-top:20px;" >
            <div class="address_input_2_box">
               <input class="address_input_2" name="addr2" placeholder="주소"/>
            </div>
         </div>
         <div class="address_input_3_wrap" style="margin-top:20px;">
            <div class="address_input_3_box">
               <input class="address_input_3" name="addr3" placeholder="상세주소"/>
            </div>
         </div>
      </div>
      
      
      <h3 class="join_title" style="margin-top:20px;">성별</h3> 
      <select class="ps_box box_right_space"  name="gender">
         <option value="남자" >남자</option>
         <option value="여자" >여자</option>
      </select>
      
      <h3 class="join_title" style="margin-top:20px;">이메일</h3> 
      <div>
         <span class="ps_box box_right_space" style="display: inline-block; width:357px;" >
            <input type="text" name="email" class="mail_input" maxlength="100" placeholder="이메일"/>
         </span>
         <input type="button" id="mail_check_button" value="번호발송"/>
      </div>
      
      
      
      <div style="margin-top:20px;">
         <span class="mail_check_input_box" id="mail_check_input_box_false" style="display: inline-block; width:357px;">
            <input type="text"  name="mail_check_input" class="mail_check_input" placeholder="인증번호"/>
         </span>
         <input type="button" id="mail_check_button_warn" value="번호확인"/>
      </div>
      
      <!-- <span id="mail_check_input_box_warn">인증</span><br/>-->
      
      <h3 class="join_title" style="margin-top:20px;">핸드폰번호</h3> 
      <span class="ps_box box_right_space" >
         <input type="text" name="phone" class="phone_input" id="phone" maxlength="13"/>
      </span>
      
      
      <div style="margin-top:20px; ">
         <input type="submit" value="회원가입" style="width:460px; height:52px;">
      </div>
   </form>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">

</script>
 
<script>

   var code = "";
   $(frm).on("submit",function(e) {
            e.preventDefault();
            var u_id = $(frm.id).val();
            var u_pass = $(frm.pass).val();
            var u_name = $(frm.name).val();
            var u_age = $(frm.age).val();
            var u_addr1 = $(frm.addr1).val();
            var u_addr2 = $(frm.addr2).val();
            var u_addr3 = $(frm.addr3).val();
            var u_gender = $(frm.gender).val();
            var u_email = $(frm.email).val();
            var u_phone = $(frm.phone).val();
            
            if (u_id == "" || u_pass == "" || u_name == "" || u_age == ""
				|| u_addr1 == "" || u_addr2 == "" || u_gender == "" || u_email == ""
				|| u_phone == "") {
					alert("내용을 모두 입력하세요");
					return;
			}
            
            if (!confirm("등록하시겠습니까?")) return;
            
            $.ajax({
               type : "post",
               url : "/member/insert",
               data : {
                  "u_id" : u_id,
                  "u_pass" : u_pass,
                  "u_age" : u_age,
                  "u_name" : u_name,
                  "u_addr1" : u_addr1,
                  "u_addr2" : u_addr2,
                  "u_addr3" : u_addr3,
                  "u_gender" : u_gender,
                  "u_email" : u_email,
                  "u_phone" : u_phone
               },
               success : function() {
                 location.href = "/";
               }
            });
         });
   
   /* 인증번호 이메일 전송 */
   $("#mail_check_button").click(function(){
       
       var email = $(".mail_input").val();            // 입력한 이메일
       var checkBox = $(".mail_check_input");        // 인증번호 입력란
       var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
       
       if(email==""){
    	   alert("이메일 주소를 입력해주세요."); 
    	   return;
       }
       
       $.ajax({
           
           type:"GET",
           url:"mailCheck?email=" + email,
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
   $("#mail_check_button_warn").click(function(){
       
       var inputCode = $(".mail_check_input").val();        // 입력코드    
       var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
       
       if(inputCode == code){      
             console.log(inputCode);// 일치할 경우
             alert("인증번호가 일치합니다")
       } else {               
             console.log(inputCode);// 일치하지 않을 경우
             alert("인증번호가 일치하지 않습니다.")
       }    
       
   });
   
   /* 다음 주소 연동*/
   function execution_daum_address(){
      new daum.Postcode({
           oncomplete: function(data) {
     
              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var addr = ''; // 주소 변수
               var extraAddr = ''; // 참고항목 변수
               
              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
              }
               
               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
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
                  $(".address_input_3").attr("readonly",false);
                   $(".address_input_3").focus();
               
    
           }
       }).open();    
   }
   
   //아이디 중복검사
   $('.id_check').on("click", function(){

      var u_id = $('.id_input').val();         // .id_input에 입력되는 값
  	  if(u_id == ""){
  		  alert("아이디를 입력하세요.");
  		  return;
  	  }  
      $.ajax({
         type : "post",
         url : "/member/memberIdChk",
         data : {"u_id":u_id},
         success : function(result){
            if(result == 'fail'){
               console.log(result);
               alert("아이디가 이미 존재합니다");   
               $(".id_input").val("");
               $(".id_input").focus();
            } else {
               console.log(result);
               alert("사용가능한 아이디 입니다.");   
               $(".pw_input").focus();
            }
         }
      }); // ajax 종료   

   });// function 종료
   
   
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

      var cellPhone = document.getElementById('phone');
      cellPhone.onkeyup = function(event){
              event = event || window.event;
              var _val = this.value.trim();
              this.value = autoHypenPhone(_val) ;
      }
</script>
</html>