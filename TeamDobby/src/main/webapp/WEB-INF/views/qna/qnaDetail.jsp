<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>장바구니</title>

     
    <!-- 달력 관련 시작 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <!-- 달력 관련 END -->
   
    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    
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
    	      
        /* 고객문의_write -----------------*/
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
        
        .top {
        	padding-top: 80px;
        }
        /* 고객문의_write END ----------------------*/
        
        /* qna, review, 고객문의 공통 ----------------------------------*/
	
        section {
            margin-top: 70px;
        }

        .text-center .btn {
            float: right; /*우측정렬*/
            border: 0; /*보더스타일 해제*/
            border-radius: 0; /*윤곽0*/
            padding: 5px 10px; /*버튼의 크기를 조정, 페이지네이션에 맞춤*/
        }

        .titlebox {
            width: 250px;
            text-align: center;
            margin: 70px auto; /*가운데정렬*/
            height: 40px; /*세로정렬*/
            line-height: 40px; /*세로정렬*/
            border-top: 2px solid #ddd;
            border-bottom: 2px solid #ddd;
        }

        
        
        .board-title {
            width: 300px;
        }
        
        .table-bordered > thead > tr > th {
            background-color: #ccc; /*배경색*/
            color:#777; /*글씨색*/
        }
          
            .titlefoot{
            float:right;
        }

	/* qna, review, 고객문의 공통 END ----------------------------------*/
    
    </style>
</head>
<body>
<%@include file="../include/header.jsp" %>
            
    <section class="top">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    <div class="titlebox titlebox2">
                        <p>상품문의</p>
                    </div>
                    
                   <form action="registForm" method="post" name="regForm">
                    
                    
                    <!-- 
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
                     -->
                     
                     <table class="table">
                        <tbody class="t-control">
                        <tr class="reviewimg">
                             
                              <td class="t-title">
                              <div>
                                 <div class="middle" style="
	                              <c:if test='${qnaVO.q_fileloca eq null}'>display:none;</c:if>
	                              <c:if test='${qnaVO.q_fileloca != null}'>display:visible;</c:if>
                               ">
                                <!--<img width="500" src="../resources/img/d1.jpg"> -->
                                <img width="500" src="view?fileLoca=${qnaVO.q_fileloca }&fileName=${qnaVO.q_img_name}" alt="파일 불러오기 실패">
                      
                                </div>
                                </div>
                              </td>
                          </tr>
                        </tbody>
                    </table>
                     
                    <input type="hidden" name="uno" value="${sessionScope.uno }">
                    <input type="hidden"  class="form-control"id="qna_no" name="qna_no" value="${qnaVO.qna_no }">
                    
                    <table class="table">
                        <tbody class="t-control">
                         <tr>
                             <td class="t-title">Category</td>
                            <td>
								<div class="category_select" >
									<select disabled  class=" tune" id="category" name="category" style="width: 127px;">
										<option value="상품" ${qnaVO.b_history eq '상품' ? 'selected' : '' }>상품</option>
										<option value="배송" ${qnaVO.b_history eq '배송' ? 'selected' : '' }>배송</option>
										<option value="반품/환불" ${qnaVO.b_history eq '반품/환불' ? 'selected' : '' }>반품/환불</option>
										<option value="교환/변경" ${qnaVO.b_history eq '교환/변경' ? 'selected' : '' }>교환/변경</option>
										<option value="기타" ${qnaVO.b_history eq '기타' ? 'selected' : '' }>기타</option>
									
								
									</select>
								
								</div>
							</td>
                         </tr>
                          <tr>
                            <td class="t-title">UserId</td>
                            <td><input type="text" class="form-control" name="user_id" id="uno" value="${sessionScope.user_id }" readonly></td> <!-- value="${sessionScope.user_id}" readonly -->
                          </tr>
                          <tr>
                            <td class="t-title">REGDATE</td>
                            <td><input type="text" class="form-control" name="regdate" id="regdate" value="${qnaVO.regdate }" readonly></td> <!-- value="${sessionScope.user_id}" readonly -->
                          </tr>
                          <tr>
                            <td class="t-title">TITLE</td>
                            <td><input type="text" class="form-control" id="q_title" name="q_title" value="${qnaVO.q_title }" readonly></td>
                          </tr>
                          <tr>
                            <td class="t-title">CONTENT</td>
                            <td><textarea class="form-control" rows="7" name="q_content" id="q_content" readonly>${qnaVO.q_content }</textarea></td>
                          </tr>
                          
                        </tbody>
                      </table>
                     </form>
                      
                      <div class="titlefoot">
                          <button class="btn btn-default" id="qnaList">목록</button>
                          <button class="btn btn-default" id="qnaModify">수정</button>
                          <button class="btn btn-default" id="qnaDelete">삭제</button>
                      </div>
                      
                      
                </div>
            </div>
            
        </div>
        
        
    </section>

   	<script>
  		//목록이동
	    var qnaList = document.getElementById("qnaList");
	    qnaList.onclick = function() {
	    	var qno = location.search;
	    	qno = qno.substring(qno.lastIndexOf("=")+1);
	    	console.log(qno);
	    	$.getJSON(
	  			"../qna/getPno/"+qno+"/", // 요청보낼 주소
	  			function(data) { // 성공시 전달받을 익명함수
	  				location.href="../productList/productDetail?pno="+data.pno+"#qna-point";
	  			}
	  	    )
	    }
	    
	    var qnaModify = document.getElementById("qnaModify");
	    qnaModify.onclick = function() {
	    	location.href = "qnaModify?qna_no="+${qnaVO.qna_no};
	    }

	    var qnaDelete = document.getElementById("qnaDelete");
	    qnaDelete.onclick = function() {
	    	location.href = "qnaDelete?qna_no="+${qnaVO.qna_no};
	    }
	    console.log(${pageContext.request.contextPath });
	    
	    //$(document).ready(function() {
        //    $('select[id="category"]').find('option:contains("${qnaVO.b_history}")').attr("selected",true);
        //});


	    
	    
    </script>
<%@include file="../include/footer.jsp" %>
</body>
</html>