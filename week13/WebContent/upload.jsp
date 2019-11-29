<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	
	String fileSave = "/fileSave";
	String real = application.getRealPath(fileSave);
	
	//파일최대 크기
	int max = 1024 * 1024 * 10;
	
	//파라미터 (요청,저장위치,한글코드,같은이름파일이 들어올경우 규칙)
	MultipartRequest mr = new MultipartRequest(request,real,max,"utf-8",new DefaultFileRenamePolicy());
	
	String title = mr.getParameter("title");
	String writer = mr.getParameter("writer");
	String filename = mr.getParameter("file");
	String original = mr.getFilesystemName("file"); 
	File file = new File(real+"/"+filename);
	int size = (int)file.length();
	
	
	
%>

	제목:<%=title %>
	작성자: <%=writer %>
	파일명:<%=filename %>
	원본명:<%=original %>
	파일크기:<%=size %>
	<%=real %>
	
	
	<img src="<%=real+'/'+filename %>" >
</body>
</html>