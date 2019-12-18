<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inputEmpProc</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String empno = request.getParameter("empno");
		String name  = request.getParameter("name");
		String dept = request.getParameter("dept");
		String job = request.getParameter("job");
		int sal = Integer.parseInt(request.getParameter("sal"));
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt =  null;
		ResultSet rs = null;
		
		String jdbcDriver = 
				"jdbc:mysql://localhost:3306/CjspDB?serverTimezone=UTC";
		//"jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC"
		
		String id = "root";
		String pw = "shguswls12";
		conn = DriverManager.getConnection(jdbcDriver,id,pw);
		
		String sql = "insert into emp values(?,?,?,?,?)";
		String sqlQ="select * from emp where empNo=?";
		
		pstmt = conn.prepareStatement(sql);		
		//pstmt.setString(1,empno);
		pstmt = conn.prepareStatement(sqlQ);
		rs = pstmt.executeQuery(sqlQ);
		
		int empCheck=0;
		int result=0;
		
		if(rs.next()){
			empCheck=1;
		}
		else{
			pstmt.setString(1,empno);
			pstmt.setString(2,name);
			pstmt.setString(3,dept);
			pstmt.setString(4,job);
			pstmt.setInt(5,sal);
			
			result = pstmt.executeUpdate();
		}
		
		request.setAttribute("result", result);
		request.setAttribute("empCheck", empCheck);
		
		rs.close();
		pstmt.close();
		stmt.close();
		conn.close();
		
	%>
	<jsp:forward page="inputEmpResult.jsp"></jsp:forward>
</body>
</html>