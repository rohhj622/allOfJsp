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
	<table border ="1" style="text-align:center; width:30rem ;">
		<tr>
			<td>부서번호</td>
			<td>부서이름</td>
			<td>근무지</td>
		</tr>
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/CjspDB?"+
					"useSSL=false&serverTimezone=UTC";
			
			String id = "root";
			String pw = "shguswls12";
			
			String sql = "select * from dept";
			
			conn = DriverManager.getConnection(jdbcDriver,id,pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				out.println("<tr><td>");
				out.println(rs.getString("deptNo")+"</td><td>");
				out.println(rs.getString("deptName")+"</td><td>");
				out.println(rs.getString("deptLoc")+"</td></tr>");
				
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
			
		%>
	</table>
</body>
</html>