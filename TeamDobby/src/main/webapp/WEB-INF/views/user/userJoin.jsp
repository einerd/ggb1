<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	
	<style type="text/css">
     /*userJoin Form 디자인*/
        .join-form{
            margin: 0 auto; 
            float: none; 
            margin-top: 77px;
        }
        
        .join-form form{
            border-radius: 8px;
            padding: 15px;
            box-shadow:  0px 8px 16px rgba(0, 0, 0, 0.15)
        }

        .input-group-addon {
            padding: 0;
            border: none; /*윤곽 모두 0*/
            border-radius: 0;
        }
        
        .form-group2{
        	margin-top: 12px;
        	width: 100%;
        	overflow: hidden;
        }
        
        .form-group3{
        	width: 100%;
        	overflow: hidden;
        }
        
        .need-margin{
        	margin-top: 12px;
        }
        
        .form-group2 .form-control2{
        	width: 100%;
        	height: 40px;
        	float: left;
        	border: 1px solid lightgrey; 
        	border-radius: 1;
        }
        
        .form-control2:focus {
            border-color: blue;
        }

        .input-group .userId{
			width: 100%;        
        }
        .input-group .phone1 {
   		    width: 33.3333%;
        }
        .input-group .phone2 {
            width: 66.6666%;
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
            width: 62.66%;
        }
        
        .join-form input, .join-form select{
            height: 40px;
        }
        
		.width-control{
			width: 85%;        
        }
        
        
 </style>
