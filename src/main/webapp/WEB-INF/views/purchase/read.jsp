<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<style>
	.head:hover {cursor: pointer; background: lightgray;}
		#query .content {display: none;}
		.container {
		  width: 400px;
		  background-color: #ddd;
		}
		
		.skills {
		  text-align: right;
		  padding-top: 10px;
		  padding-bottom: 10px;
		  color: white;
		}
		.html {background-color: #04AA6D;}
		#btn_member_end {background: lightgray;}
</style>
<h1>[상품조회]</h1>

<hr/>
<div style="overflow:hidden">
		
</div>
	<div id="purchase_content">
	<form name="frm" enctype="multipart/form-data">
		<div style="text-align: left; margin-bottom: 10px;"> 공동생할 > ${vo.p_category} </div>
		<div style="overflow : hidden;">
			<div style="float: left; margin-right: 20px;">
				<img id="image" src="/display?fileName=${vo.p_image}" width=350/>
			</div>
			<div style="float: left; width: 450px; text-align: left;">
				<c:if test="${vo.p_writer!=user.u_id}">
					<img id="myfeed_insert" style="float: right;" src="../resources/course/upload.png" width=20>
				</c:if>
				<h3>${vo.id}</h3>
				<h3>${vo.title}</h3>
				<h5>모임장소 : ${vo.p_local}</h5>
				<h5>모임날짜: ${vo.date_start} - ${vo.date_end }</h5>
				<h5>모집인원 : ${vo.p_cnt_member} / ${vo.p_tot_member}</h5>
				<div>
					<div class="container">
		  				<div class="skills html" style="width: calc(${vo.p_cnt_member}/${vo.p_tot_member} * 400px) ">${vo.p_cnt_member}명 </div>
					</div>
				</div>
				<h5>신청인원 : ${vo.p_cnt_member}</h5>
			</div>
		</div>
		<div style ="overflow: hidden;">
			<div id="chk_user" style="float: left; width: 330px; text-align: left; margin-right: 20px;">
				${vo.p_writer}
				<c:if test="${vo.p_writer==user.u_id}">
					<span><a href="#" style="float: right;">신청멤버 확인</a></span>
				</c:if>
			</div>
			<div id="reg_user" style="float: left; width: 400px;">
				<c:if test="${vo.p_cnt_member != vo.p_tot_member}">
					<button id="btn_member_insert" style="width: 150px;">신청하기</button>
				</c:if>
				<c:if test="${vo.p_cnt_member == vo.p_tot_member}">
					<button id="btn_member_end" style="width: 150px;" disabled="disabled">신청하기</button>
				</c:if>
				<c:if test="${chk_member==1}">
					<button id="btn_member_delete" style="width: 150px;">취소하기</button>
				</c:if>
				<c:if test="${vo.p_writer==user.u_id}">
					<button id="btn_purchase_delete" style="width: 150px;">삭제하기</button>
				</c:if>
			</div>
		</div>
		</form>
	</div>
	<hr/>
	<div style="text-align: left;">
		<h2>세부사항</h2>
		<h5>카테고리 : ${vo.p_category}</h5>
		<h5>링크 : ${vo.p_link}</h5>
		<h5>가격 : ${vo.p_salePrice}</h5>
		<h5>모임장소 : ${vo.p_local}</h5>
		<div id="map" style="width:100%;height:350px;"></div>
	</div>
	<hr/>
	<div style="text-align: left; width: 800px;">
		<h2>문의사항 ${cnt_query}개</h2>
		<span><a href="/purchase/query_insert?id=${vo.id}" style="float: right;">문의하기</a></span>
		<div id="query" style="clear: both;"></div>
	</div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="list">
				<div class="head">
					<span width=80 class="p_query_id">{{p_query_id}}</span>
					<span width=150 class="p_query_writer">{{p_query_writer}}</span>
					<span width=400>{{p_query_date}}</span>
					<span width=150>
						<img src="../resources/course/lock.png" width=20 style="display:{{printOpen p_openable}}"/>
					</span>
					<input type="hidden" class="open" value="{{p_openable}}"/>
					<span width=150 class="cnt_reply">{{p_reply_state}}</span>
				</div>
				<div class="content">
					<div>Q. {{p_query_content}} <a class="query_del" href="{{p_query_id}}"></a></div>
					<div class="reply"></div>
				</div>
			</div>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("printOpen", function(p_openable){
			if(p_openable != "f"){
				return "none";
			}
		});
	</script>
	
	<c:if test="${user.u_id == vo.p_writer && user.u_id != null}">
		<div>
			<input type="submit" value="상품수정"/>
			<input type="button"  value="글삭제" id="btnDelete"/>
		</div>
		</c:if>
	<c:if test="${user.u_id != vo.p_writer || user.u_id == null}">
		<div></div>
	</c:if>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cedbcd9eb728fa4063a08e6951fa6f47&libraries=services"></script>

<script>

var id= "${vo.id}";
var p_writer = "${vo.p_writer}";
var login_id = "${user.u_id}";
var p_local = "${vo.p_local}";
getList();

	//마이피드로 옮기기
	$("#myfeed_insert").on("click", function(){
		var tbl_code = "${vo.tbl_code}";
		if(!confirm("내 피드로 옮기시겠습니까?")) return;
		$.ajax({
			type: "post",
			url: "/purchase/feed_insert",
			data: {"user_id": login_id, "tbl_code": tbl_code, "primary_id": id},
			success: function(data){
				if(data == 0 ){
					alert("내 피드로 옮겨졌습니다.");
				}else{
					alert("이미 내 피드에 있는 글입니다.");
				}
			}
			
		});
	});

  //첨부파일 삭제
$("#images").on("click", ".box a",function(e){
	e.preventDefault();
	if(!confirm("첨부 파일을 삭제하실래요?")) return;
	var box=$(this).parent();
	var p_image=$(this).attr("href");
	$.ajax({
		type: "post",
		url: "/purchase/delete",
		data: {"p_image": p_image},
		success: function(){
			alert("삭제성공!");
			box.remove();
		}
	});
}); 
 
 

$(frm).on("submit", function(e){
	e.preventDefault();
	var p_image=$(frm.p_image).val();
	var title=$(frm.title).val();
	var p_price=$(frm.p_salePrice).val();
	var p_category=$(frm.p_category).val();
	
	if(title=="" || p_price=="" || p_category==""){
		alert("모든 내용을 입력해 주세요!");
		return;
	}if (p_price == '' || p_price.replace(/[0-9]/g, '')) {
		alert('가격을 숫자로 입력하세요.');
		$(frm.p_price).focus();
		return;
	}
	if(!confirm("상품정보를 수정하실래요?")) return;
    frm.action="/purchse/update";
    frm.method="post";
    frm.submit();
}); 

 $("#image").on("click", function(){
	$(frm.file).click();
});

$(frm.file).on("change", function(e){
	var file=$(this)[0].files[0];
	$("#image").attr("src", URL.createObjectURL(file));
}); 

$("#btnDelete").on("click",function(){	
	if(!confirm(id + "번의 게시물을 삭제하시겠습니까")) return;
	$.ajax({
		type : "post",
		url : "/purchase/delete",
		data : {"id":id},
		success : function(){
			alert("삭제되었습니다.");
			location.href = "/purchase/list";
		}
	});
});

// 문의글 삭제 관련 버튼
$("#query").on("click", ".list .content a", function(e){
	e.preventDefault();
	var query_id = $(this).attr("href");
	if(!confirm("문의글을 삭제하시겠습니까?")) return;
	
	$.ajax({
		type:"post",
		url: "purchase/delete_query",
		data: {"p_query_id": query_id},
		success : function(){
			alert("삭제가 완료되었습니다.");
			getList();
		}
	});
	
});



 
 $("#chk_user").on("click", "span a", function(e){
		e.preventDefault();
		var url = "/purchase/purchase_member?id=" + id;
		window.open(url,"", "width=400, height=400, top=200, left=900, location=no");
});
 
	// 신청 취소하기 버튼
	$("#reg_user").on("click","#btn_member_delete", function(){
		if(!confirm("신청 취소하시겠습니까?")) return;
		
		$.ajax({
			type:"post",
			url: "/purchase/delete_member",
			data: {"p_id": id, "p_member" : login_id},
			success : function(){
				alert("신청이 취소되었습니다.");
				getLocation();
			}
		});
	});
	
 
 $("#reg_user").on("click","#btn_member_insert", function(){
		if(p_writer == login_id ){
			alert("작성하신 컨텐츠로 신청이 불가능합니다.");
			return;
		}
		if(!confirm("신청하시겠습니까?")) return;
		
		$.ajax({
			type:"post",
			url: "/purchase/insert_member",
			data: {"p_id": id, "p_member" : login_id },
			success : function(result){
				if(result==0){
					alert("신청이 완료되었습니다.");
					getLocation();
				}else{
					alert("이미 신청하신 컨텐츠입니다.");
				}
			}
		});
		
		
	});
 
 function getList(){
		$.ajax({
			type: "get",
			url: "/purchase/list_query.json",
			dataType: "json",
			data: {"p_id": id},
			success: function(data){
				var temp = Handlebars.compile($("#temp").html());
				$("#query").html(temp(data));
			}
		});
	}
 
 $("#query").on("click", ".list .head", function(){
		$("#query .list .content").each(function(){
			$(this).hide();
		});
		
		var open = $(this).find(".open").val();
		var content = $(this).parent().find(".content");
		var query_del = $(this).parent().find(".content .query_del");
		var reply = $(this).parent().find(".reply");
		var query_id = $(this).find(".p_query_id").html();
		var query_writer = $(this).find(".p_query_writer").html();
		if(open == "f" && query_writer != login_id && p_writer !=login_id ){
			alert("비공개 문의글입니다.");
		}else{
			$.ajax({
				type: "get",
				url : "/purchase/list_reply.json",
				data: {"p_query_id" : query_id},
				success: function(data){
					if(data == null || data ==""){
						if(p_writer == login_id){
							var str = "<textarea class='p_reply_content' rows='5' cols='100'></textarea>"
							str += "<button class='btnReply'>등록</button>"
							reply.html(str);
						}
						if(login_id == query_writer){
							query_del.html("X");
						}
					}else{
						var str = "A. " + data.p_reply_content;
						reply.html(str);
					}
					content.show();
				}
			});
		}
	});
 
	//문의 답글 등록
	$("#query").on("click", ".list .content button", function(){
		var query_id = $(this).parent().parent().parent().find(".p_query_id").html();
		var reply_content = $(this).parent().find(".p_reply_content").val();
		
		if(!confirm("답글을 등록하시겠습니까?")) return;
		
		$.ajax({
			type: "post",
			url: "/purchase/reply_insert",
			data: {"p_query_id":query_id, "p_reply_content" : reply_content, "p_reply_writer": p_writer},
			success: function(){
				alert("답글 등록이 완료되었습니다.");
				getList();
			}
		});
	});
	
	// 새로고침 기능
	function getLocation(){
		var url = "/purchase/read?id=" + id;
		location.href=url;
	}

 
 
 
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch(p_local, function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">모임장소!</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
</script>