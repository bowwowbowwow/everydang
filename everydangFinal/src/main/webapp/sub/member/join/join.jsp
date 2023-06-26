<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>join</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/join/join.css">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://www.google.com/recaptcha/enterprise.js?render=6LdP93smAAAAAAypgFKR5s7E039SrPo65UDUI0yO"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>

</head>

<body>
<%@ include file="/header.jsp" %>

<div class="wrap">
    <div id="container">

        <div id="logo">
        <img src="<%=request.getContextPath()%>/image/logo/logo-symbol.png" alt="logo-symbol" >
        </div>

        <h1>약관 동의</h1>
    <div class="agree">

        <div class="all-check">
            <div class="input-wrap">
            <input class="form-check-input" type="checkbox" name="flexRadioDefault" id="flexRadioDefault1">
                <label class="form-check-label" for="flexRadioDefault1">
                전체 약관 동의
                </label>
                
            </div>
        </div>
        <hr>

    <div>

        <div class="form-check">
            <div class="input-wrap">
            <input class="form-check-input" type="checkbox" name="flexRadioDefault" id="flexRadioDefault2">
                <label class="form-check-label" for="flexRadioDefault2">
                [필수] 이용 약관
            </label>
            </div>
           
        </div>

        <div class="form-check">
            <div class="input-wrap">
            <input class="form-check-input" type="checkbox" name="flexRadioDefault" id="flexRadioDefault2">
                <label class="form-check-label" for="flexRadioDefault2">
                    [필수] 개인 정보 이용 약관
                </label>
            </div>
            
        </div>

        <div class="form-check">
            <div class="input-wrap">
            <input class="form-check-input" type="checkbox" name="flexRadioDefault" id="flexRadioDefault2">
                <label class="form-check-label" for="flexRadioDefault2">
                [필수] 서비스를 위한 개인정보 제공 동의
            </label>
        </div>
            
    </div>

    </div>

    </div>

<%-- action="<%=request.getContextPath()%>/sub/member/join/joinSuccessPage.jsp" --%>

    <h1>회원 정보(필수)</h1>
        <form id="join_form" method="post" action="<%=request.getContextPath()%>/joinInformation.do">
        <div class="memberinfo">

            <label class="memberinfolabel" for="mem_id">아이디</label>
            <input type="text" id="mem_id" name="mm_id" style="width:440px;" required> 
            <div class="duplication">
            <input type="button" value="중복확인" class="duplicationbutton" id="checkid">
            </div>
            <hr>

            
            <label class="memberinfolabel" for="mem_pass">비밀번호</label>
            <input type="password" id="mem_pass" name="mm_password" style="width:530px;" required>
            <hr>

            <label class="memberinfolabel" for="passwordcheck">비밀번호 확인</label>
            <input type="password" id="passwordcheck" style="width:530px;" required>
            <span class="final_pwck_ck" style="display: none;">비밀번호 확인을 입력해주세요.</span>
            <hr>
        
            
            <label class="memberinfolabel" for="mem_nickname">닉네임</label>
            <input type="text" id="mem_nickname" name="mm_nickname" style="width:440px;" required> 
            <div class="duplication">
            <input type="button" value="중복확인" class="duplicationbutton" id="checknickname">
            </div>
            <hr>

            <label class="memberinfolabel" for="mem_name">이름</label>
            <input type="text" id="mem_name" name="mm_name" style="width:530px;" required>
            <hr>

            <label class="memberinfolabel" for="mem_mail">이메일</label>
            <input type="text" id="mem_mail" name="mm_mail" style="width:530px;" required>
            <hr>

            <label class="memberinfolabel" for="mem_tel">핸드폰</label>
            <input type="text" id="mem_tel" name="mm_tel" style="width:530px;" required>
            <hr>

            <label class="memberinfolabel" for="mem_zip">주소</label>
            <!-- 우편번호 -->
            <input readonly="readonly" id="mem_zip" name="mm_zip" type="text" class="addr" style="width: 150px; border: 1px solid var(--color-grey-400)">
            
            <!-- 우편번호 찾기 -->
            <input id="addrsearch" type="button" value="주소 검색" onclick="sample6_execDaumPostcode()"><br>
            
            <label class="memberinfolabel" for="mem_addr1"></label>
            <!-- 주소 -->
            <input readonly="readonly" id="mem_addr1" name="mm_addr1" type="text" class="addr2" style="border: 1px solid var(--color-grey-400)"><br>
            
        
            <!-- 상세주소 -->
            <label class="memberinfolabel" for="mm_addr2"></label>
            <input id="mem_addr2" type="text" name="mm_addr2" class="addr3" style="border: 1px solid var(--color-grey-400)">
            <hr>

          <!--   자동가입방지
            <div id="captcha" class="g-recaptcha" data-sitekey="6LdP93smAAAAAAypgFKR5s7E039SrPo65UDUI0yO">
            </div> -->
        
        <div class="lastbutton">
            <input class="submit" id="save" type="button" value="가입하기">
        </div>
        </div>
        </form>
    </div>
