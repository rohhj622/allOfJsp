<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cancelling...</title>
</head>
<body>
<%
	String mem_id = session.getAttribute("mem_id").toString();
	String mem_id2 =null;
	
	//System.out.println("mem_id"+mem_id);
	System.out.println("mem_id2"+mem_id2);
	
	
	if(!mem_id.equals(request.getParameter("mem_id2"))){
		mem_id2=request.getParameter("mem_id2"); //r관리자 본인 아님 ㅡㅡ
	}else{
		mem_id2=mem_id; //관리자 아이디랑 같다면
	}
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	Connection conn = DriverManager.getConnection(url,id,pass);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String date = request.getParameter("date"); //선택한 날짜 
	System.out.println("adminchkRes"+date);
	
	String acd_no = request.getParameter("acd_no"); // 선택한 날짜 시간에 연습실 번호 
	String acd_startTime = request.getParameter("acd_startTime"); // 그 시작 시간 
	
%>
	<script>
			var con = confirm("취소하시겠습니까?");
			
			var date2="<%=date%>";
			var acd_no3="<%=acd_no%>";
			var acd_startTime2="<%=acd_startTime%>";
			var mem_id2="<%=mem_id2%>";
			
			if(con==true){	
				location.href="./teacherChkRes2.jsp?date="+date2+"&acd_no="+acd_no3
								+"&acd_startTime="+acd_startTime2+"&mem_id2="+mem_id2;
			}else{
				location.href="../page/admin01.jsp";	
			}
		</script>
	
<% 
	
%>
</body>
</html>