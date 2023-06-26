/**
 * 
 */

reportServer = function(cpage) {
	
	$.ajax({
		url: `${myPath}/reportList.do`,
		data: {"page" : cpage},
		type: 'get',
		success: function(res) {
			$('#report-count').html(res.reportCnt);
			
			code = "";
			code = `<tr>
                      <th>신고회원</th>
              		  <th>피신고회원</th>
              		  <th>신고일자</th>
              		  <th>신고사유</th>
                      <th>첨부파일</th>
                      <th>피신고회원 처분</th>
                    </tr>`;
			
			$.each(res.datas, function(i, v) {
				code += `
					<tr class="${v.rp_no}" idx=${i}>
                      <td class="reporter">${v.rp_reporter}</td>
                      <td class="defendent">${v.rp_defendent}</td>
                      <td class="rp-date">${(v.rp_date).substr(0,10)}</td>`
                      
                if(v.rp_reason2!=null) {
					code += `<td class="rp-reason">
                     		${v.rp_reason1}(${v.rp_reason2})
                      		</td>`
					
				} else {
					code += `<td class="rp-reason">
                     		${v.rp_reason1}
                      		</td>`
				}
				
				code += `
                      <td class="rp-file">${v.rp_file}</td>
                      <td class="rp-judge">
                        <div class="rp-judge-button">
                          <input type="button" value="강등" name="demotion" class="judge"  idx="${i}">
                          <input type="button" value="블랙리스트" name="blacklist" class="judge"  idx="${i}">
                          <input type="button" value="철회" name="reject" class="judge" idx="${i}">
                        </div>
                      </td>
                    </tr>
					`
			})
			
			$('#report-tb').html(code);
			
			pager = "";
			
			// 이전 
			if (res.sp > 1) {
				pager += `
				<li class="page-item"><a class="page-link" href="#">
              	<img src="<${myPath}/image/icon/icon-arrow-prev.png" alt="icon-arrow-prev.png" id="reportPrev"></a>
            	</li>`;
			}
			// 페이지 번호
			for (i = res.sp; i <= res.ep; i++) {
				if (i == currentPage) {
					pager += `<li class="page-item active"><a class="page-link reportPageno" href="#">${i}</a></li>`;

				} else {
					pager += `<li class="page-item"><a class="page-link reportPageno" href="#">${i}</a></li>`;
				}
			}
			// 다음
			if (res.ep < res.tp) {
				pager += `<li class="page-item"><a class="page-link" href="#">
              			  <img src="${myPath}/image/icon/icon-arrow-next.png" alt="icon-arrow-next.png" id="reportNext"></a>
            			  </li>`;
			}

			$('#report-pagination').html(pager);
			
		},
		error: function(xhr) {
			alert("오류: " + xhr.status);
		},
		dataType: 'json'
		
	})
}

blacklistServer = function(cpage) {
	$.ajax({
		url: `${myPath}/blacklistList.do`,
		data: {"page" : cpage},
		type: 'get',
		success: function(res) {
			$("#blacklist-count").html(res.blacklistCnt);
			
			code = "";
			code += `                  
				  <tr>
                    <th>아이디</th>
                    <th>사유</th>
                  </tr>`;
			
			
			$.each(res.datas, function(i, v) {
				
				if(v.rp_reason2 != null) {
				code += `
					<tr>
                    	<td class="mm-id">${v.rp_defendent}</td>
                    	<td class="report-reason">
                    	${v.rp_reason1}(${v.rp_reason2})</td>
                  	</tr>
					`
				} else {
					code += `
					<tr>
                    	<td class="mm-id">${v.rp_defendent}</td>
                    	<td class="report-reason">
                    	${v.rp_reason1}</td>
                  	</tr>`
				}
			})
			
			$('#blacklist-tb').html(code);
			
			pager = "";
			
			// 이전 
			if (res.sp > 1) {
				pager += `
				<li class="page-item"><a class="page-link" href="#">
              <img src="<${myPath}/image/icon/icon-arrow-prev.png" alt="icon-arrow-prev.png" id="blPrev"></a>
            </li>`;
			}
			// 페이지 번호
			for (i = res.sp; i <= res.ep; i++) {
				if (i == currentPage) {
					pager += `<li class="page-item active"><a class="page-link blPageno" href="#">${i}</a></li>`;

				} else {
					pager += `<li class="page-item"><a class="page-link blPageno" href="#">${i}</a></li>`;
				}
			}
			// 다음
			if (res.ep < res.tp) {
				pager += `<li class="page-item"><a class="page-link" href="#">
              <img src="${myPath}/image/icon/icon-arrow-next.png" alt="icon-arrow-next.png" id="blNext"></a>
            </li>`;
			}

			$('#blacklist-pagination').html(pager);
			},
			error: function(xhr) {
				alert("오류: " + xhr.status);
			},
			dataType: 'json'
		
	})

}

