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
    <title>결제하기</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

    <style type="text/css">
        /* 모바일 환경에서 작동 */
        @media (max-width:767px) {
            /* 물건리스트 크기 조절 */
            .address-rightarea {
                height: 140px;
            }
            /* 배송지 탭 크기 조절 */
            .height-tmp > li > a {
                width: 80px;
            }
            
            /* 배송 탭 왼쪽 간격 조절 */
            .address-leftarea {
                padding-left: 28px
            }
            
            /* 최종결제창 위쪽 마진 부여 */
            .final-decision {
            }
            /* 결제방법 탭 밑 간격 조절 */
            .detail-decision {
                margin-top: 50px;
            }
            
            /* 결제은행 탭 오른쪽 공간 부여 */
            #real {
               margin-left: 14px;
               margin-bottom: 30px;
            }
            
            /* 은행버튼 오른쪽 공간 부여 */
            #real .btn {
                margin-right: 10px;
                width: 30%;
            }
        }
        
        /* 데스크탑 환경에서 작동 */
        @media (min-width:768px) {
            /* 물건리스트 크기 고정 */
            .address-rightarea {
                height: 275px;
            }
            /* 본문컨텐츠 조금 아래로 내리기 */
            .content-middlemain {
                padding-top: 20px;
            }
            .method-btns {
                float: left;
            }
            .method-btns .btn {
                margin-left: 10px;
            }
            /* 결제 카드 버튼 오른쪽 붙이기 */
            #real {
                width: 50%;
                float: right;
            }
            #real .btn {
                margin-left: 10px;
            }
        }
        
        /* ---------------------------결제하기 페이지------------------------------------ */
        /* 결제하기 텍스트 중앙정렬 및 헤더에 안가리게 마진 */
        .info-higharea {
            padding-top: 100px;
            text-align: center;
            margin: 10px;
        }
        
        /* 배송지 탭 옆으로 쌓기 */
        .address-leftarea {
            float: left;
            padding: 10 20px;
            height: 280px;
        }
        
        /* 물건리스트 테두리 옵션 및 위치 쌓기 */
        .address-rightarea {
            float: right;
            padding: 10 20px;
            overflow: auto;
            background-color: white;
        }
        
        /* 배송탭 위치한 공간 조절 */
        .address-content {
            width: 100%;
            background-color: white;
        }
        
        /* 배송탭 기존,신규,이전 버튼 크기 */
        .height-tmp > li > a {
            padding: 10px 20px; 
        }
        
        /* 신규 탭 누르면 나오는 배송정보 입력칸 */
        .address-form {
            margin-top: 20px;
        }
        
        /* 상세주소 칸 테두리 옵션 */
        #detail-address {
            border: 1px solid;
            border-color: dodgerblue;
        }
        
        /* 주문상품정보 텍스트 바로 아래 공간 */
        .order-list-border {
            margin-bottom: 10px;
            overflow: hidden;
        }
        /* 주문상품정보 이미지 공간 */
        .ordered-img {
            float: left;
            width: 35%;
        }
        
        /* 주문상품정보 상품설명 공간 */
        .detail-infoarea {
            float: right;
            width: 60%;
        }

        /* 최종결제 공간 */
        .final-decision {
            padding: 10px 20px;
        }
        
        /* 최종결제 공간 아래 실제영역 디자인 옵션 */
        .detail-decision {
            padding: 5px 20px 20px;
            text-align: center;
            align-content: center;
            background-color: white;
        }
        
        /* 결제하기 버튼 크기 옵션 */
        .detail-decision .final-btnTAB {
            width: 50%;
            margin: 0 auto;
        }
        /*--------------------------------결제하기 끝---------------------------*/
        
    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

    <section class="info-higharea">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 purchase-title">
                    <h2><b>결제하기</b></h2>
                </div>
            </div>
        </div>
    </section>
    
    <section class="content-middlemain">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-xs-12 address-rightarea">
                    <div class="orderlist-info">
                        <h4><b>주문상품정보</b></h4>
                        <c:forEach var="vo" items="${list }">
                        <div class="order-list-border">
                            <div class="ordered-img">
                                <a class="pno" href="${vo.pno }"><img src="${pageContext.request.contextPath }/${vo.p_uploadpath }/${vo.p_img_names}${vo.p_img_exts}"></a>
                            </div>
                            <div class="detail-infoarea">
                                <h5 class="name">${vo.seller_name }</h5>
                                <h5>${vo.p_name }</h5>
                                <h5>${vo.p_price }&nbsp;원&nbsp;/&nbsp;<span class="stock">${vo.p_b_quantity }</span>&nbsp;EA</h5>
                                <h5><span class="real-price">${vo.p_price * vo.p_b_quantity }</span>&nbsp;원</h5>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-lg-8 col-xs-12 address-leftarea">
                    <div class="container address-content">
                        <h2><b>배송지</b></h2>
                        <ul class="nav nav-tabs height-tmp">
                            <li class="active"><a data-toggle="tab" href="#basic"><b>기본</b></a></li>
                            <li><a data-toggle="tab" href="#new"><b>신규</b></a></li>
                            <li><a data-toggle="tab" href="#last"><b>이전</b></a></li>
                        </ul>

                        <div class="tab-content">
                            <div id="basic" class="tab-pane fade in active" disabled>
                                <form action="">
                                <table class="address-form">
                                    <tr>
                                        <td><b>주문자</b>&nbsp;&nbsp;</td>
                                        <td colspan="4"><input type="text" name="orderer-name" id="basic_orderer_name" readonly="true"></td>
                                    </tr>
                                    <tr>
                                        <td><b>우편번호</b>&nbsp;&nbsp;</td>
                                        <td colspan="4"><input type="text" name="num-address" id="basic_post_no" readonly="true"></td>
                                    </tr>
                                    <tr>
                                        <td><b>지역</b></td>
                                        <td colspan="4"><input type="text" name="location-tmp" id="basic_location_tmp" readonly="true"></td>
                                    </tr>
                                    <tr>
                                        <td><b>연락처</b>&nbsp;&nbsp;</td>
                                        <td colspan="4">
                                        <select name="address_1" id="basic_orderer_phone1">
                                        	<option ${UserVO.u_mobile_1 eq 010? 'active': '' }>010</option>
                                        	<option ${UserVO.u_mobile_1 eq 011? 'active': '' }>011</option>
                                        	<option ${UserVO.u_mobile_1 eq 017? 'active': '' }>017</option>
                                        </select>
                                        <input type="text" name="orderer-name" id="basic_orderer_phone2" readonly="true"></td>
                                    </tr>
                                    <tr>
                                        <td><b>상세주소</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan=5>
                                            <textarea name="detail-address" id="basic_detail_address" cols="40" rows="3" readonly="true"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            </div>
                            <div id="new" class="tab-pane fade">
                            <form action="purchaseSubmit" method="post" name="addressForm" id="addressForm">
                                <table class="address-form">
                                    <tr>
                                        <td><b>주문자</b>&nbsp;&nbsp;</td>
                                        <td colspan="4"><input type="text" name="post_name" id="new-orderer-name" placeholder="이름을 입력하세요"></td>
                                    </tr>
                                    <tr>
                                        <td><b>우편번호</b>&nbsp;&nbsp;</td>
                                        <td colspan="4"><input type="text" name="post_post_no" id="new-post-no" placeholder="우편번호를 입력하세요"></td>
                                    </tr>
                                    <tr>
                                        <td><b>지역</b></td>
                                        <td colspan="4"><input type="text" name="post_address_1" id="new-location-tmp" placeholder="시, 군, 구"></td>
                                    </tr>
                                    <tr>
                                        <td><b>연락처</b>&nbsp;&nbsp;</td>
                                        <td colspan="4">
                                        <select name="post_mobile_1">
                                        	<option>010</option>
                                        	<option>011</option>
                                        	<option>017</option>
                                        </select>
                                        <input type="text" name="post_mobile_2" id="new-mobile2" placeholder="연락처를 입력하세요 (-제외)"></td>
                                    </tr>
                                    <tr>
                                        <td><b>상세주소</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan=5>
                                            <textarea name="post_address_2" id="new-detail-address" cols="40" rows="3" placeholder="상세주소를 입력하세요"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            </div>
                            <div id="last" class="tab-pane fade">
                            <form action="">
                                <table class="address-form">
                                    <tr>
                                        <td><b>주문자</b>&nbsp;&nbsp;</td>
                                        <td colspan="4"><input type="text" name="orderer-name" id="sub-orderer-name" readonly="true"></td>
                                    </tr>
                                    <tr>
                                        <td><b>우편번호</b>&nbsp;&nbsp;</td>
                                        <td colspan="4"><input type="text" name="post-no" id="sub-post-no" readonly="true"></td>
                                    </tr>
                                    <tr>
                                        <td><b>지역</b></td>
                                        <td colspan="4"><input type="text" name="location-tmp" id="sub-location-tmp" readonly="true"></td>
                                    </tr>
                                    <tr>
                                        <td><b>연락처</b>&nbsp;&nbsp;</td>
                                        <td colspan="4">
                                        <select name="address_1" id="sub-orderer-mobile1" disabled>
                                        	<option ${addVO.post_mobile_1 eq 010? 'active': '' }>010</option>
                                        	<option ${addVO.post_mobile_1 eq 011? 'active': '' }>011</option>
                                        	<option ${addVO.post_mobile_1 eq 017? 'active': '' }>017</option>
                                        </select>
                                        <input type="text" name="orderer-name" id="sub-orderer-mobile2" readonly="true"></td>
                                    </tr>
                                    <tr>
                                        <td><b>상세주소</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan=5>
                                            <textarea name="detail-address" id="sub-detail-address" cols="40" rows="3"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 col-xs-12 purchase-method">
                    <h2><b>결제방법</b></h2>
                    <div class="method-btns">
                        <button type="button" class="btn btn-info" data-toggle="collapse" value="card" data-target="#real"><b>카드결제</b></button>
                        <button type="button" class="btn btn-info cardTAB" data-toggle="collapse" value="transfer" data-target="#real"><b>계좌이체</b></button>
                        <button type="button" class="btn btn-info cardTAB" data-toggle="collapse" value="deposit" data-target="#real"><b>무통장입금</b></button>
                    </div>
                    <div id="real" class="collapse">
                            <button type="button" class="btn btn-danger" value="kb" data-toggle="collapse"><b>국민은행</b></button>
                            <button type="button" class="btn btn-primary" value="sh" data-toggle="collapse"><b>신한은행</b></button>
                            <button type="button" class="btn btn-warning" value="nh" data-toggle="collapse"><b>농협은행</b></button>
                        </div>
                    
                </div>
                <div class="col-lg-5 col-xs-12 final-decision">
                    <div class="detail-decision">
                        <h2><b><i><span class="methodInsert"></span></i></b></h2>
                        <h2><span class="bank-name"></span></h2>
                        <div class="total-pricetab">
                            <h1><b><i><span class="pricevalue"></span>원</i></b></h1>
                        </div>
                        <div class="final-btnTAB">
                            <button type="button" class="btn btn-info btn-block"><b>결제하기</b></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
		
		var finalprice = 0;
		$("#basic_orderer_name").val("${UserVO.user_name}");
		$("#basic_post_no").val("${UserVO.u_post_no}");
		$("#basic_location_tmp").val("${UserVO.u_address_1}");
		$("#basic_orderer_phone2").val("${UserVO.u_mobile_2}");
		$("#basic_detail_address").html("${UserVO.u_address_2}");
		
		document.getElementById("sub-orderer-name").setAttribute("value", "${addVO.post_name }");
		document.getElementById("sub-post-no").setAttribute("value", "${addVO.post_post_no }");
		document.getElementById("sub-location-tmp").setAttribute("value", "${addVO.post_address_1 }");
		document.getElementById("sub-detail-address").setAttribute("value", "${addVO.post_address_2}");
		document.getElementById("sub-orderer-mobile2").setAttribute("value", "${addVO.post_mobile_2}")
		
		var list = $(".real-price");
		for(var i = 0; i < list.length; i++) {
			finalprice += parseInt(list[i].innerHTML);
		}
		console.log()
		$(".pricevalue").html(finalprice);
		
		$(".collapse").on("click", ".btn", function() {
			if($(this).val() == "kb") {
				$(".bank-name").html("국민");
			}else if($(this).val() == "sh") {
				$(".bank-name").html("신한");
			}else if($(this).val() == "nh") {
				$(".bank-name").html("농협");
			}
		})
		// 결제확인서 부분
		$(".method-btns").on("click", ".btn", function() {
			if($(this).val() == "card") {
				$(".methodInsert").html("카드결제");
			}else if($(this).val() == "transfer") {
				$(".methodInsert").html("계좌이체");
			}else if($(this).val() == "deposit") {
				$(".methodInsert").html("무통장입금");
			}
		})
		// 결제버튼 클릭시 확인요소
		$(".final-btnTAB").on("click", ".btn", function() {
		    
			if(($(".methodInsert").html() == null) || ($(".methodInsert").html() == '')) {
				alert("결제 수단을 선택해주세요");
				return;
			}else if(($(".bank-name").html() == null) || ($(".bank-name").html() == '')) {
				alert("결제 은행을 선택해주세요");
				return;
			}
			
			if(confirm("구매를 진행하시겠습니까?")) {
				var pno = document.querySelector(".pno").getAttribute("href");
				var trigger = document.getElementById("new").getAttribute("class");
				var stock = $(".stock").html();
				var key = '${sessionScope.pass}';
				console.log(key);
				console.log(trigger);
				if(key == 'direct') {
					if(trigger == "tab-pane fade active in") {
						console.log("액티브");
						if($("#new-orderer-name").val() == null || $("#new-orderer-name").val() == '') {
							alert("이름은 필수 입력사항 입니다");
							return;
						}else if($("#new-post-no").val() == null || $("#new-post-no").val() == '' || $("#new-post-no").val().length > 20) {
							alert("우편번호는 필수 입력사항이며 20글자 이하여야 합니다");
							return;
						}else if($("#new-location-tmp").val() == null || $("#new-location-tmp").val() == '') {
							alert("지역은 필수 입력사항 입니다");
							return;
						}else if($("#new-mobile2").val() == null || $("#new-mobile2").val() == '' || $("#new-mobile2").val().length > 8) {
							alert("휴대폰번호 뒷자리를 확인해주세요 -제외 입력");
							return;
						}else if($("#new-detail-address").val() == null || $("#new-detail-address").val() == '') {
							alert("상세주소를 확인해주세요");
							return;
						}
							
						document.addressForm.setAttribute("action", "purchaseDirectly?pno="+pno+"&stock="+stock);
						document.addressForm.submit();
						return;
					}
					location.href="purchaseDirectly?pno="+pno+"&stock="+stock;
				}else {
					if(trigger == "tab-pane fade active in") {
						console.log("액티브");
						if($("#new-orderer-name").val() == null || $("#new-orderer-name").val() == '') {
							alert("이름은 필수 입력사항 입니다");
							return;
						}else if($("#new-post-no").val() == null || $("#new-post-no").val() == '' || $("#new-post-no").val().length > 20) {
							alert("우편번호는 필수 입력사항이며 20글자 이하여야 합니다");
							return;
						}else if($("#new-location-tmp").val() == null || $("#new-location-tmp").val() == '') {
							alert("지역은 필수 입력사항 입니다");
							return;
						}else if($("#new-mobile2").val() == null || $("#new-mobile2").val() == '' || $("#new-mobile2").val().length > 8) {
							alert("휴대폰번호 뒷자리를 확인해주세요");
							return;
						}else if($("#new-detail-address").val() == null || $("#new-detail-address").val() == '') {
							alert("상세주소를 확인해주세요");
							return;
						}
						document.addressForm.submit();
						return;
					}
					location.href="purchaseSubmit";
				}
			}
		})
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