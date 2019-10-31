<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="elResult.jsp">
		id : <input type="text" name="id"><br><BR>
		<hr>
		Select sports<br><br>
		football <input type="checkbox" name="sports" value = "축구"><br>
		basketball <input type="checkbox" name="sports" value = "농구"><br>
		baseball <input type="checkbox" name="sports" value = "야구"><br>
		ping-pong <input type="checkbox" name="sports" value = "탁구"><br>
		<br><br>
		<input type="submit" value="확인">
		<input type="reset" value="취소">
	</form>
</body>
</html>