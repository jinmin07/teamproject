<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스터디/취미</title>
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
</head>
<body>	
	<div id="course_content">
		<div style="text-align: left; margin-bottom: 10px;"> 취미/스터디 > ${category.category} > ${category.subcategory} </div>
		<div style="overflow : hidden;">
			<div style="float: left; margin-right: 20px;">
				<img src="../resources/course/${vo.tbl_code}.jpg" width=350>
			</div>
			<div style="float: left; width: 450px; text-align: left;">
				<img style="float: right;" src="../resources/course/upload.png" width=20>
				<h3>${vo.title}</h3>
				<h5>모임장소 : ${vo.c_place}</h5>
				<h5>모임일정 : <f:formatDate value="${vo.date_start}" pattern="yy-MM-dd"/> - <f:formatDate value="${vo.date_end}" pattern="yy-MM-dd"/></h5>
				<h5>모임시간 : ${vo.c_time}</h5>
				<h5>모집인원 : ${vo.c_cnt_member} / ${vo.c_tot_member}</h5>
				<div>
					<div class="container">
		  				<div class="skills html" style="width: calc(${vo.c_cnt_member}/${vo.c_tot_member} * 400px)">${vo.c_cnt_member}명 </div>
					</div>
				</div>
				<h5>신청인원 : ${vo.c_cnt_member}</h5>
			</div>
		</div>
		<div style ="overflow: hidden;">
			<div id="chk_user" style="float: left; width: 330px; text-align: left; margin-right: 20px;">
				${vo.c_writer}
				<c:if test="${vo.c_writer==user.u_id}">
					<span><a href="#" style="float: right;">신청멤버 확인</a></span>
				</c:if>
			</div>
			<div id="reg_user" style="float: left; width: 400px;">
				<c:if test="${vo.c_cnt_member != vo.c_tot_member}">
					<button id="btn_member_insert" style="width: 150px;">신청하기</button>
				</c:if>
				<c:if test="${vo.c_cnt_member == vo.c_tot_member}">
					<button id="btn_member_end" style="width: 150px;" disabled="disabled">신청하기</button>
				</c:if>
				<c:if test="${chk_member==1}">
					<button id="btn_member_delete" style="width: 150px;">취소하기</button>
				</c:if>
				<c:if test="${vo.c_writer==user.u_id}">
					<button id="btn_course_delete" style="width: 150px;">삭제하기</button>
				</c:if>
				<c:if test="${vo.c_writer==user.u_id}">
					<button id="btn_course_update" style="width: 150px;">수정하기</button>
				</c:if>
			</div>
		</div>
	</div>
	<hr/>
	<div style="text-align: left;">
		<h2>세부사항</h2>
		<h5>모집분야 : ${category.category} - ${category.subcategory}</h5>
		<h5>모집성별 : ${vo.c_gender}</h5>
		<h5>모임지역  / 모임장소 : ${vo.c_local} / ${vo.c_place}</h5>
		<h5>모임시간 : ${vo.c_time}</h5>
		<h5>비용 : ${vo.c_fee}</h5>
		<h5>세부내용<br/>${vo.c_content}</h5>
	</div>
	<hr/>
	<div style="text-align: left; width: 800px;">
		<h2>문의사항 ${cnt_query}개</h2>
		<span><a href="/query_insert?id=${vo.id}" style="float: right;">문의하기</a></span>
		<div id="query" style="clear: both;"></div>
	</div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="list">
				<div class="head">
					<span width=80 class="c_query_id">{{c_query_id}}</span>
					<span width=150 class="c_query_writer">{{c_query_writer}}</span>
					<span width=400>{{c_query_date}}</span>
					<span width=150>
						<img src="../resources/course/lock.png" width=20 style="display:{{printOpen c_openable}}"/>
					</span>
					<input type="hidden" class="open" value="{{c_openable}}"/>
					<span width=150 class="cnt_reply">{{c_reply_state}}</span>
				</div>
				<div class="content">
					<div>Q. {{c_query_content}} <a class="query_del" href="{{c_query_id}}"></a></div>
					<div class="reply"></div>
				</div>
			</div>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("printOpen", function(c_openable){
			if(c_openable != "f"){
				return "none";
			}
		});
	</script>
