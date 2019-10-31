<%@page import="java.util.Enumeration"%>
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
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
	%>
	
	<h3>request Parameter</h3>
	name parameter = <%=name %><br>
	address parameter = <%=addr %><br>
	
	<h3>getParameterValues() method print</h3>
	
	<%
		String[] pet = request.getParameterValues("pet"); /* 몇개가 넘어올지 모르니까 배열로 받음 */
		if(pet != null){
			for(int i = 0; i< pet.length; i++){
				out.println(pet[i]); /* out:  html instantly spread content. */
			}	
		}
	%>
	
	<h3>getParameterNames() method print</h3>
	<!-- 요청한 파라메터들만불러옴  -->
	<%
		Enumeration paramEnum = request.getParameterNames(); 
	
		while(paramEnum.hasMoreElements()){
			String names = (String)paramEnum.nextElement();
			out.println(names);
		}
		
	%>
	
</body>
</html>