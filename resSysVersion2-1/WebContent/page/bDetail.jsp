<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic - Board Detail </title>
</head>
<body>
	<table border ="1">
		<tr >		
		<%
			String mem_id = session.getAttribute("mem_id").toString();
			if(mem_id.equals("admin")){
		%>
					<td>
						<jsp:include page="../header/adminMenu.jsp"/>
					</td>
		<%
			}
			else{
		%>
					<td>
						<jsp:include page="../header/menu.jsp"/>
					</td>
		<%
			}
		%>
			
		</tr>
		<tr>
			<td>
				<jsp:include page="./detail.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>