</body>
<script>
	var id = "${vo.id}";
	var writer = "${vo.c_writer}";
	var login_id = "${user.u_id}";
	getList();

	// 게시글 삭제
	$("#btn_course_delete").on("click", function(){
		if(!confirm("게시글을 삭제하시겠습니까?")) return;
		$.ajax({
			type:"post",
			url: "/delete_course",
			data: {"c_id": id},
			success : function(){
				alert("삭제가 완료되었습니다.");
				location.href="/cou/list";
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
			url: "/delete_query",
			data: {"c_query_id": query_id},
			success : function(){
				alert("삭제가 완료되었습니다.");
				getLocation();
			}
		});
		
	});
	
	// 문의글 세부내용 출력
	$("#query").on("click", ".list .head", function(){
		$("#query .list .content").each(function(){
			$(this).hide();
		});
		
		var open = $(this).find(".open").val();
		var content = $(this).parent().find(".content");
		var query_del = $(this).parent().find(".content .query_del");
		var reply = $(this).parent().find(".reply");
		var query_id = $(this).find(".c_query_id").html();
		var query_writer = $(this).find(".c_query_writer").html();
		if(open == "f" && query_writer != login_id && writer !=login_id ){
			alert("비공개 문의글입니다.");
		}else{
			$.ajax({
				type: "get",
				url : "/list_reply.json",
				data: {"c_query_id" : query_id},
				success: function(data){
					if(data == null || data ==""){
						if(writer == login_id){
							var str = "<textarea class='c_reply_content' rows='5' cols='100'></textarea>"
							str += "<button class='btnReply'>등록</button>"
							reply.html(str);
						}
						if(login_id == query_writer){
							query_del.html("X");
						}
					}else{
						var str = "A. " + data.c_reply_content;
						reply.html(str);
					}
					content.show();
				}
			});
		}
	});
	
	//문의 답글 등록
	$("#query").on("click", ".list .content button", function(){
		var query_id = $(this).parent().parent().parent().find(".c_query_id").html();
		var reply_content = $(this).parent().find(".c_reply_content").val();
		
		if(!confirm("답글을 등록하시겠습니까?")) return;
		
		$.ajax({
			type: "post",
			url: "/cou_reply_insert",
			data: {"c_query_id":query_id, "c_reply_content" : reply_content, "c_reply_writer": writer},
			success: function(){
				alert("답글 등록이 완료되었습니다.");
				getList();
			}
		});
	});
	
	// 새로고침 기능
	function getLocation(){
		var url = "/cou/read?id=" + id;
		location.href=url;
	}
	
	//문의글 리스트
	function getList(){
		$.ajax({
			type: "get",
			url: "/list_query.json",
			dataType: "json",
			data: {"c_id": id},
			success: function(data){
				var temp = Handlebars.compile($("#temp").html());
				$("#query").html(temp(data));
			}
		});
	}
	
	//신청명단 확인하기 버튼
	$("#chk_user").on("click", "span a", function(e){
		e.preventDefault();
		var url = "/course_member?id=" + id;
		window.open(url,"", "width=400, height=400, top=200, left=900, location=no");
	});
	
	// 신청 취소하기 버튼
	$("#reg_user").on("click","#btn_member_delete", function(){
		if(!confirm("신청 취소하시겠습니까?")) return;
		
		$.ajax({
			type:"post",
			url: "/delete_member",
			data: {"c_id": id, "c_member" : login_id},
			success : function(){
				alert("신청이 취소되었습니다.");
				getLocation();
			}
		});
	});
	
	// 신청하기 버튼
	$("#reg_user").on("click", "#btn_member_insert", function(){
		if(writer == login_id){
			alert("작성하신 컨텐츠로 신청이 불가능합니다.");
			return;
		}
		if(!confirm("신청하시겠습니까?")) return;
		
		var c_gender = "${vo.c_gender}";
		var u_gender = "${user.u_gender}"
		
		if(c_gender =="여성" && u_gender=="남성"){
			alert("모집성별에 해당되지 않습니다.");
			return;
		}
		
		if(c_gender =="남성" && u_gender =="여성"){
			alert("모집성별에 해당되지 않습니다.");
			return;
		}
		
		$.ajax({
			type:"post",
			url: "/insert_member",
			data: {"c_id": id, "c_member" : login_id },
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
	
	//수정 페이지로 이동
	$("#btn_course_update").on("click", function(){
		if(!confirm("글을 수정하시겠습니까?")) return;
		location.href="/cou/update?id=${vo.id}";
	});
</script>
</html>