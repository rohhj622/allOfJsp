<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forTokens var="token" items="빨강,주황.노랑,초록.파랑,남색.보라" delims=",.">
		<!-- delims ==> 구분자 뭘로할건지.여러개 가능  -->
		
		${token }
	</c:forTokens> 
</body>
</html>