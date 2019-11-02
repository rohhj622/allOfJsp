
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

	<jsp:include page="calendar.jsp" flush="false"/>

<%! 
	//전역변수 선언 
	String instrument = null; //악기 
	int weekday;
	boolean isWeek;
%>	
	
<%
	/* request  받아오기.  */

/* 	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day"); */	
	
	//String mem_id = request.getParameter("mem_id");
	String mem_id = "rohhj622";
	//String date = year+"-" + month +"-"+ day; //선택 날짜
	String date = "19-11-01";
	
	System.out.println(mem_id);
	System.out.println(date);
	
	/*  DB  건드리기  */
	request.setCharacterEncoding("utf8");
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	try{
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql = "SELECT WEEKDAY(?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, date);
		ResultSet rs = pstmt.executeQuery(sql);
		
		if(rs.next()){
			weekday = rs.getInt(1);
		}
		
	}catch(SQLException e){
		System.out.println(e);
	}
	
	
	
	
%>
</body>
</html>