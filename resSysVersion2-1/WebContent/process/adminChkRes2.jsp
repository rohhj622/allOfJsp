<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cancelling...</title>
</head>
<body>
<%
	String mem_id = session.getAttribute("mem_id").toString();

	String date = request.getParameter("date");
	String acd_no = request.getParameter("acd_no");
	String mem_id2 = request.getParameter("mem_id2");
	String acd_startTime = request.getParameter("acd_startTime"); // 그 시작 시간 
	
	//System.out.println("mem_id"+mem_id);
	//System.out.println("mem_id2"+mem_id2);
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	Connection conn = DriverManager.getConnection(url,id,pass);
	
	PreparedStatement pstmt = null;

	
	try{
		/* 일단 지움. */
		String sql1 = "delete from SkyMusic.reservation where mem_id = '"+mem_id2+"' and res_date='"+date+"' and acd_no='"+acd_no+"'";
		pstmt = conn.prepareStatement(sql1);	
		pstmt.executeUpdate(sql1);	
		System.out.println("지웠어.");
	}catch(SQLException e){
		System.out.println("adminChkRes2:"+e);
	}
	
	pstmt.close();
	conn.close();
	
	
%>
	<script>
				alert("취소되었습니다.");
				location.href="../page/admin01.jsp";
	</script>

</body>
</html>