<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<style>
	form {
		width: 960px;
	}
	input[type=text]{
		width: 100%;
		margin-bottom: 20px;
		outline:none;
		border:none;
		border-bottom: 1px solid gray;
		font-size:20px;
	}
	#images img {
		width: 160px;
		border-radius: 10px;
	}
	#images .box {
		width:170px;
		heigh:200px;
		float:left;
		margin-left:20px;
	}
</style>
<h1>[상품조회]</h1>

<hr/>
<form name="frm" enctype="multipart/form-data" >
<div style="overflow:hidden">
		<img id="image" src="/display?fileName=${vo.p_image}" width=350/>
</div>
		<div>
			<h3>${vo.title}</h3>
			<h3>모집지역:</h3>
			<h3>세부거래위치:${vo.p_local}</h3>
			<input type="hidden" name="p_local" value="${vo.p_local}"/>
			<h3>링크: ${vo.p_link}</h3>
			<h3>모임날짜: ${vo.date_start} - ${vo.date_end }</h3>
			<h3>모집인원: ${vo.p_cnt_member} / ${vo.p_tot_member}</h3>
			<h3>가격: ${vo.p_salePrice}</h3>	
		<div id="map" style="width:100%;height:350px;"></div>
		<c:if test="${user.u_id == vo.p_writer && user.u_id != null}">
		<div>
			<input type="submit" value="상품수정"/>
			<input type="button"  value="글삭제" id="btnDelete"/>
		</div>
		</c:if>
		<c:if test="${user.u_id != vo.p_writer || user.u_id == null}">
			<div></div>
		</c:if>
	</div>
	
	<div style ="overflow: hidden;">
				<c:if test="${user.u_id == vo.p_writer && user.u_id != null}">
					<div id="chk_user" style="float: left; width: 330px; text-align: left; margin-right: 20px;">
						${vo.p_writer}<span><a href="#" style="float: right;">신청멤버 확인</a></span>
					</div>
				</c:if>
				<div id="reg_user" style="float: left; width: 400px;">
					<button style="width: 390px;" id="btn_register">신청하기</button>
				</div>
	</div>	
	
	
	<div style="text-align: left; width: 800px;">
		<h2>문의사항 ${cnt_query}개</h2>
		<span><a href="/purchase/reply_insert?id=${vo.id}" style="float: right;">문의하기</a></span>
		<div id="query" style="clear: both;"></div>
	</div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="list">
				<span width=80 class="p_query_id">{{p_query_id}}</span>
				<span width=150 class="p_query_writer">{{p_query_writer}}</span>
				<span width=400>{{p_query_date}}</span>
				<span width=150>
					<img src="../resources/lock.png" width=20 style="display:{{printOpen p_openable}}"/>
				</span>
				<input type="hidden" class="open" value="{{p_openable}}"/>
				<span width=150 class="cnt_reply">{{p_reply_state}}</span>
				<div class="content">
					<div>Q. {{p_query_content}}</div>
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
</form>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cedbcd9eb728fa4063a08e6951fa6f47&libraries=services"></script>

<script>

var id= "${vo.id}";
var p_writer = "${vo.p_writer}";
var login_id = "${user.u_id}";
var p_local = "${vo.p_local}";
getList();

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
	var p_price=$(frm.p_price).val();
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

 
 $("#chk_user").on("click", "span a", function(e){
		e.preventDefault();
		var url = "/purchase/purchase_member?id=" + id;
		window.open(url,"", "width=400, height=400, top=200, left=900, location=no");
});
 
 $("#btn_register").on("click", function(){
		if(p_writer == id ){
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
					location.href = "/purchase/list";
				}else{
					alert("이미 신청하신 컨텐츠입니다.");
					location.href = "/purchase/list";
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
 
 $("#query").on("click", ".list", function(){
		$("#query .list .content").each(function(){
			$(this).hide();
		});
		
		var open = $(this).find(".open").val();
		var content = $(this).find(".content");
		var reply = $(this).find(".reply");
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
					}else{
						var str = "<div class='reply'>";
						str += "A. " + data.p_reply_content;
						str += "</div>";
						reply.html(str);
					}
					content.show();
				}
			});
		}
	});

 
 
 
 
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