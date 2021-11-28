<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#products {
   margin : 0px auto;
   width: 1000px;
   height:1080px;
   overflow: hidden;
}

.view {
   width: 1024px;
   margin: 0 auto;
}
.view button {
   width:80px;
   font-size:16px;
   margin:0px;
   padding: 5px 15px;
   font-family:"맑은고딕";
   font-weight: 600;
   color: #fff;
    background-color: #35c5f0;
}
.view button:hover{
   background-color: #09addb;
}


<!-- 리스트 검색 CSS 시작 -->
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
      width: 420px;
      border-top: 1px solid #e5e5e5;
      border-bottom: 1px solid #e5e5e5;
      justify-content: flex-end;
      background-color: #F0FFFF;
      float:left;
      margin-left:120px;
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
      border-top: 1px solid #e5e5e5;
      border-bottom: 1px solid #e5e5e5;
   }
   
   .box4 .list    {
      width:720px;
       
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
   
   .search button {
      margin-left: 10px;
      width: 95px;
      height: 42px;
      color: #fff;
      font-weight: 600;
      background-color: #35c5f0;
      cursor: pointer;
      padding: 0;
      font-size: 16px;
   }
   .search button:hover{
      border-color: #09addb;
       background-color: #09addb;
   }

<!-- 리스트 검색 CSS 끝-->

<!-- 리스트 출력 CSS -->
.box_list {
   max-width: 1299px;
    margin-top: 40px;
}   
.sub_cnt_slide_wrap {
    width: 90%;
    margin: 0 auto;
}
.sub_cnt_list {
    width: 250px !important;
    height: 340px;
    margin: 11px 10px 10px;
    float: left;
    box-shadow: 2px 2px 2px rgb(0 0 0 / 10%);
    border-radius: 9px;
    position: relative;
}
.sub_cnt_list:hover{
   transform: scale(1.05);   
}

.pick_con_img {
    height: auto; 
    overflow: hidden;
    width: 100%;
    position: relative;    
}

.main_cnt_txtbox {
   padding: 8px;
    text-align: center;
    color: #333;
    background: #fff;
    padding: 15px;
    max-height: 157px;
    box-sizing: border-box;
}

.main_cnt_txtbox > dl dt {
    font-size: 14px;
    font-weight: 700;
    color: #333333;
    word-break: break-all;
    line-height: 17px;
    height: 36px;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    border-bottom: 1px solid #ff2236;
}

div, span, a, strong, dl, dt, dd, ul, li {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
} 

#infor, #infor2, #infor3 {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.infor {
    font-size: 14px;
    color: #333;
    font-weight: 500;
    text-align: right;
    margin: 8px 0 0;
    position: relative!important;
}

.main_cnt_txtbox > dl {
    text-align: left;
}
a:hover, a:active, a:focus, a {
    text-decoration: none;
}

a:-webkit-any-link {
   /* color: -webkit-link; */
    cursor: pointer;
}

.check_person::before {
    content: '';
    background: url(https://pickcrawl.com/web/images/main/people_icon.png)center no-repeat;
    background-size: auto;
    width: 15px;
    height: 12px;
    display: inline-block;
    vertical-align: bottom;
}
.infor2 span:first-child::after {
    content: '|';
    color: #333;
    margin: 0 8px;
    font-size: 12px;
}
.txt03 {
    margin: 0 0 8px 0;
}
.infor2 {
    font-size: 12px;
    color: #333;
    font-weight: 300;
    text-align: right;
    margin: 8px 0 3px;
    width: 100%;
    display: inline-block;
    height: 13px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.infor3{
   margin-top:5px;
}
.infor3::before {
    content: "";
    display: block;
    width: 100%;
    height: 1px;
    margin: 5px 0;
    margin-right:2px;
    background: #969696;
    }   


.heart_btn {
    display: inline-block;
    position: relative;
    z-index: 2;
}

.heart_btn > span.new-heart {
    background: url(https://pickcrawl.com/web/images/common/list_heart.png) 50% 50% no-repeat;
    -webkit-background-size: cover;
    background-size: cover;
    width: 12px;
    height: 12px;
    display: inline-block;
    vertical-align: baseline;
    margin-left: 7px;
    margin-top: 3px;
}

.infor3 strong {
    float: right;
    padding-right: 8px;
    font-size: 13px;
    color: #333;
    font-weight: 300;
}
.thin {
    font-family: 'Nanum Gothic', '돋움', Sans-serif;
    font-weight: 350;
}
.red {
    color: #ff2236;
}

<!-- 리스트 출력 CSS 끝 -->


</style>
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
                     <label for="ca3">미용용품</label>
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

<div class="view">
   <div style="text-align:left; margin-left:10px; padding-bottom:7px; border-bottom:1px dotted gray; margin-bottom:15px;">
      <div style="display: inline-block; ">
         <h4 id="total" style="margin-bottom: 5px;"></h4>
      </div>
      <div style="display: inline-block; float: right; margin-top: 20px; margin-right: 15px;">
         <button onClick="location.href='/purchase/insert'">등록</button>
      </div>
   </div>
</div>


<div id="products"></div>
<script id="temp" type="text/x-handlebars-template">
{{#each list}}
<div class="box_list">
   <div class="list_sub_wrap">
      <ul class="sub_cnt_slide_wrap sub_cnt_slide01_wrap">
         <li class="sub_cnt_list sub_cnt_list01">
            <a href="read?id={{id}}">
               <div class="pick_con_img">
                  <img src="../resources/purchaseimg/{{p_image}}" width= 250 height= 155>
               </div>   
               <div class="main_cnt_txtbox">
                  <dl>
                     <dt class="view20Byte">{{title}}</dt>
                     <dd>
                        <p class="infor txt01">
                           <span class="red cate_infor">{{p_category}}</span>
                        </p>
                        <p class="infor thin date_infor txt02">
                           {{p_price}} 원 <br/>
                           {{date_start}} ~ {{date_end}}
                        </p>
                        <p class="infor2 thin txt03">
                           <span class="check_person thin">
                              <strong>{{p_cnt_member}}</strong>/{{p_tot_member}}
                           </span>
                           <span class="thin add_infor">{{printOpen p_local}}</span>
                        </p>
                     </dd>
                     <dd>
                        <p class="infor3">
                        <span class="heart_btn">
                           <span class="new-heart">&nbsp;&nbsp;&nbsp;{{p_cnt_feed}}</span>
                        </span>
                        </p>
                     </dd>
                  </dl>
               </div>         
            </a>
         </li>
      </ul>
   </div>
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