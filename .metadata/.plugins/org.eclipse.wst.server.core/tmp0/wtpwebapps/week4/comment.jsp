<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- this html page is made by jsp. -->
	
	<!-- 스크립틀릿은 페이지네 소스 보기에서 안보임  -->
	<!--  주석처리해도 아예 소스보기에서 안보임// 보안 구웃~  -->
	
	<%
		int result =1;
		
		/*  1~10 multiply*/
		for(int cnt =1; cnt<=10;cnt++){
			result += cnt;
		}
		
	%>
	<br>
	1~10 multiply! <%-- <%=result %> --%>
	
</body>
</html>