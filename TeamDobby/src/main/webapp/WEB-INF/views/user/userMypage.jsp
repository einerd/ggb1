<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>도비는 공짜에요</title>

	<!-- 부트스트랩 -->
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<!--개인 디자인 추가-->
	<link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
	<script	src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

	<style type="text/css">
		.myInfo{
			margin: 0 auto;
			float: none; 
            margin-top: 77px;
		}
		.form-control{
			height: 40px;
		}

		.form-control3{
			width: 100%;
        	height: 40px;
        	float: left;
        	border: 1px solid lightgrey; 
        	border-radius: 1;
		}
		
        .email-form {
            box-sizing: border-box;
            float: none;
        }
        .email-form .email-at{
            float: left;
            text-align: center;
            padding-top: 8px;
            width: 5%;
        }
        .email-form .email-f{
            width: 31.33%;
        }
        .email-form .email-r {
            width: 63.66%;
        }
		
		.phone1{
			width: 30%;
			height: 40px;
			float: left;
		}
		
		.phone-form input{
			width: 57%;
			float: left;
		}
		
		.post-no-form input{
			width: 87%;
			
		}
		.input-group-addon {
            padding: 0;
            border: none; /*윤곽 모두 0*/
            border-radius: 0;
        }
        
        .title-foot{
        	float: none;        
        	margin: 0 auto;
        }
        
        .table {
        	overflow: auto;
        }
        /* 페이지네이션 중앙정렬 */
        .paging {
            text-align: center;
        }
		
		
	</style>

