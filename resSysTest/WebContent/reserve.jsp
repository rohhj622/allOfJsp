<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic - Reserve</title> 
<style>
	#rsP{
		text-align: center;
		text-decoration:underline;
	}
	.tb4 {
		width:auto;
	}
	.tb3 {
		width:auto;
	}
	.tb4-td{
		width:50px;
	}
	#ipR{
		background-color: #ccf2ff;
	  	border: none;
	  	color: black;
	  	padding: 5px 10px;
	  	text-align: center;
	  	text-decoration: none;
	  	display: inline-block;
	  	font-size: 12px;
	  	width:10rem;
	}
	#d1{
		position: relative;
	}
	
	
</style>
</head>
<body>

<table class="tb3" >
	<tr>
		<td colspan="2">
			<p id="rsP">예약 하기</p>
			<jsp:include page="includer/menu.jsp"></jsp:include>
			
		</td>
	</tr>
	
	<tr>
		<td class="tb3-td">
			<jsp:include page="/includer/calendar.jsp" flush="false"/>
		</td>
	
	
	

<%! 
	//전역변수 선언 
	String instrument = null; //악기 
	String date; //선택한 날짜 저장.
	String mem_id;
	String isWeek; //주말인가 평일인가 

	int weekday;
%>
	
	
<%
	/* request  받아오기. userMain에서 받아옴   */

	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");	
	
	mem_id = session.getAttribute("mem_id").toString();
	date = year+"-" + month +"-"+ day; //선택 날짜
	
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

		ResultSet rs = pstmt.executeQuery();
		
		//선택한 날짜가 주말인지, 평일인지 확인.	
		if(true==rs.next()){
			weekday = rs.getInt(1);
			/* System.out.println(weekday); */
			
			switch(weekday){
				case 0: case 1: case 2: case 3: case 4: 
					isWeek = "true"; // 평일이면 true
					break;
				
				case 5: case 6:
					isWeek = "false"; // 주말이면 false
					break;
			}
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
	}catch(SQLException e){
		System.out.println(e);
	}

	try{
		
		Connection conn = DriverManager.getConnection(url,id,pass);	
		String sql2 = "select mem_instrument from SkyMusic.member where mem_id ='"+mem_id+"'"; 
		PreparedStatement pstmt1 = conn.prepareStatement(sql2);

		ResultSet rs = pstmt1.executeQuery(sql2);
		
		if(rs.next()){
			instrument = rs.getString(1); 
		} 
		
		rs.close();
		pstmt1.close();
		conn.close();
		
	}catch(SQLException e){
		System.out.println(e);
	}
	try{
		Connection conn = DriverManager.getConnection(url,id,pass);
		String sql3;
		String state ="unusing";

		// 평일 이면 true 
		if(isWeek.equals("true")){
			sql3 = "Select * from  SkyMusic.academy where acd_no like '%_d%' and acd_name like '"+instrument+"' and acd_no not in (select distinct acd_no from SkyMusic.reservation where res_date='"+date+"' and res_count=0)";	
		}else{
			/* sql3 = String.format("select * from academy where acd_no like '%_w%' and acd_name like %s%",instrument); */
			sql3 = "Select * from  SkyMusic.academy where acd_no like '%_w%' and acd_name like '"+instrument+"' and acd_no not in (select distinct acd_no from SkyMusic.reservation where res_date='"+date+"' and res_count=0)";	
		}
		
		PreparedStatement pstmt2 = conn.prepareStatement(sql3);		
		ResultSet rs = pstmt2.executeQuery(sql3);
		

%>
<td>
	<p id="d1"><%=date %></p>
	
<table class="tb4">	
<%		

		while(rs.next()){			
			String text = rs.getString("acd_no")+"||" + rs.getString("acd_startTime") +"~" +  rs.getString("acd_endTime");	
			
			String sText = instrument +" | "+ rs.getString("acd_startTime") +"~" +  rs.getString("acd_endTime");
%>
	<tr>
		<td class="tb4-td">
			<form name="form1" action="taskResTest.jsp" method="post" onsubmit="return doRes()">
				<input type="hidden" name="date" value="<%=date %>">
				<input type="hidden" name="mem_instrument" value="<%=instrument %>">
				<input type="hidden" name="isWeek" value="<%=isWeek %>">
				<input type="hidden" name="text" value="<%=text %>">
				
				<input id="ipR" type="submit" value="<%=sText %>" ><br>
			</form>
		</td>
	</tr>
<% 		
		}

		pstmt2.close();
		conn.close();
		
	}catch(SQLException e){
		System.out.println("2"+e);
	}
%>
</table>
</td>	
</tr>
</table>
<script>
	function doRes(){
		var form1 = document.form1;	
		if (confirm("예약하시겠습니까?")){    //확인
			return true;

		 }else{   //취소
			return false;
		 }
	}
</script>	

	
</body>
</html>