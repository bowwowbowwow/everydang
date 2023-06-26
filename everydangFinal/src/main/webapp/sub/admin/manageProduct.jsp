<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <html lang="ko">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품관리 | 관리자페이지</title>
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
                                <p><a href="<%= request.getContextPath() %>/sub/admin/registerProduct.jsp">상품 등록</a></p>
                        		<p><a href="<%= request.getContextPath() %>/sub/admin/manageProduct.jsp" style="color: black;">상품 관리</a></p> 
                        		<p><a href="<%= request.getContextPath() %>/sub/admin/orderHistory.jsp">주문 내역 관리</a></p> 
                        		<p><a href="<%= request.getContextPath() %>/sub/admin/manageReview.jsp">리뷰 관리</a></p> 
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
                <div class="content-title">
                    <p class="table-title">상품 관리</p>
                    <div class="content-table-count">
                        <p class="table-subtitle">전체 상품</p>
                        <p class="table-count">60</p>
                    </div>
                </div>
                <div id="content-table">
                    <table border="1" class="listTable" id="product-tb">
                        <tr>
                            <th>상품 코드</th>
                            <th>상품 이름</th>
                            <th>상품 가격</th>
                            <th>상품 옵션</th>
                            <th>
                                <div class="sort-div">
                                    <p>좋아요수</p>
                                    <input type="button" id="likeSort" name="likeSort" class="sort">
                                </div>
                            </th>
                            <th></th>
                        </tr>
                        <tr>
                            <td class="pr-code">EV0001</td>
                            <td class="pr-name">에브리댕 핸드폰 케이스</td>
                            <td class="pr-price">18,000</td>
                            <td class="pr-option">
                                <select name="pr-op-select" class="pr-op-select">
	                                <option>아이폰 13mini </option>
									<option>아이폰 pro13  </option>
									<option>아이폰 pro14  </option>
									<option>갤럭시 s23    </option>
									<option>갤럭시 Z FLIP </option>
									<option>갤럭시 Z FOLD3</option>
                                </select>
                            </td>
                            <td class="cr-like">8</td>
                            <td class="product-button-box">
                                <div class="product-button">
                                    <input type="button" value="수정" name="productModify" class="product productModify">
                                    <input type="button" value="삭제" name="productDelete" class="product productDelete">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="pr-code">EV0002</td>
                            <td class="pr-name">에브리댕 봉제 인형</td>
                            <td class="pr-price">9,000</td>
                            <td class="pr-option">
                                <select name="pr-op-select" class="pr-op-select">
                                    <option>사이즈-소</option>
                                    <option>사이즈-중</option>
                                    <option>사이즈-대</option>
                                </select>
                            </td>
                            <td class="cr-like">18</td>
                            <td class="product-button-box">
                                <div class="product-button">
                                    <input type="button" value="수정" name="productModify" class="product productModify">
                                    <input type="button" value="삭제" name="productDelete" class="product productDelete">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="pr-code">EV0003</td>
                            <td class="pr-name">에브리댕 자체 제작 텐트</td>
                            <td class="pr-price">70,000</td>
                            <td class="pr-option">
                                <select name="pr-op-select" class="pr-op-select">
                                    <option>컬러-화이트</option>
                                    <option>컬러-블랙</option>
                                    <option>컬러-옐로우</option>
                                </select>
                            </td>
                            <td class="cr-like">13</td>
                            <td class="product-button-box">
                                <div class="product-button">
                                    <input type="button" value="수정" name="productModify" class="product productModify">
                                    <input type="button" value="삭제" name="productDelete" class="product productDelete">
                                </div>
                            </td>
                        </tr>
                       <tr>
                            <td class="pr-code">EV0004</td>
                            <td class="pr-name">에브리댕 뾱뾱이 인형</td>
                            <td class="pr-price">9,000</td>
                            <td class="pr-option">
                                <select name="pr-op-select" class="pr-op-select">
                                    <option>사이즈-소</option>
                                    <option>사이즈-중</option>
                                    <option>사이즈-대</option>
                                </select>
                            </td>
                            <td class="cr-like">17</td>
                            <td class="product-button-box">
                                <div class="product-button">
                                    <input type="button" value="수정" name="productModify" class="product productModify">
                                    <input type="button" value="삭제" name="productDelete" class="product productDelete">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="pr-code">EV0005</td>
                            <td class="pr-name">에브리댕 자체 제작 텐트</td>
                            <td class="pr-price">70,000</td>
                            <td class="pr-option">
                                <select name="pr-op-select" class="pr-op-select">
                                    <option>사이즈-소</option>
                                    <option>사이즈-중</option>
                                    <option>사이즈-대</option>
                                </select>
                            </td>
                            <td class="cr-like">8</td>
                            <td class="product-button-box">
                                <div class="product-button">
                                    <input type="button" value="수정" name="productModify" class="product productModify">
                                    <input type="button" value="삭제" name="productDelete" class="product productDelete">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="pr-code">EV0006</td>
                            <td class="pr-name">에브리댕 수제 간식</td>
                            <td class="pr-price">6,000</td>
                            <td class="pr-option">
                                <select name="pr-op-select" class="pr-op-select">
                                    <option>닭고기 육포</option>
                                    <option>말고기 육포</option>
                                    <option>소고기 육포</option>
                                    <option>돼지고기 육포</option>
                                </select>
                            </td>
                            <td class="cr-like">15</td>
                            <td class="product-button-box">
                                <div class="product-button">
                                    <input type="button" value="수정" name="productModify" class="product productModify">
                                    <input type="button" value="삭제" name="productDelete" class="product productDelete">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="pr-code">EV0007</td>
                            <td class="pr-name">에브리댕 비건 강아지 샴푸</td>
                            <td class="pr-price">10,000</td>
                            <td class="pr-option">
                                <select name="pr-op-select" class="pr-op-select">
                                    <option>포도향</option>
                                    <option>딸기향</option>
                                    <option>레몬향</option>
                                </select>
                            </td>
                            <td class="cr-like">3</td>
                            <td class="product-button-box">
                                <div class="product-button">
                                    <input type="button" value="수정" name="productModify" class="product productModify">
                                    <input type="button" value="삭제" name="productDelete" class="product productDelete">
                                </div>
                            </td>
                        </tr>  
                        <tr>
                            <td class="pr-code">EV0008</td>
                            <td class="pr-name">에브리댕 리드줄</td>
                            <td class="pr-price">8,000</td>
                            <td class="pr-option">
                                <select name="pr-op-select" class="pr-op-select">
                                    <option>사이즈-소</option>
                                    <option>사이즈-중</option>
                                    <option>사이즈-대</option>
                                </select>
                            </td>
                            <td class="cr-like">8</td>
                            <td class="product-button-box">
                                <div class="product-button">
                                    <input type="button" value="수정" name="productModify" class="product productModify">
                                    <input type="button" value="삭제" name="productDelete" class="product productDelete">
                                </div>
                            </td>
                        </tr>  
                       <tr>
                            <td class="pr-code">EV0009</td>
                            <td class="pr-name">에브리댕 강아지 옷</td>
                            <td class="pr-price">15,000</td>
                            <td class="pr-option">
                                <select name="pr-op-select" class="pr-op-select">
                                    <option>사이즈-중</option>
                                    <option>사이즈-소</option>
                                    <option>사이즈-대</option>
                                </select>
                            </td>
                            <td class="cr-like">4</td>
                            <td class="product-button-box">
                                <div class="product-button">
                                    <input type="button" value="수정" name="productModify" class="product productModify">
                                    <input type="button" value="삭제" name="productDelete" class="product productDelete">
                                </div>
                            </td>
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
                            <td></td>
                        </tr>        
                    </table>
                </div>
                <div aria-label="Page navigation example" class="page">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#" style="color:var(--color-blue)">1</a></li>
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