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
	<table border ="1" style="text-align:center;">
		<tr>
			<td>사원번호</td>
			<td>사원이름</td>
			<td>근무부서</td>
			<td>업무</td>
			<td>급여</td>
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
			
			String sql = "select * from emp";
			
			conn = DriverManager.getConnection(jdbcDriver,id,pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				out.println("<tr><td>");
				out.println(rs.getString("empNo")+"</td><td>");
				out.println(rs.getString("empName")+"</td><td>");
				out.println(rs.getString("empDept")+"</td><td>");
				out.println(rs.getString("empJob")+"</td><td>");
				out.println(rs.getString("empSal")+"</td></tr>");
				
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
			
		%>
	</table>
</body>
</html>