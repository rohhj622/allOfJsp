<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic - CancelChart</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.js"></script>
</head>
<body>

<table>
	<tr>
		<td>이름</td> <td>페널티(누적포함)</td>
	</tr>

<%
	

	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs  = null;
	//Map<String, String> result = new HashMap<String, String>();
	
	try{
		conn = DriverManager.getConnection(url,id,pass);
		
		/* 요일별 예약  */
		String sql = "select mem_name,mem_penalty+mem_accP as num from SkyMusic.member where mem_id <>'admin' group by mem_id order by 2 desc ";
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery(sql);

		
		while(rs.next()){
			String name = rs.getString("mem_name");			
			String num = rs.getString("num");
			%>
			<tr>
				<td><%=name %></td> <td><%=num %></td>
			</tr>
<% 
		}
 
		
	}catch(SQLException e){
		System.out.println(e);
	}finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
	
	
	
%>
</table>

</body>
</html>