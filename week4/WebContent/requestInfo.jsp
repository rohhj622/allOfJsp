<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> Client and server info</h3>
	client IP = <%=request.getRemoteAddr() %><br> <!-- IPv6 ver 그래서 0000001 -->
	요청정보 길이 = <%=request.getContentLength() %><br>
	요청정보 인코딩 = <%=request.getCharacterEncoding() %><br>
	요청정보 컨텐츠 타입 = <%=request.getContentType() %><br>
	요청정보 프로토콜 = <%=request.getProtocol() %><br>
	요청정보 전송방식 = <%=request.getMethod() %><br>
	요청 URL = <%=request.getRequestURL() %><br>
	요청 URI = <%=request.getRequestURI() %><br>
	컨텍스트 경로 = <%=request.getContextPath() %><br>
	서버이름 = <%=request.getServerName() %><br>
	서버포트 = <%=request.getServerPort() %><br>
</body>
</html>