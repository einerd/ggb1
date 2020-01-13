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
    <title>메인페이지</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    
    <style type="text/css">
        
        /*캐러셀 위아래 간격조절*/
        .carousel {
            margin-top: 80px;
            margin-bottom: 30px;
        }
        
        /*캐러셀 양쪽 버튼 명암조절*/
        .carousel-control.right,
        .carousel-control.left {
            background-image: linear-gradient(to right, rgba(0, 0, 0, .0001) 0%, rgba(0,0,0,0) 100%);
        }
        
        .prod-list,
        .prod-link {
            border: 1px solid #ccc;
            display: block; /*a태그가 inline요소이기 때문에, border가 없음 반드시 */
            text-align: center;
        }
        
        /*기본적으로 col의 부트설정이 padding에 15px를 가지고 있기 때문에 전부 5px로 변경*/
        .prod-list,
        .prod-list >li[class*="col-"] {
            padding: 5px;
        }
        
        /*박스에 호버했을 때 윤곽 파란색*/
        .prod-list .prod-link:hover {
            border-color: #7B68EE;
        }
        
        .prod-link {
            position: relative;
        }
        
        .prod-link .arrow {
            display: block; /*span은 인라인요소, 인라인요소는 position속성을 사용할 수 업습니다*/
            position: absolute; /*부모요소 기준으로 떠오르고*/
            left:20px; /*left, right중에 하나*/
            bottom:20px; /*top, bottom중에 하나*/
            width:40px; /*넓이*/
            height:40px; /*높이*/
            line-height:40px; /*텍스트가 위치에 맞게 높이와 동일하게 설정*/
            color: #fff;
            background-color: #808080;
            opacity: 1; /*투명도*/
        }
        
        .prod-link .hover {
            display: block; /*span은 인라인요소, 인라인요소는 position속성을 사용할 수 업습니다*/
            position: absolute; /*부모요소 기준으로 떠오르고*/
            left:20px; /*left, right중에 하나*/
            bottom:20px; /*top, bottom중에 하나*/
            width:100px; /*넓이*/
            height:40px; /*높이*/
            line-height:40px; /*텍스트가 위치에 맞게 높이와 동일하게 설정*/
            color: #fff;
            background-color: #7B68EE;
            opacity: 0; /*투명도*/
        }
        
        /*prod-link호버시 arrow클래스의 투명도를 0으로 바꾸겠다*/
        .prod-link:hover > .arrow {
            opacity: 0;
        }
        
        .prod-link:hover > .hover {
            opacity: 1;
        }
        
        
        
        @media (max-width:767px) {
			
			.row > ul > li > a > img {
				width:100%;
				height:401px;
			}
			
			.carousel-inner > .item > img {
				height: 115px;
				text-align: center;
			}
			
			.h3, h3 {
				text-align: center;
				margin-top: 10px;
				font-size: 20px;
			}
		}
    </style>
    
</head>
<body>
<%@ include file="include/header.jsp" %>
   
<section>
    <div class="container-fluid">
        <div class="row">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="resources/img/img1.jpg" alt="Los Angeles">
                    </div>

                    <div class="item">
                        <img src="resources/img/img2.jpg" alt="Chicago">
                    </div>

                    <div class="item">
                        <img src="resources/img/img3.jpg" alt="New york">
                    </div>

                    <div class="item">
                        <img src="resources/img/img4.jpg" alt="Busan">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</section>
   
<section>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h3>상품목록</h3>
            </div>
        </div>
        <div class="row">
            <!--xs사이즈에서 12칸 xs보다 커도 12칸(1개씩 보장)-->
            <ul class="col-xs-12 prod-list">
                <li class="col-sm-6 col-md-4">
                    <a href="##" class="prod-link">
                        <img src="resources/img/d1.jpg">

                        <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                        <span class="hover">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                    </a>
                </li>
                <li class="col-sm-6 col-md-4">
                    <a href="##" class="prod-link">
                        <img src="resources/img/d2.jpg">

                        <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                        <span class="hover">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                    </a>
                </li>
                <li class="col-sm-6 col-md-4">
                    <a href="##" class="prod-link">
                        <img src="resources/img/d3.jpg">

                        <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                        <span class="hover">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                    </a>
                </li>
                <li class="col-sm-6 col-md-4">
                    <a href="##" class="prod-link">
                        <img src="resources/img/d4.jpg">

                        <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                        <span class="hover">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                    </a>
                </li>
                <li class="col-sm-6 col-md-4">
                    <a href="##" class="prod-link">
                        <img src="resources/img/d5.jpg">

                        <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                        <span class="hover">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                    </a>
                </li>
                <li class="col-sm-6 col-md-4">
                    <a href="##" class="prod-link">
                        <img src="resources/img/d6.jpg">

                        <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                        <span class="hover">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                    </a>
                </li>
                <li class="col-sm-6 col-md-3">
                    <a href="##" class="prod-link">
                        <img src="resources/img/d7.jpg">

                        <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                        <span class="hover">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                    </a>
                </li>
                <li class="col-sm-6 col-md-3">
                    <a href="##" class="prod-link">
                        <img src="resources/img/d8.jpg">

                        <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                        <span class="hover">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                    </a>
                </li>
                <li class="col-sm-6 col-md-3">
                    <a href="##" class="prod-link">
                        <img src="resources/img/d9.jpg">

                        <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                        <span class="hover">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                    </a>
                </li>
                <li class="col-sm-6 col-md-3">
                    <a href="##" class="prod-link">
                        <img src="resources/img/d10.jpg">

                        <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                        <span class="hover">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

</section>
  
<%@ include file="include/footer.jsp" %>

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
</script>
</body>
</html>