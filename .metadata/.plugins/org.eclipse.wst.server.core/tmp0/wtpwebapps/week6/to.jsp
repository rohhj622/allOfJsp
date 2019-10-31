<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이 페이지는 to.jsp에서 생성한 것. 
	 
	<%
		String id = (String)request.getAttribute("id");
		String passwd = (String)request.getAttribute("passwd");
		String name = (String)request.getAttribute("name");
		String address = (String)request.getAttribute("address");
		String email = (String)request.getAttribute("email");
	%> 
	<h1>기본객체의 속성을 이용한 값 전달 결과 </h1>
	
		id : <%=id %> <br>
		password : <%=passwd %> <br>
		name: <%=name %> <br>
		address : <%=address %> <br>
		email : <%=email %> <br>
	
	
</body>
</html>