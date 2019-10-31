<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login </title>
<style>
	p{
		font-size:20px;
	}
</style>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");

		try{
			if(id.equals("admin")||pw.equals("adminpw")){ %>
				<p>로그인에 성공하셨습니다!</p>
			<% }
			else{ %>
				<p>로그인에 실패하셨습니다.</p>
			<% }
		}catch(Exception e){
			
		}
	%>
		

</body>
</html>	