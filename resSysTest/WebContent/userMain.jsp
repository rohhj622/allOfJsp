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
	String mem_id = session.getAttribute("mem_id").toString();
	System.out.println(mem_id);
%>
<div>
	<table>
		<tr>
			<td colspan="2" align="center">
				<jsp:include page="menu.jsp" flush="false"/>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="calendar.jsp" flush="false"/>
			</td>
			<td>
			</td>		
		</tr>
				
	</table>
</div>
</body>
</html>