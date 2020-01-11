<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>제품 상세보기</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    
    <!-- 달력 관련 시작 -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <!-- 달력 관련 END -->
    
    <style type="text/css">
        /*Detail section 화면 설정 START------------------------*/
        
        /*titlebox 제목 설정 */
        .titlebox {
            
            text-align: center;
            font-size: 25px;
            margin-top: 100px;
            margin-bottom: 40px;
            border-top: 3px solid #ddd;
            border-bottom: 3px solid #ddd;
        }
        
        /*titlebox 제목 공간 크기 설정*/
        .titlebox .titlebox-name {
            margin: 14px 14px;
        }
        
        /*제목 글자 설정*/
        .info > .title {
            margin-top: 10px;
            font-size: 25px;
        }
        
        /*title제목 부가설명 설정*/
        .info > .title-info {
            
            font-size: 15px;
            color: #FF6347;
        }
        
        /*제목 부분 전체적인 설정*/
        .info > .price {
            line-height:50px;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
            font-size: 28px;
            padding: 10px 0;
        }
        
        /*오버플로우 히든 설정*/
        .goods-list {
            overflow:hidden;
        }
        
        /*설명 부분 왼쪽 정렬*/
        .goods-list .tit {
            line-height:50px;
            font-size: 16px;
            width: 25%;
            float: left;
        }
        
        /*설명 부분 오른쪽 정렬*/
        .goods-list .desc {
            line-height: 50px;
            height: 50px;
            font-size: 15px;
            width: 75%;
            float: right;
			overflow: hidden;
        }
		
		.desc .EA {
			float: left;
			width: 70%;
		}

		.desc .btns {
			float: right;
			width: 30%;
		}
		
		.btns .btn {
			width: 50%;
			float: right;
			border: 1px solid;
			box-sizing: border-box;
			height: 50px;
		}
        
        /*상품금액 위쪽 여백 넓히기*/
        .control {
            padding-top: 130px;
            
        }
        
        /*오버플로우 히든 설정*/
        .control > .price,
        .control > .order {
            overflow: hidden;
        }
        
        /*버튼 및 내용 왼쪽 정렬*/
        .control .left {
            float: left;
        }
        
        /*버튼 및 내용 오른쪽 정렬*/
        .control .right {
            float: right;
        }
        
        /*밑쪽 상품금액 크기 조절*/
        .control .price .right {
            font-size: 30px;
        }
        
        /*상품금액 폰트 크기 조절*/
        .control .price .left {
            font-size: 18px;
            line-height: 45px;
            
        }
        
        /*양쪽 버튼 설정*/
        .control .order .left,
        .control .order .right {
            margin-top: 20px;
            width: 50%;
            height: 50px;
            font-size: 20px;
            border-radius: 0;
            
        }
		
		/*버튼 갖다 댔을때 명암*/
		.control .order .right:hover {
			background-color: #ddd;
		}
        
        /*우측 구매하기 버튼 색상 설정*/
        .control .order .right {
            background-color: #9370DB;
            border: 1px solid #9370DB;
            
        }
        /* Detail section 화면 설정 END--------------------*/
		
		/* 상품정보 버튼 설정START -----------------------*/
		
		/*버튼 윤곽선*/
		.nav-tabs {
			border-bottom: 1px solid #9370DB;
			
		}
		
		.goods-tab-group>li.active>a {
			    border-right: 2px solid #9370DB;
				border-left: 2px solid #9370DB;
				border-top: 2px solid #9370DB;
				border-bottom: 2px solid white;
		}
		
		/*버튼 창 사이에 공간 설정*/
		.nav-tabs {
			padding-top: 80px;
			
		}
		
		.goods-view {
			margin-top: 80px;
			margin-bottom: 60px;
			float: left;
			position: relative;
			top: 1px;
			width: 168px;
			height: 72px;
			line-height: 46px;
			text-align: center;
			display: block;
			padding : 15px 0;
			font-size: 18px;
			width:25%;
		}
		
		.goods-view:hover {
            background-color: #ddd;
			text-decoration:none
        }
		
		/*클릭 되지않는 버튼 글자색*/
		.goods-tab-group > li > a {
			color: #aaa;
			border-bottom: 2px solid #9370DB;
		}
		
		/*클릭 된 버튼 글자색*/
		.goods-tab-group>li.active>a {
			color: black;
		}
		
		
		/*상품 설명 창 글자 제목 위치와 크기 설정*/
		.h3, h3 {
			padding: 35px 0;
			margin: 0px;
			font-size: 25px;
			text-align: center;
		}
		
		/*일반 글자 크기 설정*/
		.content p {
			font-size: 18px;
		}
		
		/*사진 중간위치 및 마진으로 공간 처리*/
		.pic {
			padding: 40px 0;
			text-align: center;
		}
		
		/* 상품정보 버튼 설정 END -----------------------*/
		
		/* 배송/교환/반품 안내 내용물 설정 START----------------*/
        
        .delivery1,
		.delivery2,
        .delivery4,
        .delivery5 {
			margin-bottom: 50px;
		}
        
        .delivery3 {
            margin-bottom: 10px;
        }
		
		.delivery1 > tbody > tr > th,
        .delivery2 > tbody > tr > th,
        .delivery4 > tbody > tr > th,
        .delivery5 > tbody > tr > th {
			border: 1px solid #ddd;	
			text-align: center;
            background: #F6F6F6;
		}
		
		.delivery1 > tbody > tr > td > p, 
        .delivery2 > tbody > tr > td > p,
        .delivery4 > tbody > tr > td > p,
        .delivery5 > tbody > tr > td > p {
			padding-left: 20px;
            margin-bottom: 0;
            padding: 5px;
		}
		
		.delivery1 > tbody > tr > .th1, 
        .delivery1 > tbody > tr > .th2 {
			font-weight: 100;
            background: white;
		}
        
		.delivery1 > tbody > tr > td {
			border: 1px solid #ddd;
			padding: 25px 0;
		}
        
        .delivery2 > tbody > tr > td,
        .delivery4 > tbody > tr > td,
        .delivery5 > tbody > tr > td {
            padding: 25px 0;
            border: 1px solid #ddd;
            width: 85%;
        }
    
		.delivery-info > p,
        .delivery-guide > p,
        .delivery-limit > p,
        .delivery-seller > p {
			font-size: 21px;
		} 
        
        .delivery-limit-info > p {
            font-size: 15px;
        }
        
        /* 배송/교환/반품 안내 내용물 설정 END----------------*/
   
    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<section>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="titlebox">
                    <p class="titlebox-name">상품상세</p>
                </div>
            </div>
            <div class="col-md-6 col-xs-12 tmptmp">
                <img src="${pageContext.request.contextPath }/${vo.p_uploadpath }/${vo.p_img_names}${vo.p_img_exts}">
            </div>
            <div class="col-md-6 col-xs-12">
                <div class="info">
                    <p class="title">
                        ${vo.p_name }
                    </p>
                    <p><strong><span class="truePrice">${vo.p_price }</span>원</strong></p>
                    <div class="goods-list">
                        <dl class="goods-menu1">
                            <dt class="tit">개수</dt>
                            <dd class="desc">
                            <div class="EA">
                            	<span class="stock">1</span>&nbsp;EA
                            </div>
                            <div class="btns">
                            	<button type="button" value="minus" class="btn btn-warning"><i class="glyphicon glyphicon-minus"></i></button>
                            	<button type="button" value="plus" class="btn btn-info"><i class="glyphicon glyphicon-plus"></i></button>
                            </div>
                            </dd>
                        </dl>
                        <dl class="goods-menu2">
                            <dt class="tit">배송구분</dt>
                            <dd class="desc">무료배송</dd>
                        </dl>
                        <dl class="goods-menu3">
                            <dt class="tit">제조사</dt>
                            <dd class="desc">${vo.p_manufac }</dd>
                        </dl>
                        <dl class="goods-menu4">
                            <dt class="tit">상세설명</dt>
                            <dd class="desc">${vo.p_detail }
                            </dd>
                        </dl>
                    </div>
                    <div class="control">
                        <div class="price">
                            <dt class="left">상품금액</dt>
                            <dd class="right"><strong><span class="finalPrice">${vo.p_price }</span>원</strong></dd>
                        </div>
                        <div class="order">
                            <button value="basket" class="left btn btn-default">장바구니</button>
                            <button value="purchase" class="right btn btn-warning">구매하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
   
