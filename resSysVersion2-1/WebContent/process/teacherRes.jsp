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
	request.setCharacterEncoding("utf8"); 	
	//String instrument=null;
	int chkID = 0; // 0 : ㅇㄱ

	/* 
		1. 날짜 클릭한거에 맞춰서 그사람의 내역 보여주기.
		
	*/
	
	String mem_id = session.getAttribute("mem_id").toString();
	String year = request.getParameter("y");
	String  month = request.getParameter("m");
	String instrument=null;
	
	
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
<% 
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	Connection conn =DriverManager.getConnection(url,id,pass);;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String sql0 = "select mem_instrument from SkyMusic.member where mem_id='"+mem_id+"'";
		//System.out.println(mem_id);
		
		pstmt = conn.prepareStatement(sql0);
		rs = pstmt.executeQuery(sql0);
		
		if(rs.next()){
			instrument=rs.getString("mem_instrument");
		}
		
		if(instrument.equals("drum")){
			chkID=1;
		}
		if(instrument.equals("bass")||instrument.equals("guitar")){
			instrument="guitar&bass";
			chkID=2;
		}
		
		if(instrument.equals("piano")||instrument.equals("vocal")){
			instrument="piano&vocal";
			chkID=3;
		}	
		
	}catch(SQLException e){
		System.out.println(e);
	}

	if(chkID==1){
		out.println("드럼");
		try{
			
			//String sql = "select * from SkyMusic.academy where acd_no in(select acd_no from SkyMusic.reservation where res_date = '"+date+"' order by acd_startTime);";
			String  sql = "SELECT mem_name,acd_startTime,acd_endTime,mem_instrument,acd_no,mem_id"+
							" FROM SkyMusic.reservation natural join SkyMusic.member natural join SkyMusic.academy "+
							"where res_date ='"+date+"' and SkyMusic.reservation.acd_no like 'D_a%' order by acd_startTime,mem_name";

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
					String mem_id2= rs.getString("mem_id");
					//System.out.println(acd_startTime);

					String text = rs.getString("mem_name")+" | "+rs.getString("acd_startTime") +"~" +rs.getString("acd_endTime");
	%>

					<form action="../process/teacherChkRes.jsp" onSubmit="return chk()">
						<input type="hidden" name="date" value="<%=date %>">
						<input type="hidden" name="acd_no" value="<%=acd_no %>">
						<input type="hidden" name="acd_startTime" value="<%=acd_startTime %>">
						<input type="hidden" name="mem_id2" value="<%=mem_id2%>">
						<input type="hidden" name="teacherI" value="<%=instrument%>">
						
						<input type="submit" value="<%=text%>"><br>
					</form>
					
	<% 
				}while(rs.next());
			}
			rs.close();
			pstmt.close();
		}catch(SQLException e){
			System.out.println("drum:"+e);
		}

	}else if(chkID==2){
		out.println("<hr>");
		out.println("기타&베이스");
		try{
			String sql2 = "SELECT mem_name,acd_startTime,acd_endTime,mem_instrument,acd_no,mem_id"+
					" FROM SkyMusic.reservation natural join SkyMusic.member natural join SkyMusic.academy "+
							"where res_date ='"+date+"' and SkyMusic.reservation.acd_no like 'G_a%' order by acd_startTime,mem_name";
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
					String mem_id2= rs.getString("mem_id");
					//System.out.println(acd_startTime);

					String text = rs.getString("mem_name")+" | "+rs.getString("acd_startTime") +"~" +rs.getString("acd_endTime");
	%>
					<%-- <p><%=sText %></p> --%>
					<form action="../process/teacherChkRes.jsp" onSubmit="return chk()">
						<input type="hidden" name="date" value="<%=date %>">
						<input type="hidden" name="acd_no" value="<%=acd_no %>">
						<input type="hidden" name="acd_startTime" value="<%=acd_startTime %>">
						<input type="hidden" name="mem_id2" value="<%=mem_id2%>">
						<input type="hidden" name="teacherI" value="<%=instrument%>">
						
						<input type="submit" value="<%=text%>"><br>
					</form>
					
	<% 
				}while(rs.next());
			}
			rs.close();
			pstmt.close();
		}catch(SQLException e){
			System.out.println("drum:"+e);
		}
		
	}else if(chkID==3){
		out.println("<hr>");
		out.println("피아노&보컬");
		try{
			
			String sql3 = "SELECT mem_name,acd_startTime,acd_endTime,mem_instrument,acd_no,mem_id"+
					" FROM SkyMusic.reservation natural join SkyMusic.member natural join SkyMusic.academy "+
							"where res_date ='"+date+"' and SkyMusic.reservation.acd_no like 'P_a%' order by acd_startTime,mem_name";
			pstmt = conn.prepareStatement(sql3);
			rs = pstmt.executeQuery(sql3);
			
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
					String mem_id2= rs.getString("mem_id");
					//System.out.println(acd_startTime);

					String text = rs.getString("mem_name")+" | "+rs.getString("acd_startTime") +"~" +rs.getString("acd_endTime");
	%>
					<%-- <p><%=sText %></p> --%>
					<form action="../process/teacherChkRes.jsp" onSubmit="return chk()">
						<input type="hidden" name="date" value="<%=date %>">
						<input type="hidden" name="acd_no" value="<%=acd_no %>">
						<input type="hidden" name="acd_startTime" value="<%=acd_startTime %>">
						<input type="hidden" name="mem_id2" value="<%=mem_id2%>">
						<input type="hidden" name="teacherI" value="<%=instrument%>">
						
						<input type="submit" value="<%=text%>"><br>
					</form>
					
	<% 
				}while(rs.next());
				
				rs.close();
				pstmt.close();
			}
		}catch(SQLException e){
			System.out.println("drum:"+e);
		}
	}
		
	
	conn.close();
		
	
%>
</body>
</html>