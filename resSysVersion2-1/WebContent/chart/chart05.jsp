<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
  <html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
  </head>
  <body>
  <%
 
  	int day[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}; //1호
    int day2[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}; //2호

  
  	Class.forName("com.mysql.cj.jdbc.Driver");	
	String url = "jdbc:mysql://localhost/SkyMusic?characterEncoding=UTF-8 & serverTimezone=UTC";
	String id = "HJ";
	String pass = "shguswls12";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs  = null;
	//Map<String, String> result = new HashMap<String, String>();
	conn = DriverManager.getConnection(url,id,pass);
	
	try{
		/* 기타&베이스 평일 시간 */
		String sql  = "select acd_no ,count(*), acd_startTime"+
					" from SkyMusic.reservation natural join SkyMusic.academy "+
					"where SkyMusic.academy.acd_no like 'P_a%' group by acd_no order by 1";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String str = rs.getString("acd_startTime").substring(0, 2);
			System.out.println(str);
			
			if(str.equals("9")){
				day[0] = rs.getInt("count(*)");
			}else if(str.equals("10")){
				day[1] = rs.getInt("count(*)");
			}
			else if(str.equals("11")){
				day[2] = rs.getInt("count(*)");
			}
			else if(str.equals("12")){
				day[3] = rs.getInt("count(*)");
			}
			else if(str.equals("13")){
				day[4] = rs.getInt("count(*)");
			}
			else if(str.equals("14")){
				day[5] = rs.getInt("count(*)");
			}
			else if(str.equals("15")){
				day[6] = rs.getInt("count(*)");
			}
			else if(str.equals("16")){
				day[7] = rs.getInt("count(*)");
			}
			else if(str.equals("17")){
				day[8] = rs.getInt("count(*)");
			}
			else if(str.equals("18")){
				day[9] = rs.getInt("count(*)");
			}
			else if(str.equals("19")){
				day[10] = rs.getInt("count(*)");
			}
			else if(str.equals("20")){
				day[11] = rs.getInt("count(*)");
			}
			else if(str.equals("21")){
				day[12] = rs.getInt("count(*)");
			}
		}
		
		/*  기타&베이스 서련 빌딩  */
		String sql2  = "select acd_no ,count(*), acd_startTime"+
				" from SkyMusic.reservation natural join SkyMusic.academy "+
				"where SkyMusic.academy.acd_no like 'P_b%' group by acd_no order by 1";
		pstmt = conn.prepareStatement(sql2);
		rs = pstmt.executeQuery(sql2);
		
		while(rs.next()){
			String str = rs.getString("acd_startTime").substring(0, 2);
			System.out.println(str);
			
			if(str.equals("9")){
				day2[0] = rs.getInt("count(*)");
			}else if(str.equals("10")){
				day2[1] = rs.getInt("count(*)");
			}
			else if(str.equals("11")){
				day2[2] = rs.getInt("count(*)");
			}
			else if(str.equals("12")){
				day2[3] = rs.getInt("count(*)");
			}
			else if(str.equals("13")){
				day2[4] = rs.getInt("count(*)");
			}
			else if(str.equals("14")){
				day2[5] = rs.getInt("count(*)");
			}
			else if(str.equals("15")){
				day2[6] = rs.getInt("count(*)");
			}
			else if(str.equals("16")){
				day2[7] = rs.getInt("count(*)");
			}
			else if(str.equals("17")){
				day2[8] = rs.getInt("count(*)");
			}
			else if(str.equals("18")){
				day2[9] = rs.getInt("count(*)");
			}
			else if(str.equals("19")){
				day2[10] = rs.getInt("count(*)");
			}
			else if(str.equals("20")){
				day2[11] = rs.getInt("count(*)");
			}
			else if(str.equals("21")){
				day2[12] = rs.getInt("count(*)");
			}
			
		}
		
		
	}
	catch(SQLException ex){
		System.out.println(ex);
	}finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
  %>
   	<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Time', '1호점', '2호점'],
          ['9',   <%=day[0]%>,  <%=day2[0]%>],
          ['10',  <%=day[1]%>,  <%=day2[1]%>],
          ['11',  <%=day[2]%>,  <%=day2[2]%>],
          ['12',  <%=day[3]%>,  <%=day2[3]%>],
          ['13',  <%=day[4]%>,  <%=day2[4]%>],
          ['14',  <%=day[5]%>,  <%=day2[5]%>],
          ['15',  <%=day[6]%>,  <%=day2[6]%>],
          ['16',  <%=day[7]%>,  <%=day2[7]%>],
          ['17',  <%=day[8]%>,  <%=day2[8]%>],
          ['18',  <%=day[9]%>,  <%=day2[9]%>],
          ['19',  <%=day[10]%>, <%=day2[10]%>],
          ['20',  <%=day[11]%>, <%=day2[11]%>],
          ['21',  <%=day[12]%>, <%=day2[12]%>],
          ['22',  0,    0]
          
        ]);

        var options = {
          title: '학원별 시간 사용량 차트 [피아노]',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
    <div id="curve_chart" style="width:700px; height: 300px"></div>
  </body>
</html>