<section>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <!--1. 상품정보 창-->
                <div id="info-point"></div>
                <!--버튼 누를 때 위치지정 id-->
                <div id="goods-info">
                    <!--버튼-->
                    <ul class="goods-tab-group">
                        <li class="active"><a href="#info-point" class="goods-view">상품설명</a></li>
                        <li><a href="#review-point" class="goods-view">상품후기</a></li>
                        <li><a href="#qna-point" class="goods-view">상품문의</a></li>
                        <li><a href="#guide-point" class="goods-view">배송안내</a></li>
                    </ul>
                    <!--내용물-->
                    <h3>상품정보</h3>
                    <div class="pic">
                        <img src="${pageContext.request.contextPath }/${vo.p_uploadpath }/${vo.p_img_names}${vo.p_img_exts}">
                    </div>
                    <div class="content">
                        <p>${vo.p_detail }</p>
                    </div>
                </div>
                <!--상품정보 창END-->
                <!--2. 상품후기 창-->
                <div id="review-point"></div>
                <div id="goods-review">
                    <!--버튼-->
                    <ul class="goods-tab-group">
                        <li><a href="#info-point" class="goods-view">상품설명</a></li>
                        <li class="active"><a href="#review-point" class="goods-view">상품후기</a></li>
                        <li><a href="#qna-point" class="goods-view">상품문의</a></li>
                        <li><a href="#guide-point" class="goods-view">배송안내</a></li>
                    </ul>
                    <!--내용물-->
                    <%@ include file="../review/reviewList.jsp" %>
                </div>
                <!-- 상품후기 창 END-->
                <!--3. 상품문의qna창-->
                <div id="qna-point"></div>
                <div id="goods-qna">
                    <!--버튼-->
                    <ul class="goods-tab-group">
                        <li><a href="#info-point" class="goods-view">상품설명</a></li>
                        <li><a href="#review-point" class="goods-view">상품후기</a></li>
                        <li class="active"><a href="#qna-point" class="goods-view">상품문의</a></li>
                        <li><a href="#guide-point" class="goods-view">배송안내</a></li>
                    </ul>
                    <!--내용물-->
                    <%@ include file="../qna/qnaList.jsp" %>
                </div><!-- 상품문의qna 창-->
                <!--4. 배송/교환/판품 안내 창-->
                <div id="guide-point"></div>
                <div id="goods-guide">
                    <!--버튼-->
                    <ul class="goods-tab-group">
                        <li><a href="#info-point" class="goods-view">상품설명</a></li>
                        <li><a href="#review-point" class="goods-view">상품후기</a></li>
                        <li><a href="#qna-point" class="goods-view">상품문의</a></li>
                        <li class="active"><a href="#guide-point" class="goods-view">배송안내</a></li>
                    </ul>
                    <!--내용물-->
                    <h3>배송/교환/반품 안내</h3>
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <!--delivery-return-table START-->
                                <table class="delivery1">
                                    <!--테이블 크기 설정-->
                                    <colgroup>
                                        <col width="170px">
                                        <col width="180px">
                                        <col width="170px">
                                        <col width="618px">
                                    </colgroup>
                                    <!--1. delivery1 테이블 구조 만들기 START-->
                                    <tbody>
                                        <!--배송정보 제목-->
                                        <div class="delivery-info">
                                            <p><strong>배송정보</strong></p>
                                        </div>
                                        <!--배송정보 내용-->
                                        <tr>
                                            <th>배송방법</th>
                                            <th class="th1">순차배송</th>
                                            <th rowspan="2">배송비</th>
                                            <!--행을 2칸먹음-->
                                            <td rowspan="2">
                                                <!--행을 2칸먹음-->
                                                <p>ㆍ무료배송</p>
                                                <p>ㆍ총알배송 상품 중 19,800원 이상 구매 시 무료배송</p>
                                                <p>ㆍ도서 산간 지역 추가비용 없음</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>묶음배송 여부</th>
                                            <th class="th2">가능</th>
                                        </tr>
                                        <tr>
                                            <th>배송기간</th>
                                            <td colspan="3">
                                                <!--열을 3칸먹음-->
                                                <p>ㆍ팀도비 배송 지역 : 주문 및 결제 완료 후, 1~2일 이내 도착</p>
                                                <p>ㆍ팀도비 미배송 지역 : 주문 및 결제 완료 후, 2~3일 이내 도착</p>
                                                <p>ㆍ도서 산간 지역 등은 하루가 더 소요될 수 있습니다. 곧 고객님께도 팀도비가 찾아갈 수 있도록 노력하겠습니다.</p>
                                                <p>ㆍ천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 다소 지연될 수 있는 점 양해 부탁드립니다.</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <!--delivery-return 테이블 구조 만들기 END-->
                                </table>
                                <!--delivery1 table END-->
                                <!--2. delivery2 테이블 구조 만들기 START-->
                                <table class="delivery2">
                                    <!--테이블 크기 설정-->
                                    <colgroup>
                                        <col width="300px">
                                        <col width="340px">
                                        <col width="150px">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                        <!--교환/반품안내 제목-->
                                        <div class="delivery-guide">
                                            <p><strong>교환/반품안내</strong></p>
                                        </div>
                                        <!--교환/반품안내 내용-->
                                        <tr>
                                            <th>교환반품비용</th>
                                            <td>
                                                <p>ㆍ5,000원</p>
                                                <p>ㆍ단, 고객 변심의 경우에만 발생</p>
                                                <p>ㆍ부분반품 시, 남은금액이 무료배송 조건을 유지하면 일부 반품비용이 부과</p>
                                            </td>

                                        </tr>
                                        <tr>
                                            <th>
                                                교환/반품 신청
                                                <br>기준일
                                            </th>
                                            <td>
                                                <p>ㆍ단순변심에 의한 총알배송 상품의 교환/반품은 제품 수령 후 30일 이내까지만 가능(교환/반품비용 고객부담)
                                                    <p>ㆍ상품의 내용이 표시 광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내 가능</p>
                                                    <p>ㆍ또한 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 가능</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!--delivery2 table END-->
                                <!--3. delivery3 테이블 구조 만들기 START-->
                                <table class="delivery3">
                                    <!--테이블 크기 설정-->
                                    <tbody>
                                        <!--교환/반품 제한사항 제목-->
                                        <div class="delivery-limit">
                                            <p><strong>교환/반품 제한사항</strong></p>
                                        </div>
                                        <!--교환/반품 제한사항 내용-->
                                        <tr>
                                            <td>
                                                <p>ㆍ주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</p>
                                                <p>ㆍ상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우 (단, 내용 확인을 위한 포장 개봉의 경우는 예외)</p>
                                                <p>ㆍ고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</p>
                                                <p>ㆍ세트상품 일부 사용, 구성품을 분실하였거나 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</p>
                                                <p>ㆍ모니터 해상도의 차이로 인해 색상이나 이미지가 실제와 달라, 고객이 단순 변심으로 교환/반품을 무료로 요청하는 경우</p>
                                                <p>ㆍ제조사의 사정(신모델 출시 등)및 부품 가격 변동 등에 의해 무료 교환/반품으로 요청하는 경우</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!--delivery3 table END-->
                                <!--4. delivery4 테이블 구조 만들기 START-->
                                <table class="delivery4">
                                    <!--테이블 크기 설정-->
                                    <colgroup>
                                        <col width="300px">
                                        <col width="340px">
                                        <col width="150px">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                        <!--교환/반품 제한사항 정보 내용-->
                                        <div class="delivery-limit-info">
                                            <p><strong>※각 상품별로 아래와 같은 사유로 취소/반품이 제한 될 수 있습니다.</strong></p>
                                        </div>
                                        <tr>
                                            <th>의류/잡화/수입명품</th>
                                            <td>
                                                <p>ㆍ상품의 택(TAG) 제거, 라벨 및 상품 훼손, 구성품 누락으로 상품의 가치가 현저히 감소된 경우</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>계절상품/식품/화장품</th>
                                            <td>
                                                <p>ㆍ신선냉동 식품의 단순변심의 경우</p>
                                                <p>ㆍ뷰티 상품 이용 시 트러블(알러지, 붉은 반점, 가려움, 따가움)이 발생하는 경우</p>
                                                <p>ㆍ진료 확인서 및 소견서 등을 증빙하면 환불이 가능(제반비용 고객부담)</p>
                                        </tr>
                                        <tr>
                                            <th>전자/가전/설치상품</th>
                                            <td>
                                                <p>ㆍ설치 또는 사용하여 재판매가 어려운 경우, 액정이 있는 상품의 전원을 켠 경우</p>
                                                <p>ㆍ상품의 시리얼 넘버 유출로 내장된 소프트웨어의 가치가 감소한 경우(내비게이션, OS시리얼이 적힌 PMP)</p>
                                                <p>ㆍ홀로그램 등을 분리, 분실, 훼손하여 상품의 가치가 현저히 감소하여 재판매가 불가할 경우(노트북, 데스크탑 PC등)</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>자동차용품</th>
                                            <td>
                                                <p>ㆍ상품을 개봉하여 장착한 이후 단순변심인 경우</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>CD/DVD/GAME<br>/BOOK</th>
                                            <td>
                                                <p>ㆍ복제가 가능한 상품의 포장 등을 훼손한 경우</p>
                                            </td>
                                        </tr>
                                </table>
                                <!--delivery4 table END-->
                                <!--5. delivery5 테이블 구조 만들기 START-->
                                <table class="delivery5">
                                    <!--테이블 크기 설정-->
                                    <colgroup>
                                        <col width="300px">
                                        <col width="340px">
                                        <col width="150px">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                        <!--판매자 정보 제목-->
                                        <div class="delivery-seller">
                                            <p><strong>판매자 정보</strong></p>
                                        </div>
                                        <!--판매자 정보 내용-->
                                        <tr>
                                            <th>판매자</th>
                                            <td>
                                                <p>ㆍ팀도비</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!--delivery5 table END-->
                            </div>
                        </div>
                    </div>
                </div><!-- 배송/교환/반품 창 END-->
            </div>
            <!--content END-->
        </div>
        <!--row END-->
    </div>
    <!--container END-->
