<%@page import="com.everydang.everything.service.IEverythingService"%>
<%@page import="com.everydang.everything.service.EverythingService"%>
<%@page import="com.everydang.vo.CartVO"%>
<%@page import="com.everydang.vo.OptionVO"%>
<%@page import="java.util.List"%>
<%@page import="com.everydang.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 | 에브리띵</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/everything/everythingDetail.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
</head>
<body>
	<% 
		ProductVO vo = (ProductVO)request.getAttribute("productvo");
		List<OptionVO> optionList = (List<OptionVO>)request.getAttribute("optionList");
		List<OptionVO> fileList = (List<OptionVO>)request.getAttribute("fileList");
		int wishLike = (int) request.getAttribute("wishLike");
	%>
<%@ include file="/header.jsp" %>

    <div id="wrap">
        <div id="container">
            <!-- 왼쪽 -->
            <div id="left">
                <!-- 상품 정보-->
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        	<%
                        		for(OptionVO file : fileList) {
                        	%>
                        <div class="swiper-slide">
                            <img src="<%=request.getContextPath()%>/images/<%=file.getOp_file()%>" alt="<%=file.getOp_file()%>">
                        </div>
                        	<%} %>
                        
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>

                <!-- 리뷰 -->
                <div id="review">
                    <div class="reviewRow">
                        <div class="profile">
                            <a href="<%=request.getContextPath()%>/sub/member/memberPage/memberPage.jsp">
                                <img src="<%=request.getContextPath()%>/image/user-profile/icon-user-profile1.png" alt="profile">
                            </a>
                            <div class="right">
                                <p class="nickname">haneul</p>
                                <div class="likeBox">
                                    <span class="reviewLike">
                                        <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M5.55342 1.71723C4.317 0.432695 2.31672 0.426452 1.08565 1.70543C-0.145412 2.9844 -0.139404 5.06253 1.09701 6.34706L5.67391 11.1021C5.86375 11.2993 6.17155 11.2993 6.3614 11.1021L10.9145 6.37455C12.1427 5.09142 12.1388 3.01912 10.9022 1.73436C9.66358 0.447532 7.66236 0.441288 6.42909 1.72255L5.99423 2.1752L5.55342 1.71723Z""/>
                                        </svg>
                                        <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M5.55342 1.71723C4.317 0.432695 2.31672 0.426452 1.08565 1.70543C-0.145412 2.9844 -0.139404 5.06253 1.09701 6.34706L5.67391 11.1021C5.86375 11.2993 6.17155 11.2993 6.3614 11.1021L10.9145 6.37455C12.1427 5.09142 12.1388 3.01912 10.9022 1.73436C9.66358 0.447532 7.66236 0.441288 6.42909 1.72255L5.99423 2.1752L5.55342 1.71723Z""/>
                                        </svg>
                                        <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M5.55342 1.71723C4.317 0.432695 2.31672 0.426452 1.08565 1.70543C-0.145412 2.9844 -0.139404 5.06253 1.09701 6.34706L5.67391 11.1021C5.86375 11.2993 6.17155 11.2993 6.3614 11.1021L10.9145 6.37455C12.1427 5.09142 12.1388 3.01912 10.9022 1.73436C9.66358 0.447532 7.66236 0.441288 6.42909 1.72255L5.99423 2.1752L5.55342 1.71723Z""/>
                                        </svg>
                                        <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M5.55342 1.71723C4.317 0.432695 2.31672 0.426452 1.08565 1.70543C-0.145412 2.9844 -0.139404 5.06253 1.09701 6.34706L5.67391 11.1021C5.86375 11.2993 6.17155 11.2993 6.3614 11.1021L10.9145 6.37455C12.1427 5.09142 12.1388 3.01912 10.9022 1.73436C9.66358 0.447532 7.66236 0.441288 6.42909 1.72255L5.99423 2.1752L5.55342 1.71723Z""/>
                                        </svg>
                                        <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M5.55342 1.71723C4.317 0.432695 2.31672 0.426452 1.08565 1.70543C-0.145412 2.9844 -0.139404 5.06253 1.09701 6.34706L5.67391 11.1021C5.86375 11.2993 6.17155 11.2993 6.3614 11.1021L10.9145 6.37455C12.1427 5.09142 12.1388 3.01912 10.9022 1.73436C9.66358 0.447532 7.66236 0.441288 6.42909 1.72255L5.99423 2.1752L5.55342 1.71723Z""/>
                                        </svg>
                                    </span>
                                    <span class="date">2023.0606</span>
                                </div>
                            </div>
                        </div>
                        <div class="content">
                            <p>상품이 너무 귀엽고 다른 색으로 사고 싶어요!</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 오른쪽 -->
            <div id="right">
                <div id="fixed">
                    <!-- 탭 -->
                    <div id="subBoardBox">
                        <div id="subBoard">
                            <a href="#" class="btnLeft board selected">
                                <p id="bowwowBoard">상품 정보</p>
                            </a>
                            <a href="#" class="btnRight board">
                                <p id="boastBoard">리뷰</p>
                            </a>
                        </div>
                    </div>
                    <!-- 주문 옵션 -->
                    <!-----------------------------form-------------------------- -->
                    <form id="optionForm" action="<%=request.getContextPath()%>/insertCart.do?id=<%=memId %>" method="post" ectype="multipart/form-data">
	                   <div id="option">
	                       <div id="titleBox">
	                           <h4><%= vo.getPr_name() %></h4>
	                       </div>
	                       <div id="optionBox">
	                           <div id="opTop" class="op">
	                               <span class="opText">판매가</span>
	                               <span class="opText"><strong id="prodPrice"><%=vo.getPr_price() %></strong>원</span>
	                           </div>
	                           <div id="opMiddle" class="op">
	                               <span class="opText">수량</span>
	                               <div id="volume">
	                                   <button type="button" class="volumeBox minus"></button>
	                                   <input type="text" readonly id="count" value="1" style= "border:none;width: 10px" name="cr_count">
	                                   <input type="text" readonly id="count" value="<%=vo.getPr_code() %>" style= "display:none" name="pr_code">
	                                   <button type="button" class="volumeBox plus"></button>
	                               </div>
	                           </div>
	                           <div id="opBottom" class="op">
	                               <span class="opText">옵션</span>
	                               <select name="cr_selop" id="optionName">
	                               	<% for(int i=0; i<optionList.size(); i++) {%>
	                                   <option value="<%=optionList.get(i).getOp_name() %>"><%=optionList.get(i).getOp_name() %></option>
	                               	<%} %>
	                               </select>
	                           </div>
	                       </div>
	                       <div id="totalBox">
	                           <span class="opText">총 금액</span>
	                           <span class="opText"><strong id="total">0</strong>원</span>
	                       </div>
	                       <div id="deliverBox">
	                           <h5>배송정보</h5>
	                           <p><strong id="deliver">3,000</strong>원</p>
	                           <p>오후 4시 당일배송 주문 마감</p>
	                       </div>
	                       <!----------------------------------------------위시리스트 버튼 -----------------------------------------------  -->
	                       <div id="wishOrder">
	                           <div id="wish">
	                               <svg width="12" height="12" viewBox="0 0 12 12" fill="#000" xmlns="http://www.w3.org/2000/svg">
	                                   <path style = "red" d="M5.55342 1.71723C4.317 0.432695 2.31672 0.426452 1.08565 1.70543C-0.145412 2.9844 -0.139404 5.06253 1.09701 6.34706L5.67391 11.1021C5.86375 11.2993 6.17155 11.2993 6.3614 11.1021L10.9145 6.37455C12.1427 5.09142 12.1388 3.01912 10.9022 1.73436C9.66358 0.447532 7.66236 0.441288 6.42909 1.72255L5.99423 2.1752L5.55342 1.71723Z""/>
	                               </svg>
	                           </div>
	                           
	                       <!-- !------------------------------------------------------------------------------------------- -->
	                           <button type="submit" id="cart">장바구니에 담기</a>
	                       </div>
                    	</div>
                    </form>
                    <!-----------------------------form-------------------------- -->
                </div>
            </div> <!-- right -->
        </div> <!-- container -->
    </div> <!-- wrap -->
    <footer id="footer"></footer>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/everything/everything.js"></script>
    <script>
    
    // header & footer
    $("#footer").load("<%=request.getContextPath()%>/footer.html");
    
    //swiper
    var swiper = new Swiper(".mySwiper", {
        loop: true,
        autoplay: {        
            delay: 3500, 
            disableOnInteraction: false, 
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });

    // tab scroll

    var detailScroll = $("#wrap").offset();
    var reviewScroll = $("#review").offset();
    
    $(".btnLeft").on("click", function(){
        $("html, body").animate({scrollTop: detailScroll.top},400);
        $(this).addClass("selected");
        $(".btnRight").removeClass("selected");
    });
    $(".btnRight").on("click", function(){
        $("html, body").animate({scrollTop: reviewScroll.top-100},400);
        $(this).addClass("selected");
        $(".btnLeft").removeClass("selected");
    });

    $(window).on("scroll",function(){
        if( $(window).scrollTop() > reviewScroll.top-300){
            
            $(".btnRight").addClass("selected");
            $(".btnLeft").removeClass("selected");
        }else {
            $(".btnLeft").addClass("selected");
            $(".btnRight").removeClass("selected");
        }
            
    });
    
    // 수량 증가 감소
    $('.plus').on('click',function() {
    	count = parseInt($('#count').val());
    	$('#count').val(count+1);
    	
    	sumOfProduct();
    })
    $('.minus').on('click',function() {
    	count = parseInt($('#count').val());
    	$('#count').val(count-1);
    	if($('#count').val() < 1) $('#count').val(1);

    	sumOfProduct();    
    })
    
    sumOfProduct = function(){
    	productPrice = $('#prodPrice').html();
        totalPrice =productPrice * $('#count').val();
        
        $('#total').html(totalPrice);
    }
    
    // 위시리스트 
   
    if(<%=wishLike%> == 1) {
    	$('#wish svg').css('fill','var(--color-red)');
    	}
    else if(<%=wishLike%> == 0) {
    	$('#wish svg').css('fill','var(--color-blue)');
    	}
    		
    $('#cart').on('click', function(){
    	con = confirm("장바구니에 담으시겠습니까?");
    	if(con) {
    		$('#optionForm').submit();
    	} else {
    		return false;
    	}
    })
   
	var mmId = '<%=session.getAttribute("Id")%>'
    var prodCode = '<%=request.getAttribute("pr_code")%>'
    $('#wish').on('click',function(){
    	$.ajax({
    		url: '<%=request.getContextPath()%>/updateWish.do',
    		data: {
    			"mem_id": mmId,
    			"pr_code": prodCode
    		},
    		type: 'post',
    		success: function(res){
    			
    			if(res == 1){
    				$('#wish svg').css('fill','var(--color-red)');
    			}else{
    				$('#wish svg').css('fill','var(--color-blue)');
    			} 
    			
    		}, 
    		error:function(xhr, ss) {
    			alert(xhr.status);
    			console.log(ss);
    		} ,
    		dataType: 'json'
    	})
    })
    
    </script>
</body>
</html>