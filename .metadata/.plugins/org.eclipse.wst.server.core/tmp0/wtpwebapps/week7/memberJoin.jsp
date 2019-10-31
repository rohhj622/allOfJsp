<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String strDate = sdf.format(date);
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
	%>
	<!-- 자바빈 객체 생성  -->
	<jsp:useBean id="member" class="week7.MemberInfo" scope="request" />
	<jsp:setProperty property="id" name="member" value="<%=id %>"/>
	<jsp:setProperty property="password" name="member" value="<%=id %>"/>
	<jsp:setProperty property="name" name="member" value="<%=name %>"/>
	<jsp:setProperty property="email" name="member" value="<%=email %>"/>
	<jsp:setProperty property="regDate" name="member" value="<%=strDate%>"/>
	
	<!-- 속성갑을 다 저장해주고 테이블로 뿌려줌  -->
	
	<table border="1" >
		<tr>
			<td>id</td>
			<td><jsp:getProperty property="id" name="member"/></td>
			<td>password</td>
			<td><jsp:getProperty property="password" name="member"/> </td>	
		</tr>
		
		<tr>
			<td>name</td>
			<td><jsp:getProperty property="name" name="member"/> </td>
			<td>email</td>
			<td><jsp:getProperty property="email" name="member"/> </td>			
		</tr>
		
		<tr>
			<td>register Date</td>
			<td colspan="3"><jsp:getProperty property="regDate" name="member"/> </td>		
		</tr>
	</table>
</body>
</html>