<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>구매내역</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    
    <style type="text/css">
        
        /* 모바일 환경에서 동작할 옵션들 */
        @media (max-width:767px) {
            /* 이미지 크기 고정 */
            .TAB-img {
                width: 30%;
            }
            
            /* 판매자 정보 위치 높이 고정 */
            .TAB-status {
                overflow: hidden;
                height: 85px;
            }
            
            /* 판매자 정보 왼쪽 쌓기 */
            .TAB-status .seller-status {
                float: left;
            }
            
            /* 주문 현황 오른쪽 쌓기 */
            .TAB-status .result-status {
                float: right;
            }
            
            /* 주문 현황 텍스트 위치 조정 */
            .status-DETAIL {
                padding-left: 60px;
            }
            
            .purchaseDATE {
            	
            }
        }
        
        /*-------------------------------------------구매내역 리스트----------------- */
        /* 버튼 옆에 공간 */    
        .btns3 {
            margin-right: 20px;
        }

        /* [이름]님의 구매내역 공간 텍스트 조정 및 위치 조정 */
        .info-Area {
            margin-top: 80px;
            margin-bottom: 10px;
            text-align: center;
        }
        
        /* 달력 위치할 공간 */
        .inner-bar {
            background-color: dimgray;
            margin: 0 auto;
            width: 60%;
            padding: 10px 20px;
        }
        
        /* 구매내역 공간 */
        .list-MAIN {
            padding: 10px 20px;
            overflow: hidden;
            margin-bottom: 10px;
            background-color: white;
            box-sizing: border-box;
        }
        
        /* 상품 이미지를 담을 공간 */
        .TAB-img {
            float: left;
            padding: 0;
        }
        
        /* 상품이미지 크기 고정 */
        .TAB-img img {
            width: 150px;
            height: 150px;
        }
        
        /* 상품이미지 바로 오른쪽에 놓이는 상품명 공간 */
        .TAB-info {
            float: left;
        }
        
        /* 제일 오른쪽에 위치하는 판매자 및 주문현황 공간 */
        .TAB-status {
            float: right;
            text-align: center;
        }
        
        /* 주문현황 텍스트 색깔 변경 (결제 및 배송 완료) */
        .status-DETAIL {
            color: dodgerblue;
        }
        
        /* 백그라운드 공간지정 */
        .content-AREA {
            padding-top: 10px;
        }
        .purchaseDATE {
        	font-size: 20px;
        }
        /* 페이지네이션 중앙정렬 */
        .paging {
            text-align: center;
        }
        /*------------------------------------------------구매내역 리스트 끝--------*/
        
        
    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
    
    <section class="info-Area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3><b>[<span class="user-ID">${sessionScope.user_name }</span>]님의 구매내역</b></h3>
                    <hr>
                    <h4><i><span class="last-totalCNT">${total }</span></i>&nbsp;&nbsp;건의 내역이 존재합니다</h4>
                </div>
            </div>
        </div>
    </section>
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 cal-bar">
                    <div class="inner-bar"></div>
                </div>
            </div>
        </div>
    </section>    
            
    <section class="content-AREA">
           <div class="container">
               <c:forEach var="vo" items="${list }">
               <div class="row content-AREA">
                    <div class="list-MAIN">
                        <div class="col-lg-2 col-xs-4 TAB-img">
                            <a href="#"><img src="${pageContext.request.contextPath }/${vo.p_uploadpath }/${vo.p_img_names}${vo.p_img_exts}"></a>
                        </div>
                        <div class="col-lg-7 col-xs-8 TAB-info">
                            <h3><b><i>상품명</i><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;<span class="purchaseDATE"><fmt:formatDate value="${vo.p_regdate }" pattern="yyyy-MM-dd"/></span>&nbsp;)</b></h3>
                            <h4><a href="productDetail?pno=${vo.pno }">&nbsp;<b><span class="productNAME">${vo.p_name }</span></b></a>
                            &nbsp;(&nbsp;${vo.p_b_quantity }&nbsp;EA&nbsp;)</h4>
                            <h4><b><i>가격</i></b></h4>
                            <h4>&nbsp;<b><span class="productPRICE">${vo.p_price }</span>원&nbsp;(&nbsp;${vo.p_price * vo.p_b_quantity }&nbsp;원&nbsp;)</b></h4>
                        </div>
                        <div class="col-lg-3 col-xs-12 TAB-status">
                           <div class="seller-status">
                                <h3><b><i>판매자</i></b></h3>
                                <h4><a href="#"><b><span class="name">${vo.seller_name }</span></b></a></h4>
                           </div>
                           <div class="result-status">
                            <h3><b><span class="status-DETAIL">결제 완료</span></b></h3>                           </div>
                        </div>
                    </div>
               </div>
               </c:forEach>
           </div>
    </section>
    <section class="paging">
                        <ul class="pagination pagination-sm">
                          <!--이전 button  --> 
                          <c:if test = "${pageVO.prev }" >
                          	<li><a href="../productList/purchaseHistory?pageNum=${pageVO.startPage-1 }">${num }">이전</a></li>
                          </c:if>
                          
                          <!-- pageNum -->
                          <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
                          	<li class="${pageVO.pageNum == num ? 'active' : '' }"><a href="../productList/purchaseHistory?pageNum=${num }">${num }</a></li>
                          </c:forEach>
                          
                          <!-- 다음 button -->
                          <c:if test = "${pageVO.next }">
                          	<li><a href="../productList/purchaseHistory?pageNum=${pageVO.endPage+1 }">${num }">다음</a></li>
                          </c:if>
                        </ul>
                    </section>
    
<%@ include file="../include/footer.jsp" %>
<script>
	$(document).ready(function() {
		// 뒤로가기 실행후에 앞으로가기 했을 때, 저장된 기록이 공백이라면 함수 종료
		if(history.state == '') return;
		
		var msg = '${msg}';
		if(msg != '') { // 값이 없을 때는 ''로 감싸서 공백문자열로 완성되도록 해준다
			alert(msg);
			history.replaceState('', null, null); // 현재 히스토리 기록을 변경
		}
	})
	
	// 사용 보류 가격 , 찍는 함수
	function number_format(str) {
	    str = str + "";
	    if(str == "" || /[^0-9,]/.test(str)) return str;
	    str = str.replace(/,/g, "");
	    for(var i=0; i<parseInt(str.length/3, 10); i++) {
	        str = str.replace(/([0-9])([0-9]{3})(,|$)/, "$1,$2$3");
	    }
	    return str;
	}       

</script>
</body>
</html>