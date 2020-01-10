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
    <title>장바구니</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    
    <style type="text/css">
        
        /*----------------------------------------------------------------*/
        /* 모바일 환경에서 동작할 옵션들 */
        @media(max-width:767px) {
            /* 데스크탑 화면에서 보여질 상품이미지+상품설명, 최종결제탭 지우기 */
            .cartlist-left,
            .cartlist-right {
                display: none;
            }
            
            /* 모바일 화면에서 사용할 (회원명 장바구니) + n개품목 탭 마진부여 */
            .mycart-Info {
                margin-top: 200px;
            }
        }
        
        /* 데스크탑 환경에서 동작할 옵션들 */
        @media(min-width:768px) {
            /* 모바일 환경에서 보여질 결제탭, 상품탭 지우기 */
            .content-B,
            .content-C {
                display: none;
            }
            
            /* 데스크탑 화면에서 사용할 (회원명 장바구니) + n개품목 탭 마진부여 */
            .mycart-Info {
                margin-top: 80px;
            }
        }
        /*--------------------------장바구니 리스트---------------------------------*/
        
        /* (회원명 장바구니) + n개품목 탭 텍스트정렬 + 위치조정 */
        .mycart-Info {
            text-align: center;
            padding-top: 50px;
            margin-bottom: 20px;
        }
        
        /* (상품이미지 + 상품설명) 왼쪽 칸 옵션 */
        .cartlist-left {
            overflow: hidden;
            padding: 20px 20px;

        }
        
        /* (최종 결제탭) 오른쪽 칸 옵션 + fixed 위한 기준점 */
        .cartlist-right {
            padding: 0 20px;
            padding-bottom: 20px;
            float: right;
        }
        
        /* 상품 이미지를 감싸는 div영역 스타일 */
        .productIMG-TAB {
            width: 40%;
            float: left;
            background-color: white;
        }
        
        /* 상품설명 탭 크기 및 디자인 옵션 */
        .productINFO-TAB {
            width: 55%;
            float: right;
            padding: 0px 10px;
            background-color: white;
        }

        /* X 아이콘 색깔 */
        .glyphicon-remove {
            color: red;
        }
        
        /* X 아이콘 호버 색깔 */
        .glyphicon-remove:hover {
            color: darkred;
        }
        
        /* 버튼 오른쪽 정렬 */
        .productINFO-TAB .btn {
            float: right;
        }
        
        /* a태그 까만색깔 */
        .productINFO-TAB a,
        .content-C a {
            color: black;
        }
        
        /* a태그 호버색깔 */
        .productINFO-TAB a:hover,
        .content-C a:hover {
            color: dodgerblue;
            text-decoration-line: none;
        }
        
        /* 버튼 간격위한 하얀 테두리 */
        .productINFO-TAB .btn {
            border: 1px solid;
        }
        
        /* 상품이미지로 사용할 img 크기 옵션 */
        .productIMG img {
            width: 100%;
            height: auto;
        }
        
        /* 상품이미지 아래에 위치한 총 가격 탭 */
        .PRICETAB {
            height: 100px;
            line-height: 100px;
            text-align: center;
        }
        
        /* 최종결제탭 상세 옵션 -   cart-right연동 */
        .right-outer {
            padding: 10px;
            position: fixed;
        }
        
        /* 상품결제 탭 아래 [전체합계] 중앙정렬 */
        .total-INFO {
            text-align: center;
        }
        
        /* 상품결제 탭 맨 아래에 전체금액: 영역 */
        .TABTAB {
            overflow: hidden;
        }
        
        /* 상품결제 탭 맨 아래에 전체금액: -> 전체금액: */
        .TABTAB .finalPRICETAG {
            float: left;
            width: 50%;
        }
        
        /* 상품결제 탭 맨 아래에 전체금액: -> 최종가격 */
        .TABTAB .finalPRICE {
            float: right;
            float: 50%;
        }
        
        /* 결제하기 버튼 */
        .right-outer .btn-primary {
            border-radius: 0;
        }
        
        
        /* 모바일 화면에서 보여질 최종결제 탭 */
        .content-B {
            padding: 20px;
            position: fixed;
            z-index: 50;
            background-color: #c4dff6;
            top: 70px
        }
        
        /* 모바일-최종결제: 디자인 */
        .content-B .B-inner {
            overflow: hidden;
            background-color: white;
        }
        
        /* 모바일-최종결제: 배송비 등 텍스트 영역  */
        .B-inner-left {
            float: left;
            width: 70%;
        }
        
        /* 모바일-최종결제: 버튼영역 */
        .B-inner-right {
            float: right;
            width: 30%;
        }
        
        /* 모바일-최종결제-버튼영역: 버튼옵션 */
        .B-inner-right .btn {
            width: 100%;
            border-radius: 0;
            margin-top: 0;
        }
        
        /* 모바일-최종결제: 총 결제금액 텍스트영역 */
        .B-inner-bottom1 {
            width: 50%;
            float: left;
        }
        
        /* 모바일-최종결제: ~~~원 영역 */
        .B-inner-bottom2 {
            width: 50%;
            float: right;
        }
        
        /* 모바일:개별상품영역 디자인 */
        .content-C {
            padding: 10px 15px;
            margin-bottom: 10px;
        }
        
        /* 모바일:개별상품영역 - 상자쌓기옵션 */
        .content-C .C-inner {
            overflow: hidden;
            z-index: 20;
        }
        
        /* 모바일:개별상품영역 img 영역 */
        .c-inner-left {
            width: 60%;
            float: left;
            padding: 5px;
        }
        
        /* 모바일:개별상품영역 주문옵션 영역 (버튼+수량) */
        .c-inner-right {
            float: right;
            width: 40%;
            padding: 5px;
            text-align: center;
            height: 152px;
        }
        
        /* 모바일:개별상품영역: 버튼 옵션 */
        .c-inner-right .btn {
            border: 1px solid;
        }
        
        /* 모바일:개별상품영역: 최종 가격 위치조정 */
        .c-inner-right h3 {
            margin: 10px 0;
        }
        
        
        /* 모바일:개별상품영역 이미지 크기 */
        .c-inner-left-imgTAB img {
            width: 200px;
            height: 100px
        }
        
        /* 모바일:개별상품영역 - 아래 낱개 가격 */
        .tmpmp {
            text-align: right;
        }
        
        /* 모바일:개별상품영역 - 버튼 높이 강제고정 */
        .c-inner-right-btns {
            height: 40px;
        }
        
        /* 모바일:개별상품영역 - 버튼 넓이 강제고정 */
        .c-inner-right-btns .btn {
            width: 50%;
        }
        
        /* 모바일:개별상품영역: 최종가격 윗칸 border 추가 */
        .tmpmpmp {
            border-top: 1px solid;
        }

        /* 상품개별 테두리 색깔 */
        .content-C {
            background-color: darkgray;
        }
        
        /* 상품개별 테두리 안쪽 배경색 */
        .content-C .C-inner {
            background-color: white;
        }
        /*----------------------------------장바구니 리스트 끝 ------------------------*/

        
        
    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

    <section class="mycart-Info">
        <div class="container">
            <div class="row">
               <div class="col-xs-12 content-B">
                    <div class="B-inner">
                        <div class="B-inner-left">
                            <br>
                            <b>결제건수:&nbsp;&nbsp;<span class="totalCNT"></span>&nbsp;건</b><br>
                            <b>상품금액:&nbsp;&nbsp;<span class="totalPRICE"></span>&nbsp;원</b><br>
                            <b>할인:&nbsp;&nbsp;-&nbsp;<span class="transferFEE">2500</span>&nbsp;원</b>
                        </div>
                        <div class="B-inner-right">
                            <button type="button" class="btn btn-primary">결제하기</button>
                        </div>
                        <div class="B-inner-bottom1">
                            <h3>총 결제금액:</h3>
                        </div>
                        <div class="B-inner-bottom2">
                            <h3><span class="finalObjectPRICE"></span>원</h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <h3><b>[<span class="user-ID">${sessionScope.user_name }</span>]님의 장바구니</b></h3>
                    <hr>
                    <h4><i><span class="mycartCNT">${total }</span></i>&nbsp;&nbsp;개의 품목이 존재합니다</h4>
                </div>
                
            </div>
        </div>
    </section>
    <section class="bodyContent">
        <div class="container">
            <div class="row list-content">
                <div class="col-lg-4 cartlist-right">
                    <div class="right-outer">
                        <div class="total-INFO"><h1><b>전체합계</b></h1></div>
                        <div class="total-INFO-CONTENT">
                            <hr>
                            <h4><b>결제건수:&nbsp;&nbsp;<span class="totalCNT"></span>&nbsp;건</b></h4>
                            <h4><b>상품금액:&nbsp;&nbsp;<span class="totalPRICE"></span>&nbsp;원</b></h4>
                            <h4><b>할인:&nbsp;&nbsp;-&nbsp;<span class="transferFEE">2500</span>&nbsp;원</b></h4>
                            <hr>
                            <div class="TABTAB">
                                <div class="finalPRICETAG">
                                    <h2><b>전체금액:</b></h2>
                                </div>
                                <div class="finalPRICE">
                                <h2><b><span class="truePRICE"></span>원</b></h2>
                                </div>
                                <button type="button" class="btn btn-primary btn-block">결제하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <c:forEach var="vo" items="${list }" varStatus="i">
                <div class="col-lg-8 cartlist-left">
                    <div class="productIMG-TAB">
                        <a href="#"><img src="${pageContext.request.contextPath }/${vo.p_uploadpath }/${vo.p_img_names}${vo.p_img_exts}"></a>
                        <div class="PRICETAB">
                            <h4><b><i>총 가격</i></b></h4>
                            <h2><span class="priceSUM" id="${vo.p_price }" value="key=${i.count }">
                            ${vo.p_price * vo.p_b_quantity}
                            </span><b>&nbsp;원</b></h2>
                        </div>
                    </div>
                    <div class="productINFO-TAB" value="${vo.pno }">
                        <h2><b><i>상품명</i></b>&nbsp;&nbsp;<a href="delInBasketList?pno=${vo.pno }" onclick="return confirm('장바구니에서 삭제하시겠습니까?')"><i class="glyphicon glyphicon-remove" value="${vo.pno }"></i></a></h2>
                        <h4 class="producINFO-NAME"><a href="productDetail?pno=${vo.pno }">${vo.p_name }</a></h4>
                        <hr>
                        <h4><b><i>판매자 연락처</i>&nbsp;&nbsp;-&nbsp;&nbsp;<a href="#"><span class="panNAME">${vo.seller_name }</span></a></b></h4>
                        <h4 class="productINFO-PHONE">${vo.s_phone_1 } - ${vo.s_phone_2 }</h4>
                        <h4><b><i>수량:&nbsp;&nbsp;</i></b><span class="productINFO-CNT" value="key=${i.count }">${vo.p_b_quantity }</span><b><i>&nbsp;EA</i></b>
                        <button type="button" value="key=${i.count }" class="btn btn-warning"><i class="glyphicon glyphicon-minus"></i></button>
                        <button type="button" value="key=${i.count }" class="btn btn-info"><i class="glyphicon glyphicon-plus"></i></button></h4>
                        <h4><b><i>개당:&nbsp;&nbsp;</i></b><span class="productINFO-PRICE" value="key=${i.count }">${vo.p_price }</span><b><i>&nbsp;원</i></b></h4><hr>
                        <h4><b><i>상세설명</i></b></h4>
                        <h4><b class="productINFO-DETAIL">${vo.p_detail }</b></h4>
                    </div>
                </div>
                
                
                <div class="col-xs-12 content-C">
                    <div class="C-inner">
                        <div class="c-inner-left">
                            <div class="c-inner-left-imgTAB">
                               <a href="#"><span class="seller-name">${vo.seller_name }</span></a>
                               &nbsp;&nbsp;<a href="delInBasketList?pno=${vo.pno }" onclick="return confirm('장바구니에서 삭제하시겠습니까?')"><i class="glyphicon glyphicon-remove" value="${vo.pno }"></i></a>
                                <a href="#"><img src="${pageContext.request.contextPath }/${vo.p_uploadpath }/${vo.p_img_names}${vo.p_img_exts}"></a>
                                <div class="tmpmp">
                                <span class="trueObjectPRICE">${vo.p_price }</span>&nbsp;<b>원</b>
                                </div>
                            </div>
                        </div>
                        <div class="c-inner-right">
                            <div class="c-inner-right-btns">
                            <button type="button" value="key=${i.count }" class="btn btn-info"><i class="glyphicon glyphicon-plus"></i></button>
                            <button type="button" value="key=${i.count }" class="btn btn-warning"><i class="glyphicon glyphicon-minus"></i></button>
                            </div>
                            <h4><b>수량:&nbsp;</b>&nbsp;&nbsp;<b><span class="objectCNT" value="key=${i.count }">${vo.p_b_quantity }</span>&nbsp;EA</b></h4>
                              <a href="#"><span class="name">${vo.p_name }</span></a>
                               <div class="tmpmpmp">
                                <h3><b><span class="objectPRICE" id="${vo.p_price }" value="key=${i.count }">${vo.p_price * vo.p_b_quantity}</span>&nbsp;원</b></h3>
                                </div>
                        </div>
                    </div>
                </div>
	                <script>
	                	$(".totalCNT").html(${i.count });
	                </script>
				</c:forEach>
            </div>
        </div>
    </section>