deleteReportServer = function() {
	
	$.ajax({
		url: `${myPath}/deleteReport.do`,
		data: {"reportNo" : vrpno},
		type: 'get',
		success: function(res) {
			
			reportServer();
		},
		error: function(xhr) {
			alert("오류: " + xhr.status);
		},
		dataType: 'json'
	})
	
}

updateBlacklist = function() {
	
	$.ajax({
		url: `${myPath}/updateBlacklist.do`,
		data: {"reportNo" : vrpno},
		type: 'get',
		success: function(res) {
			
			reportServer();
			blacklistServer();
			
		},
		error: function(xhr) {
			alert("오류: " + xhr.status);
		},
		dataType: 'json'
	})
}

updateDefendentGrade = function() {
	$.ajax({
		url: `${myPath}/updateDefendentGrade.do`,
		data: {
				"reportNo" : vrpno,
				"memId" : vdefendent
			  },
		type: 'get',
		success: function(res) {
			alert("강등 처리를 완료했습니다.");
			
			deleteReportServer();
			reportServer();
			blacklistServer();
		},
		error: function(xhr) {
			alert("오류: " + xhr.status);
		},
		dataType: 'json'
		
	})
}

postServer = function(cpage) {
	$.ajax({
		url: `${myPath}/postList.do`,
		data: { "page" : cpage },
		type: 'post',
		success: function(res) {
			console.log(res);
			code = "";
			code += `
			<tr>
              <th></th>
              <th>게시판명</th>
              <th>제목</th>
              <th>글쓴이</th>
              <th>작성일</th>
            </tr>
			`;
			
			$.each(res.datas, function(i, v){
				code += `
			<tr idx="${i}">
              <td><input type="checkbox" idx="${i}" name="check" class="${v.ps_no}"></td>
              <td class="br-name">${v.br_name}</td>
              <td class="ps-title">
              	<a href="${myPath}/postRead.do?board=${v.br_code}&no=${v.ps_no}">${v.ps_subject}</a></td>
              <td class="writer">${v.mm_id}(${v.mm_nickname})</td>
              <td class="ps-date">${(v.ps_date).substr(0,10)}</td>
            </tr>
				`
			})
			
			code += `
			<tr>
              <td><input type="checkbox" id="checkAll"></td>
              <td style="font-size: 1.7rem; font-weight: bold;">선택한 글</td>
              <td colspan="5">
                <div id="del-black">
                    <input type="button" value="삭제" name="delete" class="delete">
				    <input type="button" value="블랙리스트" name="blacklist" class="blacklist">
                </div>
              </td>
            </tr>
			`
			
			$('#member-post').html(code);
			
			pager = "";
			
			// 이전 
			if (res.sp > 1) {
				pager += `
				<li class="page-item"><a class="page-link" href="#">
              <img src="${myPath}/image/icon/icon-arrow-prev.png" alt="icon-arrow-prev.png" id="prev"></a>
            </li>`;
			}
			
			// 페이지 번호
			for (i = res.sp; i <= res.ep; i++) {
				if (i == currentPage) {
					pager += `<li class="page-item active"><a class="page-link pageno" href="#">${i}</a></li>`;

				} else {
					pager += `<li class="page-item"><a class="page-link pageno" href="#">${i}</a></li>`;
				}
			}
			// 다음
			if (res.ep < res.tp) {
				pager += `<li class="page-item"><a class="page-link" href="#">
              <img src="${myPath}/image/icon/icon-arrow-next.png" alt="icon-arrow-next.png" id="next"></a>
            </li>`;
			}
			
			pager += `</ul>`;


			$('#post-pagination').html(pager);
		
		},
		error: function(xhr) {
			alert("오류: " + xhr.status);
		},
		dataType: 'json'		
			
	})
}

deletePostServer = function() {
	var checkedPost = "";
	$('input[name=check]:checked').each(function() {
		if(checkedPost!="") checkedPost += "&"
		checkedPost+= "checkedPost=" + $(this).attr('class');
	});
	console.log(checkedPost);
	if(checkedPost.length > 0) {
		$.ajax({
			url: `${myPath}/deletePost.do`,
			type: 'post',
			data: checkedPost,
			success: function(res) {
				alert("게시글이 성공적으로 삭제되었습니다.");
				postServer();
				myPostServer();
			},
			error: function(xhr) {
				alert("오류: " + xhr.status);
			},
			dataType: 'json'
		});
	
	} else {
		alert("게시글을 선택해주세요.");
	}
	
}

