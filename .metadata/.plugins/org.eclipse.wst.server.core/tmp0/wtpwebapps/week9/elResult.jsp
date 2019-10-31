<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${param.id },Hello!<br>
	favorite sports : ${paramValues.sports[0] }
					  ${paramValues.sports[1] }
					  ${paramValues.sports[2] }
					  ${paramValues.sports[3] }
</body>
</html>