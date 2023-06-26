<%@page import="com.everydang.vo.OptionVO"%>
<%@page import="com.everydang.vo.ProductVO"%>
<%@page import="com.everydang.everything.service.EverythingService"%>
<%@page import="com.everydang.everything.service.IEverythingService"%>
<%@page import="com.everydang.everything.service.WishService"%>
<%@page import="com.everydang.everything.service.IWishService"%>
<%@page import="com.everydang.vo.WishVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>위시리스트 | 에브리띵</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/everything/everythingWish.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<%@ include file="/header.jsp" %>
<% 
	IWishService service = WishService.getInstance();
	IEverythingService eService = EverythingService.getInstance();
	List<WishVO> wishList = service.selectAllWish(memId);
	
%> 
    <div id="wrap">
        <div id="container">
            <!-- 탭 -->
            <div id="tabBox">
                <div id="tabSub">
                    <a href="<%=request.getContextPath()%>/sub/everything/everythingCart.jsp" class="btnLeft tab">
                        <p id="cartTab">장바구니</p>
                    </a>
                    <a href="<%=request.getContextPath()%>/sub/everything/everythingWish.jsp" class="btnRight tab selected">
                        <p id="wishTab">위시리스트</p>
                    </a>
                </div>
            </div>
            <div id="wishlistBox">
                <div class="wishRow">
            	<% 
            	for (int i = 0; i< wishList.size(); i++) {
            		WishVO vo = wishList.get(i);
            		String prCode = vo.getPr_code();
            		ProductVO pvo = eService.selectProduct(prCode);
            		
            		IEverythingService service2 = EverythingService.getInstance();
            		List<OptionVO> fileList = service2.selectAllFile(prCode);
            		String file = fileList.get(0).getOp_file();
            	%>
                    <div class="wishItem">
                        <button class="x" style="cursor: pointer;"></button>
                        <a href="<%=request.getContextPath()%>/productOption.do?pr_code=<%=prCode%>" id="<%=prCode%>">
                            <img src="<%=request.getContextPath()%>/images/<%=file %>" alt="item1">
                        </a>
                        <span class="hot hotItem">HOT</span>
                        <p class="itemTitle"><%=pvo.getPr_name() %></p>
                        <p class="itmePrice"><%=pvo.getPr_price() %></p>
                    </div>
            <%} %>
                </div>
            </div>
        </div>
    </div>
    <footer id="footer"></footer>
    <script src="<%=request.getContextPath()%>/js/everything/everything.js"></script>
    <script>
    	myPath = '<%=request.getContextPath()%>';
        // header & footer
        $("#footer").load("<%=request.getContextPath()%>/footer.jsp");
        
        $('.x').on('click',function(){
        	memId = '<%=memId%>';
        	prCode = $(this).parent().find('a').attr('id');
        	wishBox = $(this).parent();
        	//console.log(prCode)
        	deleteWish(); 
        })
    </script>
</body>ㅂ
</html>