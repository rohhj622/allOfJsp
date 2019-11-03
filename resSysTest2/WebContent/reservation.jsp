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
<%!
	int weekday; //0~4 평일, 5~6 주말
	String isWeek;
	String instrument;
	//String mem_id;
	//String year;
	//String month;
	//String day;
%>
<%
	/* 
		1.날짜 클릭한거에 맞춰서 그사람의 내역 보여주기.
		
	*/
	
	String mem_id = session.getAttribute("mem_id").toString();
	String year = request.getParameter("y");
	String  month = request.getParameter("m");
	
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
	<p><%=date %></p>
<%-- <% 
	request.setCharacterEncoding("utf8"); 
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	try{
		/* 1 */
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql = "select weekDay(?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,date);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			weekday = rs.getInt(1);
			
			System.out.println("weekday: "+weekday);
			
			switch(weekday){
			case 0: case 1: case 2: case 3: case 4: 
				isWeek = "true"; // 평일이면 true
				break;
			
			case 5: case 6:
				isWeek = "false"; // 주말이면 false
				break;
			}
		}
		
		System.out.println(isWeek);
		
		/* 2 */
		String sql2 = "select mem_instrument from SkyMusic.member where mem_id='"+mem_id+"'";
		System.out.println(mem_id);
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(sql2);
		
		if(rs.next()){
			instrument = rs.getString(1);		
		}
		System.out.println(instrument);
		
		/* 3 */
		String sql3;
		if(isWeek.equals("true")){
			System.out.println("i am here");
			sql3="SELECT * FROM SkyMusic.academy where acd_no like '%_d%' and acd_name = '"+instrument
					+"' and acd_no not in (select  acd_no from SkyMusic.reservation where res_date='"+date
					+"' and res_state='using' group by acd_no having count(*) =2) order by acd_startTime";
		}
		else{
			System.out.println("i am here2");
			sql3 = "SELECT * FROM SkyMusic.academy where acd_no like '%_w%' and acd_name = '"+instrument
					+"' and acd_no not in (select  acd_no from SkyMusic.reservation where res_date='"+date
					+"' and res_state='using' group by acd_no having count(*) =2) order by acd_startTime";
		}
		
		pstmt = conn.prepareStatement(sql3);
		rs = pstmt.executeQuery(sql3);
		
		while(rs.next()){
			String text = rs.getString("acd_no")+"||" + rs.getString("acd_startTime") +"~" +  rs.getString("acd_endTime");			
			String sText = instrument +" | "+ rs.getString("acd_startTime") +"~" +  rs.getString("acd_endTime");
%>
			<p><%=sText %></p> --%>
			<form action="chkRes.jsp" onSubmit="return chk()">
				<%-- <input type="hidden" name="date" value="<%=date %>"> --%>
				
				<input type="submit" value="<%=date %>"><br>
			</form>
<%-- 			
<% 			
		}
		
		
	}catch(SQLException e){
		System.out.println("1:"+e);
		
	}
	

	
%> --%>
</body>
</html>