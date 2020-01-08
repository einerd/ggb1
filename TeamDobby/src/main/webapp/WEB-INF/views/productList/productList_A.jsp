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
    <title>상품리스트A</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    
    <style type="text/css">
        
        /* 모바일 환경에서 동작할 옵션들 */
        @media (max-width:767px) {
            /* 데스크탑 화면에서 보여지는 list 숨기기 */
            .productPART, .sellerPART {
                display: none;
            }
        }
        /* 데스크탑 환경에서 동작할 옵션들 */
        @media (min-width:768px) {
            /* 모바일 환경에서 보여지는 list 숨기기 */
            .infoSUMMARY-3 {
                display: none;
            }
        }
        
        /* 까만 막대에 있는 a태그는 색깔을 하얗게 */
        .infoSUMMARY-1 a,
        .infoSUMMARY-2 a {
            color: white;
        }
        
        /* 호버 옵션 */
        .infoSUMMARY-1 a:hover,
        .infoSUMMARY-2 a:hover {
            color: dodgerblue;
            text-decoration-line: none;
        }
        /*--------------------------------------------상품크게보기 리스트------*/
        /* 작게보기, 크게보기 버튼 - 작게보기 리스트에도 있음 */
        .searchInfoTab .btn {
            float: right;
        }
        /* (검색어)검색결과 공간 */
        .searchResult-Area {
            margin-top: 80px;
            margin-bottom: 10px;
        }
        
        /* 상품이미지를 감싸는 공간 */
        .imgTAB {
            padding: 20px;
            text-align: center;
            position: relative;
            background-color: white;
        }
        .imgTAB img {
        	width: 447px;
        	height: 298px;
        }
        
        /* 상품 설명을 담은 공간 */
        .productInfoTAB {
            padding: 15px 40px;
            background-color: white;
        }
        
        /* 상품 설명 공간 - 버튼 옵션 */ 
        .selectBTNS .btn {
            width: 50%;
            border-radius: 0;
            font-size: 20px;
        }
        
        /* 상품 이미지 위 아래로 걸쳐있는 검은색 막대 */
        .infoSUMMARY-1,
        .infoSUMMARY-2 {
            background-color: black;
            opacity: 0.7;
            height: 30px;
            line-height: 30px;
            font-size: 20px;
            position: absolute;
            width: 100%;
            z-index: 50;
            left: 0px;
            color: white;
        }
        .infoSUMMARY-2 {
            bottom: 20px;
        }
        
        /* 모바일 환경에서 보여질 가격 탭 (숨김 옵션중)*/
        .infoSUMMARY-3 {
            text-align: center;
            font-size: 25px;
            padding-bottom: 15px;
        }
        
        /* 상품명: */
        h4 .productNAME {
            width: 100%;
        }
        
        
        /* 개별 상품정보 밑 바텀 부여 */
        .content-TMP {
            margin-bottom: 20px;
        }
        
        /* 페이지네이션 중앙정렬 */
        .paging {
            text-align: center;
        }
        /*----------------------------------------------상품 크게보기 리스트 끝------*/
        
    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
   
   <section class="searchResult-Area">
       <div class="container">
           <div class="row">
               <div class="col-lg-12 searchInfoTab">
               	   <h3><b>카테고리:&nbsp;<span id="cateTAB"></span>&nbsp;&nbsp;${total }&nbsp;게시글</b></h3>
                   <c:if test="${sessionScope.searchName ne ''}">
                   <h3><b>[${sessionScope.searchName }]</b></h3>
                   <h4>위 단어로 검색한 결과입니다</h4>
                   </c:if>
                   <button type="button" class="btn btn-warning" id="small-see">작게보기</button>
               </div>
           </div>
       </div>
   </section>
   
   <section class="searchList-Area">
   <c:forEach var="vo" items="${list }">
       <div class="container">
           <div class="row content-TMP">
               <div class="col-lg-5 col-xs-12 imgTAB">
                   <div class="infoSUMMARY-1">
                       <a href="#"><span class="sellerNAME">${vo.seller_name }</span></a>
                   </div>
               <a href="#"><img src="${pageContext.request.contextPath }/${vo.p_uploadpath }/${vo.p_img_names}${vo.p_img_exts}"></a>
                   <div class="infoSUMMARY-2">
                       <a href="productDetail?pno=${vo.pno }"><span class="productNAME">${vo.p_name }</span></a>
                   </div>
               </div>
               <div class="col-lg-7 col-xs-12 productInfoTAB">
                   <div class="productPART">
                       <h2><b><i>상품명</i></b></h2>
                       <h4 class="productNAME"><a href="productDetail?pno=${vo.pno }">${vo.p_name }</a></h4><hr>
                   </div>
                   <div class="sellerPART">
                       <h4><b>판매자</b>: <a href="#"><span class="sellerNAME">${vo.seller_name }</span></a></h4>
                       <h4><b>가격</b>: <span class="productPRICE">${vo.p_price }</span><b>원</b></h4><hr>
                   </div>
                   <div class="infoSUMMARY-3">
                       <span class="productPRICE">${vo.p_price }원</span>
                   </div>
                   <div class="selectBTNS" id="selectBTNS">
                       <button type="button" class="btn btn-danger" onclick="location.href='insertCart?pno=${vo.pno }&stock=1&pageNum=${pageVO.pageNum }&mode=A'">장바구니</button>
                       <button type="button" class="btn btn-primary" onclick="location.href='productDetail?pno=${vo.pno }'">상세보기</button>
                   </div>
               </div>
           </div>
       </div>
	</c:forEach>
       
   </section>
   <section class="paging">
   <form action="productList_A" id="pageForm" name="pageForm">
       <ul class="pagination">
       <c:if test="${pageVO.prev }">
           <li><a href="${pageVO.startPage+1 }" onclick="page(${pageVO.startPage-1 })"><i class="glyphicon glyphicon-chevron-left"></i></a></li>
       </c:if>    
           <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
           		<li class="${pageVO.pageNum eq num? 'active': ''}"><a href="${num }" onclick="page(${num })">${num }</a></li>
           </c:forEach>
       <c:if test="${pageVO.next }">    
           <li><a href="${pageVO.endPage+1 }" onclick="page(${pageVO.endPage+1 })"><i class="glyphicon glyphicon-chevron-right"></i></a></li>
       </c:if>
       </ul>
       <input type="hidden" name="pageNum" id="pageNum" value="${pageVO.cri.pageNum }">
       <input type="hidden" name="amount" id="amount" value="${pageVO.cri.amount }">
       <input type="hidden" name="searchType" id="searchType" value="${pageVO.cri.searchType }">
       <input type="hidden" name="searchName" id="searchName" value="${pageVO.cri.searchName }">
       <input type="hidden" name="mode" id="mode" value="A">
   </form>
   </section>
  
<%@ include file="../include/footer.jsp" %>

<script>
     
	$(document).ready(function() {
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
		}
		var category = "";
		var tab = "${sessionScope.searchType}";
		if(tab == "animal") category = "동물";
		else if(tab == "artefact") category = "인공물";
		else if(tab == "") category = "전체상품";
		
		document.getElementById("cateTAB").innerHTML = category;
	}) 
     
     document.getElementById("small-see").onclick = function() {
         location.href="productList_B?pageNum=${pageVO.pageNum }&mode=A";
     }
     
  	// 검색처리(페이지 클릭시 폼 전송)
 	function page(num) {
 		event.preventDefault(); // 현재 실행되는 이벤트의 실행을 막는 방법.. 여기서는 a태그의 링크이동을 막기 위해서 설정함
 		// 페이지 폼의 pageNum값 변경
 		document.querySelector("#pageForm #pageNum").setAttribute("value", num);
 		document.getElementById("pageForm").submit(); // 페이지 폼 전송
 	}
 	
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