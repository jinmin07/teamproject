<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.board_detail {
	    display: block;
	    position: relative;
	    width: 980px;
	    overflow: hidden;
	    margin:0 auto;
	    margin-top:30px;
	    border-top: 2px solid #000;
}

	.board_detail .title_box {
	    overflow: hidden;
	    padding: 10px 30px;
	    background-color: #eef9ff;
	}
	
	.board_detail > div {
    border-bottom: 1px solid #999;
}

.board_detail .title_box h3 {
    font-size: 20px;
    font-weight: 400;
    text-align: center;
    margin:0px 0px;
}

.board_detail .info_box {
    position: relative;
    padding: 20px 30px;
    color: #909090;
    font-size: 14px;
}

.board_detail .info_box .list {
    display: flex;
    display: -webkit-flex;
    justify-content: space-between;
}

.list li{
	margin-top:5px;
	list-style:none;
}

.board_detail .content_box {
    padding: 35px 30px;
}

.board_detail .content_box img {
    max-width: 100%;
}

.button_box{
	padding :0px 20px;
	margin-right:150px;
	margin-top: 50px;
	margin-bottom: 80px;
    display: -webkit-flex;
    align-items: center;
    justify-content: flex-end;
}

.btn_gray{
	width:220px;
	height:70px;
	font-size: 18px;
	font-weight: 600;
	color: #fff;
	background-color: #696969;
	cursor: pointer;
	border: 0 none;
	margin-left: 15px;
}

.btn_gray:hover{
	background-color:#4d4d4d;
}
</style>

<div id="read"></div>

	<div class="board_detail">
		<div class="title_box">
			<h3>${vo.title}</h3>
		</div>
		
		<div class="info_box">
			<div class="list">
				<li>구분 : ${vo.s_category}</li>
				<li>등록일: <f:formatDate value="${vo.s_date}" pattern="yyyy-MM-dd"/></li>
				<li>조회수: ${vo.s_view}</li>
			</div>
		</div>
		
		<div class="content_box">
			<img src="display?fileName=${vo.s_image}"  width=660 onerror="this.style.display='none'"/>
			
			<p>${vo.s_content}</p>
		</div>
	</div>	
	
	<div class="button_box">	
			<c:if test="${user.u_id eq 'user21'}">
				<button type="button"  onClick="location.href='/support/update?id=${vo.id}'"  class="btn_gray"  title="수정"  >수정</button>
				<button type="button" class="btn_gray" id="delete" title="삭제"  >삭제</button>
			</c:if>
			<c:if test="${user!=null}">
				<button type="button" class="btn_gray"  title="내 피드"  >내 피드</button>
			</c:if>
			<button type="button" onClick="location.href='list'" class="btn_gray" title="목록">목록</button>
		
		
			
			
	</div>
<script>
	$(".button_box").on("click","#delete",function(e){
		e.preventDefault();;
		var id="${vo.id}";
		var image="${vo.s_image}";
		if(!confirm("정책을 삭제하실래요?"))return;
		$.ajax({
			type:"post",
			url:"delete",
			data:{"id":id,"S_image":image},
			success:function(){
				alert("삭제 성공!");
				location.href="/support/list";
			}
		})
	})
</script>