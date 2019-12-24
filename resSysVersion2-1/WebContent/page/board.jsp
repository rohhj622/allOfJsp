<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	
</style>
<title>SkyMusic - Board</title>
</head>
	<table border ="1" class="tb">
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
				<jsp:include page="read.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>