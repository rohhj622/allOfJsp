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
	System.out.println("chk3");
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
	System.out.println(date);
	String acd_no = request.getParameter("acd_no"); // 선택한 날짜 시간에 연습실 번호 
	String acd_startTime = request.getParameter("acd_startTime"); // 그 시작 시간 
	String okP = request.getParameter("okP");//페널티 받는지 안받는지
	
	//acd_no = acd_no.substring(0,1)+"-"+acd_no.substring(acd_no.length()-2,acd_no.length());
	//acd_startTime = acd_startTime+":00:00";
	System.out.println(acd_startTime);
	
	
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

	/* 2 */
	//본격 지우기 시작.
	boolean pStart = false; // 페널티 받기 시작하는지 알려줌. false면 안받아.
	try{
		/* 일단 지움. */
		String sql1 = "delete from SkyMusic.reservation where mem_id = '"+mem_id+"' and res_date='"+date+"' and acd_no='"+acd_no+"'";
		pstmt = conn.prepareStatement(sql1);	
		pstmt.executeUpdate(sql1);	
		System.out.println("지웠어.");
		
		/* 당일 취소로, 페널티 점수 1점 추가. */		
		if(okP.equals("true")){
			String sql2 = "update SkyMusic.member set mem_penalty = mem_penalty+1 where mem_id= '"+mem_id+"' ";
			pstmt = conn.prepareStatement(sql2);			
			pstmt.executeUpdate(sql2);	
			
			/* 업뎃 된 페널티 가져오기  */
			String sql3 = "select mem_penalty from SkyMusic.member where mem_id= '"+mem_id+"' ";
			pstmt = conn.prepareStatement(sql3);	
			rs = pstmt.executeQuery(sql3);	
			if(rs.next()){
				penalty = rs.getInt(1);
			}
			System.out.println("업뎃 . "+penalty);
			
			if( penalty == 5 ){
				/* 업뎃된 페널티가 5점이면, 현재날짜 +7 한 date를 mem_pDate에 넣기. mem_accP에 페널티값 넣고, 현재 페널티는 0으로 변경. */
				/* mem_pDate : 예약을 할수있게되는 날. mem_accP:그 사람의 누적 페널티. mem_penalty : 페널티 저장.  */
				
				System.out.println("들으어옴. "+penalty);
				 
				String sql4 = "update SkyMusic.member set mem_pDate = '"+pDate+"' where mem_id= '"+ mem_id +"' ";				
				pstmt = conn.prepareStatement(sql4);			
				pstmt.executeUpdate(sql4);	
				
				sql4 = "update SkyMusic.member set mem_accP = mem_accP + 5 where mem_id= '"+ mem_id +"' ";				
				pstmt = conn.prepareStatement(sql4);				
				pstmt.executeUpdate(sql4);			

				sql4 = "update SkyMusic.member set mem_penalty = 0 where mem_id= '"+ mem_id +"' ";				
				pstmt = conn.prepareStatement(sql4);	
				pstmt.executeUpdate(sql4);	
				
				pStart = true;
				
			}
			
		}

		rs.close();
		pstmt.close();
		conn.close();
		
		/* pStart가 true 라면 이제부터 페널티를 받기 시작한 사람. */
		//System.out.println("과염 " +pStart);
		if(pStart == false){
%>
			<script>
				alert("취소되었습니다.(현재 패널티 : "+<%=penalty%>+" 점)");
				location.href="../page/user02.jsp";
			</script>    
		
<% 		
			
		}
		else{
%>
			<script>
				alert("취소되었습니다.\n 현재 패널티 : "+<%=penalty%>+"점 으로"+<%=pDate%>+" 까지 예약하실 수 없습니다.");
				location.href="../page/user02.jsp";
			</script>    
<%	
		}

		
	}
	catch(SQLException e){
		System.out.println("chkRe3:"+e);
	}
	
	
%>


	
	

</body>
</html>