<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이 페이지는 from.jsp가 생성한 것.
	<%
		request.setCharacterEncoding("utf-8"); 
		request.setAttribute("id","admin");
		request.setAttribute("passwd","adminpw");
		request.setAttribute("name","노현진");
		request.setAttribute("address","Gunpo");
		request.setAttribute("email","rohhj622@naver.com");
	%>
	
	
	<jsp:forward page="/to.jsp"></jsp:forward>
	<!-- 주소는 from 으로 뜸. -->
	
	
</body>
</html>