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
			 
			  google.charts.load('current', {'packages':['corechart']});
			  google.charts.setOnLoadCallback(drawChart);
				
			  function drawChart() {

				
						 var data = google.visualization.arrayToDataTable([
			         	 ['Date', 'Temperature','Min','Max'],
			    		 ['01-May-2022',38,35,40],
			    		 ['02-May-2022',37,25,42],
			    		 ['03-May-2022',28,25,35],
			    		 ['04-May-2022',35,25,39],
			    		 ['05-May-2022',30,25,35],
			    		 ['06-May-2022',28,25,32],
			    		 ['07-May-2022',30,25,35]
			          		]);
						 
						 /* if (data.getNumberOfRows() == 0) {
						      data.addRows([
						        ['', 0, null,null, 'No Data Copy']
						      ]);
						    } */
						 
						   
			   var options = {
					   
					   
			         title: ' Datails',  
					   
						   
					 titleTextStyle: {
			        			      fontSize: 15,
			        			      alignment: 'center'
			        			    }, 
			        	hAxis: {
			        	          title: 'Time'
			        	        },
			        	vAxis: {
			        	          title: 'Temperature'
			        	        },
			        	chartArea: {
			        	            bottom: 45,
			        	            left: 55,
			        	            right: 5,
			        	            top: 48, 
			        	            width: '100%',
			        	            height: '100%' 
			        		        
			        	          },   
			        	         
			        
			        //curveType: 'function', 
			        series: {
			            1: { lineDashStyle: [8, 1] , type: 'line' },
			            2: { lineDashStyle: [8, 1] , type: 'line' },
			          },
			          lineWidth: 1,
			          legend: {position: 'bottom'},
			          colors:['Yellow','Green','Red'],  //  [fill color , Min , Max]

			          annotations: {
			              // remove annotation stem and push to middle of chart
			              stem: {
			                color: 'Red',
			                length: 120
			              },
			              textStyle: {
			                color: '#9E9E9E',
			                fontSize: 18
			              }
			            },
			          
			        };

			  
			  
			    	  var formatter = new google.visualization.DateFormat({pattern: "dd.MM.yyyy"});
			      	  formatter.format(data, 0);
					  var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));

					  var btnSave = document.getElementById('save_chart');  
					  google.visualization.events.addListener(chart, 'ready', function () {
					    btnSave.disabled = false;
					  });

					  btnSave.addEventListener('click', function () {
					    var doc = new jsPDF('l', 'mm', [297, 210]);
					    doc.addImage(chart.getImageURI(), 0, 0);
					    doc.save('Temperature.pdf');
					  }, false);
			        
					      
			        chart.draw(data, options);
			        
			        $("text:contains(" + Options.title + ")").attr({'x':'60', 'y':'20'})
			      }
			    </script>
			<div class ="row mt-2">
			<div class="col-md-2"></div>
			<div class="col-md-8">
		       <div class="card p-1">
					<h4 class="text-center">Graph Title</h4>
					<div class="text-left" >
	 				<button type="button" class="btn btn-success" id="save_chart" disabled >Export</button>
				</div>
				<div id="chart_div"></div>
			</div>
		  </div>
			</div> 
			
			</div>
			</div>
</body>
</html>