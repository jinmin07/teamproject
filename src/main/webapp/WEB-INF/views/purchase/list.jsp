<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#products {
	margin : 0px auto;
	width: 1000px;
	height:1000px;
	overflow: hidden;
}

.box1 {
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


<!-- 리스트 검색 박스 CSS 시작 -->
	.listoption{
		margin:0 auto;
		width:1200px;
		margin-bottom: 70px;
	    border-top: 1px solid #e5e5e5;
	    border-bottom: 1px solid #e5e5e5;
	    overflow: hidden;
	    
	}
	
	.box3{
		height:200px;
		width: 440px;
    	border-bottom: 1px solid #e5e5e5;
    	justify-content: flex-end;
   	 	background-color: #F0FFFF;
   	 	float:left;
   	 	margin-left:100px;
	}
	
	.list{
		font-size: 14px;
	}
	
	.box3 .list .title ,.box4 .list .title{
		line-height: 32px;
		margin:5px 0px;
		font-weight:600;
	}
	
	.box4 .list .title{
		margin: 5px 0;
	    width: auto;
	    line-height: 28px;
	}
	
	.box3 .list .checkbox1, .box4 .list .checkbox2{
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
		height:200px;
		width:53%;
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
	
	
	.box4 .list .category{
		padding-bottom:10px;
		width:470px;
		border-bottom: 1px solid #dbdbdb;
		border-right: 1px solid #dbdbdb;
		display: block;
	}
		
	
	.box .list{
		margin:5px 0px;
		padding: 5px 5px 5px 10px;
	    display: flex;
	    display: -webkit-flex;
	    flex-wrap: wrap;
	    -webkit-flex-wrap: wrap;
	}
	
	.local{
		padding:10px 0; 
		width:100%;
	}
	
	.search{
		width: 100%;
	    flex-wrap: wrap;
	    -webkit-flex-wrap: wrap;
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
		width:100%;height: 100%; display: block; border: 1px solid #999;
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

<!-- 리스트 검색 박스 CSS 끝-->


</style>
<h1>[상품 목록]</h1>

<!-- 리스트 검색 박스 시작-->
	<div class="listoption">
		<div class="box box3" >
			<dl class="list">
				<dt><h3 class="title">지역별</h3></dt>
				<dd>
					<div class="checkbox1" id="searchType" >
							<p>
								<input type="radio" id="allLocal"  name="local" value="allLocal" checked />
								<label for="allLocal">전체</label>
							</p>
							<p>
								<input type="radio" id="local1" name="local" value="" />
								<label for="local1">서울</label>
							</p>
							<p>
								<input type="radio" id="local2" name="local" value="" />
								<label for="local2">경기</label>
							</p>
							<br/>
							<p>
								<input type="radio" id="local3" name="local" value="" />
								<label for="local3">인천</label>
							</p>
							<p>
								<input type="radio" id="local4" name="local" value="" />
								<label for="local4">대전</label>
							</p>
							<p>
								<input type="radio" id="local5" name="local" value=""/>
								<label for="local5">광주</label>
							</p>
							<br/>
							<p>
								<input type="radio" id="local6" name="local" value=""/>
								<label for="local6">울산</label>
							</p>
							<br/>
							<p>
								<input type="radio" id="local7" name="local" value=""/>
								<label for="local7">부산</label>
							</p>
							<p>
								<input type="radio" id="local8" name="local" value=""/>
								<label for="local8">제주</label>
							</p>
					</div>
				</dd>
			</dl>
		</div>
		
		<div class="box box4">
			<ul class="list">
				<li class="age">
					<h3 class="title">카테고리별</h3>
					<div class="checkbox2" id="searchType">
						<p>
							<input type="radio" id="allCate" name="category" value="allCate"  checked/>
							<label for="allCate">전체</label>
						</p>
						<p>
							<input type="radio" id="cate1" name="category" value=""/>
							<label for="cate">음식</label>
						</p>
						<p>
							<input type="radio" id="cate2" name="category" value=""/>
							<label for="cate2">스포츠용품</label>
						</p>
						<p>
							<input type="radio" id="cate3" name="category" value=""/>
							<label for="cate3">뷰티용품</label>
						</p>
						<p>
							<input type="radio" id="cate4" name="category" value=""/>
							<label for="cate4">패션</label>
						</p>
						<p>
							<input type="radio" id="cate5" name="category" value=""/>
							<label for="cate5">가전제품</label>
						</p>
					</div>
				</li> 
				
				<li class="search">
					<div class="insearch" id="searchType">
						<input type="text" class="txt" id="searchtxt" name="searchtxt" placeholder="검색"/>
					</div>
					<button type="button" id="searchbtn" style="">조회</button>				
				</li>
			</ul>
		</div>
	</div>
<!-- 리스트 검색 박스  끝 -->



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
	<div class="box1">
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

<div style="text-align: center; margin-bottom:10px;">
	<div id="pagination" class="pagination"></div>
</div>
<script src="/resources/pagination.js"></script>


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