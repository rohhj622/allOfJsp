<%@page import="week11.Emp"%>
<%@page import="java.util.ArrayList"%>
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
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String jdbcDriver ="jdbc:mysql://localhost/CjspDB?characterEncoding=UTF-8 & serverTimezone=UTC & usessl=false";
					//"jdbc:mysql://localhost:3306/CjspDB?serverTimezone=UTC";
			
			String id = "root";
			String pw = "shguswls12";
			
			String sql = "select * from emp";
			
			conn = DriverManager.getConnection(jdbcDriver,id,pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			ArrayList<Emp> list = new ArrayList<Emp>();
			
			while(rs.next()){
				Emp emp = new Emp();
				emp.setEmpNo(rs.getString(1));
				emp.setEmpName(rs.getString(2));
				emp.setEmpDept(rs.getString(3));
				emp.setEmpJob(rs.getString(4));
				emp.setEmpSal(rs.getInt(5));
				list.add(emp);
			}
			request.setAttribute("list", list);
			
			rs.close();
			stmt.close();
			conn.close();
			
			RequestDispatcher rd = request.getRequestDispatcher("queryEmpResult.jsp");
			rd.forward(request, response);
			
			
			
			
		%>
	
</body>
</html>