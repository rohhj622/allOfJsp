<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#rsP{
		text-align: center;
		text-decoration:underline;
	}
</style>
</head>
<body>
<%
	String mem_id = session.getAttribute("mem_id").toString();
%>
<table>
	<tr>
		<td colspan="2">
			<!-- Menu -->
			<p id="rsP"> 내역 보기</p>
			<jsp:include page="menu.jsp"/>
		</td>
	</tr>
	<tr>
		<td>
			<!-- Calendar2 // just check reservation. -->
			<jsp:include page="calendar2.jsp" flush="false"/>
		</td>
		<td>
		</td>
	</tr>
</table>
	
	
<%-- 	

	<!-- Reservation Check. -->

<%
	request.setCharacterEncoding("utf8"); 
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	try{
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql = "SELECT * from reservation where res_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,mem_id);
		System.out.println(sql);

		
		ResultSet rs = pstmt.executeQuery();
%>
		내역:<br> <!-- html Code -->
<%
		while(rs.next()){
			String res_id = rs.getString("res_id");
			String res_acdNo = rs.getString("res_acdNo");
			String res_date = rs.getString("res_date");
			String res_state = rs.getString("res_state");
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

  --%>
 
</body>
</html>