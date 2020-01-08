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
        
        .top {
        	padding-top: 80px;
        }
        
        /* 날짜(캘린더) 솔팅 END---------------------------*/
        
        
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

   <!-- 
   <script type="text/javascript">
	    $(document).ready(function () {
	            $.datepicker.setDefaults($.datepicker.regional['ko']); 
	            $( "#startDate" ).datepicker({
	                 changeMonth: true, 
	                 changeYear: true,
	                 nextText: '다음 달',
	                 prevText: '이전 달', 
	                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 dateFormat: "yymmdd",
	                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	                 onClose: function( selectedDate ) {    
	                      //시작일(startDate) datepicker가 닫힐때
	                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                     $("#endDate").datepicker( "option", "minDate", selectedDate );
	                 }    
	 
	            });
	            $( "#endDate" ).datepicker({
	                 changeMonth: true, 
	                 changeYear: true,
	                 nextText: '다음 달',
	                 prevText: '이전 달', 
	                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 dateFormat: "yymmdd",
	                 maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	                 onClose: function( selectedDate ) {    
	                     // 종료일(endDate) datepicker가 닫힐때
	                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
	                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
	                 }    
	 
	            });    
	    });
	</script>
 -->
      
	    <section class="top">
	        <div class="container">
	            <div class="row middle">
	                <div class="col-xs-12 col-lg-9 board-table qnalist-wrap">
	                    <div class="titlebox">
	                        <p>상품문의</p>                        
	                    </div>
	                    
	                 <!-- ==============================-->
	                  <div class="date_check_box">
					<form name="dateSearch" method="get" action="searchForm">
						<input type="hidden" name="pno" value="">
						<input type="hidden" name="uno" value="">
					<!-- 
						<input type="hidden" name="memNo" value="">
						<input type="hidden" name="noheader" value="">
					 -->
						<h3> 조회기간 </h3>
						<div class="date_check_list" data-target-name="rangDate[]">
							<button type="button" data-value="0" class="on">오늘</button>
							<button type="button" data-value="7">7일</button>
							<button type="button" data-value="30">1개월</button>
							<button type="button" data-value="90">3개월</button>
							<button type="button" data-value="365">1년</button>
						</div>
						<!-- //date_check_list -->
						<div class="date_check_calendar">
						    <div class="input-group date startDate datepicker">
	                        <input type="text" id="startDate" name="startDate" class="anniversary js_datepicker input-group-addon" value=""></div> 
	                        <div class="date_check_calendar">
	                        <p>~</p>
	                        </div>
	                        <div class="input-group date endDate datepicker">
	                        <input type="text" id="endDate" name="endDate" class="anniversary js_datepicker  input-group-addon" value=""></div>
						</div>
						<!-- //date_check_calendar -->
	
						<button type="submit" class="btn_date_check" id="calsearch"><em>조회</em></button>
					</form>
				</div>
				<!-- 검색 클릭시 pageNum을 1부터 시작하게 처리 -->
				<input type="hidden" name="pageNum" value="1">
				<input type="hidden" name="amount" value="${pageVO.cri.amount }">
	                  <!-- ==============================-->
	                  
	                     
	                    <table class="table table-bordered">
	                    
	                        <thead>
	                            <tr>
	                                <th>번호</th>
	                                <th class="board-title">제목</th>
	                                <th>작성자</th>
	                                <th>등록일</th>
	                            </tr>
	                        </thead>
	                        <c:forEach var="vo" items="${QnaList }">
	                        <tbody>
	                            <tr>
	                                <td>${vo.qna_no }</td>
	                                <td><a href="../qna/qnaDetail?qna_no=${vo.qna_no }">${vo.q_title }</a></td>
	                                <td>${vo.user_id }</td>
                                	<td>
                                      <fmt:formatDate value="${vo.regdate }" pattern="yyyy년MM월dd일 "/>
                                   </td>
	                                
	                            </tr>
	                        </tbody>
	                    </c:forEach>
	                    
	                    </table>
	      
	                     
	                    <div class="text-center">
	                        <ul class="pagination pagination-sm">
	                          <!-- 3.이전버튼 활성화 여부 -->
	                        <c:if test="${pageVO.prev }">
	                        	<li><a href="freeList?pageNum=${pageVO.startPage-1 }">이전</a></li>
	                        </c:if>
	                        <!-- 1.pageNum처리 -->
	                        <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
	                        	<li  class="${pageVO.pageNum == num ? 'active': '' }"><a href="qnaList?pageNum=${num }">${num }</a></li>
	                        </c:forEach>
	                        <!-- 2.다음버튼 활성화여부 -->
	                        <c:if test="${pageVO.next }">
	                        	<li><a href="freeList?pageNum=${pageVO.endPage+1 }">다음</a></li>
	                        </c:if>
	                        </ul>
	                        <button class="btn btn-info" id="qnaRegist">등록</button>
	                    </div>
	                    
	                </div>
	            </div>
	        </div>       
	        
	    </section>
	    
	    
	    <script>
	    window.onload = function() {
			
			//뒤로가기 실행후에 앞으로가기 했을때 변경된 기록 공백이라면 함수 종료
			if(history.state == '') {
				return;
			}
					
			var msg = '${msg}';
			if(msg != '') {
				alert(msg);
				history.replaceState('', null, null); //현재 히스토리 기록을 변경
			}
		}
	    
	    
	    var qnaRegist = document.getElementById("qnaRegist");
	    qnaRegist.onclick = function() {
	    	location.href = "../qna/qnaRegist?pno=${vo.pno }";
	    }
	    
	    
	    /* var calsearch = document.getElementById("calsearch");
	    calsearch.onclick = function() {
    		
    		if(document.dateSearch.rangDate1.value == '' ) {
    			alert("날짜를 입력해주세요");
    			document.regForm.rangDate1.focus();
    			return; //함수 종료
    		} else if(document.dateSearch.rangDate2.value == '') {
    			alert("날짜를 입력해주세요");
    			document.regForm.rangDate2.focus();
    			return;
    		} else {
    			document.dateSearch.submit(); //폼의 서브밋기능
    		}
    	} */
    	
	    
	    
	    </script>
