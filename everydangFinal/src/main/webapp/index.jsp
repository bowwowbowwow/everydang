<%@page import="com.everydang.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>에브리댕</title>
<link rel="icon" href="/everydang/assets/favicon.ico">
<!-- swiper -->
<script src="js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
</head>
<body>
	
    <a href="/everydang/index.jsp" class="logo-marquee">
        <div class="marquee"></div>
        <h2 class="everydang"></h2>
    </a>
    <div id="wrap">
   	<%@ include file="/header.jsp" %>
        <main>
        <div class="main-wrap container">
                <div class="swiper mySwiper1">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="image/main/main-slide1.png">
                        </div>
                        <div class="swiper-slide">
                            <img src="image/main/main-slide2.png">
                        </div>
                        <div class="swiper-slide">
                            <img src="image/main/main-slide3.png">
                        </div>
                    </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                </div>
                <section id="sec-board">
                    <div class="board-wrap">
                    <!-- 멍멍게시판 -->
                        <div class="board board1">
                            <a href="<%=request.getContextPath() %>/bowwowList.do" class="board-title">
                                <i class="thum-title"></i>
                                <h3>멍멍게시판</h3>
                            </a>
                            <div class="board-content">
                                <ul class="board-lists">
                                <!-- ---------------------------------------------------- -->
               						 <%
					                    List<BoardVO> bowwowList = (List<BoardVO>) request.getAttribute("bowwowList");
					                    for (int i = 0; i < bowwowList.size(); i++) {
					                    	if(i < 5) {
					                    	BoardVO bowwowVO = bowwowList.get(i);
					                    %>
                                    <li class="board-list board-list1">
                                        <div class="user-info">
                                                 <%
                                                 if (bowwowVO.getMm_nickname() == null) {
                                                	 %>
                                            <p class="user">
                                                <i class="thum"></i>
                                                (정보가 존재하지 않는 회원입니다.)
                                            </p>
                                                	 <%
                                                 } else {
                                                	 %>
                                            <a href="<%=request.getContextPath() %>/getMemPage.do?Id=<%=bowwowVO.getMm_id() %>" class="user">
                                            <%
                                            if(bowwowVO.getMm_profile() == null || bowwowVO.getMm_profile().equals("filepath")){
                                            	%>	
                                            	<i class="thum" style="background-image: url('<%=request.getContextPath() %>/image/user-profile/icon-user-noimage.jpg');"></i>
                                            	<%
                                            } else {
                                            	%>
                                            	<i class="thum" style="background-image: url('<%=request.getContextPath() %>/images/<%=bowwowVO.getMm_profile()%>');"></i>
                                            	<%
                                            }
                                            %>
                                                <%=bowwowVO.getMm_nickname() %>
                                            </a>
                                                	 <%
                                                 }
                                                 %>
                                            <div class="view">
                                                <div class="like-wrap">
                                                    <i class="icon-like icon"></i>
                                                    <span class="count-like count"><%=bowwowVO.getLk_like() %></span>
                                                </div>
                                                <div class="comment-wrap">
                                                    <i class="icon-comment icon"></i>
                                                    <span class="count-comment count"><%=bowwowVO.getCm_no()%></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="board-title">
                                            <a href="<%=request.getContextPath() %>/postRead.do?board=<%=bowwowVO.getBr_code() %>&no=<%=bowwowVO.getPs_no() %>"><%=bowwowVO.getPs_subject() %>
                                                <span class="date"><%=bowwowVO.getPs_date() %></span>
                                            </a>
                                        </div>
                                    </li>
                                    <%}} %>
                                </ul>
                            </div>
                        </div>
                    <!-- 찾습니다 -->   
                        <div class="board board3">
                            <a href="<%=request.getContextPath() %>/wikiList.do" class="board-title">
                                <i class="thum-title"></i>
                                <h3>멍멍위키</h3>
                            </a>
                            <div class="board-content">
                                <ul class="board-lists board-list2">
                                    <li class="board-list board-list1" id="thum1">
                                        <div class="user-info">
                                            <a href="#" class="user">
                                                <i class="thum"></i>
                                                시고르자브종
                                            </a>
                                            <div class="view">
                                                <div class="like-wrap">
                                                    <i class="icon-like icon"></i>
                                                    <span class="count-like count">25</span>
                                                </div>
                                                <div class="comment-wrap">
                                                    <i class="icon-comment icon"></i>
                                                    <span class="count-comment count">30</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="board-title">
                                            <a href="#">이불'만'물어뜯는 강아지 따로자야할까요
                                                <span class="date">2023-05-24</span>
                                            </a>
                                        </div>
                                    </li>
                                    <li class="board-list board-list2"  id="thum2">
                                        <div class="user-info">
                                            <a href="#" class="user">
                                                <i class="thum"></i>
                                                댕댕내꼬
                                            </a>
                                            <div class="view">
                                                <div class="like-wrap">
                                                    <i class="icon-like icon"></i>
                                                    <span class="count-like count">50</span>
                                                </div>
                                                <div class="comment-wrap">
                                                    <i class="icon-comment icon"></i>
                                                    <span class="count-comment count">20</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="board-title">
                                            <a href="#">애기 교육을 어떻게 시켜야 할까요?
                                                <span class="date">2023-05-30</span>
                                            </a>

                                        </div>
                                    </li>
                                    <li class="board-list board-list3"  id="thum3">
                                        <div class="user-info">
                                            <a href="#" class="user">
                                                <i class="thum"></i>
                                                멍멍멍멍
                                            </a>
                                            <div class="view">
                                                <div class="like-wrap">
                                                    <i class="icon-like icon"></i>
                                                    <span class="count-like count">82</span>
                                                </div>
                                                <div class="comment-wrap">
                                                    <i class="icon-comment icon"></i>
                                                    <span class="count-comment count">30</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="board-title">
                                            <a href="#">대형견 입마개 매너
                                                <span class="date">2023-06-01</span>
                                            </a>
                                        </div>
                                    </li>
                                    <li class="board-list board-list4"  id="thum4">
                                        <div class="user-info">
                                            <a href="#" class="user">
                                                <i class="thum"></i>
                                                내안에캔디
                                            </a>
                                            <div class="view">
                                                <div class="like-wrap">
                                                    <i class="icon-like icon"></i>
                                                    <span class="count-like count">100</span>
                                                </div>
                                                <div class="comment-wrap">
                                                    <i class="icon-comment icon"></i>
                                                    <span class="count-comment count">50</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="board-title">
                                            <a href="#">강아지 사료 추천받아요~~~
                                                <span class="date">2023-06-11</span>
                                            </a>
                                        </div>
                                    </li>
                                    <li class="board-list board-list5"  id="thum5">
                                        <div class="user-info">
                                            <a href="#" class="user">
                                                <i class="thum"></i>
                                                뀨류류르
                                            </a>
                                            <div class="view">
                                                <div class="like-wrap">
                                                    <i class="icon-like icon"></i>
                                                    <span class="count-like count">125</span>
                                                </div>
                                                <div class="comment-wrap">
                                                    <i class="icon-comment icon"></i>
                                                    <span class="count-comment count">130</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="board-title">
                                            <a href="#">강아지 보험으로 건강하게!
                                                <span class="date">2023-06-24</span>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec-dang">
                    <h3>#강아지 #댕주접</h3>
                    <div class="swiper mySwiper2">
                        <div class="swiper-wrapper">
                            <a href="#" class="swiper-slide">
                                <img src="image/main/main-thum1.png">
                            </a>
                            <a href="#" class="swiper-slide">
                                <img src="image/main/main-thum2.png">
                            </a>
                            <a href="#" class="swiper-slide">
                                <img src="image/main/main-thum3.png">
                            </a>
                            <a href="#" class="swiper-slide">
                                <img src="image/main/main-thum4.png">
                            </a>
                            <a href="#" class="swiper-slide">
                                <img src="image/main/main-thum6.png">
                            </a>
                            <a href="#" class="swiper-slide">
                                <img src="image/main/main-thum7.png">
                            </a>
                            <a href="#" class="swiper-slide">
                                <img src="image/main/main-thum8.png">
                            </a>
                            <a href="#" class="swiper-slide">
                                <img src="image/main/main-thum9.png">
                            </a>
                        </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                    </div>
                </section>
                 <!-- 공지사항 -->
                <section id="sec-notice">
                	<div class="board-wrap">
                		<div class="board board-noti">
                            <a href="<%=request.getContextPath() %>/sub/board/noticeBoard.jsp" class="board-title">
                                <h3>공지사항</h3>
                            </a>
                            <div class="board-content">
                                <ul class="board-lists">
                                    <%
				                    List<BoardVO> noticeList = (List<BoardVO>) request.getAttribute("noticeList");
				                    for (int i = 0; i < noticeList.size(); i++) {
				                    	if(i < 5) {
				                    		BoardVO noticeVO = noticeList.get(i);
				                        %>
                                    <li class="board-list board-list<%=i%>">
                                        <div class="board-title">
                                            <a href="<%=request.getContextPath() %>/postRead.do?board=<%=noticeVO.getBr_code() %>&no=<%=noticeVO.getPs_no()%>"><%=noticeVO.getPs_subject() %>
                                                <span class="date"><%=noticeVO.getPs_date() %></span>
                                            </a>
                                        </div>
                                    </li>
                                    <%}} %>
                                </ul>
                            </div>
                        </div>
                	</div>
                </section>
            </div>
            <div id="bg"></div>
        </main>
        <footer id="footer"></footer>
    </div>
   
    <div id="dang-modal">
        <div class="dang-modal-wrap">
            <section class="dang-modal-img">
                <img src="./image/main/main-thum1.png">
            </section>
            <section class="dang-modal-content">
                <div id="content-title">
                    <i id="thum">
                        <img src="<%=request.getContextPath() %>/image/main/main-thum2.png">
                    </i>
                    <p id="dang-user">rian104</p>
                </div>
                <div id="content-content">
                    <p id="content-text">
                        리리랑 산책 다녀왔어요 ^^ <br />
                        날씨가 더워서 그런지 엄청 헥헥 거리더라구요 ㅠㅠ 이제 더워지면 산책도 힘들듯하네요..ㅠ_ㅠ
                    </p>
                </div>
            </section>
        </div>
    </div>
    <div id="modal-bg"></div>
    
    <script src="<%=request.getContextPath() %>/js/common.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script>
	    <%-- $("#header").load("<%=request.getContextPath() %>/header.jsp"); --%>
	    $("#footer").load("<%=request.getContextPath() %>/footer.jsp");
        
        new Swiper(".mySwiper1", {
            loop: true,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            autoplay: {     //자동슬라이드 (false-비활성화)
            delay: 2500, // 시간 설정
            disableOnInteraction: true, // false-스와이프 후 자동 재생
            },
            
        });

        new Swiper(".mySwiper2", {
            slidesPerView: 4,
            spaceBetween: 24,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            }
        });

        $("#sec-dang").find(".swiper-slide").on("click",function(e){
            e.preventDefault();
            let imgSrc = $(this).find("img").attr("src");
            $("#dang-modal, #modal-bg").addClass("active");
            $("#dang-modal .dang-modal-img img").attr("src",imgSrc);
            $("#dang-modal #thum img").attr("src",imgSrc);
            
        })
        $("#modal-bg").on("click",function(){
            $("#dang-modal, #modal-bg").removeClass("active");
        })
   
    </script>
    
    <script>

    (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

    ChannelIO('boot', {
      "pluginKey": "e3d5044d-ad2b-4341-aaaa-7ac3bf21477b"
    });
  
  	</script>

</body>
</html>