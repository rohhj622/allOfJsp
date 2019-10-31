<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="400" cellpadding="0" cellspacing="0" >
		
		<tr>
			<td colspan="2"><jsp:include page="top.jsp" flush="false" ></jsp:include> </td>
		</tr>
			
		<tr>
			<td><jsp:include page="/left.jsp" flush="false"></jsp:include> </td>
			
			<td>
				<table border="1" cellpadding="5" cellspacing="5">
					<tr>
						<td>모델번호</td>
						<td>MDOE3</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>10,000,000원</td>
					</tr>
				</table>
				<jsp:include page="infoSub.jsp" flush="false"></jsp:include>
			</td>
		</tr>
			
		<tr>
			<td colspan="2"><jsp:include page="/bottom.jsp" flush="false"></jsp:include> </td>
		</tr>
	
	
	</table>
		
		
</body>
</html>