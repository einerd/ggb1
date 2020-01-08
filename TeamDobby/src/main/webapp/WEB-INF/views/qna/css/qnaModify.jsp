<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>장바구니</title>

    <!-- 부트스트랩 -->
    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js">
    </script>
     
    <!-- 달력 관련 시작 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <!-- 달력 관련 END -->
   
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    
    <style type="text/css">
        /* 상품문의 작성 */
        .qnaimg td{
            vertical-align: middle;
            width: 50%;
            
        }
        
        .qnaimg .middle .p{
            padding-top: 20px;
            vertical-align: middle;
            text-align: center;
        }
        
        .qnaimg .middle{
            padding-top: 20px;
            vertical-align: middle;
            text-align: center;
        }
        /* 상품문의 작성 END-------------------------- */
    
    </style>
    
</head>
<body>

 <header>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><img width="43" src="img/logo.svg"></a>
            </div>


            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="dropdown">

                        <a href="#" class="dropdown-toggle" id="dropdown1" data-toggle="dropdown" role="button" aria-expanded="true">전체카테고리 <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">HOT상품</a></li>
                            <li class="divider"></li>
                            <li><a href="#">신상품</a></li>
                            <li class="divider"></li>
                            <li><a href="#">식품</a></li>
                            <li class="divider"></li>
                            <li><a href="#">생활용품</a></li>
                            <li class="divider"></li>
                            <li><a href="#">가전제품</a></li>
                            <li class="divider"></li>
                            <li><a href="#">주방용품</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                        <div><button type="submit" class="btn btn-default">검색</button></div>
                    </div>
                </form>
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" id="dropdown2" data-toggle="dropdown" role="button" aria-expanded="true">
                            <span class="glyphicon glyphicon-home"></span>
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 즐겨찾기</a></li>
                        </ul>
                    </li>


                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" id="dropdown3" data-toggle="dropdown" role="button" aria-expanded="true">
                            <span class="glyphicon glyphicon-user"></span>
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</header>
            
    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    <div class="titlebox titlebox2">
                        <p>상품문의</p>
                    </div>
                    
                   <form action="registForm" method="post" name="regForm">
                    <table class="table">
                        <tbody class="t-control">
                        <tr class="qnaimg">
                             
                              <td class="t-title">
                               <div class="middle">
                                <img width="150" src="img/color1.jpg">
                                </div>
                              </td>
                              <td>
                                <div class="middle">
                                 <div class="info">
                                  <p class="title p">토끼의 간</p>
                                  </div>
                                  <div class="seller">
                                   <p class="title p">(판매자명)용궁거북이</p>
                                  </div>
                                  </div>
                              </td>
                          </tr>
                        </tbody>
                    </table>
                    
                    <input type="text" class="form-control" name="pno" id="pno" value="999">
                    <input type="text" class="form-control" name="sno" id="sno" value="888">
                    <input type="text" class="form-control" name="pno" id="b_history" value="히스토리">
                    
                    
                    <table class="table">
                        <tbody class="t-control">
                         <tr>
                             <td class="t-title">Category</td>
                            <td>
								<div class="category_select">
									<select class=" tune" id="category" name="category" style="width: 127px;"><option value="상품">상품</option><option value="배송">배송</option><option value="반품/환불">반품/환불</option><option value="교환/변경">교환/변경</option><option value="기타">기타</option></select>
								</div>
							</td>
                         </tr>
                          <tr>
                            <td class="t-title">UserId</td>
                            <td><input type="text" class="form-control" name="uno" id="uno" value="${qnaVO.uno }"></td> <!-- value="${sessionScope.user_id}" readonly -->
                          </tr>
                          <tr>
                            <td class="t-title">TITLE</td>
                            <td><input type="text" class="form-control" id="q_title" name="q_title" value="${qnaVO.q_title }"></td>
                          </tr>
                          <tr>
                            <td class="t-title">CONTENT</td>
                            <td><textarea class="form-control" rows="7" name="q_content" id="q_content">${qnaVO.q_content }</textarea></td>
                          </tr>
                          <tr>
                           <td class="t-title left"> 
                               <button class="btn btn-default" id="q_img_name">    파일업로드    </button>
                           </td>
                           <td>
                               <input type="text" class="form-control" value="파일명.jpg">
                           </td>
                          </tr>
                          
                        </tbody>
                      </table>
                     </form>
                      
                      <div class="titlefoot">
                          <button class="btn btn-default" id="qnaList">목록</button>
                          <button class="btn btn-default" id="qnaUpdate">완료</button>
                      </div>
                      
                      
                </div>
            </div>
            
        </div>
        
        
    </section>

   	<script>
	    //목록을 클릭하면 list화면으로 연결
	    var qnaList = document.getElementById("qnaList");
	    qnaList.onclick = function() {
	    	location.href = "qnaList";
	    }
	    
	 
   		//등록을 클릭하면 작성자, 제목, 내용이 공백인지 확인하고, 공백이라면 함수종료 ,공백이 아니라면 controller전송하는 처리
    	var qnaUpdate = document.getElementById("qnaUpdate");
    	qnaUpdatedho.onclick = function() {
    		
    		if(document.regForm.uno.value == '' ) {
    			alert("작성자는 필수 사항입니다");
    			document.regForm.uno.focus();
    			return; //함수 종료
    		} else if(document.regForm.q_title.value == '') {
    			alert("제목은 필수 사항입니다");
    			document.regForm.q_title.focus();
    			return;
    		} else if(document.regForm.q_content.value == '') {
    			alert("내용은 필수 사항입니다");
    			document.regForm.q_content	.focus();
    			return;
    		} else {
    			document.regForm.submit(); //폼의 서브밋기능
    		}
    	}
    	
    	
    
    
    
    </script>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-7">
                <div class="copyright">
                    <img src="img/logo.svg" width="20">
                    팀도비 | 대표이사: 김도비<br>
                    서울시 송파구 송파대로 570<br>
                    사업자 등록번호 : 120-88-00767<br>
                    통신판매업신고 : 2017-서울송파-0680<br>
                </div>
            </div>
            <!--text-right는 부트스트랩에 정의되어 있는 클래스로 글자 오른쪽 정렬-->
            <div class="col-sm-12 col-md-5" text-right>
                <ul class="footer-menu">
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보취급</a></li>
                </ul>
                <address>서울특별시 금천구 두산로 70 B, 24층<br>
                    Fax : 02-3441-7011 |
                    email : socialrsh@market.com</address>
            </div>
        </div>
    </div>
</footer>
</body>
</html>