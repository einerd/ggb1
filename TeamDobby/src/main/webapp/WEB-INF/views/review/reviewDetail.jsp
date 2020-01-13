<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>장바구니</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

 <style type="text/css">
    
        /*review_write 별---------------------*/
        
        .reviewwrite .starR{
          background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
          background-size: auto 100%;
          width: 30px;
          height: 30px;
          display: inline-block;
          text-indent: -9999px;
          cursor: pointer;
        }
        
        .reviewwrite .starR.on{
            background-position:0 0;
        
        }
        
        /*review_write 별 END-------------------*/
        
         /* review_write -----------------*/
        .reviewimg .t-title .middle{
            vertical-align: middle;
            text-align: center;
            padding-top: 20px;
        }
        
        .category_select select{
            width:150px;
            padding:2px; 
            border:1px solid #ddd;
            border-radius:0.3em;
        }
        /* rewview_write END ----------------------*/
    
    	.top {
    		padding-top: 80px;
    	}
    	
    	body.modal-open {
		    overflow:scroll;
		    width:100.9%;
		}
		
		.modal {
        text-align: center;
		}
		 
		@media screen and (min-width: 768px) { 
		        .modal:before {
		                display: inline-block;
		                vertical-align: middle;
		                content: " ";
		                height: 100%;
		        }
		}
		 
		.modal-dialog {
		        display: inline-block;
		        text-align: left;
		        vertical-align: middle;
		}
		
		.titlefoot{
            float:right;
        }
		
    </style>
</head>
<body>

	<%@include file="../include/header.jsp" %>
	
	<section class="top">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    <div class="titlebox titlebox2">
                        <p>상품후기</p>
                        
                    </div>
                    <form action="reviewModify" method="post" name="regForm">
                    <table class="table">
                        <tbody class="t-control">
                        <tr class="reviewimg">
                             
                              <td class="t-title" >
                              <div>
                               <div class="middle"> <!-- 모달 작업 (사진 크게) -->
                               <a data-toggle="modal" href="#reviewModal">
                              <c:choose>
	                               <c:when test="${reviewVO.r_img_name != null && reviewVO.r_img_name != ''}"> <!-- 이미지값 null이면 안보이게 하기 -->
	                                <img width="400" src="${pageContext.request.contextPath }/resources/img/${reviewVO.r_fileloca}/${reviewVO.r_img_name}" >
	                                </c:when>
	                                <c:otherwise>
	                               
	                                </c:otherwise>
                              </c:choose>
                               </a>
                                </div>
                                </div>
                              </td>
                          </tr>
                        </tbody>
                    </table>
                    
                    <table class="table">
                        <tbody class="t-control reviewwrite">
                          <tr>
                             <!--<td>평가</td>-->
                              <td><span class="rating_star"><span style="width: 50%;">Rating</span></span></td>
                              <td>
                                <div class="starRev">
                                  <c:forEach var="i" begin="1" end="5">
                                	<c:choose>
                                		<c:when test="${i <= reviewVO.starCount }">
                                			<span class="starR on">★</span>
                                		</c:when>
                                		<c:otherwise>
                                			<span class="starR">☆</span>
                                		</c:otherwise>
	                                </c:choose>
                                </c:forEach>
                                </div>
                              </td>
                          </tr>
                          <tr>
                            <td class="t-title">review_no</td>
                            <td><input type="text" class="form-control" value="${reviewVO.review_no	 }" name="review_no" readonly></td>
                          </tr>
                          <tr>
                            <td class="t-title">UserId</td>
                            <td><input type="text" class="form-control" value="${reviewVO.user_id }" name="writer" readonly></td>
                          </tr>
                          <tr>
                            <td class="t-title">TITLE</td>
                            <td><input type="text" class="form-control" value="${reviewVO.r_title }" name="r_title"  readonly></td>
                          </tr>
                          <tr>
                            <td class="t-title">CONTENT</td>
                            <td><textarea class="form-control" rows="7" id="comment" name="r_content"  readonly>${reviewVO.r_content }</textarea></td>
                          </tr>
                         
                          
                        </tbody>
                      </table>
                      </form>
                      
                      
                      <div class="titlefoot">
                      	  <button class="btn btn-default" id="reviewModify">수정</button>
                          <button class="btn btn-default" id="reviewDelete">삭제</button>
                          <button class="btn btn-default" id="reviewList">목록</button>
                      </div>
                      
                      
                </div>
            </div>
            
        </div>
        
        
      <!-- 모달 -->
	<div id="reviewModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <img width="1200" height="1200" src="${pageContext.request.contextPath }/resources/img/${reviewVO.r_fileloca}/${reviewVO.r_img_name}" >
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>
        
        
    </section>
    
    <%@include file="../include/footer.jsp" %>
    
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

      
	   //수정화면이동
	   var reviewList = document.getElementById("reviewModify");
       reviewModify.onclick = function() {
          var rno = location.search;
            rno = location.search.substring(rno.lastIndexOf("=")+1);
            $.getJSON(
	  	  			"../review/getPno/"+rno+"/", // 요청보낼 주소
	  	  			function(data) { // 성공시 전달받을 익명함수
				          document.regForm.setAttribute("action", "reviewModify?review_no="+rno);
				          document.regForm.submit();
	  	  			}
	  	  	    )
            
       }
    	
    
	  	//삭제기능
		var reviewDelete = document.getElementById("reviewDelete");
		reviewDelete.onclick = function(){
			
			if(confirm("삭제하시겠습니까?")) {
				var rno = location.search;
	  	    	rno = location.search.substring(rno.lastIndexOf("=")+1);
	  	    	
	  	    	$.getJSON(
	  	  			"../review/getPno/"+rno+"/", // 요청보낼 주소
	  	  			function(data) { // 성공시 전달받을 익명함수
						document.regForm.setAttribute("action", "reviewDelete?pno="+data.pno);
						document.regForm.submit();
	  	  			}
	  	  	    )
				
			}
		}
		
		//목록이동
  	    var reviewList = document.getElementById("reviewList");
  	    reviewList.onclick = function() {
  	    	var rno = location.search;
  	    	rno = location.search.substring(rno.lastIndexOf("=")+1);
  	    	
  	    	$.getJSON(
  	  			"../review/getPno/"+rno+"/", // 요청보낼 주소
  	  			function(data) { // 성공시 전달받을 익명함수
  	  				location.href="../productList/productDetail?pno="+data.pno+"#review-point";
  	  			}
  	  	    )
  	    }
		
    </script>
</body>
</html>