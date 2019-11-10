<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Reservation Check. -->

<%
	request.setCharacterEncoding("utf8"); 
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	try{
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql = "SELECT * from reservation where mem_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,"rohhj622");
		System.out.println(sql);

		
		ResultSet rs = pstmt.executeQuery();
%>
		내역:<br> <!-- html Code -->
<%
		while(rs.next()){
			String res_id = rs.getString("mem_id");
			String res_acdNo = rs.getString("acd_no");
			String res_date = rs.getString("res_date");
			String res_state = rs.getString("res_state");
			String res_count = rs.getString("res_count");
%>
			<%=res_id %>//<%=res_acdNo %>//<%=res_date %>//<%=res_state %><br>
			
<% 		}

		pstmt.close();
		pstmt.close();
		conn.close();
		
	}catch(SQLException e){
		out.println(e.toString());
	}
%>

</body>
</html>