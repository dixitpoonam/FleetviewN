<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headernew1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day Speed Chart</title>
<link rel="stylesheet" href="css/table/jquery-ui.css">
<script src="js/datatable/jquery-ui.js"></script>
<script type="text/javascript" src="js/loader.js"></script>
<script type="text/javascript" src="js/jspdf.min.js"></script>
 <link rel="stylesheet" href="css/table/TemplateCSS.css">
 
 <script type="text/javascript">
$(function () {

$('#cmd').click(function () {
var doc = new jsPDF();
doc.addHTML($('#content')[0], 10, 10, {
'background': '#fff',
'border':'1px solid black',
}, function() {
doc.save('sample-file.pdf');
});
});
});

</script>
</head>
<body>
<%!
	String vehregno, cnt1, cnt2, cnt3, cnt4, cnt5, cnt6, cnt7, thedate, vehcode, thedate1;
	Connection conn;
	String sp = "";
	String dis = "";
%>
<%
		vehregno = request.getParameter("vehregno");
		cnt1 = request.getParameter("cnt1");
		cnt2 = request.getParameter("cnt2");
		cnt3 = request.getParameter("cnt3");
		cnt4 = request.getParameter("cnt4");
		cnt5 = request.getParameter("cnt5");
		cnt6 = request.getParameter("cnt6");
		cnt7 = request.getParameter("cnt7");
		thedate = request.getParameter("thedate");
		vehcode = request.getParameter("vehcode");
		thedate1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(thedate));
