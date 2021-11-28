<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#slider-div {
   width: 980px;
   margin: 0 auto;
}

#slider-div a {
   margin: 0 auto;
}

.slick-prev:before, .slick-next:before {
   color: #35c5f0 !important;
   opacity: 1;
}
/* 화살표 위치 변경 */
.slick-prev {
   left: 10px !important;
   z-index: 9;
}

.slick-next {
   right: 50px !important;
   z-index: 9;
}

/* 버튼 위치 변경 */
.slick-dots {
   bottom: 0 !important;
}
/* 버튼 색상 변경 (마우스 오버)  */
.slick-dots li button:hover:before, .slick-dots li button:focus:before {
   color: #35c5f0;
}

/* 버튼 색상 변경 (활성화)  */
.slick-dots li.slick-active button:before {
   color: #35c5f0 !important;
}

/* 버튼 색상 변경 (비활성화)  */
.slick-dots li button:before {
   color: #35c5f0 !important;
}

.m_title{
   overflow: hidden;
    width: 1440px;
    margin-left:215px;
    position: relative;
}

.m_title span{
   font-size: 24px;
    color: #373737;
    font-weight: 500;
    float: left;
    display:inline;
}

.m_title strong{
   color:#35c5f0;
}

.best_more{
    float: right;
    display: block;
    text-align: center;
    position: relative;
    margin-top:7px;
    margin-right: 480px;
    color: #373737;
    font-size: 16px;
    font-weight: 600;
}

.best_more:hover{
   border-bottom:1px solid black;
}

.main_floor{
   width:100%;
   margin-top:20px;
}

.slick-track {
   margin-top:10px;
    display: block;
    position: relative;
    top: 0;
    left: 0;
    -webkit-perspective: 1000px;
}

.slick-item{
    overflow: hidden;
    display: block;
    margin-left:215px;
    height: 360px;
    min-height: 1px;
}

.sbox{
    display: block;
    float: left;
    position: relative;
    box-sizing: border-box;
    width: 240px;
    height: 360px;
    border-left: 1px solid #e6e6e8;
    border-bottom: 1px solid #e6e6e8;
    background: #ffffff;
}

.imgs{
    overflow: hidden;
    position: relative;
    width: 240px;
    height: 210px;
    margin: 0 0 0 -1px;
    border-bottom: 1px solid #e6e6e8;
}


.imgs img{
    width: 240px;
    height: 210px;
    transition: all .3s;}
    
    

    
.imgs img:hover{
    transform: scale(1.05);
}
    
.info{
   box-sizing: border-box;
    height: 90px;
    padding: 15px 29px 0;
}

