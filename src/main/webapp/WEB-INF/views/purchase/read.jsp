<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<style>
	#purchase_content{width:960px; margin:0 auto;}
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
		
		#home::before {
    		content: '';
    		background: url(https://pickcrawl.com/web/images/sub/home_icon.png) center no-repeat;
    		background-size: contain;
    		width: 15px;
    		height: 15px;
    		display: inline-block;
    		margin-right: 5px;
    		vertical-align: middle;
    		line-height: 13px;
    		margin-top: -4px;
		}
		<!-- 문의하기 CSS-->
		.sub_inner_right {
    		float: left;
    		width: 100%;
    		display: inline-block;
    		box-sizing: border-box;
    		margin-bottom: 20px;
		}
		.review_comment {
    		border: 1px solid #e1e1e1;
    		width: 420px;
    		padding: 10px;
    		margin-top: 20px;
    		margin-left: 18px;
		}
		
		.review_comment_head h3::before {
    		content: '';
    		background: url(https://pickcrawl.com/web/images/sub/review_icon.png)center no-repeat;
    		background-size: contain;
    		display: inline-block;
    		width: 20px;
    		height: 15px;
    		margin-right: 25px;
		}
		.review_comment_head {
    		border-bottom: 1px solid #e1e1e1;
		}
		.review_comment_head h3 {
			text-align:left;
    		font-size: 16px;
    		color: #f43143;
    		font-weight: 500;
    	}
		<!-- 문의하기 CSS 끝-->
		.new_profile_wrap {
    		margin: 0 auto;
    		float: right;
    		border: 1px solid #c7c7c7;
    		box-sizing: border-box;
		}
		 button{
			width:100px;
			font-size:16px;
			margin:0px;
			padding: 5px 15px;
			font-family:"맑은고딕";
			font-weight: 600;
			color: #fff;    	
			background-color: #35c5f0;
			margin-right:10px;
		}
		 button:hover{
			background-color: #09addb;
		}
</style>

<div style="overflow:hidden" >
	<div id="purchase_content" >
	<form name="frm" enctype="multipart/form-data">
		<div id="home" style="text-align: left; margin-bottom: 10px;"> 공동구매 > ${vo.p_category} </div>
		<div style="overflow : hidden;">
			<div style="float: left; margin-right: 20px;">
				<img id="image" src="../resources/purchaseimg/${vo.p_image}" width=460 height= 350/>
			</div>
			<div style="float: left; width: 450px; text-align: left;">
				<c:if test="${vo.p_writer!=user.u_id}">
					<img id="myfeed_insert" style="float: right;" src="https://pickcrawl.com/web/images/common/list_heart.png" width=20>
				</c:if>
				<h3>상품번호:${vo.id}</h3>
				<h3>${vo.title}</h3>
				<h5>모임장소 : ${vo.p_local}</h5>
				<h5>모집날짜: ${vo.date_start} - ${vo.date_end }</h5>
				<h5>모집인원 : ${vo.p_cnt_member} / ${vo.p_tot_member}</h5>
				<div>
					<div class="container" style="position:relative;">
		  				<div class="skills html" style="width: calc(${vo.p_cnt_member}/${vo.p_tot_member} * 400px)"></div>
						<p style="position:absolute;right:-60px;top:calc(0% - 19px);">
                           <span style="color:#f43143;">${vo.p_cnt_member}</span>/ ${vo.p_tot_member}명
                        </p>
					</div>
				</div>
		
			</div>
		</div>
	</div>
		<div style ="overflow: hidden; width:960px; margin:0 auto;">
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
	<hr style="width:960px;"/>
<div style ="overflow: hidden; width:960px; margin:0 auto;">	
	<div style="text-align: left; width: 500px; float: left;">
		<h2>세부사항</h2>
		<h5>▶ 카테고리 : ${vo.p_category}</h5>
		<h5>▶링크 : ${vo.p_link}</h5>
		<h5>▶가격 : ${vo.p_salePrice}</h5>
		<h5>▶모임장소 : ${vo.p_local}</h5>
		<div id="map" style="width:100%;height:350px;"></div>
	</div>
		
	<div class="sub_inner_right sub_inner_right02" style="float: left;">	
	<div class="inner_review">
		<div class="review_comment" id="position03">
			<div class="review_comment_head">
				<h3>
					문의(<span id="comment_num">${cnt_query}</span>)
				</h3>
			</div>
			<div class="review_comment_con">
				<div id="cfrm">
					<br/>						
					<div class="msg ac fs17 view_con_login">
						<a href="/purchase/query_insert?id=${vo.id}">
						문의사항을 입력하시려면 여기를 클릭하세요.							
						</a>
					</div>
					<br/>
					<div id="query" style="clear: both;"></div>
				</div>
			</div>
		</div>
	</div>
	</div>	
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
					<div>Q. {{p_query_content}} <a class="query_del" href="{{p_query_id}}" query_writer="{{p_query_writer}}"></a></div>
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
	var title = "${vo.title}";
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

	$("#btnDelete").on("click", function(){
		if(!confirm(id + "게시글을 삭제하시겠습니까")) return;
		var n_content = "모집 신청하신 공동구매 [" + title + "] 진행 건이 작성자의 요청에 의해 삭제되었습니다. 이용에 참고하시기 바랍니다."; 
		sock_notice.send("admin");
		$.ajax({
			type : "post",
			url : "/purchase/delete",
			data : {"id":id},
			success : function(){
				alert("삭제가 완료되었습니다.");
				$.ajax({
					type: "post",
					url: "/notice/insert",
					data: {"tbl_code": "P", "tbl_id":id,"sender": "admin", "content": n_content, "n_state": 1},
					success : function(){
						alert("알림 전송이 완료되었습니다.");
						location.href = "/purchase/list";
					}
				});
			}
		});
	});

	// 문의글 삭제 관련 버튼
	$("#query").on("click", ".list .content a", function(e){
		e.preventDefault();
		var query_id = $(this).attr("href");
		var query_writer = $(this).attr("query_writer");
		if(!confirm("문의글을 삭제하시겠습니까?")) return;
		
		$.ajax({
			type:"post",
			url: "purchase/delete_query",
			data: {"p_query_id": query_id},
			success : function(){
				$.ajax({
					type: "post",
					url: "/notice/insert",
					data: {"tbl_code": tbl_code, "tbl_id":id,"sender": "admin", "receiver": p_writer, "content": n_content,  "n_state": 1},
					success : function(){
						alert("삭제가 완료되었습니다.");
						getList();
					}
				});
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
		var query_writer = $(this).parent().parent().parent().find(".p_query_writer").html();
		
		if(!confirm("답글을 등록하시겠습니까?")) return;
		sock_notice.send("admin");
		var n_content = "문의하신 공동구매 [" + title + "] 진행 건에 대한 답변이 등록되었습니다."; 
		$.ajax({
			type: "post",
			url: "/purchase/reply_insert",
			data: {"p_query_id":query_id, "p_reply_content" : reply_content, "p_reply_writer": p_writer},
			success: function(){
				$.ajax({
					type: "post",
					url: "/notice/insert",
					data: {"tbl_code": "P", "tbl_id":id,"sender": "admin", "receiver": qeury_writer, "content": n_content},
					success : function(){
						alert("답글 등록이 완료되었습니다.");
						getList();
						location.href = "/purchase/list";
					}
				});
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