</div>
        

<footer id="footer"></footer>

    <script>
        // header & footer
        $("#footer").load("<%=request.getContextPath()%>/footer.jsp");
        
        
        
        //다음 주소
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = ''; 
                    var extraAddr = ''; 

                    
                    if (data.userSelectedType === 'R') { 
                        addr = data.roadAddress;
                    } else { 
                        addr = data.jibunAddress;
                    }

                    
                    if (data.userSelectedType === 'R') {
                        
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                    }

                    
                    document.getElementById('mem_zip').value = data.zonecode;
                    document.getElementById("mem_addr1").value = addr;
                    
                    document.getElementById("mem_addr2").focus();
                }
            }).open();
        }

        
        // 전체 선택 / 해제
        $("#flexRadioDefault1").click(function(){
          if($("#flexRadioDefault1").is(":checked")){
            $("input[name=flexRadioDefault]").prop("checked", true);
          }else {
            $("input[name=flexRadioDefault]").prop("checked", false);
          }
        })
        
        $("input[name=flexRadioDefault]").click(function(){
          var totalArr = $("input[name=flexRadioDefault]").length;
          var checked = $("input[name=flexRadioDefault]:checked").length;
          
          if(totalArr != checked){
            $("#flexRadioDefault1").prop("checked", false);
          }else{
            $("#flexRadioDefault1").prop("checked", true);
          }
        });
        
        
        
        //아이디 중복 검사
        $('#checkid').on('click', function(){
        	
        	idvalue = $('#mem_id').val();
        	
        	$.ajax({
        		url : "<%=request.getContextPath()%>/checkId.do",
        		data : { "id" : idvalue},
        		type : 'get',
        		success : function(res) {
        			
        			alert(res.check);
        			if(res.check == "사용 가능한 아이디입니다.") {
	        			$('#checkid').html(res.flag).css('background-color', '#f5f5f5');
	        			$('#checkid').html(res.flag).css('color', '#D9D9D9');
        			}
        		},
        		error : function(xhr){
        			alert(xhr.status);
        		},
        		dataType : 'json'
        	})
        	
        })
        
        //닉네임 중복 검사
        $('#checknickname').on('click', function(){
        	
        	nickNamevalue = $('#mem_nickname').val();
        	
        	$.ajax({
        		url : "<%=request.getContextPath()%>/checkNickname.do",
        		data : { "nickname" : nickNamevalue},
        		type : 'get',
        		success : function(res) {
        			
        			alert(res.check);
        			if(res.check == "사용 가능한 닉네임입니다.") {
	        			$('#checknickname').html(res.flag).css('background-color', '#f5f5f5');
	        			$('#checknickname').html(res.flag).css('color', '#D9D9D9');
        			}
        		},
        		error : function(xhr){
        			alert(xhr.status);
        		},
        		dataType : 'json'
        	})
        	
        })
        
        
                
		//회원가입 버튼
        $("#save").on("click", function() {
			
			inputData = $("#join_form").serializeArray()
			
			console.log(inputData);
			
			$.ajax({
				url: "<%=request.getContextPath()%>/joinInformation.do",
				data: inputData,
				type: 'post',
				success: function(res) {
					location.href = "<%=request.getContextPath()%>/sub/member/join/joinSuccessPage.jsp";
				},
				error: function(xhr) {
					alert("상태: " + xhr.status);
				},
				dataType: 'json'
			})
		})
        
    </script>
</body>
</html>