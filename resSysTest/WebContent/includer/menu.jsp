<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic-menu</title>
<style type="text/css">
	table{
		margin-left:auto;
    	margin-right:auto;
	}
	#ipM{
	  	background-color: #4CAF50; /* Green */
	  	border: none;
	  	color: white;
	  	padding: 10px 32px;
	  	text-align: center;
	  	text-decoration: none;
	  	display: inline-block;
	  	font-size: 16px;
	  	width:10rem;
	  	
	}
	#sub{
		font-size:2rem;
		font-weight: bold;
		font-style:italic;
		text-align: center;
	}
	

</style>
</head>
<body>

<p id="sub">SkyMusic</p>
<%
	String mem_id= request.getParameter("mem_id");
%>

<table>
	<tr>
		<td>
			<form action="reserve.jsp" method="post">
				<input id="ipM" type="submit" value="예약">
			</form>
		</td>
		<td>
			<form action="reservation.jsp" method="post">
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