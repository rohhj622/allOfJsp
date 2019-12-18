<%@page import="java.sql.*"%>
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
		String empno = request.getParameter("empno");
		String dept = request.getParameter("dept");
		String job = request.getParameter("job");
		int sal = Integer.parseInt(request.getParameter("sal"));
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String jdbcDriver ="jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC & usessl=false";
				//"jdbc:mysql://localhost:3306/CjspDB?serverTimezone=UTC";
		
		String id = "root";
		String pw = "shguswls12";
		
		String sql = "delete from emp where empNo = ?";
		
		conn = DriverManager.getConnection(jdbcDriver,id,pw);
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,empno);
		
		int result = 0;
		
		
		pstmt.executeUpdate();
		request.setAttribute("result", result);
		request.setAttribute("empno", empno);
		
		pstmt.close();
		conn.close();
		
	
				
	%>
	<jsp:forward page="deleteEmpResult.jsp"></jsp:forward>
</body>
</html>