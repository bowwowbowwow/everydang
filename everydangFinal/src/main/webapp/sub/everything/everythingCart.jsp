<%@page import="com.everydang.vo.OptionVO"%>
<%@page import="java.util.List"%>
<%@page import="com.everydang.everything.service.EverythingService"%>
<%@page import="com.everydang.everything.service.IEverythingService"%>
<%@page import="com.everydang.vo.ProductVO"%>
<%@page import="com.everydang.vo.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니 | 에브리띵</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/everything/everythingCart.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<%@ include file="/header.jsp" %>
	<% 
		IEverythingService service = EverythingService.getInstance();
		List<CartVO> cartList = service.selectCartById(memId);
		
	%>
    <div id="wrap">
        <div id="container">
            <!-- 탭 -->
            <div id="tabBox">
                <div id="tabSub">
                <!--!!!!!!!!!!!!!!!!!!!링크 못 클릭하게 변경!!!!!!!!!!!!!! -->
                    <a href="<%=request.getContextPath()%>/sub/everything/everythingWish.jsp" class="btnLeft tab selected">
                        <p id="cartTab">장바구니</p>
                    </a>
                    <a href="<%=request.getContextPath()%>/sub/everything/everythingWish.jsp" class="btnRight tab">
                        <p id="wishTab">위시리스트</p>
                    </a>
                </div>
            </div>
            <!---------------------------FORM 장바구니 & 결제하기 ------------------------------>
             <form action="<%=request.getContextPath()%>/cartToPay.do" method="post" ectype="multipart/form-data" id="cartForm">            <div id="both">
                <!-- 장바구니 -->
               <div id="cart" style="width : 864px">
               <%
              	int sum = 0;
                String code = "";
               	for(int i=0; i<cartList.size();i++) {
               		CartVO vo = cartList.get(i);
               		code = vo.getPr_code();//장바구니에 담긴 상품 코드 
               		ProductVO productvo = service.selectProduct(code); // 상품코드로 불러오는 상품 정보 
               		int prPrice = productvo.getPr_price(); //상품 가격 
               		int prCount = vo.getCr_count(); // 담은 수 
               		int cartPrice = prPrice * prCount; //각 상품별 총합 
	            		List<OptionVO> fileList = service.selectAllFile(code);
               		
            			fileList.get(0).getOp_file();
               		
               		sum += cartPrice;
               	%>
                    <div class="cartBox">

                        <div class="left">
                            <div class="title">
                                <a href="<%=request.getContextPath()%>/productOption.do?pr_code=<%=code%>">
                                    <img src="<%=request.getContextPath()%>/images/<%=fileList.get(0).getOp_file() %>" alt="item" style="width: 90px;">
                                </a>
                                <div class="text">
                                    <p class="op itemTitle"><%=productvo.getPr_name() %></p>
                                    <p class="itemPrice"><span class="aaa" data-price="<%=productvo.getPr_price() %>"><%=productvo.getPr_price() %></span>원</p>
                                    <input type="text" readonly="readonly" value="<%=vo.getCr_selop()%>" class="op itemOption" name="crSelop" style="border: none">
                                </div>
                            </div>
                            <div class="option">
                                <div class="itemSelect">
                                    <select name="selectOption" class="selectOption">
                                    <option selected disabled="disabled">옵션 선택</option>
                                     <% 
									    List<OptionVO> optionList = service.selectAllOption(vo.getPr_code());
									    for (OptionVO optionvo : optionList) {
									        String selected = "";
									        if (optionvo.getOp_name().equals(vo.getCr_selop())) {
									            selected = "selected";
									        }
									    %>
									        <option value="<%=optionvo.getOp_name()%>" <%=selected%>><%=optionvo.getOp_name()%></option>
									    <% } %>
                                    </select>
                                    
                                </div>
                                <div id="volume">
                                    <div class="volumeBox minus"></div>
                                    <input type="text" readonly="readonly" class="count" value="<%=vo.getCr_count()%>" name = "count" style="border: none; width: 20px; text-align: center; outline: none"> 
                                    <div class="volumeBox plus"></div>
                                </div>
                            </div>
                        </div>
                        <div class="right">
                            <input type="text" readonly="readonly" style="display: none;" name="<%=code%>">
                            <div class="x" style="cursor: pointer;"></div>
                        </div>
                    </div>
                    <%} %>
                </div>
                <!-- 결제하기 -->
                <div id="pay">
                    <div id="fixed">
                        <div id="top">
                            <h3>결제 예정 금액</h3>
                        </div>
                        <div id="middle">
                            <div id="totalCartPrice" class="middleDisplay">
                                <span class="mText">총 제품 금액</span>
                                <span class="mCost"><input type="text" readonly="readonly" id="totalCart" value="<%=sum%>" style="border: none; width: 100px; text-align: right; outline: none; font-size: 1.7rem; color: var(--color-blue)"> 원</span>
                                
                            </div>
                            <div id="deliver" class="middleDisplay">
                                <span class="mText">배송비</span>
                                <span class="mCost">3,000원</span>
                            </div>
                            
                        </div>
                        <div id="bottom">
                            <span class="totalCost">합계</span>
                            <span class="totalCost"><strong><%=sum+3000%></strong> 원</span>
                        </div>
                        <button type="submit" id="payBtn">주문하기</button>
                    </div>
                </div>
             </form>
            </div>
            <!---------------------------FORM 장바구니 & 결제하기 ------------------------------>
        </div>
    </div>
    <footer id="footer"></footer>
    <script src="<%=request.getContextPath()%>/js/everything/everything.js"></script>
    <script>
    	myPath = '<%=request.getContextPath()%>';
        // header & footer
        $("#footer").load("<%=request.getContextPath()%>/footer.jsp");
        
     // 수량 증가 감소
       	 vtotal = parseInt($('#totalCart').val());
         $('.plus').on('click',function(){
        	 $(".minus").attr("disabled",false);
        	 let quantity = $(this).parent().find('.count').val();
        	 $(this).parent().find('.count').val(++quantity);
        	 x = $(this).parents('.cartBox').find('.aaa').attr('data-price');
        	         	 
        	 vtotal += parseInt(x);
        	 
        	 $('#totalCart').val(vtotal);
        	 $('.totalCost strong').text(vtotal + 3000);        		 
         })
         
         $("#payBtn").on("click", function() {
		})
        
         $('.minus').on('click', function(){
        	let quantity = $(this).parent().find('.count').val();
        	console.log(quantity);
        	if(quantity > 1) {
        		$(this).parent().find('.count').val(--quantity);
        		x = $(this).parents('.cartBox').find('.aaa').attr('data-price');
        		
        		vtotal -= parseInt(x);
        		
        		$('#totalCart').val(vtotal);
        		$('.totalCost strong').text(vtotal + 3000);
        	}else {
        		$(this).attr("disabled",true)
        	}
         })
 	
     // 옵션    
     target = "";
     $("select").on('change',function(){
    	 target = $(this).val();
    	 
     	($(this).parents('.left').find('.itemOption')).val(target);
     	$(this).parents('.left').find('.op').attr('name',target);
     })
	 
     $('.x').on('click',function(){
    	 code = $(this).parent().find('input').attr('name');
    	 crSelop = $(this).parents('.cartBox').find('.itemOption').val();
    	 console.log(crSelop);
    	 $cartBox = $(this).parents('.cartBox');
    	 
    	// 장바구니에 담겨있던 금액 (수량 * 가격) 
		cprice = $(this).parents('.cartBox').find('.itemPrice .aaa').attr('data-price');
    	csu = $(this).parents('.cartBox').find('.count').val();
    	cto = cprice * csu;
    	console.log(cto)
    	deleteCart();
     })
	
    </script>
</body>      
</html>