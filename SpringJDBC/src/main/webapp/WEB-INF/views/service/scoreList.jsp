<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>리스트</h2>
	<c:forEach var="list" items="${scoreList }" varStatus="num">
	번호 : ${list.num } <!-- items의 인덱스 번호 -->
	이름 : ${list.name }
	국어 : ${list.kor }
	영어 : ${list.eng }
	수학 : ${list.math }
	<button type="button" id="deleteBtn" onclick="location.href='scoreDelete?num=${list.num}'">삭제</button><br>
	</c:forEach>
	<br>
	<a href="scoreRegist">점수등록하러가기</a>
	
	<script>
// 		var deleteBtn = document.getElementById("deleteBtn");
// 		deleteBtn.onclick = function test(){
// 			location.href='scoreDelete';
// 		}
		
	</script>
</body>
</html>