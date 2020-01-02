<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic - AdminReservation</title>
<script type="text/javascript">
	function chk() {
		//var r = confirm("취소 하시겠습니까?");
		var r = true;
		return r;
	}
</script>
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
	
	String date1 = year+"년 "+ month+"월 "+ day+"일";
	String date = year+month+ day;
	System.out.println("선택 날 : "+date);
%>
	<!-- 날짜 보이기  -->
	<p><%=date1 %></p>
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
		String  sql = "SELECT mem_name,acd_startTime,acd_endTime,mem_instrument,acd_no,mem_id"+
						" FROM SkyMusic.reservation natural join SkyMusic.member natural join SkyMusic.academy "+
						"where res_date ='"+date+"' and SkyMusic.reservation.acd_no like 'D_b%' order by acd_startTime,mem_name";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		/* 예약 내역이 없이비어있다면  */
		/* 예약 내역이 없이비어있다면  */
		if(rs.next()==false){
%>
			<p>예약내역이 없습니다.</p>
<% 
		}
		else{
			do{
				String acd_no = rs.getString("acd_no");
				String acd_startTime =rs.getString("acd_startTime"); 
				//System.out.println(rs.getString("mem_id"));

				String text = rs.getString("mem_name")+" | "+rs.getString("acd_startTime") +"~" +rs.getString("acd_endTime");
%>
				<%-- <p><%=sText %></p> --%>
				<form action="../process/chkRes.jsp" onSubmit="return chk()">
					<input type="hidden" name="date" value="<%=date %>">
					<input type="hidden" name="acd_no" value="<%=acd_no %>">
					<input type="hidden" name="acd_startTime" value="<%=acd_startTime %>">
					<input type="hidden" name="mem_id" value="<%=rs.getString("mem_id")%>">
					
					<input type="submit" value="<%=text%>"><br>
				</form>
				
<% 
			}while(rs.next());
		}
		out.println("<hr>");
		out.println("기타&베이스");
		
		/* 2.guitar */
		String sql2 = "SELECT mem_name,acd_startTime,acd_endTime,mem_instrument,acd_no,mem_id"+
				" FROM SkyMusic.reservation natural join SkyMusic.member natural join SkyMusic.academy "+
						"where res_date ='"+date+"' and SkyMusic.reservation.acd_no like 'G_b%' order by acd_startTime,mem_name";
		pstmt = conn.prepareStatement(sql2);
		rs = pstmt.executeQuery(sql2);
		
		/* 예약 내역이 없이비어있다면  */
		/* 예약 내역이 없이비어있다면  */
		if(rs.next()==false){
%>
			<p>예약내역이 없습니다.</p>
<% 
		}
		else{
			do{
				String acd_no = rs.getString("acd_no");
				String acd_startTime =rs.getString("acd_startTime"); 
				System.out.println(acd_startTime);

				String text = rs.getString("mem_name")+" | "+rs.getString("acd_startTime") +"~" +rs.getString("acd_endTime");
%>
				<%-- <p><%=sText %></p> --%>
				<form action="../process/chkRes.jsp" onSubmit="return chk()">
					<input type="hidden" name="date" value="<%=date %>">
					<input type="hidden" name="acd_no" value="<%=acd_no %>">
					<input type="hidden" name="acd_startTime" value="<%=acd_startTime %>">
					<input type="hidden" name="mem_id" value="<%=rs.getString("mem_id")%>">
					
					<input type="submit" value="<%=text%>"><br>
				</form>
				
<% 
			}while(rs.next());
		}
		out.println("<hr>");
		out.println("피아노&보컬");
		
		/* 2.guitar */
		String sql3 = "SELECT mem_name,acd_startTime,acd_endTime,mem_instrument,acd_no,mem_id"+
				" FROM SkyMusic.reservation natural join SkyMusic.member natural join SkyMusic.academy "+
						"where res_date ='"+date+"' and SkyMusic.reservation.acd_no like 'P_b%' order by acd_startTime,mem_name";
		pstmt = conn.prepareStatement(sql3);
		rs = pstmt.executeQuery(sql3);
		
		/* 예약 내역이 없이비어있다면  */
		/* 예약 내역이 없이비어있다면  */
		if(rs.next()==false){
%>
			<p>예약내역이 없습니다.</p>
<% 
		}
		else{
			do{
				String acd_no = rs.getString("acd_no");
				String acd_startTime =rs.getString("acd_startTime"); 
				System.out.println(acd_startTime);

				String text = rs.getString("mem_name")+" | "+rs.getString("acd_startTime") +"~" +rs.getString("acd_endTime");
%>
				<%-- <p><%=sText %></p> --%>
				<form action="../process/chkRes.jsp" onSubmit="return chk()">
					<input type="hidden" name="date" value="<%=date %>">
					<input type="hidden" name="acd_no" value="<%=acd_no %>">
					<input type="hidden" name="acd_startTime" value="<%=acd_startTime %>">
					<input type="hidden" name="mem_id" value="<%=rs.getString("mem_id")%>">
					
					<input type="submit" value="<%=text%>"><br>
				</form>
				
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