<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <html lang="ko">
  <meta charset="UTF-8"> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시글관리 | 관리자페이지</title>
  <link rel="icon" href="/everydang/assets/favicon.ico">
  <script src="<%= request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/adminMain.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin/admin.css">
  <script src="<%= request.getContextPath() %>/js/admin/admin.js"></script>
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
                  <div id="flush-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                      <p><a href="<%= request.getContextPath() %>/sub/admin/manageMemPost" style="color:black;">게시글 관리</a></p>
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
          <p class="table-title">게시글 관리</p>
        </div>
        <div id="content-table">
          <table border="1" class="listTable" id="member-post">
           <!--  <tr>
              <th></th>
              <th>게시판명</th>
              <th>제목</th>
              <th>내용</th>
              <th>글쓴이</th>
              <th>작성일</th>
            </tr>
            <tr>
              <td><input type="checkbox"></td>
              <td class="br-name">자유게시판</td>
              <td class="ps-title">강아지가 기지개 켜는 자세를 하는 이유가 뭔가요?</td>
              <td class="ps-content">저희 강아지가 10분마다 기지개를 켜는데 그 이유가...</td>
              <td class="ps-writer">hong1234(홍홍홍)</td>
              <td class="ps-date">2023-01-01</td>
            </tr>
            <tr>
              <td><input type="checkbox"></td>
              <td class="br-name">자유게시판</td>
              <td class="ps-title">강아지가 기지개 켜는 자세를 하는 이유가 뭔가요?</td>
              <td class="ps-content">저희 강아지가 10분마다 기지개를 켜는데 그 이유가...</td>
              <td class="ps-writer">hong1234(홍홍홍)</td>
              <td class="ps-date">2023-01-01</td>
            </tr>
            <tr>
              <td><input type="checkbox"></td>
              <td class="br-name">자유게시판</td>
              <td class="ps-title">강아지가 기지개 켜는 자세를 하는 이유가 뭔가요?</td>
              <td class="ps-content">저희 강아지가 10분마다 기지개를 켜는데 그 이유가...</td>
              <td class="ps-writer">hong1234(홍홍홍)</td>
              <td class="ps-date">2023-01-01</td>
            </tr>
            <tr>
              <td> </td>
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
            </tr> -->
            <!-- <tr>
              <td><input type="checkbox"></td>
              <td style="font-size: 1.7rem; font-weight: bold;">선택한 글</td>
              <td colspan="5">
                <div id="del-black">
                    <input type="button" value="삭제" name="delete" class="delete">
				            <input type="button" value="블랙리스트" name="blacklist" class="blacklist">
                </div>
              </td>
            </tr> -->
          </table>
        </div>
        <div aria-label="Page navigation example" class="page">
          <ul class="pagination" id="post-pagination">
<%--             <li class="page-item"><a class="page-link" href="#">
              <img src="<%= request.getContextPath() %>/image/icon/icon-arrow-prev.png" alt="icon-arrow-prev.png" id="prev"></a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item"><a class="page-link" href="#">
              <img src="<%= request.getContextPath() %>/image/icon/icon-arrow-next.png" alt="icon-arrow-next.png" id="next"></a>
            </li> --%>
          </ul>
        </div>
        </div>
      </div>
    </div>
  <footer id="footer"></footer>
  <script>
    $("#footer").load("<%= request.getContextPath() %>/footer.jsp");
    
  	myPath = "<%= request.getContextPath() %>";
    var currentPage = 1;
    
    postServer(1);
    
    // 페이징 숫자 클릭
    $(document).on('click', '.pageno', function(){
    	let currentPage = parseInt($(this).text().trim());
    	
    	console.log(".pageno",currentPage);
    	postServer(currentPage);
    })
    
    // 페이징 다음(next) 버튼 클릭
    $(document).on('click', '#next', function() {
    	let currentPage = parseInt($('.pageno').last().text()) + 1;
    	console.log("#next",currentPage);
    	postServer(currentPage);
    })
    
    // 페이징 이전(prev) 버튼 클릭
    $(document).on('click', '#prev', function() {
    	let currentPage = parseInt($('.pageno').first().text()) - 1;
    	console.log("#prev",currentPage);
    	postServer(currentPage);;
	})
    
    
    // 체크박스
    $(document).on('click', '#checkAll', function () {
		if($("#checkAll").is(":checked")) $("input[name=check]").prop("checked", true);
		else $("input[name=check]").prop("checked", false);
    });
			
 	$(document).on('click', 'input[name=check]', function() {
		var total = $("input[name=check]").length;
		var checked = $("input[name=check]:checked").length;
				
		if(total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true); 
	});
 	
    
    // 삭제
    $(document).on('click', '.delete', function() {
     	if(confirm("게시글을 삭제하시겠습니까?")) {
     		deletePostServer();
    	} else {
    		return false;
    	} 
    });

    // 글쓴이 블랙리스트
    $(document).on('click', '.blacklist', function() {
    	if(confirm("블랙리스트에 추가하시겠습니까?")) {
    		insertBlacklist();
    	} else {
    		return false;
    	}

    });
    
  </script>
</body>
</html>