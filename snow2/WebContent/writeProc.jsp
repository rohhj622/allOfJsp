<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>365CHRISTMAS</title>
</head>
<body>
	<%
		String cdate = request.getParameter("cdate");
		String content = request.getParameter("content");

		
		/* DB */
		Class.forName("com.mysql.cj.jdbc.Driver");	
		String url = "jdbc:mysql://localhost/christmasDB?characterEncoding=UTF-8 & serverTimezone=UTC";
		String id = "HJ";
		String pass = "shguswls12";
		
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		
		try{
			String sql1 = "insert into diary(cdate,content) values('"+cdate+"','"+content+"')";
			pstmt = conn.prepareStatement(sql1);
			
			pstmt.executeUpdate(sql1);
			

			pstmt.close();
			conn.close();
		}
		catch(SQLException e){
			System.out.println(e);
		}
		
		%>
		<script type="text/javascript">
			location.href="writeResult.jsp";
		</script>
		<% 
	
	%>
</body>
</html>