<%@ include file="../include/footer.jsp" %>
<script>
	
	$(document).ready(function () {
		var list1 = $(".priceSUM");
		var totalPRICE = 0;
		for(var i = 0; i < list1.length; i++) {
			totalPRICE += parseInt(list1[i].innerHTML);
		}
		$(".totalPRICE").html(totalPRICE);
		$(".truePRICE").html($(".totalPRICE").html() - 2500);
		
		// ----------------------------------------------------------
		
		$(".finalObjectPRICE").html($(".totalPRICE").html() - 2500);
		
		if(($(".totalCNT").html() == null) || ($(".totalCNT").html() == '')) {
			$(".right-outer").css("display", "none");
		}
		
	})
	// 마이너스 버튼 클릭
	$(".productINFO-TAB").on("click", ".btn-warning", function(event) {
		var btnKey = $(this).val();
		var list1 = $(".productINFO-CNT");
		var list2 = $(".priceSUM");
		var list3 = $(".objectCNT");
		var list4 = $(".objectPRICE");
		
		var stock = 0;
		var totalPRICE = 0;
		var truePRICE = 0;
		for(var i = 0; i < list1.length; i++) {
			if(list1[i].getAttribute("value") == btnKey) {
				for(var j = 0; j < list3.length; j++) {
					if(list1[i].getAttribute("value") == list3[j].getAttribute("value")) {
						stock = parseInt(list1[i].innerHTML);
						if(stock > 1) {
							list1[i].innerHTML = stock - 1;
							list3[j].innerHTML = list1[i].innerHTML;
							stock = list1[i].innerHTML;
						}
					}
				}
			}
		}
		for(var i = 0; i < list2.length; i++) {
			if(list2[i].getAttribute("value") == btnKey) {
				for(var j = 0; j < list4.length; j++) {
					if(list2[i].getAttribute("value") == list4[j].getAttribute("value")) {
						var originPrice = parseInt(list2[i].getAttribute("id"));
						list2[i].innerHTML = originPrice * stock;
						list4[j].innerHTML = list2[i].innerHTML;
					}
				}
			}
		}
		for(var i = 0; i < list2.length; i++) {
			totalPRICE += parseInt(list2[i].innerHTML);
		}
		
		$(".totalPRICE").html(totalPRICE);
		$(".truePRICE").html($(".totalPRICE").html() - 2500);
		$(".finalObjectPRICE").html($(".totalPRICE").html() - 2500);
	})
	// 플러스 버튼 클릭
	$(".productINFO-TAB").on("click", ".btn-info", function(event) {
		var btnKey = $(this).val();
		var list1 = $(".productINFO-CNT");
		var list2 = $(".priceSUM");
		var list3 = $(".objectCNT");
		var list4 = $(".objectPRICE");
		
		var stock = 0;
		var totalPRICE = 0;
		var truePRICE = 0;
		for(var i = 0; i < list1.length; i++) {
			if(list1[i].getAttribute("value") == btnKey) {
				for(var j = 0; j < list3.length; j++) {
					if(list1[i].getAttribute("value") == list3[j].getAttribute("value")) {
						stock = parseInt(list1[i].innerHTML);
						list1[i].innerHTML = stock + 1;
						list3[j].innerHTML = list1[i].innerHTML;
						stock = list1[i].innerHTML;
					}
				}
			}
		}
		for(var i = 0; i < list2.length; i++) {
			if(list2[i].getAttribute("value") == btnKey) {
				for(var j = 0; j < list4.length; j++) {
					if(list2[i].getAttribute("value") == list4[j].getAttribute("value")) {
						var originPrice = parseInt(list2[i].getAttribute("id"));
						list2[i].innerHTML = originPrice * stock;
						list4[j].innerHTML = list2[i].innerHTML;
					}
				}
			}
		}
		for(var i = 0; i < list2.length; i++) {
			totalPRICE += parseInt(list2[i].innerHTML);
		}
		
		$(".totalPRICE").html(totalPRICE);
		$(".truePRICE").html($(".totalPRICE").html() - 2500);
		$(".finalObjectPRICE").html($(".totalPRICE").html() - 2500);
	})
	
	//-------------------------------------------------------------------
	// 마이너스 버튼 클릭시 화면 동기화 (작게볼때 화면하고 크게볼때 화면이 서로 다름)
	$(".c-inner-right-btns").on("click", ".btn-warning", function() {
		var btnKey = $(this).val();
		var list1 = $(".objectCNT");
		var list2 = $(".objectPRICE");
		var list3 = $(".productINFO-CNT");
		var list4 = $(".priceSUM");
		
		var stock = 0;
		var totalPRICE = 0;
		for(var i = 0; i < list1.length; i++) {
			if(list1[i].getAttribute("value") == btnKey) {
				for(var j = 0; j < list3.length; j++) {
					if(list1[i].getAttribute("value") == list3[j].getAttribute("value")) {
						stock = parseInt(list1[i].innerHTML);
						if(stock > 1) {
							list1[i].innerHTML = stock - 1;
							list3[j].innerHTML = list1[i].innerHTML;
							stock = list1[i].innerHTML;
						}
					}
				}
			}
		}
		for(var i = 0; i < list2.length; i++) {
			if(list2[i].getAttribute("value") == btnKey) {
				for(var j = 0; j < list4.length; j++) {
					if(list2[i].getAttribute("value") == list4[j].getAttribute("value")) {
						var originPrice = parseInt(list2[i].getAttribute("id"));
						list2[i].innerHTML = originPrice * stock;
						list4[j].innerHTML = list2[i].innerHTML;
					}
				}
			}
		}
		for(var i = 0; i < list2.length; i++) {
			totalPRICE += parseInt(list2[i].innerHTML);
		}
		
		$(".totalPRICE").html(totalPRICE);
		$(".finalObjectPRICE").html($(".totalPRICE").html() - 2500);
		$(".truePRICE").html($(".totalPRICE").html() - 2500);
	})
	// 플러스 버튼 클릭시 화면 동기화 (작게볼때 화면하고 크게볼때 화면이 서로 다름)
	$(".c-inner-right-btns").on("click", ".btn-info", function() {
		var btnKey = $(this).val();
		var list1 = $(".objectCNT");
		var list2 = $(".objectPRICE");
		var list3 = $(".productINFO-CNT");
		var list4 = $(".priceSUM");
		
		var stock = 0;
		var totalPRICE = 0;
		for(var i = 0; i < list1.length; i++) {
			if(list1[i].getAttribute("value") == btnKey) {
				for(var j = 0; j < list3.length; j++) {
					if(list1[i].getAttribute("value") == list3[j].getAttribute("value")) {
						stock = parseInt(list1[i].innerHTML);
						list1[i].innerHTML = stock + 1;
						list3[j].innerHTML = list1[i].innerHTML;
						stock = list1[i].innerHTML;
					}
				}
			}
		}
		for(var i = 0; i < list2.length; i++) {
			if(list2[i].getAttribute("value") == btnKey) {
				for(var j = 0; j < list4.length; j++) {
					if(list2[i].getAttribute("value") == list4[j].getAttribute("value")) {
						var originPrice = parseInt(list2[i].getAttribute("id"));
						list2[i].innerHTML = originPrice * stock;
						list4[j].innerHTML = list2[i].innerHTML;
					}
				}
			}
		}
		for(var i = 0; i < list2.length; i++) {
			totalPRICE += parseInt(list2[i].innerHTML);
		}
		
		$(".totalPRICE").html(totalPRICE);
		$(".finalObjectPRICE").html($(".totalPRICE").html() - 2500);
		$(".truePRICE").html($(".totalPRICE").html() - 2500);
	})
	
	// 결제버튼 클릭
	$(".btn-primary").click(function() {
		var list1 = $(".productINFO-CNT");
		var list2 = $(".productINFO-TAB");
		var array = new Array();
		for(var i = 0; i < list1.length; i++) {
			var map = new Object();
			console.log("상품번호: " + list2[i].getAttribute("value"));
			console.log("수량: " + list1[i].innerHTML);
			console.log("--------------------");
			map.pno = list2[i].getAttribute("value");
			map.p_b_quantity = list1[i].innerHTML;
			array.push(map);
		}
		console.log(array);
		$("#data").val(array);
		
		if(confirm("결제페이지로 이동하시겠습니까?")) {
			$.ajax({
				type: "put",
				url: "updateBasketList",
				data: JSON.stringify(array),
				contentType: "application/json; charset:utf-8",
				success: function(data) {
					if(data == 1) {
						location.href="paymentPage";
						
					}else {
						
					}
				},
				error: function(status) {
					alert("알수없는 에러!!");
				}
			})
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