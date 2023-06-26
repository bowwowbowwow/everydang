<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<head>
    <html lang="ko">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품등록 | 관리자페이지</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <script src="<%= request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminMain.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/admin.css">
</head>

<body>
<%@ include file="/sub/admin/adminHeader.jsp" %>
    <div id="wrap">
        <div id="container">
            <div id="sideMenu">
                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <div class="accordion-item">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                            <img src="<%= request.getContextPath() %>/image/icon/icon-user-green.png" alt="icon-user-green.png"
                                class="selectIcon">
                            <p class="selectText">회원 관리</p>
                        </button>
                        <div id="flush-collapseOne" class="accordion-collapse collapse"
                            aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">
                                <p><a href="<%= request.getContextPath() %>/memberList.do?">회원 관리</a></p>
                                <p><a href="<%= request.getContextPath() %>/sub/admin/manageReport.jsp">강등/블랙리스트</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                            <img src="<%= request.getContextPath() %>/image/icon/icon-document-green.png" alt="icon-document-green.png"
                                class="selectIcon">
                            <p class="selectText">회원 게시글 관리</p>
                        </button>
                        <div id="flush-collapseTwo" class="accordion-collapse collapse"
                            aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">
                                <p><a href="<%= request.getContextPath() %>/sub/admin/manageMemPost.jsp">게시글 관리</a></p>
                                <p><a href="<%= request.getContextPath() %>/sub/admin/manageMemComment.jsp">댓글 관리</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseThree" aria-expanded="false"
                            aria-controls="flush-collapseThree">
                            <img src="<%= request.getContextPath() %>/image/icon/icon-document-green.png" alt="icon-document-green.png"
                                class="selectIcon">
                            <p class="selectText">관리자 게시글 관리</p>
                        </button>
                        <div id="flush-collapseThree" class="accordion-collapse collapse"
                            aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">
                                <p><a href="<%= request.getContextPath() %>/sub/admin/manageMyPost.jsp">게시글 관리</a></p>
                                <p><a href="<%= request.getContextPath() %>/sub/admin/manageMyComment.jsp">댓글 관리</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseFour" aria-expanded="false"
                            aria-controls="flush-collapseFour">
                            <img src="<%= request.getContextPath() %>/image/icon/icon-cart-green.png" alt="icon-cart-green.png"
                                class="selectIcon">
                            <p class="selectText">쇼핑몰 관리</p>
                        </button>
                        <div id="flush-collapseFour" class="accordion-collapse collapse show"
                            aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">
                                <p><a href="<%= request.getContextPath() %>/sub/admin/registerProduct.jsp" style="color:black;">상품 등록</a></p>
                                <p><a href="<%= request.getContextPath() %>/sub/admin/manageProduct.jsp">상품 관리</a></p>
                                <p><a href="<%= request.getContextPath() %>/sub/admin/orderHistory.jsp">주문 내역 관리</a></p>
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
                <div class="content-title">
                    <p class="table-title">상품 등록</p>
                </div>
                <form action="<%= request.getContextPath() %>/registerProd.do" method="post" enctype="multipart/form-data">
                	<div class="content-product-info">

                	
                        <div class="content-table-count">
                            <p class="table-subtitle">상품 코드</p>
                        </div>
                        <input type="text" name="prodCode" id="prodCode" placeholder="상품 코드를 입력해주세요.">
                    </div>
                    <div class="content-product-info">
                        <div class="content-table-count">
                            <p class="table-subtitle">상품 이름</p>
                        </div>
                        <input type="text" name="prodName" id="prodName" placeholder="상품 이름을 입력해주세요.">
                    </div>
                    <div class="content-product-info">
                        <div class="content-table-count">
                            <p class="table-subtitle">상품 금액</p>
                        </div>
                        <div class="content-product-price">
                            <input type="text" name="prodPrice" id="prodPrice" placeholder="상품 금액을 입력해주세요.">
                            <p id="priceKRW">원</p>
                        </div>
                    </div>
                    <div class="content-product-info">
                        <div class="content-table-count">
                            <p class="table-subtitle">상품 이미지</p>
                        </div>
                        <div class="content-product-option">
                            <input type="file" name="productImage" id="productImage" multiple>
                        </div>
                    </div>
                    <div class="content-product-info">
                        <div class="content-table-count">
                            <p class="table-subtitle">상품 옵션</p>
                        </div>
                        <div class="content-product-option">
                            <input type="text" name="optionInput" id="optionInput"
                                placeholder="상품 옵션을 등록해주세요. (예시: 컬러, 사이즈 등)">
                            <input type="button" value="등록" id="registerOption" name="registerOption">
                        </div>
                        <div id="optionDisplay"></div>
                    </div>
                    <div class="content-product-info">
                        <input type="submit" value="상품 등록" id="registerProduct" name="registerProduct">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer id="footer"></footer>
    <script>
      $("#footer").load("<%= request.getContextPath() %>/footer.jsp");
      
      // 옵셥 추가 버튼 클릭 이벤트
      var counter = 1;
      $(document).on('click', '#registerOption', function(){
    	  var inputValue = $("#optionInput").val();

          // 새로운 <div>를 생성하여 값을 추가합니다.
          var newDiv = $("<div>").addClass("option-div");
          var newOption = $("<input type='text'>").attr("name", inputValue).attr("readonly", "readonly").attr("value", inputValue);
          var newButton = $("<input>").attr({
              type: "button",
              value: "X",
              class: "deleteOption",
              name: "deleteOption"
          });

          // 옵션 인덱스를 데이터 속성으로 추가합니다.
          newOption.attr("idx", counter);

          newDiv.append(newOption, newButton);
          $("#optionDisplay").append(newDiv);

          // 삭제 버튼 클릭 시 해당 <div>를 제거합니다.
          newButton.click(function() {
              newDiv.remove();
          });

          // 입력 필드를 초기화합니다.
          $("#optionInput").val("");

          // 카운터 변수를 증가시킵니다.
          counter++;
      });
      
    </script>
</body>

</html>