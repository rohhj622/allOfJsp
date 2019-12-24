<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.Date" %>  
<%@ page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cancelling...</title>
</head>
<body>
<%!
	int penalty =0;
%>
<%
	String mem_id = session.getAttribute("mem_id").toString();

	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	Connection conn = DriverManager.getConnection(url,id,pass);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		/* 1 */
		/* 현재 페널티 가져오기.  */
		String sql = "select mem_penalty from SkyMusic.member where mem_id = '"+mem_id+"'";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();	
		
		
		if(rs.next()){
			penalty = rs.getInt(1);
		}
		
	}
	catch(SQLException e){
		System.out.println(e);
	}

	String date = request.getParameter("date"); //선택한 날짜 
	String acd_no = request.getParameter("acd_no"); // 선택한 날짜 시간에 연습실 번호 
	String acd_startTime = request.getParameter("acd_startTime"); // 그 시작 시간 
	
	//System.out.println(acd_no);
	Calendar cal = Calendar.getInstance();
	Date now = new Date();

	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sf2 = new SimpleDateFormat("HH:mm:ss");

	/* 페널티 처리를 위한 날짜 설정  */
	cal.setTime(new Date());
	cal.add(Calendar.DATE, 7);	
 
	String pDate = sf.format(cal.getTime()); //혹시나 페널티받을 차례라면 이때 까지 예약못하게 할 날짜 
    
    cal.add(Calendar.DATE, -7); //다시 되돌리기.
    Date mem_pDate  = sf.parse(pDate);/* 페널티 받을 날짜 만들기 date로. */
  	
    int i = 0;

	
	/* 
		취소하기
		1. 오늘날짜가 취소하려는 날짜 인지 확인하기. // 맞으면 패널티 +1 , 아니면 그대로 
		2. 취소 유무 물어보고 한다하면 내역에서 지우기 & 패널티 처리하기.
		
	*/

	
	/* 1 */
	/* 이미 지나간 시간대 선택  */
	Date a = sf2.parse(acd_startTime); // 예약한 시간 
	Date b = sf2.parse(sf2.format(now)); // 현재 시간 
	
	if(a.getTime()-b.getTime()<0 && date.equals(sf.format(now))){	
%>
		<script type="text/javascript">
			alert("이미 지나간 시간입니다.");
			location.href="../page/user02.jsp";
		</script>
<% 
	}else{
%>

		<jsp:forward page="./chkRes2.jsp"></jsp:forward>
<% 
	}
	
%>


	
	

</body>
</html>