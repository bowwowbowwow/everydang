<%@page import="com.everydang.everything.service.EverythingService"%>
<%@page import="com.everydang.everything.service.IEverythingService"%>
<%@page import="com.everydang.vo.OptionVO"%>
<%@page import="com.everydang.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>에브리띵</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/everything/everythingMain.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
</head>
<body>
	<%
		List<ProductVO> list = (List<ProductVO>)request.getAttribute("allList");
		ProductVO pvo = (ProductVO)request.getAttribute("productvo");
		IEverythingService eService = EverythingService.getInstance();
		
	%>
	<%@ include file="/header.jsp" %>
    <div id="wrap">
        <div id="container">
            <div id="main">
                <img src="<%=request.getContextPath()%>/image/sub/shop/shop-main.png" alt="mainImage">
            </div>
            <p class="Heading">에브리댕 굿즈 시리즈</p>
            <!-- 에브리댕 굿즈 시리즈 -->
            <div id="slide" class="swiper">
                <div class="swiper-wrapper">
                <% 
                	for(int i = 1; i < list.size(); i++) {
                		ProductVO vo = list.get(i);
                		List<OptionVO> fileList = eService.selectAllFile(vo.getPr_code());
                		fileList.get(0).getOp_file();
                %>
                        <div class="mainItem swiper-slide">
                            <a href="<%=request.getContextPath()%>/productOption.do?pr_code=<%=vo.getPr_code()%>">
                                <img src="<%=request.getContextPath()%>/images/<%=fileList.get(0).getOp_file()%>" alt="item">
                            </a>
                            
                            <span class="hot">HOT</span>
                            <p class="itemTitle"><%= vo.getPr_name() %></p>
                            <p class="itmePrice"><%= vo.getPr_price() %></p>
                        </div>
                <% 
                }
                %>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
            </div>
            <p class="Heading">전체 상품</p>
            <!-- 전체 상품 -->
            <div id="itemList">
                <% 
                for(int i = 1; i < list.size(); i++) {
                	ProductVO vo = list.get(i);
            		List<OptionVO> fileList = eService.selectAllFile(vo.getPr_code());
            		fileList.get(0).getOp_file();
                	
                %>
                    <div class="allItem">
                        <a href="<%=request.getContextPath()%>/productOption.do?pr_code=<%=vo.getPr_code()%>">
                            <img src="<%=request.getContextPath()%>/images/<%=fileList.get(0).getOp_file()%>" alt="item8">
                        </a>
                        <span class="hot">HOT</span>
                        <p class="itemTitle"><%= vo.getPr_name() %></p>
                        <p class="itmePrice"><%= vo.getPr_price() %></p>
                    </div>
                <%
                	}
                
                %>
            </div>
        </div>
    </div>
    <footer id="footer"></footer>
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

    <script>
         // header & footer
        $("#footer").load("<%=request.getContextPath()%>/footer.jsp");
        
        //swiper
        var swiper = new Swiper('.swiper', {
        slidesPerView: 3,
        spaceBetween: 24,
        loop: true,
        autoplay: {     
            delay: 3500, 
            disableOnInteraction: false, 
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    	});
        
        $(".swiper-wrapper .swiper-slide:eq(3) span.hot").addClass("hotItem");
        $(".swiper-wrapper .swiper-slide:eq(8) span.hot").addClass("hotItem");
        $("#itemList .allItem:eq(3) span.hot").addClass("hotItem");
        $("#itemList .allItem:eq(8) span.hot").addClass("hotItem");
       
    </script>
</body>
</html>