</head>
<body>

	<%@ include file="../include/header.jsp"%>


	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-10 col-lg-9 myInfo">
					<ul class="nav nav-tabs tabs-style">
						<li class="" id="basic"><a data-toggle="tab" href="#info">내정보</a></li>
						<li class="" id="review"><a data-toggle="tab" href="#myReviewBoard">내 리뷰</a></li>
						<li class="" id="qna"><a data-toggle="tab" href="#myQnaBoard">내 질문</a></li>
					</ul>
					<div class="tab-content">
						<div id="info" class="tab-pane fade">

							<p>*표시는 필수 입력 표시입니다</p>
							<form action="userModify" id="regForm" name="regForm" method="post">
								<table class="table">
									<tbody class="m-control">
										<tr>
											<td class="mtitle">회원번호</td>
											<td><input class="form-control input-sm" id="uno" value="${userVO.uno }" readonly></td>
										</tr>
										<tr>
											<td class="m-title">ID</td>
											<td><input class="form-control input-sm" id="user_id" value="${userVO.user_id }" readonly></td>
										</tr>
										<tr>
											<td class="m-title">이름</td>
											<td><input class="form-control input-sm" id="user_name" value="${userVO.user_name }"  readonly></td>
										</tr>
										<tr>
											<td class="m-title">*별명(닉네임)</td>
											<td><input class="form-control3 input-sm" id="user_nick" value="${userVO.user_nick }"></td>
										</tr>
										<tr>
											<td class="m-title">*비밀번호</td>
											<td><input type="password" class="form-control3 input-sm" id="user_pw" placeholder="변경할 비밀번호를 입력하세요. 변경을 하지 않으려면 공란으로 남겨두세요."></td>
										</tr>
										<tr>
											<td class="m-title">*비밀번호확인</td>
											<td><input type="password" class="form-control3 input-sm" id="pwConfirm" placeholder="변경할 비밀번호를 입력하세요. 변경을 하지 않으려면 공란으로 남겨두세요."></td>
										</tr>
										<tr>
											<td class="m-title">*E-mail</td>
											<td>
												<div class="email-form">
													<input type="text" class="form-control3 email-f" name="u_email_1" id="u_email_1" value="${userVO.u_email_1 }">
													<div class="email-at">@</div>
													<select class="form-control3 email-r" name="u_email_2" id="u_email_2">
														<option ${userVO.u_email_2 eq 'naver.com' ? 'selected': '' }>naver.com</option>
														<option ${userVO.u_email_2 eq 'gmail.com' ? 'selected': '' }>gmail.com</option>
														<option ${userVO.u_email_2 eq 'daum.net'  ? 'selected': '' }>daum.net</option>
														<option ${userVO.u_email_2 eq 'hotmail.com'  ? 'selected': '' }>hotmail.com</option>
													</select>
														
												</div>
											</td>
										</tr>
										<tr>
											<td class="m-title">*휴대폰</td>
											<td>
												<div class="phone-form">
							                        <select class="form-control3 phone1" name="u_phone_1" id="u_phone_1">
						                           		<option ${userVO.u_phone_1 eq '010' ? 'selected' : '' }>010</option>
														<option ${userVO.u_phone_1 eq '011' ? 'selected' : '' }>011</option>
														<option ${userVO.u_phone_1 eq '017' ? 'selected' : '' }>017</option>
														<option ${userVO.u_phone_1 eq '018' ? 'selected' : '' }>018</option>
														<option ${userVO.u_phone_1 eq '019' ? 'selected' : '' }>019</option>
							                        </select> 
													<input class="form-control3 input-sm" name="u_phone_2" id="u_phone_2" value="${userVO.u_phone_2 }">
					                                <div class="input-group-addon">
					                                    <button type="button" class="btn btn-primary">본인인증</button>
					                                </div>
					                            </div>
											</td>
										</tr>
										<tr>
											<td class="m-title">*우편번호</td>
											<td>
												<div class="post-no-form">
													<input class="post-no form-control3 input-sm" id="u_post_no" value="${userVO.u_post_no }" readonly>
													<button type="button" class="btn btn-primary" id="addBtn">주소찾기</button>
												</div>
											</td>
										</tr>
										<tr>
											<td class="m-title">*주소</td>
											<td><input class="form-control3 input-sm add" name="u_address_1" id="u_address_1" value="${userVO.u_address_1 }" readonly></td>
										</tr>
										<tr>
											<td class="m-title">*상세주소</td>
											<td><input class="form-control3 input-sm add" name="u_address_2" id="u_address_2" value="${userVO.u_address_2 }" readonly></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
						
						
						
						<!-- 첫번째 토글 끝 -->
	                    <div id="myReviewBoard" class="tab-pane fade">
                            <p>*내 게시글 관리</p>
                            <form>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <td>상품번호</td>
                                        <td>제목</td>
                                        <td>작성일</td>
                                    </tr>
                                    <c:forEach var="vo" items="${reviewList }">
                                    <tr>
                                    	<td><a href="../productList/productDetail?pno=${vo.pno }">${vo.pno }</a></td>
                                    	<td><a href="../review/reviewDetail?review_no=${vo.review_no }">${vo.r_title }</a></td>
                                    	<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
                                    </tr>
                                    </c:forEach>
                                </thead>
                            </table>
                            </form>
   					<div class="paging">
                        <ul class="pagination pagination-sm">
                          <!--이전 button  --> 
                          <c:if test = "${pageVO1.prev }" >
                          	<li><a href="../user/userMypage?pageNum=${pageVO1.startPage-1 }&path=review">${num }">이전</a></li>
                          </c:if>
                          
                          <!-- pageNum -->
                          <c:forEach var="num" begin="${pageVO1.startPage }" end="${pageVO1.endPage }">
                          	<li class="${pageVO1.pageNum == num ? 'active' : '' }"><a href="../user/userMypage?pageNum=${num }&path=review">${num }</a></li>
                          </c:forEach>
                          
                          <!-- 다음 button -->
                          <c:if test = "${pageVO1.next }">
                          	<li><a href="../user/userMypage?pageNum=${pageVO1.endPage+1 }&path=review">${num }">다음</a></li>
                          </c:if>
                        </ul>
                    </div>
                        </div>

						<!-- 두번째 토글 끝 -->
						<div id="myQnaBoard" class="tab-pane fade">
                            <p>*내 게시글 관리</p>
                            <form>
                            <table class="table">
                            
                                <thead>
                                    <tr>
                                        <td>상품번호</td>
                                        <td>제목</td>
                                        <td>작성일</td>
                                    </tr>
                                    <c:forEach var="vo" items="${qnaList }">
                                    <tr>
                                    	<td><a href="../productList/productDetail?pno=${vo.pno }">${vo.pno }</a></td>
                                    	<td><a href="../qna/qnaDetail?qna_no=${vo.qna_no }">${vo.q_title }</a></td>
                                    	<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
                                    </tr>
                                    </c:forEach>
                                </thead>
                                
                                
                                
                            </table>
                            </form>
                            <div class="paging">
                        <ul class="pagination pagination-sm">
                          <!--이전 button  --> 
                          <c:if test = "${pageVO2.prev }" >
                          	<li><a href="../user/userMypage?pageNum=${pageVO2.startPage-1 }&path=qna">${num }">이전</a></li>
                          </c:if>
                          
                          <!-- pageNum -->
                          <c:forEach var="num" begin="${pageVO2.startPage }" end="${pageVO2.endPage }">
                          	<li class="${pageVO2.pageNum == num ? 'active' : '' }"><a href="../user/userMypage?pageNum=${num }&path=qna">${num }</a></li>
                          </c:forEach>
                          
                          <!-- 다음 button -->
                          <c:if test = "${pageVO2.next }">
                          	<li><a href="../user/userMypage?pageNum=${pageVO2.endPage+1 }&path=qna">${num }">다음</a></li>
                          </c:if>
                        </ul>
                    </div>
                        </div>
					</div>
				</div>
			</div>

		</div>


	</section>

	<%@ include file="../include/footer.jsp"%>
	
	<script>
	$("#updateBtn").click(function() {
		
		
		if( $("#user_pw").val() == '') {
			alert("비밀번호 규칙을 확인하세요");
		} else if( $("#user_pw").css("border-Color") == 'rgb(255, 0, 0)' ) {
			alert("비밀번호 규칙을 확인하세요");
		} else if( $("#user_pw").val() != $("#pwConfirm").val() ) {
			alert("비밀번호 확인란을 확인하세요");
		} else if( $("#u_phone_2").val() == '') {
			alert("연락처는 필수사항입니다");
		} else if( $("#u_email_1").val() == '') {
			alert("이메일은 필수사항입니다");
		} else if( $("#u_post_no").val() == '') {
			alert("주소는 필수사항입니다");
		} else if( $("#u_address_1").val() == '') {
			alert("주소는 필수사항입니다");
		} else if( confirm("회원 정보 수정을 진행하시겠습니까?") ) {
			$("#regForm").submit(); //제이쿼리의 서브밋
		}
	})
	</script>
	
	<script>
		//주소 팝업
	    var addBtn = document.getElementById("addBtn");
	    addBtn.onclick = goPopup; 
	    function goPopup(){
			var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		}
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
				document.getElementById("u_address_1").value = roadAddrPart1;
				document.getElementById("u_address_2").value = addrDetail + roadAddrPart2;
				document.getElementById("u_post_no").value = zipNo;
		}
		
		window.onload = function() {
			
			// 뒤로가기 실행후에 앞으로가기 했을 때, 저장된 기록이 공백이라면 함수 종료
			if(history.state == '') return;
				
			var msg = '${msg}';
			if(msg != '') { // 값이 없을 때는 ''로 감싸서 공백문자열로 완성되도록 해준다
				alert(msg);
				history.replaceState('', null, null); // 현재 히스토리 기록을 변경
			}
			
			var path = location.search;
			path = path.substring(path.lastIndexOf("=")+1);
			console.log(path);
			if(path == 'review') {
				document.getElementById("review").setAttribute("class", "active");
				document.getElementById("myReviewBoard").setAttribute("class", "tab-pane fade in active");
				document.getElementById("basic").setAttribute("class", "");
				document.getElementById("info").setAttribute("class", "tab-pane fade in");
			}else if(path == 'qna') {
				document.getElementById("qna").setAttribute("class", "active");
				document.getElementById("myQnaBoard").setAttribute("class", "tab-pane fade in active");
				document.getElementById("basic").setAttribute("class", "");
				document.getElementById("info").setAttribute("class", "tab-pane fade in");
				
			}else {
				document.getElementById("basic").setAttribute("class", "active");
				document.getElementById("info").setAttribute("class", "tab-pane fade in active");
			}
		}
	</script>

</body>
</html>