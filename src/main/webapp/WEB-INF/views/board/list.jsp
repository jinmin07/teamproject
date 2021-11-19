<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<style>
	#condition button{
		font-size:16px;
		margin:0px;
		padding: 5px 15px;
		font-family:"맑은고딕";
		font-weight: 600;
	}
	#condition button:hover{
		background: #dbb4b4;
	}
</style>	
<style>
	.listoption{
		margin:0 auto;
		width:1200px;
		margin-bottom: 70px;
	    border-top: 1px solid #e5e5e5;
	    border-bottom: 1px solid #e5e5e5;
	    overflow: hidden;
	}
	
	.box3{
		height:101px;
		width: 600px;
    	border-bottom: 1px solid #e5e5e5;
    	justify-content: flex-end;
   	 	background-color: #F0FFFF;
   	 	float:left;
	}
	
	.list{
		font-size: 14px;
	}
	
	.box3 .list .title{
		line-height: 32px;
		margin:5px 0px;
		font-weight:600;
	}
	
	
	.box3 .list .checkbox1{
		margin-left:10px;
		position: relative;
	    display: flex;
	    display: -webkit-flex;
	    flex-wrap: wrap;
	    -webkit-flex-wrap: wrap;
	    align-items: center;
	}
	
	p{
		margin:5px;
		display:block
	}
	
	 input[type=radio] {
	    border: 0;
	    clip: rect(0 0 0 0);
	    height: 1px;
	    margin: -1px;
	    overflow: hidden;
	    padding: 0;
	    position: absolute;
	    width: 0;
	}
	
	.checkbox1 input+label {
		position: relative;
		display: block;
		cursor: pointer;
		font-size: 15px;
		width:72px;
		line-height: 30px;
		text-align: center;
    	border: 1px solid #333;
	}
	
	.checkbox2 label{
		cursor: pointer;
	    padding: 5px 8px;
	    width: 56px;
	    line-height: 26px;
	    text-align: center;
	    border: 1px solid #bdbdbd;
	    color:#bdbdbd;
	}
	
	.checkbox1 input:checked +label{
		color: #fff; 
	    font-weight: 600;
	    background-color: #6b6ce2;
	    border-color: #6b6ce2;
	}
	
	.checkbox2 input:checked +label{
		color:white;
		border: 1px solid black;
		font-weight: 600;
		background-color: black;
	}
	
	
	.box4{
		height:100px;
		width:50%;
		background-color: #f7f8fa;
		display:-webkit-flex;
	}
	
	.box4 .list 	{
		width:750px;
   	 
	}
	
	.box .box4 .list li{
		display: flex;
		display: -webkit-flex;
	}
	
		
	
	.box .list{
		margin:5px 0px;
		padding: 5px 5px 5px 10px;
	    display: flex;
	    display: -webkit-flex;
	    flex-wrap: wrap;
	    -webkit-flex-wrap: wrap;
	}
		
	.search{
		width: 100%;
	    flex-wrap: wrap;
	    -webkit-flex-wrap: wrap;
	    padding-top:15px;
	}
	
	.search .insearch{
		display:inline-block;
		width: calc(100% - 125px);
	    height: 42px;
	}
	
	.insearch input{
		padding: 0 10px;
    	background-color: transparent;
	}
	
	.txt{
		width:100%; height:100%; display: block; border: 1px solid #999;
		
	}
	
	.search button{
		margin-left: 10px;
	    width: 95px;
	    height: 42px;
	    color: #fff;
	    font-weight: 600;
	    background-color: #6b347c;
	    cursor: pointer;
	    padding: 0;
	    border:0;
	    font-size: 16px;
	}
	.view {
		width: 1024px;
		margin: 0 auto;
	}
	
	.view button {
		font-size: 16px;
		margin: 0px;
		padding: 5px 15px;
		font-family: "맑은고딕";
		font-weight: 600;
	}
	
	.view button:hover {
		background: #dbb4b4;
	}
</style>

<h1>[글목록]</h1>

<!-- 리스트 검색 박스 시작 -->
	<div class="listoption">
		<div class="box box3" >
			<dl class="list">
				<dt><h3 class="title">카테고리별</h3></dt>
				<dd>
					<div class="checkbox1" id="searchType" >
							<p>
								<input type="radio" id="allCate"  name="cate" value="전체" checked />
								<label for="allCate">전체</label>
							</p>
							<p>
								<input type="radio" id="cate1" name="cate" value="맛집추천" />
								<label for="cate1">맛집추천</label>
							</p>
							<p>
								<input type="radio" id="cate2" name="cate" value="후기" />
								<label for="cate2">후기</label>
							</p>
							
							<p>
								<input type="radio" id="cate3" name="cate" value="정보제공" />
								<label for="cate3">정보제공</label>
							</p>
					</div>
				</dd>
			</dl>
		</div>
		
		<div class="box box4">
			<ul class="list">
				<li class="search">
					<div class="insearch">
						<input type="text" class="txt" id="keyword" name="searchtxt" placeholder="검색"/>
					</div>
					<button type="button" id="searchbtn" style="">조회</button>				
				</li>
			</ul>
		</div>
	</div>

<!-- 리스트 검색 박스  끝-->
<div class="view">
	<div style="text-align: left; margin-left: 10px; padding-bottom: 7px; border-bottom: 1px dotted gray; margin-bottom:15px;">
		<div style="display: inline-block;">
			<h4 id="total" style="margin-bottom: 5px;"></h4>
		</div>
		<div style="display: inline-block; float: right; margin-top: -8px; margin-right: 15px;">
			<button onClick="location.href='/board/insert'">등록</button>
		</div>
	</div>
</div>
<table id="tbl"></table>
<script id="temp" type="text/x-handlebars-template">
	<tr class="title">
		<td width="100">No.</td>
		<td width="300">제목</td>
		<td width="100">작성자</td>
		<td width="200">작성일</td>
		<td width="100">조회수</td>
	</tr>
	{{#each list}}
	<tr class = "row" onClick="location.href='/board/read?id={{id}}'">
		<td width=100>{{id}}</td>
      	<td width=300>[ {{b_category}} ] {{title}}</td>
      	<td width=100>{{b_writer}}</td>
		<td width=200>{{b_date}}</td>
		<td width=100>{{b_view}}</td>
	</tr>
	{{/each}}
</script>


<div style="text-align: center; margin-bottom:10px;">
	<div id="pagination" class="pagination" ></div>
</div>
<script src="/resources/pagination.js"></script>

<script>
	$("#searchType").on("change", function(){
		page = 1;
		getList();
	});
	
	var page = 1;
	getList();

	$("#keyword").on("keypress", function(e) {
		if (e.keyCode == 13) {
			page = 1;
			getList();
		}
	});

	function getList() {
		var keyword = $("#keyword").val();
		var searchType = $(".checkbox1 input[type=radio]:checked").val();
		
		
		$.ajax({
			type : "get",
			url : "/board/list.json",
			dataType : "json",
			data : {
				"page" : page,
				"keyword" : keyword,
				"searchType" : searchType
			},
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				$("#total").html(data.pm.totalCount +"개의 게시글이 있습니다.");
				$("#pagination").html(getPagination(data));
			}
		});
	}
	$("#pagination").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getList();
	});
</script>

