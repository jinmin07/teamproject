
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
input[type=text], select, #p_content {
	width: 580px;
	padding: 12px 20px;
	margin: 8px 0;
	display: block;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=date]{
	width: 580px;
	padding: 12px 20px;
	margin: 8px 0;
	display: block;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit], input[type=reset] {
	width: 100px;
	color: white;
	padding: 14px 20px;
	margin: 0px auto;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button{
	display:flex;
	justify-content: center;
	align-items: center;
	width: 100px;
	color: white;
	padding: 14px 20px;
	margin: 0px auto;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.date{

}

.register{
	width: 210px;
	margin: 0px auto;
}

.row {
	margin-top:10px;
	margin: 0px auto;
	width: 600px;
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

.image{
	width:300px;
	margin:0px auto;
}
</style>
<form name="frm" enctype="multipart/form-data">
	<div class="row">
		<div class="image">
			<input type="hidden" name="p_image" value="${vo.p_image}"/>
			<img id="image" src="display?fileName=${vo.p_image}" width=300 height="300"  onerror="this.src='http://placehold.it/300x300'"/>
			<input type="file" name="file" style="display: none;" /><br />
		</div>
		<div>
			<input type="hidden" name="id" value="${vo.id}" readonly/> 
			<input type="hidden" name="tbl_code" value="${vo.tbl_code}" readonly/> 
			<h3>작성자</h3>
			<c:if test="${ user != null}">
				<input type="text" name="p_writer" value="${user.u_id}"/>
			</c:if>
			<h3>카테고리</h3>
		<select name="p_category">
			<option value="음식">음식</option>
			<option value="패션용품">패션용품</option>
			<option value="운동용품">운동용품</option>
			<option value="가전제품">가전제품</option>
			<option value="미용용품">미용용품</option>
		</select><br/>
			<h3>상품명</h3>
			<input type="hidden" name="old_title" placeholder="상품명" value="${vo.title}"/> <br/>
			<input type="text" name="title" placeholder="상품명" value="${vo.title}"/> <br/>
			<h3>링크</h3>
			<input type="text" name="p_link" placeholder="링크주소" value="${vo.p_link}"/> <br/>
			<h3>상품가격</h3>
			<input type="text" name="p_price" placeholder="상품 가격" value="${vo.p_price}"/> <br/>
			<h3>총 모집인원</h3>
			<input type="text" name="p_tot_member" placeholder="최대모집인원" value="${vo.p_tot_member}"/><br/>
			<div class="date">
				<h3>모집시작기간</h3>
		    	<input type="date"  name="start" value="${start}">
		    	<h3>모집종료기간</h3>
		    	<input type="date"  name="end" value="${end}">
	    	</div>
			<h3>모집장소</h3>
			<input type="text" class="address_input_2" name="p_local" placeholder="모집장소" value="${vo.p_local}"/>
			<div class="address_button" onclick="execution_daum_address()">
					<button>주소찾기</button>
			</div>
			<h3>한줄 소개</h3>
			<textarea id="p_content" name="p_content" style="height: 200px;width: 600px;resize:none;" placeholder="상품에 대한 설명을 써주세요">${vo.p_content}</textarea>
		</div>
	</div>	
	<hr/>
	<div class="register">
		<input type="submit" value="수정하기" /> 
		<input type="reset" value="등록취소" />
	</div>
</form>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>

	var category = $("#p_category").val('${vo.p_category}').prop('selected', true);
	
	$("#image").on("click", function() {
		$(frm.file).click();
	});
	
	$(frm.file).on("change", function(e) {
		var file = $(this)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

	$(frm).on("submit", function(e) {
		e.preventDefault();
		var image = $(frm.p_image).val();
		var id = $(frm.id).val();
		var p_category = $(frm.p_category).val();
		var title = $(frm.title).val();
		var p_link = $(frm.p_link).val();
		var p_price = $(frm.p_price).val();
		var p_salePrice = $(frm.p_salePrice).val();
		var p_tot_member = $(frm.p_tot_member).val();
		var date_start = $(frm.start).val();
		var date_end = $(frm.end).val();
		var p_local = $(frm.p_local).val();
		var p_writer = $(frm.p_writer).val();
		
		if (p_price == "" || p_link == "" || image == "") {
			alert("파일등록,상품가격과 상품페이지주소를 입력하세요.");
			return;
		}
		if (!confirm("수정하시겠습니까?")) return;
		sock_notice.send("admin");
		
		frm.action = "/purchase/update";
		frm.method = "post";
		frm.submit();
	
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
</script>