<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <html lang="ko">
  <meta charset="UTF-8"> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>리뷰관리 | 관리자페이지</title>
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
                        <p><a href="<%= request.getContextPath() %>/sub/admin/orderHistory.jsp">주문 내역 관리</a></p> 
                        <p><a href="<%= request.getContextPath() %>/sub/admin/manageReview.jsp" style="color:black;">리뷰 관리</a></p> 
                      </div>
                    </div>
                </div>
          </div>
          <hr id="sideMenuHr">
          <div id="chatbotMenu">
            <img src="<%= request.getContextPath() %>/image/icon/icon-comment-green.png" alt="icon-comment-green.png" id="chatbotIcon">
            <span id="chatbotText"><a href="https://desk.channel.io/#/signin?redirectTo=/channels/134531/user_chats/646dfb24c57b0cab08c0">챗봇 관리 바로가기</a></span>
          </div>
      </div>
      <div id="content">
        <div id="content-title">
          <p class="table-title">리뷰 관리</p>
          <div class="content-table-count">
            <p class="table-subtitle">전체 리뷰</p>
            <p class="table-count">7</p>
          </div>
        </div>
        <div id="content-table">
          <table border="1" class="listTable" id="review">
            <tr>
              <th></th>
              <th>리뷰 번호</th>
              <th>상품 이름</th>
              <th>구매자</th>
              <th>별점</th>
              <th>한줄평</th>
              <th>리뷰 날짜</th>
            </tr>
            <tr>
              <td><input type="checkbox"></td>
              <td class="rv-no">RV0006</td>
              <td class="prod-name">에브리댕 강아지 옷</td>
              <td class="customer">ddit1234</td>
              <td class="rv-star">4점</td>
              <td class="rv-comment">옷이 정말 귀여워요!</td>
              <td class="rv-date">2023-06-20</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td class="rv-no">RV0005</td>
                <td class="prod-name">에브리댕 수제 간식</td>
                <td class="customer">doooog123</td>
                <td class="rv-star">5점</td>
                <td class="rv-comment">저희 강아지 입맛이 굉장히 까다로운데 에브리댕 간식은 정말 잘 먹어요 ♡</td>
                <td class="rv-date">2023-06-20</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td class="rv-no">RV0004</td>
                <td class="prod-name">에브리댕 봉제 인형</td>
                <td class="customer">doooog123</td>
                <td class="rv-star">4점</td>
                <td class="rv-comment">생각보다 사이즈가 좀 커요. 세탁하기가 살짝 번거로워요.</td>
                <td class="rv-date">2023-06-19</td>
            </tr>
            <tr>
              	<td><input type="checkbox"></td>
                <td class="rv-no">RV0004</td>
                <td class="prod-name">에브리댕 비건 강아지 샴푸</td>
                <td class="customer">doooog123</td>
                <td class="rv-star">5점</td>
                <td class="rv-comment">비건에 성분도 좋고 순해서 안심하고 사용 수 있어요.</td>
                <td class="rv-date">2023-06-19</td>
            </tr>
            <tr>
              	<td><input type="checkbox"></td>
                <td class="rv-no">RV0003</td>
                <td class="prod-name">에브리댕 자체 제작 텐트</td>
                <td class="customer">honggildong</td>
                <td class="rv-star">3점</td>
                <td class="rv-comment">상품은 만족스러운데 저희 애가 사용을 안 해요 ㅠ</td>
                <td class="rv-date">2023-06-19</td>
            </tr>
            <tr>
              	<td><input type="checkbox"></td>
                <td class="rv-no">RV0002</td>
                <td class="prod-name">에브리댕 리드줄</td>
                <td class="customer">puppy2love</td>
                <td class="rv-star">5점</td>
                <td class="rv-comment">튼튼해서 좋아요!</td>
                <td class="rv-date">2023-06-18</td>
            </tr>
            <tr>
              <td><input type="checkbox"></td>
                <td class="rv-no">RV0001</td>
                <td class="prod-name">에브리댕 뾱뾱이 인형</td>
                <td class="customer">wangwan9</td>
                <td class="rv-star">5점</td>
                <td class="rv-comment">이 인형 사주고 나서 맨날 이것만 가지고 놀아요ㅎ</td>
                <td class="rv-date">2023-06-18</td>
            </tr>
            <tr>
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
            </tr>
            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><input type="checkbox"></td>
              <td style="font-size: 1.7rem; font-weight: bold;">선택한 리뷰</td>
              <td colspan="5">
                <div id="del-black">
                    <input type="button" value="삭제" name="delete" class="delete">
                </div>
              </td>
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