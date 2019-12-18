<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyMusic - Chart</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

</head>
<body>

<%
	int mon=0;
	int tue=0;
	int wed=0;
	int thu=0;
	int fri=0;
	int sat=0;
	int sun=0;

	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs  = null;
	
	try{
		conn = DriverManager.getConnection(url,id,pass);
		System.out.println("2");
		/* 요일별 예약  */
		String sql = "select res_date from SkyMusic.reservation group by res_date order by count(*)";
		// 날짜별로 나온 횟수 select 
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery(sql);
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sf2 = new SimpleDateFormat("E"); //요일만 나오게 해줌. 
		System.out.println("3");
		while(rs.next()){
			String str = rs.getString("res_date"); /* 결과로 나온 날짜 가져오기 */
			Date date = sf.parse(str); // 선택한 날짜 
			String day = sf2.format(date); /* 위에format에 맞춰 가져오기. */
			System.out.println("4");
			
			System.out.println(str);
			System.out.println(day);
			System.out.println(date); 
			
			switch(day){
				case "Mon":
					System.out.println(day);
					mon++;
					break;
				case "Tue":
					System.out.println(day);
					tue++;
					break;
				case "Wed":
					System.out.println(day);
					wed++;
					break;
				case "Thu":
					System.out.println(day);
					thu++;
					break;
				case "Fri":
					System.out.println(day);
					fri++;
					break;
				case "Sat":
					System.out.println(day);
					sat++;
					break;
				case "Sun":
					System.out.println(day);
					sun++;
					break;
			}
		}
		
	}catch(SQLException e){
		System.out.println(e);
	}finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
	
	
%>


<!-- 요일별 예약  -->
<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["요일", "횟수", { role: "style" } ],
        ["월요일", <%=mon%>, "#ff6666"],
        ["화요일",  <%=tue%>, "#ff944d"],
        ["수요일",  <%=wed%>, "#ffff4d"],
        ["목요일",  <%=thu%>, "#4dff4d"],
        ["금요일",  <%=fri%>, "#99c2ff"],
        ["토요일",  <%=sat%>, "#4d4dff"],
        ["일요일",  <%=sun%>, "#a64dff"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "요일별 차트",
        bar: {groupWidth: "80%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
  </script>
<div id="columnchart_values" style="width: 500px; height: 300px;"></div>

</body>
</html>