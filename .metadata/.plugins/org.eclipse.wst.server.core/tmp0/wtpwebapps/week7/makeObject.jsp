<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  자바빈 객체 생성 -->
	<jsp:useBean id="member" class="week7.MemberInfo" scope="request"/> 
	<%
		member.setId("admin");
		member.setName("노현진");
		member.setEmail("admin@naver.com");
	%>
	<jsp:forward page="useObject.jsp"></jsp:forward>
</body>
</html>