.tit{

   overflow: hidden;
    height: 56px;
    margin: 0 0 18px;
    font-weight: 700;
    font-size: 18px;
    line-height: 28px;
    color: #2d2d2d;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;}
    
.txt{
   overflow: hidden;
    height: 72px;
    margin: 0 0 38px;
    font-size: 14px;
    line-height: 24px;
    color: #777777;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
}

</style>
 
<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">

<div style="padding:10px 5px 20px 5px; height:250px; width:1000px; margin:0 auto;">
          <div id="slider-div"  >
             <div style="width:980px; margin:0 auto; ">
                 <a href="/support/read?id=96" ><img src="/resources/banner.jpg" width=960 height=250/></a>             
             </div>
             <div style="width:980px; margin:0 auto; ">
                  <a href="/support/read?id=94" ><img src="/resources/banner2.jpg" width=960 height=250/></a>             
             </div>
             <div style="width:980px; margin:0 auto; ">
                  <a href="https://familyseoul.or.kr/" ><img src="/resources/banner3.png" width=960 height=250/></a>             
             </div>
             <div style="width:980px; margin:0 auto; ">
                  <a href="https://youth.seoul.go.kr/site/main/content/youth_young_tech_intro" ><img src="/resources/banner4.jpg" width=960 height=250/></a>             
             </div>
             <div style="width:980px; margin:0 auto; ">
                  <a href="https://www.mentalhealth.or.kr/TreatmentSupport_A/main/youthcare/main.asp" ><img src="/resources/banner5.png" width=960 height=250/></a>             
             </div>
             <div style="width:980px; margin:0 auto; ">
                  <a href="https://youth.gg.go.kr/gg/info/housing-welfare.do?mode=view&arcNo=1020&pager.offset=0&pagerLimit=8" ><img src="/resources/banner6.png" width=960 height=250/></a>             
             </div>
          </div>
</div>


<section class="main_floor">
   <div class="m_title">
      <span>소모임/스터디 <strong>추천</strong></span> 
      <a href="/course/list" class="best_more">전체보기</a>
      </div>
      <div class="slick-track">
         <li class="slick-item">
            <a href="/course/read?id=19" class="sbox">
               <div class="imgs">
                  <img src="../resources/course/CSL.jpg">
               </div>
               <div class="info">
                  <div class="tit">
                     토익 스터디
                  </div>
                  <div class="txt">
                     스터디 - 어학
                  </div>
               </div>
            </a>
            <a href="/course/read?id=20" class="sbox">
               <div class="imgs">
                  <img src="../resources/course/CGF.jpg">
               </div>
               <div class="info">
                  <div class="tit">
                     송도 맛집탐방
                  </div>
                  <div class="txt">
                     소모임 - 맛집탐방
                  </div>
               </div>
            </a>
            <a href="/course/read?id=22" class="sbox">
               <div class="imgs">
                  <img src="../resources/course/CCC.jpg">
               </div>
               <div class="info">
                  <div class="tit">
                     쌀 쿠키 클래스
                  </div>
                  <div class="txt">
                     클래스 - 쿠킹
                  </div>
               </div>
            </a>
            <a href="/course/read?id=23" class="sbox" style="border-right:1px solid #e6e6e8;">
               <div class="imgs">
                  <img src="../resources/course/CSR.jpg">
               </div>
               <div class="info">
                  <div class="tit">
                     R언어 프로그래밍
                  </div>
                  <div class="txt">
                     스터디 - 기타
                  </div>
               </div>
            </a>
         </li>
      </div>
      
   </section>



<section class="main_floor">
   <div class="m_title">
      <span>공동구매 <strong>추천</strong></span>
      <a href="/purchase/list" class="best_more">전체보기</a>
   </div>
   <div class="slick-track">
         <li class="slick-item">
            <a href="/purchase/read?id=48" class="sbox">
               <div class="imgs">
                  <img src="/resources/purchaseimg/1637816683579_공동구매1.jpg">
               </div>
               <div class="info">
                  <div class="tit">
               매콤 순살 소갈비찜
                  </div>
                  <div class="txt">
                       맛있는 갈비찜을 공동구매로 저렴하게!!               
                  </div>
               </div>
            </a>
            <a href="/purchase/read?id=69" class="sbox">
               <div class="imgs">
                  <img src="/resources/purchaseimg/1637818992774_공동구매9.jpg">
               </div>
               <div class="info">
                  <div class="tit">
                       무로 스퀴즈 슈트
                  </div>
                  <div class="txt">
                                                 공동구매하고 운동하세요!                    
                  </div>
               </div>
            </a>
            <a href="/purchase/read?id=57" class="sbox">
               <div class="imgs">
                  <img src="/resources/purchaseimg/1637818337856_공동구매5.jpg">
               </div>
               <div class="info">
                  <div class="tit">
                        무로 스탠다드 블루라이트 필터안경
                  </div>
                  <div class="txt">
                          공동구매로 싸게! 
                  </div>
               </div>
            </a>
            <a href="/purchase/read?id=59" class="sbox" style="border-right:1px solid #e6e6e8;">
               <div class="imgs">
                  <img src="/resources/purchaseimg/1637818495862_공동구매6.jpg">
               </div>
               <div class="info">
                  <div class="tit">
                       슈맥스 와플메이커
                  </div>
                  <div class="txt">
                                                 집에서 와플을 간단히
                  </div>
               </div>
            </a>
         </li>
      </div>
</section>
<script>
   $(function(){
      $('#slider-div').slick({
            slide: 'div',        //슬라이드 되어야 할 태그 ex) div, li 
            infinite : true,     //무한 반복 옵션     
            slidesToShow : 1,        // 한 화면에 보여질 컨텐츠 개수
            slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
            speed : 100,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
            arrows : true,         // 옆으로 이동하는 화살표 표시 여부
            dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
            autoplay : true,            // 자동 스크롤 사용 여부
            autoplaySpeed : 10000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
            pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
            vertical : false,        // 세로 방향 슬라이드 옵션
            prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        // 이전 화살표 모양 설정
            nextArrow : "<button type='button' class='slick-next'>Next</button>",        // 다음 화살표 모양 설정
            dotsClass : "slick-dots",     //아래 나오는 페이지네이션(점) css class 지정
            draggable : true,     //드래그 가능 여부 
            
        });
      })
</script>