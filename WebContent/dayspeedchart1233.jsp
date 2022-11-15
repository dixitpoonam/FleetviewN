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
 
 <!-- <script type="text/javascript" src="http://www.google.com/jsapi"></script>
<link href="layout.css" rel="stylesheet" type="text/css"></link>
<script language="javascript" type="text/javascript" src="js/jquery.js"></script>
<script language="javascript" type="text/javascript"
	src="js/jquery.plot.js"></script>
	 -->
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
String vehregno, cnt1,cnt2,cnt3,cnt4,cnt5,cnt6,cnt7,thedate,vehcode,thedate1;
Connection conn;
	String sp="";
	String dis="";
%>
<%
	vehregno=request.getParameter("vehregno");
	cnt1=request.getParameter("cnt1");
	cnt2=request.getParameter("cnt2");
	cnt3=request.getParameter("cnt3");
	cnt4=request.getParameter("cnt4");
	cnt5=request.getParameter("cnt5");
	cnt6=request.getParameter("cnt6");
	cnt7=request.getParameter("cnt7");
	thedate=request.getParameter("thedate");
	vehcode=request.getParameter("vehcode");
	thedate1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(thedate));
%>
<div class="app-content content ">  <!-- app-content content -->
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<!-- content-wrapper container -->
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-0">
					<div class="row breadcrumbs-top">
						<div class="col-6">
							<h3 class="content-header-title  mb-0" style="color: #060637">
								Speed Statistics</h3>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
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
			    <div style="color:#060637" align="center">The Speed Analysis chart for vehicle<%=vehregno%>on date<%=thedate%></div>
			</div>
			<!--  /* Pia chart */ -->
			<section class="sectionDash">
				<div class="row">
					<div class="col-5">
						<div class="p-1">
							
					   </div>
					</div>
					<div class="col-5 ">
						<div class="p-1">
						 <h4 class="text-center">Line Chart</h4>
					    <div class="text-left" >
	 				      <button type="button" class="btn btn-success" id="save_chart">Export</button>
				       </div>
				        <div id="chart_div"></div>
						</div>
					</div>
				</div>
			</section>
			
		<!-- 	Pie chart -->
         <script type="text/javascript">
			google.charts.load('current', {
				  packages: ['controls', 'corechart', 'table']
				}).then(function () {
				  var data = new google.visualization.DataTable();
				  data.addColumn('string', 'Person');
			      data.addColumn('number', 'Share');
				  data.addRows([
					  		['A',<%=15%>],
							['B',<%=20%>],
							['C',<%=30%>],
							['D',<%=35%>]
				  ]);
			
				  var container = document.getElementById('performance_chart');
				  var chart = new google.visualization.PieChart(container);
				  var btnSave = document.getElementById('save-pdfPerformance');
			
			
				  
				  google.visualization.events.addListener(chart, 'ready', function () {
				    btnSave.disabled = false;
				  });
			
				  
				  btnSave.addEventListener('click', function () {
				    var doc = new jsPDF();
				    doc.addImage(chart.getImageURI(), 0, 0);
				    doc.save('FileName.pdf');
				  }, false);
			
				  
				  chart.draw(data, {
				    chartArea: {
				      bottom: 24,
				      left: 36,
				      right: 12,
				      top: 48,
				      width: '50%',
				      height: '50%'
				    },
				    height: 600,
				    width: 600
				  });
				});
           </script>

			<!-- 	Pie chart -->	
		<!-- 	Line Chart -->
			<script type="text/javascript">
				google.charts.load('current', {
					'packages' : [ 'corechart' ]
				});
				google.charts.setOnLoadCallback(drawChart);

				function drawChart() {
					var data = google.visualization.arrayToDataTable([
							[ 'Year', 'Sales', 'Expenses' ],
							[ '2004', 1000, 400 ], [ '2005', 1170, 460 ],
							[ '2006', 660, 1120 ], [ '2007', 1030, 540 ] ]);

					var options = {
						title : 'Company Performance',
						curveType : 'function',
						legend : {
							position : 'bottom'
						}
					    height: 600,
					    width: 600
					};

					var chart = new google.visualization.LineChart(document
							.getElementById('chart_div'));

					chart.draw(data, options);

					var btnSave = document.getElementById('save_chart');
					google.visualization.events.addListener(chart, 'ready',
							function() {
								btnSave.disabled = false;
							});

					btnSave.addEventListener('click', function() {
						var doc = new jsPDF('l', 'mm', [ 297, 210 ]);
						doc.addImage(chart.getImageURI(), 0, 0);
						doc.save('Temperature.pdf');
					}, false);
				}
			</script>
			<!-- 	Line Chart -->
		</div>  <!-- content-wrapper container -->
    </div>  <!-- app-content content -->
</body>
</html>


