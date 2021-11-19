<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   
   .box4 .list    {
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
								<input type="radio" id="seoul" name="local" value="seoul" />
								<label for="seoul">서울</label>
							</p>
							<p>
								<input type="radio" id="gyeonggi" name="local" value="gyeonggi" />
								<label for="gyeonggi">경기</label>
							</p>
							<br/>
							<p>
								<input type="radio" id="incheon" name="local" value="incheon" />
								<label for="incheon">인천</label>
							</p>
							<p>
								<input type="radio" id="daejeon" name="local" value="daejeon" />
								<label for="daejeon">대전</label>
							</p>
							<p>
								<input type="radio" id="gwangju" name="local" value="gwangju"/>
								<label for="gwangju">광주</label>
							</p>
							<br/>
							<p>
								<input type="radio" id="ulsan" name="local" value="ulsan"/>
								<label for="ulsan">울산</label>
							</p>
							<br/>
							<p>
								<input type="radio" id="busan" name="local" value="busan"/>
								<label for="busan">부산</label>
							</p>
							<p>
								<input type="radio" id="jeju" name="local" value="jeju"/>
								<label for="jeju">제주</label>
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
							<input type="radio" id="allCate" name="cate" value="allCate"  checked/>
							<label for="allCate">전체</label>
						</p>
						<p>
							<input type="radio" id="ca1" name="cate" value="ca1"/>
							<label for="ca1">음식</label>
						</p>
						<p>
							<input type="radio" id="ca2" name="cate" value="ca2"/>
							<label for="ca2">스포츠용품</label>
						</p>
						<p>
							<input type="radio" id="ca3" name="cate" value="ca3"/>
							<label for="ca3">뷰티용품</label>
						</p>
						<p>
							<input type="radio" id="ca4" name="cate" value="ca4"/>
							<label for="ca4">패션</label>
						</p>
						<p>
							<input type="radio" id="ca5" name="cate" value="ca5"/>
							<label for="ca5">가전제품</label>
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
<div id="products"></div>
<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
	<div class="box1">
		<img src="display?fileName={{p_image}}" width=200 height=100
		onClick="location.href='read?id={{id}}'"/>
		<div class="title">{{title}}</div>
		<div class="price">
			원가:{{p_price}} => 할인된 가격:{{p_salePrice}}
		</div>
		<div class="local">
			지역:{{printOpen p_local}}
		</div>
		<div class="p_category">{{p_category}}</div>
		<div class="p_cnt_feed"> 내피드 : {{p_cnt_feed}}</div>
	</div>
	{{/each}}
</script>
<script>
		Handlebars.registerHelper("printOpen", function(p_local){
			var str = p_local;
			var arr = str.split(" ");
			var addr = arr[0] + " " + arr[1];
			return addr;
		});
</script>

<div style="text-align: center; margin-bottom:10px;">
	<div id="pagination" class="pagination"></div>
</div>
<script src="/resources/pagination.js"></script>


<script>
	var page = 1;
	getList();
	
	//엔터키 클릭시 검색
	$("#searchtxt").on("keypress",function(e){
		if(e.keyCode==13){
			page=1;
			getList();
		}
	});

	$("#searchbtn").on("click",function(){
		page=1;
		getList();
	});
	
	function getList(){
		var keyword=$("#searchtxt").val();
		var catType = $(".checkbox2 input[type = radio]:checked").val();
		var searchType = $(".checkbox1 input[type = radio]:checked").val();
		$.ajax({
			type:"get",
			url:"/purchase/list.json",
			dataType:"json",
			data:{"page":page,"keyword":keyword,"searchType":searchType,"catType":catType},
			success:function(data){
				var temp = Handlebars.compile($("#temp").html());
				$("#products").html(temp(data));
				$("#pagination").html(getPagination(data));
				$("#total").html(data.pm.totalCount+"개의 게시물이 있습니다.");
			}
		});
	}
	
	$("#pagination").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
</script>