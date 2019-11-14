<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectDB</title>
</head>
<body>
<%
	//1. jdbc driver loading
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = null;
	Statement stmt  = null;
	ResultSet rs = null;
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/CjspDB?"+
						"useSSL=false&serverTimezone=UTC";
	String dbUser="root";
	String dbPw="shguswls12";
	String sql = "select * from emp";
	
	//2. DB connection 생성
	conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPw);
	
	//3. Statement 생성 
	stmt = conn.createStatement();
	
	//4. 쿼리 실행 
	rs = stmt.executeQuery(sql);
	
	//5.쿼리 실행 
	if(rs != null){
		out.println("디비 연결 성공 ");
	}else{
		out.println("디비 연결 실패 ");
	}
	//6. 사용한 stmt,rs,conn close
	stmt.close();
	rs.close();
	conn.close();
	
	
%>

</body>
</html>