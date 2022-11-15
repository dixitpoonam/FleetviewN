<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headernew1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Tracking System</title>
<link rel="stylesheet" href="css/table/jquery-ui.css">
<script src="js/datatable/jquery-ui.js"></script>
<script type="text/javascript" src="js/loader.js"></script>
<script type="text/javascript" src="js/jspdf.min.js"></script>
 
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
<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-6">
							<h3 class="content-header-title  mb-0" style="color: #060637">Graph Template</h3>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">
							<button
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0 btn2"
								data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
								Register Complaint</button>

							<button id="kt_engage_demos_toggle"
								class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0 btn2">
								<span id="kt_engage_demos_label">Help</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			
			<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Density", { role: "style" } ],
        ["Copper", 8.94, "#b87333"],
        ["Silver", 10.49, "silver"],
        ["Gold", 19.30, "gold"],
        ["Platinum", 21.45, "#e5e4e2"]
      ]);

       var view = new google.visualization.DataView(data);
       
       /* view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]); */

      var options = {
        title: "Density of Precious Metals, in g/cm^3",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(view, options);
      
      var btnSave = document.getElementById('save_chart');  
	  google.visualization.events.addListener(chart, 'ready', function () {
	    btnSave.disabled = false;
	  });

	  btnSave.addEventListener('click', function () {
	    var doc = new jsPDF('l', 'mm', [297, 210]);
	    doc.addImage(chart.getImageURI(), 0, 0);
	    doc.save('Metals.pdf');
	  }, false);
  }
  </script>
<!-- <div id="barchart_values" style="width: 900px; height: 300px;"></div> -->
			 			
			<div class ="row mt-2">
			<div class="col-sm-6">
		  <div class="card p-1">
					<h4 class="text-center">Bar Graph Title</h4>
					<div class="text-left" >
	 				<button type="button" class="btn btn-success" id="save_chart">Export</button>
				</div>
				<div id="barchart_values"></div>
			</div>
		  </div>
		   
  <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Overs", "Runs"],
        ["1st", 5],
        ["2nd", 8],
        ["3rd", 3],
        ["4th", 7]
      ]);

      var view = new google.visualization.DataView(data);
      /* view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]); */

      var options = {
        title: "Scores per over",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
      
      var btnSave = document.getElementById('save_chart2');  
	  google.visualization.events.addListener(chart, 'ready', function () {
	    btnSave.disabled = false;
	  });

	  btnSave.addEventListener('click', function () {
	    var doc = new jsPDF('l', 'mm', [297, 210]);
	    doc.addImage(chart.getImageURI(), 0, 0);
	    doc.save('Metals.pdf');
	  }, false);
      
  }
  </script>
		  
		  <div class="col-sm-6">
		  <div class="card p-1">
					<h4 class="text-center">Column Graph Title</h4>
					<div class="text-left" >
	 				<button type="button" class="btn btn-success" id="save_chart2">Export</button>
				</div>
				<div id="columnchart_values"></div>
			</div>
		  </div>
			</div> 
			
			</div>
			</div>
</body>
</html>