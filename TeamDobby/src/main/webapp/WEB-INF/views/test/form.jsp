<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>

	<form action="testForm" name="testForm" id="testForm" method="post" enctype="multipart/form-data">
		<input type="text" name="name" id="name"><br>
		<input type="file" name="file" id="file"><br>
		<input type="submit" value="전송">
		<button type="button" id="test2">비동기</button>
	</form>

<script>
	document.getElementById("test2").onclick = function() {
		var name = document.getElementById("name").value;
		var file = $("#file")[0].files[0];
		var formData = new FormData();
		if(file !== undefined) {
			formData.append("file", file);
		}else {
			formData.append("file", null);
		}
		formData.append("name", name);
		
		console.log(formData)
		$.ajax({
			url: "kjh",
			processData: false,
			contentType: false,
			data: formData,
			type: "post",
			success: function(result) {
				console.log("성공");
			},
			error: function(result) {
				console.log("실패");
			}
			
		})
		console.log(file);
		console.log(name);
	}
</script>
</body>
</html>