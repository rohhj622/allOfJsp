<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic - AdminReservation</title>

</head>
<body>
<%
	int weekday; //0~4 평일, 5~6 주말
	String isWeek;
	String instrument;

	/* 
		1. 날짜 클릭한거에 맞춰서 그사람의 내역 보여주기.
		
	*/
	
	String mem_id = session.getAttribute("mem_id").toString();
	String year = request.getParameter("y");
	String  month = request.getParameter("m");
	String inst = request.getParameter("instrument");
	System.out.println(inst);
	
	if(month!=null && Integer.parseInt(month)<10){
		month = "0" +month;
	}
	
	System.out.println(month);
	
	String day = request.getParameter("day");
	
	if(day ==null){
		return;
	}else if(day!=null && Integer.parseInt(day)<10){
		day = "0" +day;
	}
	
	String date = year+ month+ day;
	System.out.println("선택 날 : "+date);
%>
	<!-- 날짜 보이기  -->
	<p><%=date %></p>
	드럼
<% 
	request.setCharacterEncoding("utf8"); 
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	try{
		/* 1 Drum */
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		//String sql = "select * from SkyMusic.academy where acd_no in(select acd_no from SkyMusic.reservation where res_date = '"+date+"' order by acd_startTime);";
		String  sql = "SELECT mem_name,acd_startTime,acd_endTime,mem_instrument"+
						" FROM SkyMusic.reservation natural join SkyMusic.member natural join SkyMusic.academy "+
						"where res_date ='"+date+"' and SkyMusic.reservation.acd_no like 'D%' order by acd_startTime,mem_name";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		/* 예약 내역이 없이비어있다면  */
		if(rs.next()==false){
%>
			<p>예약내역이 없습니다.</p>
<% 
		}
		else{
			do{
				String text = rs.getString("acd_startTime")+" // "+rs.getString("mem_name") ;
				
				/* 내역 찍어주기  */
%>
				<p><%=text %></p>
				
<% 
			}while(rs.next());
		}
		out.println("<hr>");
		out.println("기타");
		
		/* 2.guitar */
		String sql2 = "SELECT mem_name,acd_startTime,acd_endTime,mem_instrument"+
				" FROM SkyMusic.reservation natural join SkyMusic.member natural join SkyMusic.academy "+
						"where res_date ='"+date+"' and SkyMusic.reservation.acd_no like 'G%' order by acd_startTime,mem_name";
		pstmt = conn.prepareStatement(sql2);
		rs = pstmt.executeQuery(sql2);
		
		/* 예약 내역이 없이비어있다면  */
		if(rs.next()==false){
		%>
			<p>예약내역이 없습니다.</p>
		<% 
		}
		else{
			do{
				String text = rs.getString("acd_startTime")+" // "+rs.getString("mem_name") ;
				
				/* 내역 찍어주기  */
		%>
				<p><%=text %></p>
				
		<% 
			}while(rs.next());
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
	}catch(SQLException e){
		System.out.println("1:"+e);
		
	}
	

	
%>
</body>
</html>