<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="content-notice">
	<div id="divNotice" style="margin: 20px 50px 0px 50px;"></div>
	<script id="temp" type="text/x-handlebars-template">
 	{{#each .}}
 		<div class="packing">
 			<div class="heading">
 				<span class="n_id" style="display:none;">{{n_id}}</span>
 				<b style="font-size:13px;">{{regdate}}</b>
				<a class="close" href="#">×</a>
				<a style="display:{{printOpen n_state}};" href="{{printCode tbl_code}}/read?id={{tbl_id}}">확인하기</a>
 			</div>
			<div class="body" style="text-align:left;">
 			 ( <b style="font-size:13px;">{{sender}}</b> ) &nbsp; {{content}}
			</div>
 		</div>
 	{{/each}}
 	</script>
 	<script>
		Handlebars.registerHelper("printOpen", function(n_state){
			if(n_state == 1){
				return "none";
			}
		});
	</script>
		 <script>
		Handlebars.registerHelper("printCode", function(tbl_code){
			if(tbl_code == "P"){
				return "/purchase";
			}else {
				return "/course";
			}
		});
	</script>
</div>
<script>
	var u_id = "${user.u_id}";
	getNoticeList();

	// 알림 삭제
	$("#divNotice").on("click", ".box .heading a", function(e){
		e.preventDefault();
		var n_id=$(this).parent().find(".n_id").html();
		if(!confirm("알림을 삭제하실래요?")) return;

		$.ajax({
			type: "post",
			url: "/notice/delete",
			data: {"n_id":n_id},
			success : function(){
				alert("알림 삭제가 완료되었습니다.");
				sock_notice.send("delete|" + id);
				getNoticeList();
			}
		});
	});

	// 세부 정보로 이동
	$("#divNotice").on("click", ".box .body a", function(e){
		e.preventDefault();
		alert("이동하실래요?");
	
	});
	
	// 알림목록
	function getNoticeList() {
		$.ajax({
			type : "get",
			url : "/notice.json",
			dateType : "json",
			data : {"u_id" : u_id},
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#divNotice").html(temp(data));
			}
		});
	}
</script>