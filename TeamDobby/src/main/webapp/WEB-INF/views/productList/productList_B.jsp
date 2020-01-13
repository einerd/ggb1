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
    <title>상품리스트B</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    
    <style type="text/css">
        .cellSUMMARY-1 a {
            color: white;
        }

        .cellSUMMARY-1 a:hover {
            text-decoration-line: none;
            color: dodgerblue;
        }
        /*------------------------------------------상품 작게보기 리스트------------*/
        /* 작게보기, 크게보기 버튼 - 작게보기 리스트에도 있음 */
        .searchInfoTab .btn {
            float: right;
        }
        /* (검색어)검색결과 공간 */
        .searchResult-Area {
            margin-top: 80px;
            margin-bottom: 10px;
        }
        
        /* 이미지를 감싸는 공간 */
        .cell-imgTAB {
            text-align: center;
            position: relative;
        }
        .cell-imgTAB img {
        	height: 173px;
        }
        
        /* 개별상품 공간 밑 공간 부여 */
        .productCELL {
            margin-bottom: 30px;
            box-sizing: border-box;
        }
        /* (검색어)검색결과 공간 */
        .searchResult-Area {
            margin-top: 80px;
            margin-bottom: 10px;
        }
        /* 이미지에 걸쳐서 보여질 검은색 막대 */
        .cellSUMMARY-1,
        .cellSUMMARY-2 {
            position: absolute;
            z-index: 50;
            background-color: black;
            color: white;
            opacity: 0.7;
            width: 100%;
        }
        
        .cellSUMMARY-2 {
            bottom: 0;
        }
        
        /* 상품 설명 공간 */
        .cell-infoTAB {
            overflow: hidden;
            border-bottom: 15px;
            padding-left: 10px;
        }
        
        /* 상품 설명 텍스트 옵션 */
        .infoTAB-text {
            width: 70%;
            float: left;
        }
        
        /* 텍스트에 a링크 */
        .infoTAB-text a {
            color: black;
        }
        
        /* 텍스트 a링크 hover 옵션 */
        .infoTAB-text a:hover {
            text-decoration-line: none;
            color: dodgerblue;
        }
        
        /* 버튼 감싸는 공간 */
        .cellBtns {
            width: 30%;
            float: right;
        }
        
        /* 개별 버튼 옵션 */
        .cellBtns .btn {
            width: 100%;
            border-radius: 0;
        }
        
        /* 페이지네이션 중앙정렬 */
        .paging {
            text-align: center;
        }

        /*----------------------------------------------------상품작게보기리스트 끝*/
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
                    <button type="button" class="btn btn-warning" id="big-see">크게보기</button>
                </div>
            </div>
        </div>
    </section>

    <section class="contentBody">
        <div class="container">
            <div class="row">
            	<c:forEach var="vo" items="${list }">
                <div class="col-lg-3 col-xs-12 productCELL">
                    <div class="tmptmptmptmp">
                        <div class="cell-imgTAB">
                            <div class="cellSUMMARY-1">
                                <a href="#"><span class="sellerINFO">${vo.seller_name }</span></a>
                            </div>
                            <a href="#"><img src="${pageContext.request.contextPath }/${vo.p_uploadpath }/${vo.p_img_names}${vo.p_img_exts}"></a>
                            <div class="cellSUMMARY-2">
                                <span class="sellerINFO">${vo.p_price }</span>&nbsp;<b>원</b>
                            </div>
                        </div>
                        <div class="cell-infoTAB">
                            <div class="infoTAB-text">
                                <h4><i><b>상품명</b></i></h4>
                                <h5><a href="productDetail?pno=${vo.pno }">${vo.p_name }</a></h5>
                            </div>
                            <div class="cellBtns">
                                <button type="button" class="btn btn-primary" id="see-detail" onclick="location.href='productDetail?pno=${vo.pno }'"><i class="glyphicon glyphicon-search"></i></button>
                                <button type="button" class="btn btn-danger" id="incart" onclick="location.href='insertCart?pno=${vo.pno }&stock=1&pageNum=${pageVO.pageNum }&mode=B'"><i class="glyphicon glyphicon-shopping-cart"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>

    </section>

    <section class="paging">
        <form action="productList_B" id="pageForm" name="pageForm">
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
       <input type="hidden" name="mode" id="mode" value="B">
   </form>
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
		
		var category = "";
		var tab = "${sessionScope.searchType}";
		if(tab == "animal") category = "동물";
		else if(tab == "artefact") category = "인공물";
		else if(tab == "") category = "전체상품";
		
		document.getElementById("cateTAB").innerHTML = category;
	}) 

    document.getElementById("big-see").onclick = function() {
		location.href="productList_A?pageNum=${pageVO.pageNum }&mode=B";
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