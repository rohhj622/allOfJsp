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
	System.out.println("hi chkres1");
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
	System.out.println("chkres2"+date);
	String acd_no = request.getParameter("acd_no"); // 선택한 날짜 시간에 연습실 번호 
	String acd_startTime = request.getParameter("acd_startTime"); // 그 시작 시간 
	
	//acd_startTime = acd_startTime.substring(0,2);
	
	Calendar cal = Calendar.getInstance();
	Date now = new Date();

	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sf2 = new SimpleDateFormat("HH:mm:ss");

	
  	
    int i = 0;

    //String acd_no2 = acd_no.substring(0,1) + acd_no.substring(acd_no.length()-2,acd_no.length());
    
    
	
	/* 
		취소하기
		1. 오늘날짜가 취소하려는 날짜 인지 확인하기. // 맞으면 패널티 +1 , 아니면 그대로 
		2. 취소 유무 물어보고 한다하면 내역에서 지우기 & 패널티 처리하기.
		
	*/
	

	String okP = "false"; // true -> penalty-1
	
	if(date.equals(sf.format(now))){
		okP = "true"; //페널티 받지만 취소할거.
%>
		<script>
			var con = confirm("지금 취소하시면 페널티 1점이 추가됩니다.\n 진행하시겠습니까? (현재 패널티 : "+<%=penalty%>+" 점)");
			
			var date2="<%=date%>";
			Console.log(date2);
			var acd_no3="<%=acd_no%>";
			var acd_startTime2="<%=acd_startTime%>";
			var okP2=<%=okP%>;
			
			if(con==true){	
				location.href="./chkRes3.jsp?date="+date2+"&acd_no="+acd_no3
								+"&acd_startTime="+acd_startTime2+"&okP="+okP2;
			}else{
				location.href="../page/user02.jsp";	
			}
		</script>	
<% 
	}
	else{
%>	
		<script>	

				var date2="<%=date%>";
				var acd_no3="<%=acd_no%>";
				var acd_startTime2="<%=acd_startTime%>";
				var okP2=<%=okP%>;

				location.href="./chkRes3.jsp?date="+date2+"&acd_no="+acd_no3+
						"&acd_startTime="+acd_startTime2+"&okP="+okP2;

		</script>
<% 	
	}
%>


	
	

</body>
</html>