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
        
        
        /*review_list 별 END-------------------*/
    </style>
    
     
<script type='text/javascript'>
$(function(){
    $('.input-group.date').datepicker({
        calendarWeeks: false,
        todayHighlight: true,
        autoclose: true,
        format: "yyyy/mm/dd",
        language: "kr"
    });

});

;(function($){
    $.fn.datepicker.dates['kr'] = {
        days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
        daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
        daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
        months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    };
}(jQuery));
</script>

    <section class="top">
        <div class="container">
            <div class="row middle">
                <div class="col-xs-12 col-lg-9 board-table qnalist-wrap">
                    <div class="titlebox" id="titletitle">
                        <p>상품후기</p>                        
                    </div>
                    
                 <!-- ==============================-->
				<form id="dateSearchForm" name="dateSearchForm" method="post" action="productDetail?pno=${vo.pno }#review-point">
	                  <div class="date_check_box">
				
						<input type="hidden" name="pno" id="pno" value="${vo.pno }">
					 	<input type="hidden" id="startDate" name="startDate" value="">
						<input type="hidden" id="endDate" name="endDate" value="">
					
						<h3 style="padding-top:10px;"> 조회기간 </h3>
						<div class="date_check_list" data-target-name="rangDate[]">
						
                    
                        <ul class="searchDate">
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                                    <label for="dateType1">당일</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
                                    <label for="dateType3">1주</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
                                    <label for="dateType5">1개월</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
                                    <label for="dateType6">3개월</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
                                    <label for="dateType7">6개월</label>
                                </span>
                            </li>
                        </ul>
                        
                   
                
						</div>
						
						<!-- //date_check_list -->
						<div class="date_check_calendar" style="padding-top: 14px;">
	                        <input type="text" id="datepicker1" name="datepicker1">
	                        <span class="glyphicon glyphicon-calendar"></span></div> 
	                        <div class="date_check_calendar ">
	                        <p>~</p>
	                        </div>
	                       <input style="padding-top:10px;" type="text" id="datepicker2" name="datepicker2"><span style="padding-top:10px;" class="glyphicon glyphicon-calendar"></span></div> 
						</div>
						<!-- //date_check_calendar -->
	
						<button class="btn_date_check" id="calsearch" type="button"><em>조회</em></button>
				</div>
					</form>
                  <!-- ==============================-->
                  
                    <table class="table table-bordered reviewlist" >
                        <thead>
                            <tr>
                                <th class="starRevth">평점</th>
                                <th class="board-title">제목</th>
                                <th>작성자</th>
                                <th>등록일</th>
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
            </div>
        </div>       
        
    </section>
    
    <script>
  
    
    	var reviewRegist = document.getElementById("reviewRegist");
	   	reviewRegist.onclick = function() {
		   location.href="../review/reviewWrite?pno=${vo.pno }";
	   	}
	   	
	    window.onload = function() {
			
		    $(function(){
		        $("#datepicker2").datepicker({ dateFormat: 'yy-mm-dd' });
		        $("#datepicker1").datepicker({ dateFormat: 'yy-mm-dd' }).bind("change",function(){
		            var minValue = $(this).val();
		            minValue = $.datepicker.parseDate("yy-mm-dd", minValue);
		            minValue.setDate(minValue.getDate()+1);
		            $("#datepicker2").datepicker( "option", "minDate", minValue );
		        })
		});
		    
		    
		    
			var calsearch = document.getElementById("calsearch");
		    calsearch.onclick = function() {
		    			var pno = location.search;
		    	    	pno = pno.substring(pno.lastIndexOf("=")+1);
		    	    	
		    	    	$("#pno").val(pno);
		    	    	console.log(pno);
		    	    	console.log($("#pno").val());
		    	   
		    	    	//alert(document.getElementById("datepicker1").value);
		    	    	//alert(document.getElementById("datepicker2").value);
		    	    	
		    	    	document.getElementById("startDate").setAttribute("value", document.getElementById("datepicker1").value+" 00:00:00");
		    	    	document.getElementById("endDate").setAttribute("value", document.getElementById("datepicker2").value+" 23:59:59");
		    	    	
		    	    	
		    	    	//alert(document.getElementById("startDate").value);
		    	    	//alert(document.getElementById("endDate").value);
		    	    	
// 		    	    	document.getElementById("startDate").setDate((document.getElementById("startDate").value).getDate()+1)
// 		    	    	document.getElementById("endDate").setDate((document.getElementById("endDate").value).getDate()+1)
		    	    	
		    	    	
		    	    	//alert(document.getElementById("startDate").value);
		    	    	//alert(document.getElementById("endDate").value);
		    	    	console.log(document.getElementById("datepicker1").value);
		    	    	console.log(document.getElementById("datepicker2").value);
		    	    	//$("datepicker3").value("datepicker1".value());
		    	    	//$("datepicker4").value("datepicker2".value());
		    	    	console.log(document.getElementById("startDate").value)
		    	    	console.log(document.getElementById("endDate").value)
		     	    	$("#dateSearchForm").submit();

		    		}
		    	}
			
			//localhost:8181/test/productList/productDetailB?pno=27&startDate=2020-01-01 00:00:00&endDate=2020-01-08 00:00:00
		
					
		 function setSearchDate(start){

				var num = start.substring(0,1);
				var str = start.substring(1,2);

				var today = new Date();

				//var year = today.getFullYear();
				//var month = today.getMonth() + 1;
				//var day = today.getDate();
				
				var endDate = $.datepicker.formatDate('yy-mm-dd', today);
				$('#datepicker2').val(endDate);
				
				if(str == 'd'){
					today.setDate(today.getDate() - num);
				}else if (str == 'w'){
					today.setDate(today.getDate() - (num*7));
				}else if (str == 'm'){
					today.setMonth(today.getMonth() - num);
					today.setDate(today.getDate() + 1);
				}

				var startDate = $.datepicker.formatDate('yy-mm-dd', today);
				$('#datepicker1').val(startDate);
						
				// 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
				$("#datepicker2").datepicker( "option", "minDate", startDate );
				
				// 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
				$("#datepicker1").datepicker( "option", "maxDate", endDate );

			}
	    
	    
	    var qnaRegist = document.getElementById("qnaRegist");
	    qnaRegist.onclick = function() {
	    	location.href = "../qna/qnaRegist?pno=${vo.pno }";
	    }
	    
	    
	    
	    $(function() {
	        $("#datepicker1, #datepicker2").datepicker({
	            dateFormat: 'yy-mm-dd',
	            	autoclose : true,
	            	todayHighlight : true ,
	            	toggleActive : true,
	            	weekStart : 0 ,
	            	changeMonth: true,
	                changeYear: true,
	            	language : "ko"
	            	
	        });

	        $('#datepicker1').datepicker();
	        $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val());
	        $('#datepicker1').datepicker("option", "onClose", function ( selectedDate ) {
	            $("#datepicker2").datepicker( "option", "minDate", selectedDate );
	        });
	     
	        $('#datepicker2').datepicker();
	        $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
	        $('#datepicker2').datepicker("option", "onClose", function ( selectedDate ) {
	            $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
	        });
	        
	    });
	   
	    
	    $.datepicker.setDefaults({
	        showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	    });
	    
	    
	    $('#datepicker2').setDefaults({
	       maxDate: "0" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)    
	    });
	    
	    
	    </script>
    
