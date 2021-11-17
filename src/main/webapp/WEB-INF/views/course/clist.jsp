<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#content {
	text-align: center;
}

#course {
	width: 960px;
	margin: 0 auto;
	display: inline-block;
}

.box_list {
	width: 270px;
	height: 320px;
	float: left;
	margin-left: 32px;
	padding: 5px;
	margin-bottom: 30px;
	box-shadow: 5px 5px 5px gray;
	border:0.5px solid gray;
	
}

.box_list img {
	cursor: pointer;
	width: 250px;
	height: 150px;
	padding-top:5px;
}

.pagination {
	text-align: center;
	margin-top: 10px;
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #1E90FF;
	color: white;
}

.pagination a :hover :not(.active){
background-color:#ddd;
}


.listoption {
	margin: 0 auto;
	width: 1200px;
	margin-bottom: 70px;
	border-top: 1px solid #e5e5e5;
	border-bottom: 1px solid #e5e5e5;
	overflow: hidden;
}

.box3 {
	height: 320px;
	width: 440px;
	border-bottom: 1px solid #e5e5e5;
	justify-content: flex-end;
	background-color: #F0FFFF;
	float: left;
}

.list {
	font-size: 14px;
}

.box3 .list .title, .box4 .list .title {
	line-height: 32px;
	margin: 5px 0px;
	font-weight: 600;
}

.box4 .list .title {
	margin: 5px 0;
	width: auto;
	line-height: 28px;
}

.box3 .list .checkbox1, .box4 .list .checkbox2, .box4 .gender .checkbox3,
	.box4 .local .checkbox4 {
	margin-left: 10px;
	position: relative;
	display: flex;
	display: -webkit-flex;
	flex-wrap: wrap;
	-webkit-flex-wrap: wrap;
	align-items: center;
}

p {
	margin: 5px;
	display: block
}

input[type=radio] {
	border: 0;
	clip: rect(0, 0, 0, 0);
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
	width: 72px;
	line-height: 30px;
	text-align: center;
	border: 1px solid #333;
}

.checkbox2 label, .checkbox3 label, .checkbox4 label {
	cursor: pointer;
	padding: 5px 8px;
	width: 56px;
	line-height: 26px;
	text-align: center;
	border: 1px solid #bdbdbd;
	color: #bdbdbd;
}

.checkbox1 input:checked+label {
	color: #fff;
	font-weight: 600;
	background-color: #6b6ce2;
	border-color: #6b6ce2;
}

.checkbox2 input:checked+label, .checkbox3 input:checked+label,
	.checkbox4 input:checked+label {
	color: white;
	border: 1px solid black;
	font-weight: 600;
	background-color: black;
}

.box4 {
	height: 320px;
	width: 62%;
	background-color: #f7f8fa;
	display: -webkit-flex;
}

.box4 .list {
	width: 750px;
}

.box .box4 .list li {
	display: flex;
	display: -webkit-flex;
}

.box4 .list .age {
	padding-bottom: 10px;
	width: 470px;
	border-bottom: 1px solid #dbdbdb;
	border-right: 1px solid #dbdbdb;
	display: block;
}

.box4 .list .gender {
	padding-bottom: 10px;
	padding-left: 15px;
	width: 200px;
	border-bottom: 1px solid #dbdbdb;
}

.box .list {
	margin: 5px 0px;
	padding: 5px 5px 5px 10px;
	display: flex;
	display: -webkit-flex;
	flex-wrap: wrap;
	-webkit-flex-wrap: wrap;
}

.local {
	padding: 10px 0;
	width: 100%;
}

.search {
	width: 100%;
	flex-wrap: wrap;
	-webkit-flex-wrap: wrap;
}

.search .insearch {
	display: inline-block;
	width: calc(100% - 125px);
	height: 42px;
}

.insearch input {
	padding: 0 10px;
	background-color: transparent;
}

.txt {
	width: 100%;
	height: 100%;
	display: block;
	border: 1px solid #999;
}

