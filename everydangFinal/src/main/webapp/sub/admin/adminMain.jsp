<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.everydang.vo.AdminVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <html lang="ko">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>관리자페이지 | 에브리댕</title>
  <link rel="icon" href="/everydang/assets/favicon.ico">
  <script src="<%= request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminMain.css">
</head>
<body>
 
<%
int memberTotalCount = (int) (request.getAttribute("memberTotalCount"));
int todayJoinMember = (int) (request.getAttribute("todayJoinMember"));
int todayNewReport = (int) (request.getAttribute("todayNewReport"));
%>

<%@ include file="/sub/admin/adminHeader.jsp" %>
  <div id="wrap">
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
                    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                      <div class="accordion-body">
                        <p><a href="<%= request.getContextPath() %>/sub/admin/registerProduct.jsp">상품 등록</a></p>
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
      <div id="dashboard">
        <div id="dashboard-up">
          <div class="dashboard" id="dashboard-one">
            <div class="db1" id="totalMember">
              <div class="db1-list-title">
                <img class="db-icon" src="<%= request.getContextPath() %>/image/icon/icon-user-black.png" alt="icon-document-green.png">
                <p>총 회원수</p>
              </div>
              <div class="db1-list-content">
                  <p id="totalMemCount" class="changeNum">
                  <%= memberTotalCount %>
                  </p>
                  &nbsp;<p class="count">명</p>
              </div>
            </div>
            <div class="db1" id="newMember">
              <div class="db1-list-title">
                <img class="db-icon" src="<%= request.getContextPath() %>/image/icon/icon-user-black.png" alt="icon-document-green.png">
                <p>신규 가입 회원</p>
              </div>
              <div class="db1-list-content">
                  <p id="newMemCount" class="changeNum">
                  <%= todayJoinMember %>
                  </p>
                  &nbsp;<p class="count">명</p>
              </div>
            </div>
            <div class="db1" id="newReport">
              <div class="db1-list-title">
                <img class="db-icon" src="<%= request.getContextPath() %>/image/icon/icon-warning-black.png" alt="icon-warning-black.png">
                <p>신규 신고 접수</p>
              </div>
              <div class="db1-list-content">
                  <p id="reportCount" class="changeNum">
                  <%= todayNewReport %>
                  </p>
                  &nbsp;<p class="count">건</p>
              </div>
            </div>
          </div>
          <div class="dashboard" id="dashboard-two">
            <div class="dashboard-title">
              <img class="db-icon" src="<%= request.getContextPath() %>/image/icon/icon-document-green.png" alt="icon-document-green.png">
              <p>최신 게시글</p>
            </div>
            <div class="dashboard-table">
              <table border="1" class="listTable">
                <tr>
                  <th>작성자</th>
                  <th>카테고리</th>
                  <th>제목</th>
                  <th>댓글수</th>
                </tr>
                <%
                List<AdminVO> newPostList = (List<AdminVO>) request.getAttribute("newPostList");
                
                for (AdminVO vo : newPostList) {
                %>
                <tr>
                  <td class="new-writer"><%= vo.getMm_id() + "(" + vo.getMm_nickname() + ")" %></td>
                  <td class="new-board"><%= vo.getBr_name() %></td>
                  <td class="new-title"><a href="<%=request.getContextPath() %>/postRead.do?board=<%=vo.getBr_code()%>&no=<%=vo.getPs_no()%>"><%= vo.getPs_subject() %></a></td>
                  <td class="new-comment-cnt"><%= vo.getComment_count() %></td>
                </tr>
                <% } %>
              </table>
            </div>
          </div>
        </div>
        <div id="dashboard-down">
          <div class="dashboard" id="dashboard-three">
            <div class="dashboard-title">
              <img class="db-icon" src="<%= request.getContextPath() %>/image/icon/icon-document-green.png" alt="icon-document-green.png">
              <p>인기 게시글</p>
            </div>
            <div class="dashboard-table">
              <table border="1" class="listTable" id="listTable-two">
                <tr>
                  <th>작성자</th>
                  <th>카테고리</th>
                  <th>제목</th>
                  <th>좋아요수</th>
                </tr>
                <%
                List<AdminVO> popularPostList = (List<AdminVO>) request.getAttribute("popularPostList");
                
                for (AdminVO vo : popularPostList) {
                %>
                <tr> 
                  <td class="p-writer"><%= vo.getMm_id() + "(" + vo.getMm_nickname() + ")" %></td>
                  <td class="p-board"><%= vo.getBr_name()%></td>
                  <td class="p-title"><a href="<%=request.getContextPath() %>/postRead.do?board=<%=vo.getBr_code()%>&no=<%=vo.getPs_no()%>"><%= vo.getPs_subject() %></a></td>
                  <td class="p-like-count"><%= vo.getLike_count() %></td>
                </tr>
                <% } %>
              </table>
            </div>
          </div>
          <div class="dashboard" id="dashboard-four">
            <div class="dashboard-title">
              <img class="db-icon" src="<%= request.getContextPath() %>/image/icon/icon-document-green.png" alt="icon-document-green.png">
              <p>신규 회원</p>
            </div>
            <div class="dashboard-table">
              <table border="1" class="listTable" id="listTable-three">
                <tr>
                  <th>아이디</th>
                  <th>이름</th>
                  <th>이메일</th>
                  <th>핸드폰</th>
                </tr>
                <%
                List<AdminVO> newMemberList = (List<AdminVO>) request.getAttribute("newMemberList");
                
                for (AdminVO vo : newMemberList) {
                %>
                <tr>
                  <td class="new-mm-id"><%= vo.getMm_id() %></td>
                  <td class="new-mm-name"><%= vo.getMm_name() %></td>
                  <td class="new-mm-mail"><%= vo.getMm_mail() %></td>
                  <td class="new-mm-tel"><%= vo.getMm_tel() %></td>
                </tr>
                <% } %>
              </table>
            </div>
          </div>
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