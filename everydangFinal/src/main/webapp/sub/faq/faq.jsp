<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ | 에브리댕</title>
    <link rel="icon" href="/everydang/assets/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/faq/faq.css">
    <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
</head>
<body>
    <div id="wrap">
        <div id="header"></div>
        <main>
            <div class="container main-wrap">
                <div id="title">
                    <div class="title-wrap">
                        <div class="site-map">
                            <a href="<%=request.getContextPath() %>/index.html">
                                <i class="icon"></i>
                            </a>
                            > FAQ
                        </div>
                        <div id="title">
                            <h2>FAQ</h2>
                            <p class="desc">회원님들이 자주 궁금해하시는 질문</p>
                        </div>
                    </div>
                </div>
                <section id="faq">
                    <div class="faq-wrap">
                        <div id="search-option">
                            <button class="search-btn active" id="all">전체</button>
                            <button class="search-btn" id="member">회원관리</button>
                            <button class="search-btn" id="board">게시판</button>
                            <button class="search-btn" id="find">찾습니다</button>
                            <button class="search-btn" id="event">이벤트</button>
                            <button class="search-btn" id="shop">에브리띵</button>
                            <button class="search-btn" id="ect">기타</button>
                        </div>
                        <div id="faq-list">
                            <div class="accordion" id="faq-accordion">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading1">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate member">[회원]</span>
                                        회원가입 하고 싶어요.
                                    </button>
                                    </h2>
                                    <div id="collapse1" class="accordion-collapse collapse show" aria-labelledby="heading1" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                        이메일로 가입 가능합니다.
										<br/><br/>
										[가입 수단]<br/>
										- 이메일 : 본인인증을 통한 가입
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading2">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate member">[회원]</span>
                                        로그인이 안돼요.
                                    </button>
                                    </h2>
                                    <div id="collapse2" class="accordion-collapse collapse" aria-labelledby="heading2" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                        ID/PW 분실 시 가입 계정에 따라 진행 가능합니다. <br/><br/>

										[일반 계정(이메일)]
										<br/>
										: ID/PW 찾기 → 정보제공(비밀번호는 이메일을 통해 전송됨) → 로그인 재시도
											<br/>
											그 밖의 문제는 챗봇을 이용해주세요.
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading3">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate member">[회원]</span>
                                        이메일로 비밀번호가 오지않아요.
                                    </button>
                                    </h2>
                                    <div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                       마이페이지 - 내 정보 확인/수정에서 이메일이 올바른지 확인해주세요.
                                       <br />
                                       그래도 보내지지않는다면 챗봇을 이용해주세요.
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading4">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate member">[회원]</span>
                                        회원 탈퇴를 하고 싶어요.
                                    </button>
                                    </h2>
                                    <div id="collapse4" class="accordion-collapse collapse" aria-labelledby="heading4" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                    	회원탈퇴는 [마이페이지]에서 가능합니다. <br />
                                    	
                                        주문건이 모두 종결된 상태(취소완료/환불완료/구매확정)에서만 탈퇴 가능합니다. <br />

										탈퇴 시 재가입은 31일 이후 가능하며 동일한 아이디의 사용은 불가합니다.<br /><br />
										
										또한 탈퇴 즉시 보유한 쿠폰/포인트는 소멸되니 이점 유의하여 접수 바랍니다.<br />
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading5">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate board">[게시판]</span>
                                        게시판 이용 가이드
                                    </button>
                                    </h2>
                                    <div id="collapse5" class="accordion-collapse collapse" aria-labelledby="heading5" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                        1. 게시판 이름 항목에서 게시판의 이름을 작성합니다. 작성한 게시판 이름은 게시판에 표시할 수 있습니다.<br /><br />
										(선택 사항) 작성해야 할 게시물 수가 많은 경우, 카테고리 옵션을 사용할 수 있습니다. 카테고리를 미리 구성한 다음, 게시물 작성 시 해당 게시물이 속할 카테고리를 선택할 수 있습니다.
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading6">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse6" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate board">[게시판]</span>
                                        게시판 등록이 안돼요.
                                    </button>
                                    </h2>
                                    <div id="collapse6" class="accordion-collapse collapse" aria-labelledby="heading6" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                        새 게시판은 디자인 모드에서 게시판 위젯을 새롭게 추가해주셔야 합니다.<br /><br />
										연동된 게시판은 [디자인 모드 > 게시판 위젯 마우스 우클릭 > 게시판 설정 > 연동 게시판 선택]에서 확인할 수 있어요.
										<br />
										💡Free(무료) 버전 사이트는 최대 3개까지 게시판을 생성할 수 있습니다.<br /><br />
										따라서 Free 버전 사이트는 게시판이 3개라면, 게시판 위젯을 새롭게 추가하더라도 기존에 생성한 게시판으로 연동됩니다.
										<br />
										기존에 생성한 게시판은 [관리자 페이지 > 컨텐츠 관리 > 게시물 관리]에서 삭제할 수 있어요.<br /><br />
										삭제 후 디자인 모드에서 게시판 위젯을 새롭게 추가하면 새 게시판이 생성되는 점 이용에 참고 부탁드립니다.
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading7">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse7" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate find">[찾습니다]</span>
                                        이용 안내
                                    </button>
                                    </h2>
                                    <div id="collapse7" class="accordion-collapse collapse" aria-labelledby="heading7" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                        질문게시판을 이용하시기 전 필독하세요.<br /><br />
										질문게시판은 현재 컴퓨터 질문 게시판과 생활정보 게시판 두 개로 나뉩니다.
										이 두 게시판을 이용하시기 전 아래 사항을 숙지하시고 이용해주세요.<br /><br />
										1. 질문 전 제목에는 반드시 머리말을 붙입니다.<br />
										예: [메신저] 스카이프 질문 있습니다.<br />
										등 가능한한 상세하고 명확하게 질문을 작성해주세요.<br />
										2. 내용은 가능한한 상세하게 질문을 작성해주세요. 간단하게 남길 시에는 해결이 어려울 수도 있습니다.<br />
										3. 두가지를 부탁드린 것은 머리말 선택이 없기 때문에 그런것이오니 회원분드르이 양해 부탁드립니다.<br />
										답변은 아는 한도네에서 모든 회원분들이 참여 하실 수 있습니다.<br />
										그럼 즐거운 질문게시판 생활이 되시길 기원드립니다.<br />
										감사합니다.<br />
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading10">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse10" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate event">[이벤트]</span>
                                        이벤트 참여를 하고 싶어요.
                                    </button>
                                    </h2>
                                    <div id="collapse10" class="accordion-collapse collapse" aria-labelledby="heading10" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                        이벤트는 최소 달의 한번 열리기 떄문에 공지사항에 올라오는 글을 잘 확인해주세요. <br />
                                        참여방법은 각 이벤트마다 상이합니다.<br />
                                        
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading11">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse11" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate event">[이벤트]</span>
                                        이벤트 당첨의 기준은 뭔가요?
                                    </button>
                                    </h2>
                                    <div id="collapse11" class="accordion-collapse collapse" aria-labelledby="heading11" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                       이벤트 당첨의 기준은 정회원/준회원으로 나뉘며, <br />
                                       참여 비율이 다를 뿐 그 안에서는 랜덤으로 공평하게 진행합니다.
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading12">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse12" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate shop">[에브리띵]</span>
                                        굿즈를 구입하고 싶어요.
                                    </button>
                                    </h2>
                                    <div id="collapse12" class="accordion-collapse collapse" aria-labelledby="heading12" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                       ■ 일반배송 / 내일도착<br /><br />

										송장번호 확인 후 우체국측으로 문의 시 확인 가능합니다.<br />
										
										
										
										■ 저녁도착<br /><br />
										
										배송완료 시 사진과 함께 배송완료 안내를 도와드리고 있습니다.<br />
										
										단, 자유 출입이 불가할 경우에는 대응배송(1층 공동현관앞, 경비실 및 우편함 등) 될 수 있으며<br />
										
										확인이 어려우실 경우 상품 Q&A문의 또는 카카오톡 채널 [@브랜디]로 문의 바랍니다.<br />
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading13">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse13" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate shop">[에브리띵]</span>
                                        반품을 하고 싶어요.
                                    </button>
                                    </h2>
                                    <div id="collapse13" class="accordion-collapse collapse" aria-labelledby="heading13" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                        ■반품요청 방법<br /><br /><br />

										1. 반품요청<br /><br />
										
										    - MY ▷ 주문/배송조회 ▷ 반품요청 ▷ 사유 선택  ▷ 수거정보 확인 ▷ 배송비 결제 방법 선택 ▷  요청완료<br />
										
										    *교환 정책 변경에 따라, 사유 내 선택 가능한 "교환 요청"은 반품 사유 중 일부이며 주문건은 반품으로 처리됩니다.<br /><br />
										
										
										
										2. 상품 포장 및 수거 일정 <br /><br />
										
										    - 받아본 투명포장지에 재포장 후 택배봉투 포장 <br />
										
										     *반품요청 확인 시, 브랜디 배송센터에서 절차 관련내용을 개별적으로 안내드리고 있으며, 해당 알림톡(또는 SMS) 확인 부탁드립니다.<br />
										
										     *투명 봉투에 부착된 바코드 훼손 및 상품만 보내주실 경우 처리 지연될 수 있습니다.<br />
										
										     *반품요청 시 자동수거 접수되며, 평일기준 1-2일 내 집배원 방문 예정<br />
										
										
										
										3. 반품 검수 및 환불완료<br /><br />
										
										    - 상품이 도착하면 검수 후 반품 처리 진행 (환불요청 승인 시 영입일 기준 1~3일 이내 환불 처리)<br />
										
										<br /><br />
										
										※ 유의사항<br />
										
										* 택배사에 고객 직접 접수(우체국/타택배)하여 수거 된 상품은 환불 처리가 불가합니다.<br />
										<br />
										* 브랜디 배송센터에서 접수된 수거건이 아닐 경우 반송으로 처리됩니다.
										
										* 자의로 인한 직접 접수 후 상품 분실 시 당사에서는 처리가 불가합니다.<br />
										
										* 개별 포장하여 재수거 진행 시 추가배송비가 발생할 수 있습니다.<br />
										
										* 환불 미요청/상품 훼손/타사품 수거 시 반송 될 수 있습니다.<br />
										
										* 판매자배송 상품을 함께 보낼 경우 반송됩니다.<br />
										
										* 정책 변경으로 인해 이전 교환으로 요청하였으나 처리 지연된 주문건의 경우, 반품으로 처리 될 수 있습니다.  <br />
										
										* 반품사유가 "상품문제", "배송문제" 일 경우 사진 첨부가 필요할 수 있습니다.<br />
										
										* 반품요청 후 결제방법 변경을 원하는 경우 고객센터로 문의 부탁드립니다. <br />
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading14">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse14" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate shop">[에브리띵]</span>
                                        상품 문의하고 싶어요.
                                    </button>
                                    </h2>
                                    <div id="collapse14" class="accordion-collapse collapse" aria-labelledby="heading14" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                        상품은 각 스토어에서 직접 판매하는 형태로, 상품관련한 문의는 챗봇으로 문의 바랍니다. <br /><br /><br />

										[게시글 문의 방법]<br /><br />
										
										-챗봇
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading15">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse15" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate shop">[에브리띵]</span>
                                        교환/반품하고 싶어요.
                                    </button>
                                    </h2>
                                    <div id="collapse15" class="accordion-collapse collapse" aria-labelledby="heading15" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                        	[반품 방법]<br /><br /><br />
											1. 마이페이지 → 배송중/배송완료 페이지로 이동<br />
											
											2. 교환/환불요청 → 반품 선택 → 상세 내용 작성<br />
											
											3. 구매 스토어 고객센터로 문의<br />
											
											
											<br /><br />
											[교환 방법]
											<br /><br /><br />
											1. 마이페이지 → 배송중/배송완료 페이지로 이동<br />
											
											2. 교환/환불요청 → 교환 선택 → 상세 내용 작성<br />
											
											3. 구매 스토어 고객센터로 문의<br />
											
											4. 교환 새상품 수령 후 교환요청 철회<br />
											
											<br /><br /><br />
											
											※ 유의사항<br />
											
											- 단순변심을 제외한 상품 하자(불량/오배송 등)로 인한 접수 시, 하자에 대한 사진 또는 영상 촬영을 권유드립니다.<br />
											<br />
											- 일부 스토어의 경우 교환/반품요청 시 회수 서비스를 제공하지 않습니다.
											
											- 스토어측으로 문의하여 수거관련 안내받은 후 진행해야합니다.<br />
											
											- 브랜디 자체배송 상품의 교환/반품 절차는 FAQ 내 [하루배송] 참고 바랍니다.<br />
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading16">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse16" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate shop">[에브리띵]</span>
                                        리뷰 작성하고 싶어요.
                                    </button>
                                    </h2>
                                    <div id="collapse16" class="accordion-collapse collapse" aria-labelledby="heading16" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                        상품 리뷰는 [구매확정]일로부터 30일 내 작성 가능합니다.<br />

										기한이 경과된 경우 작성 불가한 점 참고 바랍니다.<br /><br />
										
										
										
										[리뷰 작성 방법]<br />
										
										- 마이페이지 → 진행중인 주문 → '리뷰 쓰고 포인트 받기'<br />
										
										- 마이페이지 → 리뷰 → 리뷰 작성 탭 → '리뷰 쓰고 포인트 받기'<br />
                                    </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading17">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse17" aria-expanded="true" aria-controls="collapseOne">
                                        <span class="cate ect">[기타]</span>
                                       에브리댕에 대해 더 알고싶어요.
                                    </button>
                                    </h2>
                                    <div id="collapse17" class="accordion-collapse collapse" aria-labelledby="heading17" data-bs-parent="#faq-accordion">
                                    <div class="accordion-body">
                                        최근 12개월 이상 로그인 이력이 없을 경우 정보보호 처리 방침에 따라 휴면처리되며 개인 정보는 분리 보관됩니다.<br /><br />

										휴면 해제를 원하실 경우 로그인 후 본인인증을 통한 정상계정으로 전환되며 브랜디 서비스 이용이 가능합니다.<br />
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>
        <div id="footer"></div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="<%=request.getContextPath() %>/js/common.js"></script>
    <script>
	    $("#header").load("<%=request.getContextPath() %>/header.jsp");
	    $("#footer").load("<%=request.getContextPath() %>/footer.jsp");
        faqfnc = function(){
            const faq = $(".faq-wrap");
            const faqList = faq.find(".cate").parents(".accordion-item");
            const all = "all";
            let btnValue = undefined;
            const searchBtn = faq.find(".search-btn");
            searchBtn.on("click",function(){
                btnValue = $(this).attr("id");
                searchBtn.removeClass("active");
                $(this).addClass("active")
                faqList.each(function(){
                    var cateClass = $(this).find('.cate').hasClass(btnValue);
                    if(cateClass || btnValue == "all") {
                        $(this).show();
                    }else {$(this).hide()}
                })
                    
                
            })
        }
        faqfnc();
    </script>
</body>
</html>