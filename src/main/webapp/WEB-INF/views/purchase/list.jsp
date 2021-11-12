<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#products {
	margin : 0px auto;
	width: 1000px;
	height:1000px;
	overflow: hidden;
}

.box {
	width: 250px;
	height:200px;
	float: left;
	border: 1px solid rgb(224, 224, 235);
	margin: 5px;
	padding: 5px;
	box-shadow:5px 5px 5px gray;
}
.title{
	text-overflow:ellipsis;
	white-space:nowrap;
	overflow: hidden;
}
img{
	cursor: pointer;
}
</style>
<h1>[상품 목록]</h1>
<a href="/purchase/insert">등록하기</a>
<select id = "searchType">
	<option value="all">전체</option>
	<option value="p_food">음식</option>
	<option value="p_sports">스포츠용품</option>
	<option value="p_beauty">뷰티용품</option>
	<option value="p_fashion">패션</option>
	<option value="p_digital">가전제품</option>
</select>
<button id="searchBtn">조회</button>
<div id="products"></div>
<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
	<div class="box">
		<img src="/display?fileName={{p_image}}" width=200 height=100
		onClick="location.href='read?id={{id}}'"/>
		<div class="title">{{title}}</div>
		<div class="price">
			원가:{{p_price}} => 할인된 가격:{{p_salePrice}}
		</div>
		<div class="p_category">{{p_category}}</div>
		<div class="p_cnt_feed"> 내피드 : {{p_cnt_feed}}</div>
	</div>
	{{/each}}
</script>
<script>
	getList();
	
	$("#searchBtn").on("click",function(){
		page=1;
		getList();
	});
	
	function getList(){
		var searchType = $("#searchType").val();
		$.ajax({
			type:"get",
			url:"/purchase/list.json",
			dataType:"json",
			data:{"searchType":searchType},
			success:function(data){
				var temp = Handlebars.compile($("#temp").html());
				$("#products").html(temp(data));
			}
		});
	}
</script>