%>
<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-6">
							<h3 class="content-header-title  mb-0" style="color: #060637">Speed Statistics</h3>
						</div>
					</div>
				</div>
				<div class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">
							<button id="kt_engage_demos_toggle"
								class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0 btn2">
								<span id="kt_engage_demos_label">Help</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
			   <div style="color:#060637" align="center">The Speed Analysis chart for vehicle <%=vehregno%> on date <%=thedate%></div>
            </div>
			<section class="sectionDash">
				<div class="row">
				   <div class="col-5">
						<div class="p-1">
							<div class="text-left" >
	 						  <button type="button" class="btn btn-success" id="save-pdfPerformance" >Export</button>
	 						</div>
	 						<div id="pie_div"></div>  <!-- Pie chart -->
						</div>
				   </div>		
				   <div class="col-1"></div>
					<div class="col-5">
						<div class="p-1">
								<div class="text-left" >
				 				<button type="button" class="btn btn-success" id="save_chart">Export</button>
							   </div>
				               <div id="line_div"></div> <!-- Line chart -->
				               
		   	           </div>
		           </div>
		      </div> 
		</section>	
		<!-- Pie Chart -->
		  <script type="text/javascript">
				// Load the Visualization API and the piechart package.
				google.load('visualization', '1', {
					'packages' : [ 'piechart' ]
				});
				// Set a callback to run when the API is loaded.
				google.setOnLoadCallback(drawChart);
				// Callback that creates and populates a data table, 
				// instantiates the pie chart, passes in the data and
				// draws it.
				function drawChart() {
					var data = new google.visualization.DataTable();
					data.addColumn('string', 'Task');
					data.addColumn('number', 'Hours per Day');
					data.addRows(7);
					data.setValue(0, 0, 'Below 15 Kmph');
					data.setValue(0, 1,<%=cnt1%>);
					data.setValue(1, 0, '15 to 30 Kmph');
					data.setValue(1, 1,<%=cnt2%>);
					data.setValue(2, 0, '30 to 40 Kmph');
					data.setValue(2, 1,<%=cnt3%>);
					data.setValue(3, 0, '40 to 50 Kmph');
					data.setValue(3, 1,<%=cnt4%>);
					data.setValue(4, 0, '50 to 60 Kmph');
					data.setValue(4, 1,<%=cnt5%>);
					data.setValue(5, 0, '60 to 80 Kmph');
					data.setValue(5, 1,<%=cnt6%>);
					data.setValue(6, 0, 'Above 80 Kmph');
					data.setValue(6, 1,<%=cnt7%>);
					var chart = new google.visualization.PieChart(document
							.getElementById('pie_div'));
					chart.draw(data, {
						 chartArea: {
						      bottom: 24,
						      left: 36,
						      right: 12,
						      top: 48,
						      width: '50%',
						      height: '50%'
					                },
						width : 600,
						height :600,
						is3D : true,
					     title : 'Speed Statistics' 
					});
					
					 var btnSave = document.getElementById('save-pdfPerformance');  
					  google.visualization.events.addListener(chart, 'ready', function () {
					    btnSave.disabled = false;
					  });

					  btnSave.addEventListener('click', function () {
					    var doc = new jsPDF('l', 'mm', [297, 210]);
					    doc.addImage(chart.getImageURI(), 0, 0);
					    doc.save('SpeedStatistics.pdf');
					  }, false);
				}
			</script>
	
                  
		<!-- Pie Chart -->
      <%try {
				Class.forName(MM_dbConn_DRIVER);
				conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
				Statement st = conn.createStatement();

				String sql = "select * from t_veh" + vehcode + " where TheFieldDataDate='" + thedate1
						+ "' and TheFiledTextFileName='SI' order by TheFieldDataTime ";
				ResultSet rst = st.executeQuery(sql);
				sp = "[";
				dis = "[";
				int i = 1;
				int km = 0;
				String chartval="";
				while (rst.next()) {
					if (i == 1) {
						km = rst.getInt("Distance");
					}
					java.util.Date dt = new SimpleDateFormat("HH:mm:ss").parse(rst.getString("TheFieldDataTime"));
					//System.out.println("time"+dt);

					Double tm1 = Double.valueOf(dt.getHours());//+dt.getMinutes()/60;//*60+dt.getMinutes();

					//System.out.println("hrs"+tm1);
					int mins = dt.getMinutes();
					Double min = Double.valueOf(mins) / Double.valueOf(60);

					//System.out.println("mins"+min);
					int secs = dt.getSeconds();
					Double sec = Double.valueOf(secs) / Double.valueOf(3600);
					//System.out.println("secs"+sec);
					Double tm = tm1 + min + sec;
					System.out.println("total-->"+tm);
					
					chartval += "[" + tm + "," + rst.getString("Speed") + ","+(rst.getInt("Distance") - km)+ "],";
					
					
					//sp = sp + "[" + tm + "," + rst.getString("Speed") + "],";
					//System.out.println("[" + tm + "," + rst.getString("Speed") + "],");
					
					//dis = dis + "[" + tm + "," + (rst.getInt("Distance") - km) + "],";
					//System.out.println("[" + tm + "," + (rst.getInt("Distance") - km) + "],");
					i++;
				}
				//sp = sp.substring(0, sp.length() - 1) + "]";
				//dis = dis.substring(0, dis.length() - 1) + "]";
				
				//System.out.println("sp final: "+sp);
			     // System.out.println("dis final: "+dis);
			     
				System.out.println("chartval final: "+chartval);
%>
			
			<script type="text/javascript">
      
			 google.charts.load('current', {'packages':['corechart']});
             google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
             ['Hour', 'Speed', 'Distance'], 
             <%=chartval%>

        ]);

        var options = {
          title: 'Distance Speed chart',
          curveType: 'function',
          'width':650,
          'height':650,
          legend: { position: 'bottom' }
             
                  };

        var chart = new google.visualization.LineChart(document.getElementById('line_div'));

        chart.draw(data, options);
        
        var btnSave = document.getElementById('save_chart');  
		  google.visualization.events.addListener(chart, 'ready', function () {
		    btnSave.disabled = false;
		  });

		  btnSave.addEventListener('click', function () {
		    var doc = new jsPDF('l', 'mm', [297, 210]);
		    doc.addImage(chart.getImageURI(), 0, 0);
		    doc.save('DaySpeedDistanceChart.pdf');
		  }, false);
      }
    </script>
      
	<%
	} catch (Exception e) {%>
						alert(":Exception:");
					<%} finally {
				try {
					conn.close();
				} catch (Exception e) {

				}
			} %>		
      
			
	</div>  <!-- content-wrapper container -->
  </div>  <!-- app-content content -->
</body>
</html>