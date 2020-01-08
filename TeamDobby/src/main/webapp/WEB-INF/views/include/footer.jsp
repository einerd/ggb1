<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-7">
                <div class="copyright">
                    <img src="${pageContext.request.contextPath }/resources/img/logo.svg" width="20">
                    팀도비 | 대표이사: 김도비<br>
                    서울시 송파구 송파대로 570<br>
                    사업자 등록번호 : 120-88-00767<br>
                    통신판매업신고 : 2017-서울송파-0680<br>
                </div>
            </div>
            <!--text-right는 부트스트랩에 정의되어 있는 클래스로 글자 오른쪽 정렬-->
            <div class="col-sm-12 col-md-5" text-right>
                <ul class="footer-menu">
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보취급</a></li>
                </ul>
                <address>서울특별시 금천구 두산로 70 B, 24층<br>
                    Fax : 02-3441-7011 |
                    email : socialrsh@market.com</address>
            </div>
        </div>
    </div>
</footer>