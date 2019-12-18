<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function go() {
		<%
			pageContext.forward("NewFile1.jsp");
		%>
	}
	
</script>

</head>
<body>
	<form action="">
	
		<h1>find Me!</h1>
		<input type="button" value="go" onclick="javascript:go()">
	</form>
</body>
</html>