</head>
<body>

	<%@ include file="../include/header.jsp" %>

 
   
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-9 col-sm-12 join-form">
                    <form action="joinForm" id="regForm" name="regForm" method="post">
                        <div class="form-group2">
                            <label for="id">아이디</label>
                            <div class="input-group">
                                <input type="text" class="form-control2 userId" name="user_id" id="user_id" placeholder="아이디를 (영문포함 4~12자 이상)">
                                <div class="input-group-addon">
                                    <button type="button" class="btn btn-primary" id="idConfirmBtn">아이디중복체크</button>
                                </div>
                            </div>
                            <span id="msgId"></span><!--자바스크립트에서 추가-->
                        </div>
                        <div class="form-group2">
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control2" name="user_pw" id="user_pw" placeholder="비밀번호 (영 대/소문자, 숫자 조합 8~16자 이상)">
                            <span id="msgPw"></span><!--자바스크립트에서 추가-->
                        </div>
                        <div class="form-group2">
                            <label for="password-confrim">비밀번호 확인</label>
                            <input type="password" class="form-control2" id="pwConfirm" placeholder="비밀번호를 확인해주세요.">
                             <span id="msgPw-c"></span><!--자바스크립트에서 추가-->
                        </div>
                        <div class="form-group2">
                            <label for="name">이름</label>
                            <input type="text" class="form-control2" name="user_name" id="user_name" placeholder="이름을 입력하세요.">
                        </div>
						<div class="form-group2">
                            <label for="name">별명(닉네임)</label>
                            <input type="text" class="form-control2" name="user_nick" id=""user_nick"" placeholder="별명(닉네임)을 입력하세요.">
                        </div>                        
                        <!--input2탭의 input-addon을 가져온다 -->
                        <div class="form-group2">
                            <label for="hp">휴대폰번호</label>
                            <div class="input-group">
		                        <select class="form-control2 phone1" name="u_phone_1" id="u_phone_1">
		                           <option>010</option>
		                           <option>011</option>
		                           <option>017</option>
		                           <option>018</option>
		                           <option>019</option>
		                        </select> 
		                        <input type="text" class="form-control2 phone2" name="u_phone_2" id="u_phone_2" placeholder="휴대폰번호를 입력하세요.">
                                <div class="input-group-addon">
                                    <button type="button" class="btn btn-primary">본인인증</button>
                                </div>
                            </div>
                        </div>
                  <div class="form-group2 email-form">
                    <label for="email">이메일</label><br>
                    <input type="text" class="form-control2 email-f" name="u_email_1" id="u_email_1" placeholder="이메일">
                      <div class="email-at">@</div>
                    <select class="form-control2 email-r" name="u_email_2" id="u_email_2">
                      <option>naver.com</option>
                      <option>daum.net</option>
                      <option>gmail.com</option>
                      <option>hotmail.com</option>
                    </select>
                  </div>
                        <!--readonly 속성 추가시 자동으로 블락-->
                        <div class="form-group2">
                            <label for="post_num">주소</label>
                            <div class="input-group">
                                <input type="text" class="form-control2 width-control" name="u_post_no" id="u_post_no" placeholder="우편번호" readonly>
                                <div class="input-group-addon">
                                    <button type="button" class="btn btn-primary" id="addBtn">주소찾기</button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group2">
                            <input type="text" class="form-control2" name="u_address_1" id="u_address_1" placeholder="기본주소">
                        </div>
                        <div class="form-group2">
                            <input type="text" class="form-control2" name="u_address_2" id="u_address_2" placeholder="상세주소">
                        </div>

                        <div class="form-group3 need-margin">
                            <button type="button" class="btn btn-lg btn-success btn-block" id="joinBtn">회원가입</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
 
	<%@ include file="../include/footer.jsp" %>

  
      <script>
      
      window.onload = function() {
  		
  		// 뒤로가기 실행후에 앞으로가기 했을 때, 저장된 기록이 공백이라면 함수 종료
  		if(history.state == '') return;
  		
  		var msg = '${msg}';
  		if(msg != '') { // 값이 없을 때는 ''로 감싸서 공백문자열로 완성되도록 해준다
  			alert(msg);
  			history.replaceState('', null, null); // 현재 히스토리 기록을 변경
  			}
  		}
      
      
      
    	//아이디중복체크
    	$("#idConfirmBtn").click(function() {
    		
    		if( $("#user_id").val() == '' || $("#user_id").css("border-Color") == 'rgb(255, 0, 0)' ) {
    			alert("아이디 규칙을 확인하세요");
    			return false; //함수 종료
    		}
    		var user_id = $("#user_id").val(); //아이디 얻음
    		$.ajax({
    			type:"post",
    			url:"idConfirm",
    			data: JSON.stringify({"user_id":user_id}),
    			contentType: "application/json; charset=utf-8",
    			success:function(result) {
    				if(result == 0) {
    					alert("사용가능한 아이디 입니다");
    					$("#user_id").attr("readonly", true); //readonly처리
    					$("#msgId").html("사용가능한 아이디입니다"); //문자열로 집어넣음
    					
    				} else {
    					alert("중복된 아이디 입니다");
    					$("#user_id").focus(); //포커스
    				}
    			},
    			error:function(status) {
    				alert("다시 시도하세요:" + status);
    			}
    		})
    	}) //중복체크끝
     	
    	//회원가입버튼
    	$("#joinBtn").click(function() {
    		
    		if( !$("#user_id").attr("readonly") ) {
    			alert("아이디 중복체크는 필수 입니다");
    		} else if( $("#user_pw").val() == '') {
    			alert("비밀번호 규칙을 확인하세요");
    		} else if( $("#user_pw").css("border-Color") == 'rgb(255, 0, 0)' ) {
    			alert("비밀번호 규칙을 확인하세요");
    		} else if( $("#user_pw").val() != $("#pwConfirm").val() ) {
    			alert("비밀번호 확인란을 확인하세요");
    		} else if( $("#user_name").val() == '') {
    			alert("이름은 필수사항입니다");
    		} else if( $("#u_phone_2").val() == '') {
    			alert("연락처는 필수사항입니다");
    		} else if( $("#u_email_1").val() == '') {
    			alert("이메일은 필수사항입니다");
    		} else if( $("#u_post_no").val() == '') {
    			alert("주소는 필수사항입니다");
    		} else if( $("#u_address_1").val() == '') {
    			alert("주소는 필수사항입니다");
    		} else if( confirm("회원가입을 진행하시겠습니까?") ) {
    			$("#regForm").submit(); //제이쿼리의 서브밋
    		}
    	})
    	//회원가입페이지로 이동
    	$("#loginBtn").click(function() {
    		location.href = "userLogin";
    	})
    	
    </script>
    <script>
        /*아이디 형식 검사 스크립트*/
        var id = document.getElementById("user_id");
        id.onkeyup = function() {
            /*자바스크립트의 정규표현식 입니다*/
            /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
            var regex = /^[A-Za-z0-9+]{4,12}$/; 
            if(regex.test(document.getElementById("user_id").value )) {
                document.getElementById("user_id").style.borderColor = "green";
                document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다";

            } else {
                document.getElementById("user_id").style.borderColor = "red";
                document.getElementById("msgId").innerHTML = "";
            }
        }
        /*비밀번호 형식 검사 스크립트*/
        var pw = document.getElementById("user_pw");
        pw.onkeyup = function(){
            var regex = /^[A-Za-z0-9+]{8,16}$/;
             if(regex.test(document.getElementById("user_pw").value )) {
                document.getElementById("user_pw").style.borderColor = "green";
                document.getElementById("msgPw").innerHTML = "사용가능합니다";
            } else {
                document.getElementById("user_pw").style.borderColor = "red";
                document.getElementById("msgPw").innerHTML = "";
            }
        }
        /*비밀번호 확인검사*/
        var pwConfirm = document.getElementById("pwConfirm");
        pwConfirm.onkeyup = function() {
            var regex = /^[A-Za-z0-9+]{8,16}$/;
            if(document.getElementById("pwConfirm").value == document.getElementById("user_pw").value ) {
                document.getElementById("pwConfirm").style.borderColor = "green";
                document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
            } else {
                document.getElementById("pwConfirm").style.borderColor = "red";
                document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
            }
        }
        
        /* 주소API  */
        var addBtn = document.getElementById("addBtn");
        addBtn.onclick = goPopup; 
                
        function goPopup(){
			var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
					
		}
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
				// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
				document.getElementById("u_address_1").value = roadAddrPart1;
				document.getElementById("u_address_2").value = addrDetail + roadAddrPart2;
				document.getElementById("u_post_no").value = zipNo;
				
				
		}
    </script>
   
</body>
</html>