</section>
<%@ include file="../include/footer.jsp" %>

<script>

	$(document).ready(function() {
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
			history.replaceState('', null, null); //현재 히스토리 기록을 변경
		}
		if(history.state == '') {
			return;
		}
	})
	
	var pno = location.search;
	pno = pno.substring(pno.lastIndexOf("=")+1);
	
	console.log(pno);
	
	$.getJSON(
	  		"checkProduct/"+pno+"/", // 요청보낼 주소
	  		function(data) { // 성공시 전달받을 익명함수
	  			console.log(data);
	  			if(data == 0) {
	  				location.href="../common/error";
	  			}
	  		}
	)
	

	$(".btns").on("click", ".btn", function() {
		if($(this).val() == 'plus') {
			$(".stock").html(parseInt($(".stock").html())+1);
		}else {
			if($(".stock").html() > 1) {
				$(".stock").html(parseInt($(".stock").html())-1);
			}
		}
		$(".finalPrice").html(parseInt($(".truePrice").html()) * parseInt($(".stock").html()));
	})
	
	$(".order").on("click", ".btn", function() {
		if($(this).val() == 'basket') {
			location.href="insertBasket?pno=${vo.pno}&stock="+$(".stock").html();
		}else {
			location.href="paymentDirectly?pno=${vo.pno}&stock="+$(".stock").html();
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