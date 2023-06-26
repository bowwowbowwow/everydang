<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <html lang="ko">
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문내역관리 | 관리자페이지</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <script src="<%= request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminMain.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/admin.css">
</head>
<body>
<%@ include file="/sub/admin/adminHeader.jsp" %>  <div id="wrap">
    <div id="container">
      <div id="sideMenu">
          <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                        <img src="<%= request.getContextPath() %>/image/icon/icon-user-green.png" alt="icon-user-green.png" class="selectIcon">
                        <p class="selectText">회원 관리</p>
                    </button>
                  <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                      <p><a href="<%= request.getContextPath() %>/memberList.do?">회원 관리</a></p>
                      <p><a href="<%= request.getContextPath() %>/sub/admin/manageReport.jsp">강등/블랙리스트</a></p>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                        <img src="<%= request.getContextPath() %>/image/icon/icon-document-green.png" alt="icon-document-green.png" class="selectIcon">
                        <p class="selectText">회원 게시글 관리</p>
                    </button>
                  <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                      <p><a href="<%= request.getContextPath() %>/sub/admin/manageMemPost.jsp">게시글 관리</a></p>
                      <p><a href="<%= request.getContextPath() %>/sub/admin/manageMemComment.jsp">댓글 관리</a></p>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                        <img src="<%= request.getContextPath() %>/image/icon/icon-document-green.png" alt="icon-document-green.png" class="selectIcon">
                        <p class="selectText">관리자 게시글 관리</p>
                    </button>
                  <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                      <p><a href="<%= request.getContextPath() %>/sub/admin/manageMyPost.jsp">게시글 관리</a></p>
                      <p><a href="<%= request.getContextPath() %>/sub/admin/manageMyComment.jsp">댓글 관리</a></p>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                        <img src="<%= request.getContextPath() %>/image/icon/icon-cart-green.png" alt="icon-cart-green.png" class="selectIcon">
                        <p class="selectText">쇼핑몰 관리</p>
                      </button>
                    <div id="flush-collapseFour" class="accordion-collapse collapse show" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                      <div class="accordion-body">
                        <p><a href="<%= request.getContextPath() %>/sub/admin/registerProduct.jsp">상품 등록</a></p>
                        <p><a href="<%= request.getContextPath() %>/sub/admin/manageProduct.jsp">상품 관리</a></p> 
                        <p><a href="<%= request.getContextPath() %>/sub/admin/orderHistory.jsp" style="color:black;">주문 내역 관리</a></p> 
                        <p><a href="<%= request.getContextPath() %>/sub/admin/manageReview.jsp">리뷰 관리</a></p> 
                      </div>
                    </div>
                </div>
          </div>
          <hr id="sideMenuHr">
          <div id="chatbotMenu">
            <img src="<%= request.getContextPath() %>/image/icon/icon-comment-green.png" alt="icon-comment-green.png" id="chatbotIcon">
            <span id="chatbotText"><a href="https://desk.channel.io/#/channels/134531/user_chats/646dfb24c57b0cab08c0">챗봇 관리 바로가기</a></span>
          </div>
      </div>
      <div id="content">
        <div id="content-title">
          <p class="table-title">주문 내역 관리</p>
          <div class="content-table-count">
            <p class="table-subtitle">전체 주문</p>
            <p class="table-count">5</p>
          </div>
        </div>
        <div id="content-table">
          <table border="1" class="listTable" id="order-history">
            <tr>
              <th>주문 번호</th>
              <th>주문 상세</th>
              <th>총 결제 금액</th>
              <th>구매자</th>
              <th>연락처</th>
              <th>배송지</th>
              <th>주문상태</th>
            </tr>
            <tr>
              <td class="order-no">A152348019</td>
              <td class="order-detail">에브리댕 강아지 옷</td>
              <td class="total-amount">18,000원</td>
              <td class="customer">ddit1234</td>
              <td class="customer">010-0000-0000</td>
              <td class="customer">대전 중구 계룡로 846 대덕인재개발원 402호</td>
              <td class="order-status">결제 완료</td>
            </tr>
            <tr>
              <td class="order-no">A679245190</td>
              <td class="order-detail">에브리댕 봉제 인형 외 3건</td>
              <td class="total-amount">89,000원</td>
              <td class="customer">doooog123</td>
              <td class="customer">010-9340-1390</td>
              <td class="customer">광주 서구 월드컵4강로 38 HJ그린빌딩 4층</td>
              <td class="order-status">결제 완료</td>
            </tr>
            <tr>
              <td class="order-no">A248765081</td>
              <td class="order-detail">에브리댕 자체 제작 텐트</td>
              <td class="total-amount">73,000원</td>
              <td class="customer">honggildong</td>
              <td class="customer">010-4813-4919</td>
              <td class="customer">대전 동구 대전로448번길 11, 1동 202</td>
              <td class="order-status">결제 완료</td>
            </tr>
            <tr>
              <td class="order-no">A432091136</td>
              <td class="order-detail">에브리댕 리드줄 외 1건</td>
              <td class="total-amount">19,000원</td>
              <td class="customer">puppy2love</td>
              <td class="customer">010-9432-8324</td>
              <td class="customer">서울 성북구 성북로4길 52 한신한진아파트, 201동 1904호</td>
              <td class="order-status">결제 완료</td>
            </tr>
            <tr>
              <td class="order-no">A592014992</td>
              <td class="order-detail">에브리댕 뾱뾱이 인형 외 2건</td>
              <td class="total-amount">26,000원</td>
              <td class="customer">wangwan9</td>
              <td class="customer">010-5943-0319</td>
              <td class="customer">대전 중구 태평로 65 삼부3단지아파트, 303동 901호</td>
              <td class="order-status">결제 완료</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
          </table>
        </div>
        <div aria-label="Page navigation example" class="page">
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#" style="color: var(--color-blue);">1</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <footer id="footer"></footer>
  <script>
    $("#footer").load("<%= request.getContextPath() %>/footer.jsp");
  </script>
</body>
</html>