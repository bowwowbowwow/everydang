<%@page import="com.everydang.vo.PageVO"%>
<%@page import="com.everydang.vo.AdminVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <html lang="ko">
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원관리 | 관리자페이지</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <script src="<%= request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminMain.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/admin.css">
</head>
<body>
<%
int memberTotal = (int) request.getAttribute("memberTotalCount");
%>
<%@ include file="/sub/admin/adminHeader.jsp" %>  <div id="wrap">
    <div id="container">
      <div id="sideMenu">
          <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                        <img src="<%= request.getContextPath() %>/image/icon/icon-user-green.png" alt="icon-user-green.png" class="selectIcon">
                        <p class="selectText">회원 관리</p>
                    </button>
                  <div id="flush-collapseOne" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                      <p><a href="<%= request.getContextPath() %>/memberList.do?" style="color:black;">회원 관리</a></p>
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
      <div id="content">
        <div id="content-title">
          <p class="table-title">회원 관리</p>
          <div class="content-table-count">
            <p class="table-subtitle">전체 회원</p>
            <p class="table-count">
            <%= memberTotal %>
            </p>
          </div>
        </div>
        <div id="content-table">
          <table border="1" class="listTable" id="member-table">
            <tr>
              <th>아이디</th>
              <th>닉네임</th>
              <th>이름</th>
              <th>이메일</th>
              <th>핸드폰</th>
              <th><div class="sort-div"><p>회원등급</p><input type="button" class="sort" id="grade" name="grade"></div></th>
              <th><div class="sort-div"><p>게시글수</p><input type="button" class="sort" id="post" name="post"></div></th>
              <th><div class="sort-div"><p>댓글수</p><input type="button" class="sort" id="comment" name="comment"></div></th>
            </tr>
			<%
			PageVO pvo = (PageVO) request.getAttribute("savePageVO");
            List<AdminVO> allMemberList = (List<AdminVO>) request.getAttribute("saveList");
            int currentPage = (int) request.getAttribute("currentPage");
            
            for(AdminVO vo : allMemberList) {
            %>
            <tr>
              <td class="mm-id"><%= vo.getMm_id()%></td>
              <td class="mm-nick"><%= vo.getMm_nickname() %></td>
              <td class="mm-name"><%= vo.getMm_name() %></td>
              <td class="mm-mail"><%= vo.getMm_mail() %></td>
              <td class="mm-tel"><%= vo.getMm_tel() %></td>
              <td class="mm-grade"><%= vo.getGr_name() %></td>
              <td class="mm-post-cnt"><%= vo.getPost_count() %></td>
              <td class="mm-comment-cnt"><%= vo.getComment_count() %></td>
            </tr>
            <% } %>
          </table>
        </div>
        <div aria-label="Page navigation example" class="page">
          <ul class="pagination">
          <% if(pvo.getStartPage() > 1){ %>
            <li class="page-item"><a class="page-link" href="#">
              <img src="<%= request.getContextPath() %>/image/icon/icon-arrow-prev.png" alt="icon-arrow-prev.png" id="prev"></a>
            </li>
		  	<% } %>
          	<% for(int i=pvo.getStartPage(); i<=pvo.getEndPage(); i++) {
        			if(i == currentPage) { %>
           			 	<li class="page-item active"><a class="page-link pageno" href="#"><%= i %></a></li>
        			<% } else { %>
           				<li class="page-item"><a class="page-link pageno" href="#"><%= i %></a></li>
        			<% } %>
        	  
         	<% } %>
          	<% if(pvo.getEndPage() < pvo.getTotalPage()) { %>
            <li class="page-item"><a class="page-link" href="#">
              <img src="<%= request.getContextPath() %>/image/icon/icon-arrow-next.png" alt="icon-arrow-next.png" id="next"></a>
            </li>
            <% } %>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <footer id="footer"></footer>
  <script>
    $("#footer").load("<%= request.getContextPath() %>/footer.jsp");
    
    // 페이징 숫자 클릭
    $(document).on('click', '.pageno', function(){
    	var currentPage = parseInt($(this).text().trim());
    	location.href = "<%= request.getContextPath()%>/memberList.do?page=" + currentPage;
    })
    
    // 페이징 다음(next) 버튼 클릭
    $(document).on('click', '#next', function() {
    	var currentPage = parseInt($('.pageno').last().text()) + 1;
    	location.href = "<%= request.getContextPath()%>/memberList.do?page=" + currentPage;
    })
    
    // 페이징 이전(prev) 버튼 클릭
    $(document).on('click', '#prev', function() {
		var currentPage = parseInt($('.pageno').first().text()) - 1;
    	location.href = "<%= request.getContextPath()%>/memberList.do?page=" + currentPage;
	})
    
  </script>
</body>
</html>