<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic-menu</title>

</head>
<body>

<p id="sub">SkyMusic</p>
<%
	String mem_id= request.getParameter("mem_id");
%>

<table>
	<tr>
		<td>
			<form action="test01.jsp" method="post">
				<input id="ipM" type="submit" value="예약">
			</form>
		</td>
		<td>
			<form action="test02.jsp" method="post">
				<input id="ipM" type="submit" value="내역" >
			</form>	
		</td>
		<td>
			<form action="reservation.jsp" method="post">
				<input id="ipM" type="submit" value="공지사항" >
			</form>	
		</td>
	</tr>
</table>

<hr>
</body>
</html>