.search button {
	margin-left: 10px;
	width: 95px;
	height: 42px;
	color: #fff;
	font-weight: 600;
	background-color: #6b347c;
	cursor: pointer;
	padding: 0;
	border: 0;
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

<h3>[스터디/취미 목록]</h3>
	<div class="listoption">
		<div class="box box3" >
			<dl class="list">
				<dt><h3 class="title">모집분야별</h3></dt>
				<dd>
					<div class="checkbox1" id="searchType" >
						<p>
								<input type="radio" id="allCate"  name="cate" value="allCate" checked />
								<label for="allCate">전체</label>
							</p>
							<p>
								<input type="radio" id="ca1" name="cate" value="ca1" />
								<label for="ca1">스터디</label>
							</p>
							<p>
								<input type="radio" id="ca2" name="cate" value="ca2" />
								<label for="ca2">클래스</label>
							</p>
							<p>
								<input type="radio" id="ca3" name="cate" value="ca3" />
								<label for="ca3">소모임</label>
							</p>
							<br/>
							<p>
								<input type="radio" id="sub1" name="cate" value="sub1" />
								<label for="sub1">스터디><br/>어학</label>
							</p>
							<p>
								<input type="radio" id="sub2" name="cate" value="sub2"/>
								<label for="sub2">스터디><br/>취업</label>
							</p>
							<p>
								<input type="radio" id="sub3" name="cate" value="sub3"/>
								<label for="sub3">스터디><br/>재테크</label>
							</p>
							<p>
								<input type="radio" id="sub4" name="cate" value="sub4"/>
								<label for="sub4">스터디><br/>기타</label>
							</p>
							<br/>
							<p>
								<input type="radio" id="sub5" name="cate" value="sub5"/>
								<label for="sub5">클래스><br/>공예</label>
							</p>
							<p>
								<input type="radio" id="sub6" name="cate" value="sub6"/>
								<label for="sub6">클래스><br/>쿠킹</label>
							</p>
							<p>
								<input type="radio" id="sub7" name="cate" value="sub7"/>
								<label for="sub7">클래스><br/>운동</label>
							</p>
							<p>
								<input type="radio" id="sub8" name="cate" value="sub8"/>
								<label for="sub8">클래스><br/>기타</label>
							</p>
							<br/>
							<p>
								<input type="radio" id="sub9" name="cate" value="sub9"/>
								<label for="sub9">소모임><br/>공연예술</label>
							</p>
							<p>
								<input type="radio" id="sub10" name="cate" value="sub10"/>
								<label for="sub10">소모임><br/>맛집탐방</label>
							</p>
							<p>
								<input type="radio" id="sub11" name="cate" value="sub11"/>
								<label for="sub11">소모임><br/>여행</label>
							</p>
							<p>
								<input type="radio" id="sub12" name="cate" value="sub12"/>
								<label for="sub12">소모임><br/>기타</label>
							</p>
					</div>
				</dd>
			</dl>
		</div>
		
		<div class="box box4">
			<ul class="list">
				<li class="age">
					<h3 class="title">연령별</h3>
					<div class="checkbox2" id="searchType">
						<p>
							<input type="radio" id="allAge" name="age" value="allAge"  checked/>
							<label for="allAge">전체</label>
						</p>
						<p>
							<input type="radio" id="age1" name="age" value="age1"/>
							<label for="age1">20대 이하</label>
						</p>
						<p>
							<input type="radio" id="age2" name="age" value="age2"/>
							<label for="age2">20대~30대</label>
						</p>
						<p>
							<input type="radio" id="age3" name="age" value="age3"/>
							<label for="age3">40대~50대</label>
						</p>
						<p>
							<input type="radio" id="age4" name="age" value="age4"/>
							<label for="age4">60대 이상</label>
						</p>
					</div>
				</li> 
				
				<li class="gender">
					<h3 class="title">성별</h3>
					<div class="checkbox3" id="searchType">
						<p>
							<input type="radio" id="allGender" name="gender" value="allGender" checked/>
							<label for="allGender">전체</label>
						</p>
						<p>
							<input type="radio" id="man" name="gender" value="m"/>
							<label for="man">남성</label>
						</p>
						<p>
							<input type="radio" id="woman" name="gender" value="w"/>
							<label for="woman">여성</label>
						</p>
					</div>
				</li>
				<li class="local" >
					<h3 class="title">지역별</h3>
						<div class="checkbox4" id="searchType">
							<p>
								<input type="radio" id="allCheck"  name="local" value="all"  checked />
								<label for="allCheck">전국</label>
							</p>
							<p>
								<input type="radio" id="seoul" name="local" value="seoul"/>
								<label for="seoul">서울시</label>
							</p>
							<p>
								<input type="radio" id="incheon" name="local" value="incheon"/>
								<label for="incheon">인천시</label>
							</p>
							<p>
								<input type="radio" id="gyeonggi" name="local" value="gyeonggi"/>
								<label for="gyeonggi">경기도</label>
							</p>
						</div>
				</li>
				<li class="search">
					<div class="insearch" id="searchType">
						<input type="text" class="txt" id="searchtxt" name="searchtxt" placeholder="제목 검색"/>
					</div>
					<button type="button" id="searchbtn" style="">조회</button>				
				</li>
			</ul>
		</div>
	</div>


<div class="view">
	<div style="text-align: left; margin-left: 10px; padding-bottom: 7px; border-bottom: 1px dotted gray; margin-bottom:15px;">
		<div style="display: inline-block;">
			<h4 id="total" style="margin-bottom: 5px;"></h4>
		</div>
		<div style="display: inline-block; float: right; margin-top: -8px; margin-right: 15px;">
			<button onClick="location.href='/course/insert'">등록</button>
		</div>
	</div>
</div>
<div id="course"></div>
<script id="temp" type="text/x-handlebars-template">	
	{{#each list}}
	<div class="box_list">
		<img src="../resources/course/{{tbl_code}}.jpg" onClick="location.href='read?id={{id}}'">
		<br/>
		<br/>
		<div class="title">{{title}}</div><br/>
		모집기간:<br/>
		<div class="date">{{date_start}}~{{date_end}}</div>
		<div class="member">
			<span class="cnt_member">모집인원:{{c_cnt_member}}</span>/
			<span class="tot_member">{{c_tot_member}}명</span> 	
		</div>
		<div class="cnt">
			<span class="view">조회수:{{c_view}}</span>
			<span class="cnt_feed">내피드:{{c_cnt_feed}}</span>
		</div>
	</div>
	{{/each }}
</script>

<!-- 페이징 -->
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
		var catType=$(".checkbox1 input[type=radio]:checked").val();
		var ageType=$(".checkbox2 input[type=radio]:checked").val();
		var genderType=$(".checkbox3 input[type=radio]:checked").val();
		var searchType=$(".checkbox4 input[type=radio]:checked").val();
		
		$.ajax({
			type: "get",
			url: "/course/list.json",
			dataType: "json",
			data : {"page" : page,"keyword":keyword,"catType":catType,"ageType":ageType,"genderType":genderType,"searchType":searchType},
			success: function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#course").html(temp(data));
				$("#pagination").html(getPagination(data));
				$("#total").html(data.pm.totalCount +"개의 게시글이 있습니다.");
			}
		});
	}

</script>
	
    