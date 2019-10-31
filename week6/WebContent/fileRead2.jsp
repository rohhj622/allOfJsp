<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<h1>텍스트파일 경로 </h1>
	<%
		
		String path = application.getRealPath("test.txt");
	
		BufferedReader br = new BufferedReader(new FileReader(path));
		while(true){
			String str = br.readLine();
			if(str == null){
				break;
			}else{
				out.println(str+"<br>");
			}
		}
		br.close();
	%>
</body>
</html>