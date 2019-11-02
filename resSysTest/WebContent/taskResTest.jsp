<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.PreparedStatement"%>
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
	String mem_id = "rohhj622";
	
	String instrument = "Drum";
	String date = "2019-11-03";
	String isWeek = "false";
	String text = "D-w2";
	
	boolean isdone = false;
	
	String state = "using";
	
	System.out.println(date+instrument+text);
	
	
	int i = 0;
		
	
	request.setCharacterEncoding("utf8"); 
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	
	try{
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql0 = "select mem_penalty from SkyMusic.member where mem_id='"+mem_id+"'";
		PreparedStatement pstmt0 =  conn.prepareStatement(sql0);
		ResultSet rs = pstmt0.executeQuery(sql0);
		
		if(rs.getInt(1) == 5){
%>
			<script type="text/javascript">
				alert("페널티 5점으로 예약이 불가합니다. ");
				history.go(-1);
			</script>	
<%		
			
		}else{
			
		}

	}catch(SQLException e){
		System.out.println(e);
	}
	
	
	

%>
	
</body>
</html>