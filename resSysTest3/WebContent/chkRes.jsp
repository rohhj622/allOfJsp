<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.Date" %>  
<%@ page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sf2 = new SimpleDateFormat("HH:mm:ss");

	
	/* 
		취소하기
		1. 오늘날짜가 취소하려는 날짜 인지 확인하기. // 맞으면 패널티 +1 , 아니면 그대로 
		2. 취소 유무 물어보고 한다하면 내역에서 지우기 & 패널티 처리하기.
		
	*/
	
	/* 0 */
/* 	Date nowD = sf.parse(sf.format(now)); //지금 날짜 
	Date selD = sf.parse(date); // 선택한 날짜 
	
	long subR = selD.getTime() - nowD.getTime();
	
	if(subR<0){
		System.out.println("검사");

		<script>
			alert("이미 지나간 날짜는 취소가 불가합니다.");
			location.href="test02.jsp";	
		</script>
	
	} */
	
	
	
	/* 1 */
	/* 이미 지나간 시간대 선택  */
	Date a = sf2.parse(acd_startTime); // 예약한 시간 
	Date b = sf2.parse(sf2.format(now)); // 현재 시간 
	
	if(a.getTime()-b.getTime()<0 && date.equals(sf.format(now))){	
%>
		<script>
			alert("이미 지나간 시간입니다.");
			location.href="test02.jsp";
		</script>
<% 		
	}
	
	boolean okP = false; // true -> penalty-1

	if(date.equals(sf.format(now))){
		okP = true; //페널테 받지만 취소할거.
%>
		<script>
			var con = confirm("지금 취소하시면 페널티 1점이 추가됩니다.\n 진행하시겠습니까? (현재 패널티 : "+<%=penalty%>+" 점)");
			
			if(con==false){
				location.href="test02.jsp";				
			}
		</script>
		
<% }
	else{
%>	
		<script>				
				var con = confirm("취소하시겠습니까?");
				
				if(con==false){
					location.href="test02.jsp";				
				}
				
		</script>
<%	
	}
	
	/* 2 */
	//본격 지우기 시작.
	
	try{
		/* 일단 지움. */
		String sql1 = "delete from SkyMusic.reservation where mem_id = '"+mem_id+"' and res_date='"+date+"' and acd_no='"+acd_no+"'";
		pstmt = conn.prepareStatement(sql1);
		
		pstmt.executeUpdate(sql1);	
	
		if(true == okP){
			String sql2 = "update SkyMusic.member set mem_penalty = mem_penalty+1 where mem_id='"+mem_id+"'";
			pstmt = conn.prepareStatement(sql2);			
			pstmt.executeUpdate(sql2);	
		}

		rs.close();
		pstmt.close();
		conn.close();
%>
		<script>
			alert("취되었습니다.(현재 패널티 : "+<%=penalty%>+" 점)");
			location.href="test02.jsp";
		</script>
<% 			
	}
	catch(SQLException e){
		System.out.println(e);
	}
	
	
%>


	
	

</body>
</html>