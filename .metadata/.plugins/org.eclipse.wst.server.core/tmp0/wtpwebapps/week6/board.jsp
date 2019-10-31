<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Date"%>
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
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Date date = new Date();
		long time = date.getTime();
		
		String fileName = time + ".txt";
		String filePath = application.getRealPath("/WEB-INF/Board/"+fileName);
		
		FileWriter writer = new FileWriter(filePath);
		try{
			String str = "title: "+title +"\n";
			str+= "author: " +name +"\n" ;
			str+= content;
			
			writer.write(str);
			
			out.println("saved.");
			
		}catch(IOException e){
			out.println(e);
		}finally{
			writer.close();
		}
	%>
</body>
</html>