insertBlacklist = function() {
	var vmmid = "";
	$('input[name=check]:checked').each(function() {
		if(vmmid!="") vmmid += "&";
		id = $(this).closest('tr').find('.writer').text();
		console.log(id);
		idx = id.indexOf("(");
		mmid = id.substring(0, idx);
		vmmid+= "vmmid=" + mmid;
	});
	console.log(vmmid);
	if(vmmid.length > 0) {
		$.ajax({
			url: `${myPath}/insertBlacklist.do`,
			type: 'post',
			data: vmmid,
			success: function(res) {
				alert("블랙리스트 처리를 완료했습니다.");
				postServer();
				commentServer();
			},
			error: function(xhr) {
				alert("오류: " + xhr.status);
			},
			dataType: 'json'
		});
	
	} else {
		alert("선택을 하지 않았습니다.");
	}

}

commentServer = function(cpage) {
	$.ajax({
		url: `${myPath}/commentList.do`,
		data: { "page" : cpage },
		type: 'post',
		success: function(res) {
			code = "";
			code += `
			<tr>
              <th></th>
              <th>게시판명</th>
              <th>게시글 제목</th>
              <th>댓글 내용</th>
              <th>글쓴이</th>
              <th>작성일</th>
            </tr>
			`;
			
			$.each(res.datas, function(i, v){
				code += `
			<tr idx=${i}>
              <td><input type="checkbox" idx="${i}" name="check" class="${v.cm_no}"></td>
              <td class="br-name">${v.br_name}</td>
              <td class="ps-title">${v.ps_subject}</td>
              <td class="cm-content">${v.cm_content}</td>
              <td class="writer">${v.mm_id}(${v.mm_nickname})</td>
              <td class="cm-date">${(v.cm_date).substr(0,10)}</td>
            </tr>
				`
			})
			
			code += `
			<tr>
              <td><input type="checkbox" id="checkAll"></td>
              <td style="font-size: 1.7rem; font-weight: bold;">선택한 댓글</td>
              <td colspan="5">
                <div id="del-black">
                    <input type="button" value="삭제" name="delete" class="delete">
				    <input type="button" value="블랙리스트" name="blacklist" class="blacklist">
                </div>
              </td>
            </tr>
			`
			
			$('#member-comment').html(code);
			
			pager = "";
			
			// 이전 
			if (res.sp > 1) {
				pager += `
				<li class="page-item"><a class="page-link" href="#">
              <img src="<${myPath}/image/icon/icon-arrow-prev.png" alt="icon-arrow-prev.png" id="prev"></a>
            </li>`;
			}
			
			// 페이지 번호
			for (i = res.sp; i <= res.ep; i++) {
				if (i == currentPage) {
					pager += `<li class="page-item active"><a class="page-link pageno" href="#">${i}</a></li>`;

				} else {
					pager += `<li class="page-item"><a class="page-link pageno" href="#">${i}</a></li>`;
				}
			}
			// 다음
			if (res.ep < res.tp) {
				pager += `<li class="page-item"><a class="page-link" href="#">
              <img src="${myPath}/image/icon/icon-arrow-next.png" alt="icon-arrow-next.png" id="next"></a>
            </li>`;
			}
			
			pager += `</ul>`;


			$('#comment-pagination').html(pager);
		
		},
		error: function(xhr) {
			alert("오류: " + xhr.status);
		},
		dataType: 'json'		
			
	})
}

deleteCommentServer = function() {
	var checkedPost = "";
	$('input[name=check]:checked').each(function() {
		if(checkedPost!="") checkedPost += "&"
		checkedPost+= "checkedPost=" + $(this).attr('class');
	});
	console.log(checkedPost);
	if(checkedPost.length > 0) {
		$.ajax({
			url: `${myPath}/deleteComment.do`,
			type: 'post',
			data: checkedPost,
			success: function(res) {
				alert("댓글이 성공적으로 삭제되었습니다.");
				commentServer();
				myCommentServer();
			},
			error: function(xhr) {
				alert("오류: " + xhr.status);
			},
			dataType: 'json'
		});
	
	} else {
		alert("댓글을 선택해주세요.");
	}
	
}

