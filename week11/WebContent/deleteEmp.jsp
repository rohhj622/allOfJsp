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
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String jdbcDriver ="jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC & usessl=false";
				//"jdbc:mysql://localhost:3306/CjspDB?serverTimezone=UTC";
		
		String id = "root";
		String pw = "shguswls12";
		
		String sql = "select * from emp where empNo = "+empno;
		
		conn = DriverManager.getConnection(jdbcDriver,id,pw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		int result = 0;
		if(rs.next()){
			result =1 ;
			request.setAttribute("empno", rs.getString(1));
			request.setAttribute("name", rs.getString(2));
			request.setAttribute("dept", rs.getString(3));
			request.setAttribute("job", rs.getString(4));
			request.setAttribute("sal", rs.getInt(5));
		}

		
		rs.close();
		stmt.close();
		conn.close();
	
				
	%>
	<jsp:forward page="deleteEmpForm.jsp"></jsp:forward>
	
</body>
</html>