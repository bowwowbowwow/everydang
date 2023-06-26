<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 | 에브리띵</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/everything/everythingPay.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
    <div id="wrap">
    <%@ include file="/header.jsp" %>
        <main>
        <form action="#">
            <div class="container main-wrap">
                <h1>주문/결제</h1>
                <div id="both">
                    <!-- 결제정보 -->
                    <div id="main-view">
                        <div id="prod-info">
                            <div class="view-title">
                                <h2>주문 상품 정보</h2>
                            </div>
                            <div class="view-content">
                                <div class="content-wrap">
                                    <ul>
                                    <!----------------반복------------->
                                    <li class="prod-list">
                                            <div class="info-area">
                                                <p id="prod-img" class="prod-img3"></p>
                                                <div class="info">
                                                    <p class="name">에브리댕 강아지 옷</p>
                                                    <p class="price">15,000원</p>
                                                    <p class="option">
                                                        옵션: <span id="prod-option">사이즈-소</span>  
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="cart-info">
                                                <p>
                                                    수량: <span id="count">1</span>개
                                                </p>
                                            </div>
                                        </li>
                                    <!----------------반복------------->
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div>
                                <div id="delivery-info">
                                    <div class="view-title">
                                        <h2>주문자 정보</h2>
                                    </div>
                                    <div class="view-content">
                                        <div class="content-wrap">
                                            <div class="check-wrap">
                                                <input type="checkbox" name="userInfoChk" id="input-userinfoChk">
                                                <label for="input-userinfoChk">구매자 정보와 동일</label>
                                            </div>
                                            <div class="input-field">
                                                <label for="user-name">수령인</label>
                                                <input type="text" name="userName" id="user-name" placeholder="이름을 입력해주세요.">
                                            </div>
                                            <div class="input-field">
                                                <label for="user-tel">휴대폰 번호</label>
                                                <input type="text" name="userTel" id="user-tel" placeholder="010-1234-1234">
                                            </div>
                                            <div class="input-field">
                                                <label for="user-name">배송지</label>
                                                <div class="addr-wrap">
                                                    <input type="text" name="userAddr1" id="user-addr1" placeholder="우편번호">
                                                    <input type="button" value="주소 검색" id="search-addr">
                                                </div>
                                                <div class="addr-wrap addr-details">
                                                    <input type="text" name="userAddr2" id="user-addr2" placeholder="주소" readonly>
                                                    <input type="text" name="userAddrDetail" id="user-addr-detail" placeholder="상세주소">
                                                </div>
                                                <div class="required-wrap">
                                                    <input type="text" placeholder="배송시 요청사항을 기입해주세요." id="user-required">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               <!--  <div id="point-info">
                                    <div class="view-title">
                                        <h2>포인트 사용</h2>
                                    </div>
                                    <div class="view-content">
                                        <div class="content-wrap">
                                            <div class="input-field">
                                                <div class="point-wrap">
                                                    <div class="input-wrap">
                                                        <input type="text" name="point" id="input-point" placeholder="상품 금액을 입력해주세요.">
                                                        <p id="priceKRW">원</p>
                                                    </div>
                                                    <p class="user-point-info">
                                                        보유 포인트 : 
                                                        <span id="user-point">1000</span> 원
                                                    </p>
                                                </div>
                                                <input type="button" value="사용" id="btn-use">
                                            </div>
                                        </div>
                                    </div>
                                </div> -->
                        </div>
                    </div>
                    <!-- 결제하기 -->
                    <div id="pay">
                        <div id="fixed">
                            <div id="top">
                                <h3>결제 예정 금액</h3>
                            </div>
                            <div id="middle">
                                <div id="total" class="middleDisplay">
                                    <span class="mText">총 제품 금액</span>
                                    <span class="mCost">15000원</span>
                                </div>
                                <div id="deliver" class="middleDisplay">
                                    <span class="mText">배송비</span>
                                    <span class="mCost"><strong id="deliverCost">3000</strong>원</span>
                        
                                </div>
                                <%--  <div id="point" class="middleDisplay"   >
                                    <span class="mText">포인트 사용</span>
                                    <span class="mCost"><strong>5,000</strong>원</span>
                                </div>  --%>
                            </div>
                            <div id="bottom">
                                <span class="totalCost">합계</span>
                                <span class="totalCost"><strong>18,000</strong> 원</span>
                            </div>
                            <button id="payBtn" type="button">결제하기</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </main>
        <div id="footer"></div>
    </div>
    <script src="<%=request.getContextPath()%>/js/common.js"></script>
    <script>
        // header & footer
        $("#footer").load("<%=request.getContextPath()%>/footer.jsp");
        
        $(document).ready(function() {
        	  $("#input-userinfoChk").change(function() {
        	    if ($(this).is(":checked")) {
        	     
        	      $("#user-name").val("김대덕").prop("disabled", false);
        	      $("#user-tel").val("010-0000-0000").prop("disabled", false);
        	      $("#user-addr1").val("34908").prop("disabled", false);
        	      $("#user-addr2").val("대전 중구").prop("disabled", false);
        	      $("#user-addr-detail").val("계룡로 846 대덕인재개발원 402호").prop("disabled", false);
        	      
        	    } else {
        	      $("#user-name").val("").prop("disabled", true);
        	      $("#user-tel").val("").prop("disabled", true);
        	      $("#user-addr1").val("").prop("disabled", true);
        	      $("#user-addr2").val("").prop("disabled", true);
        	      $("#user-addr-detail").val("").prop("disabled", true);
        	      
        	    }
        	  });
        	});
       	$('#payBtn').on('click',function(){
       		window.location.href = "<%=request.getContextPath()%>/sub/everything/payResult.jsp";
       	})
    </script>
</body>
</html>