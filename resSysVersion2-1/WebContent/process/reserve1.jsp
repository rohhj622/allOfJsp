<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>  
<%@ page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function chk() {
		var r = confirm("예약 하시겠습니까?");
		
		return r;
	}
</script>

</head>
<body>
<%!
	
	Boolean isPast = false; // 과거인가?
	String instrument; //사람악기 
	String mem_id;// 그사람 아이디 
	String year;//선택한 년 
	String month;// 선택한 월 
	String day;//선택한 
%>
<%
	String placeNo="2"; // 건물 번호
	/* 
		0. 지난 날짜인지 확인하기.
		1. 선택한 날짜가 주말인지 평일인지 알아내기.  sql
		2. 그 사람의 악기가 무엇인지 알아내기.  sql2
		3. 그 악기와 날짜에 맞춰서 연습실 보여주기. sql3
	*/
	
	mem_id = session.getAttribute("mem_id").toString();
	year = request.getParameter("y");
	month = request.getParameter("m");
	
	if(month!=null && Integer.parseInt(month)<10){
		month = "0" +month;
	}
	
	//System.out.println(month);
	
	day = request.getParameter("day");
	
	if(day ==null){
		return;
	}else if(day!=null && Integer.parseInt(day)<10){
		day = "0" +day;
	}
	
	String date = year+ month+ day;
	
	//System.out.println("선택 날 : "+date);
%>
	<p>서련빌딩</p>
	<p><%=year %>년 <%=month %>월 <%=day %>일</p>
	<p>※ 연습 예약가능한 시간만 화면에 표시됩니다.</p>
<% 
	request.setCharacterEncoding("utf8");
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	
	/* 0 */
	/* 선택한 날짜가 지난 날짜라면? */
			
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	
	Date nowD = sf.parse(sf.format(now)); //지금 날짜 
	Date selD = sf.parse(date); // 선택한 날짜 

	//System.out.println(nowD+"//"+selD);
	
	
	int subR = selD.compareTo(nowD);
	//System.out.println("과연 같은가? "+subR);
	
	if(subR == 0){
		isPast = true; //true 면 오늘 날짜로, 지나간 시간의 연습실은 안보여줄거임.  false면 ㄱㅊ.
	}else if(subR > 0 || subR < 0){
		isPast = false;
	}
	
	try{
		/* 1 */
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		/* 2 */
		String sql2 = "select mem_instrument from SkyMusic.member where mem_id='"+mem_id+"'";
		//System.out.println(mem_id);
		
		PreparedStatement pstmt = conn.prepareStatement(sql2);
		ResultSet rs = pstmt.executeQuery(sql2);
		int acdCnt=0; // 연습실 개수
		
		if(rs.next()){
			instrument = rs.getString(1);		
		}
		
		if(instrument.equals("bass")||instrument.equals("guitar")){
			instrument="guitar&bass";
		}
		
		if(instrument.equals("piano")||instrument.equals("vocal")){
			instrument="piano&vocal";
		}
		
		System.out.println(instrument);
		switch (instrument){
			case "drum":
				acdCnt=3;
				break;
			case "guitar&bass":
				acdCnt=1;
				break;
			case "piano&vocal":
				acdCnt=4;
				break;
		}
		//System.out.println(instrument+":"+acdCnt);
		
		/* 3 */
		String sql3="SELECT * FROM SkyMusic.academy where acd_no like '%_b%' and acd_name = '"+instrument
					+"' and acd_no not in (select acd_no from SkyMusic.reservation where res_date='"+date
					+"' and res_state='using' group by acd_no having count(*) ="+acdCnt+")";
		
		if(isPast){ //오늘 시간이면 지난것을 연습실 안보여줄거임.
			/* today */
			//System.out.println("나 여기." + isPast);
			//sql3 += "and time(acd_startTime) > ('20:00:00') order by acd_startTime";
			
			sql3 += "and time(acd_startTime) > date_format(now(),'%H:00:00') order by acd_startTime";
		}else{
			sql3 += "order by acd_startTime";
		}
		
		pstmt = conn.prepareStatement(sql3);
		rs = pstmt.executeQuery(sql3);
		
		while(rs.next()){
			String text = rs.getString("acd_no");
			String sText = instrument +" | "+ rs.getString("acd_startTime") +"~" +  rs.getString("acd_endTime");
					
%>
			<%-- <p><%=sText %></p> --%>
			<form action="../process/taskRes.jsp" onSubmit="return chk()">
				<input type="hidden" name="date" value="<%=date %>">
				<input type="hidden" name="instrument" value="<%=instrument %>">
				<input type="hidden" name="text" value="<%=text %>">
				<input type="hidden" name="placeNo" value="<%=placeNo %>">
				<%--  --%>
				<input type="submit" value="<%=sText %>"><br>
			</form>
			
<% 			
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