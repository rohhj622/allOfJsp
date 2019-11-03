<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="tb3" >
		<tr>
			<td >
				<p id="rsP">예약 하기</p>
				<jsp:include page="includer/menu.jsp"></jsp:include>
				
			</td>
		</tr>
		
		<tr>
			<td class="tb3-td">
				<jsp:include page="/includer/calendar.jsp" flush="false"/>
			</td>
		</tr>
	</table>	
</body>
</html>