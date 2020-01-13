<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

    <style type="text/css">
        
        
        /* 날짜(캘린더) 솔팅 */
        .qnalist-wrap{
            margin: 0 auto;
            float: none;
        }
        
        
        .titlebox {
           padding-bottom: 40px;
        }
        
        .pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
            z-index: 2;
            color: #fff;
            cursor: default;
            background-color: darkgray;
            border-color: gray;
        }
        
         .pagination>li>a, .pagination>li>span {
            position: relative;
            float: left;
            padding: 6px 12px;
            margin-left: -1px;
            line-height: 1.42857143;
            color: black;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd;
        }
    

        
        /* 1:1 문의 조회기간 영역 */
        .date_check_box{
		margin:0 0 10px 0;
		padding:10px 20px 10px 30px;
		border:3px solid #eeeeee;
	}
        .date_check_box:after{
		display:block; 
		clear:both; 
		content:"";
	}
        .date_check_box h3{
		float:left;
		padding:0px 15px 0 0; 
		color:#777777; 
		font-size:13px;
	}
        .date_check_list{
		float:left;
	}
        .date_check_list button{
		float:left;
		width:54px; 
		height:31px; 
		margin:0 0 0 -1px; 
		color:#777777; 
		font-size:12px; 
		border:1px solid #d6d6d6;
	}
        .date_check_list button:hover,
        .date_check_list button.on{
		color:#ffffff; 
		background:#aeaeae;
	}
        .date_check_calendar{
		position:relative; 
		float:left; 
		margin:0 10px 0 10px;
	}
        .date_check_calendar .anniversary{
		background:url('../img/icon_calendar.png') no-repeat right center;
        }
        
        .date_check_box .date_check_list{
            padding:11px 0px 10px;
            
        }
        
        .date_check_box .anniversary{
            width:140px;
            text-align: center;
            vertical-align: middle;
        }
        
        
        .date_check_box .date_check_calendar{
            float: left;
            padding: 8px 0px 0px;
        }
        
        .date_check_box .date_check_calendar div{
          float: left;
        }
        
        .date_check_box .input-group-addon{
            padding-left:0px;
            border: none;
        }
        
        /* 1:1 문의 조회버튼 */
        .btn_date_check{display:inline-block; float: right; min-width:70px; height:31px; color:#ffffff; font-weight:bold; border:1px solid #5bc0de; background:#5bc0de; text-align:center;}
        .btn_date_check em{
            background-image:url("../../img/common/btn/btn_goods_search.png");
            background-position:right 3px;
            background-repeat:no-repeat;}
        
        /* 조회버튼 위치 */
        .btn_date_check{
            margin-top:10px;
        }
        
        /* 날짜(캘린더) 솔팅 END---------------------------*/
        
        
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

        /*review_list 별------------------------*/
        
        
        .reviewlist .starR{
          background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
          background-size: auto 70%;
          width: 21px;
          height: 30px;
          display: inline-block;
          text-indent: -9999px;
          cursor: pointer;
          margin-top:5px;
        }
        
        .reviewlist .starR.on{
            background-position:0 0;
        
        }

        .reviewlist .starRevth{
            width: 150px;
        }
        
        .reviewlist .startd{
            width: inherit;
            vertical-align: middle;
            text-align: center;
        }
        
        .reviewlist.table>tbody>tr>td{
            vertical-align: middle;
        }
        .top {
        	padding-top: 80px; 
        } 
        
        .reviewlist th,
        .reviewlist td {
        	text-align: center;
        	
        }
        
        
        @media (max-width:767px) {
			.reviewlist .starRevth,
			.reviewlist .date-title  {
			    width: 30%;
			}

			.reviewlist .board-title,
			.reviewlist .user-title {
				width: 20%;
			}
			
			.reviewlist td,
			.reviewlist th{
				text-align: center;
			}
		}
        
        
        /*review_list 별 END-------------------*/
    </style>
    
     


    <section class="top">
        <div class="container">
            <div class="row middle">
                <div class="col-xs-12 col-lg-9 board-table qnalist-wrap">
                    <div class="titlebox" id="titletitle">
                        <p>상품후기</p>                        
                    </div>
				</div>
				</div>
					
                  <!-- ==============================-->
                  
                    <table class="table table-bordered reviewlist" >
                        <thead>
                            <tr>
                                <th class="starRevth">평점</th>
                                <th class="board-title">제목</th>
                                <th class="user-title">작성자</th>
                                <th class="date-title">등록일</th>
                            </tr>
                        </thead>
                        <c:forEach var="vo" items="${review }">
                        <tbody>
                            <tr>
                                <td class="startd">
                                <div class="starRev">
                                <c:forEach var="i" begin="1" end="5">
                                 	<c:choose>  	
                                		<c:when test="${i <= vo.starCount }">
                                			<span class="starR on">★</span>
                                		</c:when>
                                		<c:otherwise>
                                			<span class="starR">☆</span>
                                		</c:otherwise>
	                                </c:choose>
                                </c:forEach>
                                 
                                </div>
                              </td>
                                <td><a href="../review/reviewDetail?review_no=${vo.review_no }">${vo.r_title }</a></td>
                                <td>${vo.user_id }</td>
                                <td>
                                	<fmt:formatDate value="${vo.regdate }" pattern="yyyy년MM월dd일"/>
                                </td>
                            </tr>
                        </tbody>
                        </c:forEach>
                    </table>
                    
                    <!-- 페이징 -->
                    <div class="text-center">
                        <ul class="pagination pagination-sm">
                          <!--이전 button  --> 
                          <c:if test = "${pageVO1.prev }" >
                          	<li><a href="../productList/productDetail?pageNum=${pageVO1.startPage-1 }&pno=${vo.pno }&path=review#review-point">${num }">이전</a></li>
                          </c:if>
                          
                          <!-- pageNum -->
                          <c:forEach var="num" begin="${pageVO1.startPage }" end="${pageVO1.endPage }">
                          	<li class="${pageVO1.pageNum == num ? 'active' : '' }"><a href="../productList/productDetail?pageNum=${num }&pno=${vo.pno }&path=review#review-point">${num }</a></li>
                          </c:forEach>
                          
                          <!-- 다음 button -->
                          <c:if test = "${pageVO1.next }">
                          	<li><a href="../productList/productDetail?pageNum=${pageVO1.endPage+1 }&pno=${vo.pno }&path=review#review-point">${num }">다음</a></li>
                          </c:if>
                        </ul>
                        <button class="btn btn-info" id="reviewRegist">등록</button>
                    </div>
                    
                </div>
        
    </section>
    
    <script>
  
    
    	var reviewRegist = document.getElementById("reviewRegist");
	   	reviewRegist.onclick = function() {
		   location.href="../review/reviewWrite?pno=${vo.pno }";
	   	}
	   	
	   
	    
	    </script>
    