myPostServer = function(cpage) {
	$.ajax({
		url: `${myPath}/myPostList.do`,
		data: { "page" : cpage },
		type: 'post',
		success: function(res) {
			code = "";
			code += `
			<tr>
              <th></th>
              <th>게시판명</th>
              <th>제목</th>
              <th>내용</th>
              <th>작성일</th>
            </tr>
			`;
			
			$.each(res.datas, function(i, v){
				newCont = v.ps_content.substr(0, v.ps_content.indexOf("</p>"));
				code += `
			<tr idx="${i}">
              <td><input type="checkbox" idx="${i}" name="check" class="${v.ps_no}"></td>
              <td class="br-name">${v.br_name}</td>
              <td class="ps-title">${v.ps_subject}</td>
              <td class="ps-content">${newCont}</td>
              <td class="ps-date">${(v.ps_date).substr(0,10)}</td>
            </tr>
				`
			})
			
			code += `
			<tr>
              <td><input type="checkbox" id="checkAll"></td>
              <td style="font-size: 1.7rem; font-weight: bold;">선택한 글</td>
              <td colspan="5">
                <div id="del-black">
                    <input type="button" value="삭제" name="delete" class="delete">
                </div>
              </td>
            </tr>
			`
			
			$('#my-post').html(code);
			
			pager = "";
			
			// 이전 
			if (res.sp > 1) {
				pager += `
				<li class="page-item"><a class="page-link" href="#">
              <img src="${myPath}/image/icon/icon-arrow-prev.png" alt="icon-arrow-prev.png" id="prev"></a>
            </li>`;
			}
			
			// 페이지 번호
			for (i = res.sp; i <= res.ep; i++) {
				if (i == currentPage) {
					pager += `<li class="page-item active"><a class="page-link pageno" href="#">${i}</a></li>`;

				} else {
					pager += `<li class="page-item"><a class="page-link pageno" href="#">${i}</a></li>`;
				}
			}
			// 다음
			if (res.ep < res.tp) {
				pager += `<li class="page-item"><a class="page-link" href="#">
              <img src="${myPath}/image/icon/icon-arrow-next.png" alt="icon-arrow-next.png" id="next"></a>
            </li>`;
			}
			
			pager += `</ul>`;


			$('.pagination').html(pager);
		
		},
		error: function(xhr) {
			alert("오류: " + xhr.status);
		},
		dataType: 'json'		
			
	})
}

myCommentServer = function(cpage) {
	$.ajax({
		url: `${myPath}/myCommentList.do`,
		data: { "page" : cpage },
		type: 'post',
		success: function(res) {
			code = "";
			code += `
			<tr>
              <th></th>
              <th>게시판명</th>
              <th>게시글 제목</th>
              <th>댓글 내용</th>
              <th>작성일</th>
            </tr>
			`;
			
			$.each(res.datas, function(i, v){
				code += `
			<tr idx=${i}>
              <td><input type="checkbox" idx="${i}" name="check" class="${v.cm_no}"></td>
              <td class="br-name">${v.br_name}</td>
              <td class="ps-title">${v.ps_subject}</td>
              <td class="cm-content">${v.cm_content}</td>
              <td class="cm-date">${(v.cm_date).substr(0,10)}</td>
            </tr>
				`
			})
			
			code += `
			<tr>
              <td><input type="checkbox" id="checkAll"></td>
              <td style="font-size: 1.7rem; font-weight: bold;">선택한 댓글</td>
              <td colspan="5">
                <div id="del-black">
                    <input type="button" value="삭제" name="delete" class="delete">
                </div>
              </td>
            </tr>
			`
			
			$('#my-post').html(code);
			
			pager = "";
			
			// 이전 
			if (res.sp > 1) {
				pager += `
				<li class="page-item"><a class="page-link" href="#">
              <img src="<${myPath}/image/icon/icon-arrow-prev.png" alt="icon-arrow-prev.png" id="prev"></a>
            </li>`;
			}
			
			// 페이지 번호
			for (i = res.sp; i <= res.ep; i++) {
				if (i == currentPage) {
					pager += `<li class="page-item active"><a class="page-link pageno" href="#">${i}</a></li>`;

				} else {
					pager += `<li class="page-item"><a class="page-link pageno" href="#">${i}</a></li>`;
				}
			}
			// 다음
			if (res.ep < res.tp) {
				pager += `<li class="page-item"><a class="page-link" href="#">
              <img src="${myPath}/image/icon/icon-arrow-next.png" alt="icon-arrow-next.png" id="next"></a>
            </li>`;
			}
			
			pager += `</ul>`;


			$('.pagination').html(pager);
		
		},
		error: function(xhr) {
			alert("오류: " + xhr.status);
		},
		dataType: 'json'		
			
	})
}

