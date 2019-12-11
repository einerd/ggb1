<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>파라미터값 받기 (화면요청 : 컨패스/request/req_ex02)</h2>
	
	<form action="param" method="post">
	
		ID : <input type="text" name="id"><br>
		PW : <input type="password" name="pw"><br>
		Name : <input type="text" name="name"><br>
		Age : <input type="text" name="age"><br>
		
		<input type="checkbox" name="interest" value="java">Java
		<input type="checkbox" name="interest" value="jsp">JSP
		<input type="checkbox" name="interest" value="spring">Spring
		
		
		<br>
		<input type="submit" value="전송">
		
	</form>
	
	<h2>여러파라미터 전달2</h2>
	
	<form action="param2" method="post">
		<input type="checkbox" name="interest" value="java">Java
		<input type="checkbox" name="interest" value="jsp">JSP
		<input type="checkbox" name="interest" value="spring">Spring
		
		<br>
		<input type="submit" value="전송">
	</form>

</body>
</html>