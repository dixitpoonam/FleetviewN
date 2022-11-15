<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="headernew2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript">
 function chk()
 {
 	
 	var chkf="";
 	var chkt="";
 	var objFromDate = document.getElementById("data").value;
 	var fdate=objFromDate.split("-");
 	if(fdate[1]=="Jan")
 	{
 		chkf="01";
 	}
 	if(fdate[1]=="Feb")
 	{
 		chkf="02";
 	}
 	if(fdate[1]=="Mar")
 	{
 		chkf="03";
 	}
 	if(fdate[1]=="Apr")
 	{
 		chkf="04";
 	}
 	if(fdate[1]=="May")
 	{
 		chkf="05";
 	}
 	if(fdate[1]=="Jun")
 	{
 		chkf="06";
 	}
 	if(fdate[1]=="Jul")
 	{
 		chkf="07";
 	}
 	if(fdate[1]=="Aug")
 	{
 		chkf="08";
 	}
 	if(fdate[1]=="Sep")
 	{
 		chkf="09";
 	}
 	if(fdate[1]=="Oct")
 	{
 		chkf="10";
 	}
 	if(fdate[1]=="Nov")
 	{
 		chkf="11";
 	}
 	if(fdate[1]=="Dec")
 	{
 		chkf="12";
 	}
 	var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
     var objToDate = document.getElementById("data1").value;
     var tdate=objToDate.split("-");
     if(tdate[1]=="Jan")
 	{
     	chkt="01";
 	}
 	if(tdate[1]=="Feb")
 	{
 		chkt="02";
 	}
 	if(tdate[1]=="Mar")
 	{
 		chkt="03";
 	}
 	if(tdate[1]=="Apr")
 	{
 		chkt="04";
 	}
 	if(tdate[1]=="May")
 	{
 		chkt="05";
 	}
 	if(tdate[1]=="Jun")
 	{
 		chkt="06";
 	}
 	if(tdate[1]=="Jul")
 	{
 		chkt="07";
 	}
 	if(tdate[1]=="Aug")
 	{
 		chkt="08";
 	}
 	if(tdate[1]=="Sep")
 	{
 		chkt="09";
 	}
 	if(tdate[1]=="Oct")
 	{
 		chkt="10";
 	}
 	if(tdate[1]=="Nov")
 	{
 		chkt="11";
 	}
 	if(tdate[1]=="Dec")
 	{
 		chkt="12";
 	}
     var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
    // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
      
     var date1 = new Date(objFromDate1);
     var date2 = new Date(objToDate1);
     
     //alert("from > "+date1+" Todate > "+date2);
     
     var date3 = new Date();
     var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
     var currentDate = new Date(date4);
      
         if(date1 > date2)
         {
             alert("From Date Should be Less Than To Date");
             return false; 
         }
         

         return true;
 	
 }
 	
	 //Save the whole page
	 //May not work with some jsPDF versions as the command to new & add image changes
	
       function saveDashboard() {
       var doc = new jsPDF('p', 'pt', 'a4', false) /* Creates a new Document*/
		/* ew jsPDF(orientation, unit, format, hotfixes: [])
		https://rawgit.com/MrRio/jsPDF/master/docs/jsPDF.html */
       doc.setFontSize(15); /* Define font size for the document */
       let chartTitle = 'FleetView DashBoard'
       let yAxis = 50;
       let imageTags = $('#graph-images img');
       doc.text(100, yAxis, chartTitle); /* Add some text in the PDF */
       yAxis = yAxis + 50
       for (let i = 0; i < imageTags.length; i++) {
               if (i % 2 == 0 && i != 0) { /* I want only two images in a page */
                   doc.addPage();  /* Adds a new page*/
                   yAxis = 100; /* Re-initializes the value of yAxis for newly added page*/
               }
				try {
                   doc.addImage(imageTags[i], 'png', 150, yAxis, 250, 183);
                   /* doc.addImage(imageData, format, x, y, width, height, compression, rotation) */
                   yAxis = yAxis+ 360; /* Update yAxis */
               }
               catch (e) {
                   doc.text(120, yAxis + 30, 'SOME ERROR OCCURRED WHILE ADDING IMAGE');
                   yAxis = yAxis + 50 /* Update yAxis */
               }
           }
         doc.save('Dashboard.pdf') /* Prompts user to save file on his/her machine */
         }
	</script>

</head>
<!-- <body style="background:#C3D9FF"> -->
<body>
<div class="app-content content " style="margin-left:0px !important">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left mb-1 col-md-9 col-12">
					<div class="row breadcrumbs-top">
						
						<div class="col-12">
							<h2 class="content-header-title  mb-0">FleetView DashBoard - <%=session.getAttribute("usertypevalue").toString()%></h2>
						</div>
					</div>
				</div>
				<%
				String datex1="",datex2="";
				%>
				<%
				String ddx = request.getQueryString();
				
				if (ddx == null) {
					
					System.out.println(" In First If  " );
					
					datex1 =  session.getAttribute("yesterday").toString();  //dd-MMM-yyyy
					datex2 = session.getAttribute("yesterday").toString();
				
				
				} else {
					
					System.out.println(" In First Else  " );
					datex1 = request.getParameter("data");
					datex2 = request.getParameter("data1");
					
				}
				
				String Bt=request.getParameter("button");
				System.out.println(" Button ::  " +Bt);
				
				
			System.out.println(" datex1 "+datex1+" datex2 "+datex2);


			String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));
			String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));
				%>
				
				
				<form name="custreport" id="custreport"  method="get" >
				<div class="row">
		   <div class="col-md-2"></div>
			<div class="col-md-2">
				

				<label for="from">From:</label>
				<div class="input-group input-group-merge" >
				
					<input type="text" name="data" id="data"  class="form-control" value="<%=datex1%>"> 
					<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
				<script>
					           $(document).ready(function() {
						       $( function() {
				          	   $( "#data" ).datepicker({
							   dateFormat: 'dd-M-yy',
							   changeMonth: true,
					            changeYear: true
								/* minDate: 0,
								maxDate:7 */}); } );
			
									});
			           </script>
				</div>				  
			</div>
			<div class="col-md-2">
				<label for="to">To:</label>
				<div class="input-group input-group-merge" >
				
					<input type="text" id="data1" name="data1"  class="form-control" value="<%=datex2%>"/> 
				<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
				<script>
					           $(document).ready(function() {
						       $( function() {
				          	   $( "#data1" ).datepicker({
							   dateFormat: 'dd-M-yy',
							   changeMonth: true,
					            changeYear: true
								/* minDate: 0,
								maxDate:7 */}); } );
			
									});
			           </script>
				</div>
		</div>

			<div class="col-md-2">
				<input type="submit" class="btn btn-primary" style="margin-top: 10px;" name="button" onclick="return chk()"  value="Submit">
			</div>
		
				
				</form>
				
				<div class="content-header-right text-md-end col-md-3 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1" >
							<button class="btn btn-danger" onclick="history.back()">Back</button>
			<button id="savePage" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0"
			  onclick="saveDashboard()" >
				Save Dashboard</button>
				</div>
					</div>
				</div>
	
			</div>
		</div>	
			
			<div class="modal" id="myModal">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle">Lost Revenue Millage</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="example1" class="table table-bordered">
					<thead>
						<tr>
							<th>SrNo</th>
							<th>Vehicle</th>
							<th>Date</th>
							<th>Distance(km)</th>
							<th>Location</th>

						</tr>
					</thead>
					<tbody>
						<tr >
							<td>1</td>
							<td>MH 08 AP 2558</td>
							<td>29-Apr-2022</td>
							<td>206</td>
							<td>29-Apr-2022 23:52:53 0.52kms north east of chiplun </td>
						</tr>
						<tr >
							<td>2</td>
							<td>MH 08 AP 2558</td>
							<td>29-Apr-2022</td>
							<td>206</td>
							<td>29-Apr-2022 23:52:53 0.52kms north east of chiplun </td>
						</tr>
						<tr >
							<td>3</td>
							<td>MH 08 AP 2558</td>
							<td>29-Apr-2022</td>
							<td>206</td>
							<td>29-Apr-2022 23:52:53 0.52kms north east of chiplun </td>
						</tr>
						<tr >
							<td>4</td>
							<td>MH 08 AP 2558</td>
							<td>29-Apr-2022</td>
							<td>206</td>
							<td>29-Apr-2022 23:52:53 0.52kms north east of chiplun </td>
						</tr>
						<tr >
							<td>5</td>
							<td>MH 08 AP 2558</td>
							<td>29-Apr-2022</td>
							<td>206</td>
							<td>29-Apr-2022 23:52:53 0.52kms north east of chiplun </td>
						</tr>
					</tbody>
					
				</table>
		
			</div>
			</div>
		</div>
	  </div>
			</div>
			<div class="modal" id="myModal1">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle">Revenue Paying Millage</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="example2" class="table table-bordered">
					<thead>
						<tr>
							<th>SrNo</th>
							<th>Vehicle</th>
							<th>Date</th>
							<th>Distance(km)</th>
							<th>Location</th>

						</tr>
					</thead>
					<tbody>
						<tr >
							<td>1</td>
							<td>MH 08 AP 2558</td>
							<td>29-Apr-2022</td>
							<td>206</td>
							<td>29-Apr-2022 23:52:53 0.52kms north east of chiplun </td>
						</tr>
						<tr >
							<td>2</td>
							<td>MH 08 AP 2558</td>
							<td>29-Apr-2022</td>
							<td>206</td>
							<td>29-Apr-2022 23:52:53 0.52kms north east of chiplun </td>
						</tr>
						<tr >
							<td>3</td>
							<td>MH 08 AP 2558</td>
							<td>29-Apr-2022</td>
							<td>206</td>
							<td>29-Apr-2022 23:52:53 0.52kms north east of chiplun </td>
						</tr>
						<tr >
							<td>4</td>
							<td>MH 08 AP 2558</td>
							<td>29-Apr-2022</td>
							<td>206</td>
							<td>29-Apr-2022 23:52:53 0.52kms north east of chiplun </td>
						</tr>
						<tr >
							<td>5</td>
							<td>MH 08 AP 2558</td>
							<td>29-Apr-2022</td>
							<td>206</td>
							<td>29-Apr-2022 23:52:53 0.52kms north east of chiplun </td>
						</tr>
					</tbody>
					
				</table>
		
			</div>
			</div>
		</div>
	  </div>
			</div>
			
			<div id="graph-images" style="display:none"></div>
		 
			<div class="row mt-1">
	  	<div class="col-sm-4" >
	  	<script type="text/javascript">
		
		// Load the Visualization API and the corechart package.	
		google.charts.load('current', {'packages':['corechart']});
			
	     // Set a callback to run when the Google Visualization API is loaded.
		google.charts.setOnLoadCallback(drawChart);
	
			function drawChart() {
		        var data = google.visualization.arrayToDataTable([     //for fixed number of records
		          ['Person', 'Share %'],
		          ['Person A',<%=15%>],
		          ['Person B',<%=20%>],
		          ['Person C',<%=30%>],
		          ['Person D',<%=35%>]
		        ]);
		
		        var options = {
		                title: 'Shareholding in %',
		                titleTextStyle:{
		                	fontSize: 16
		                	},
		                curveType: 'function',
		                pieHole: 0.4,
		                pieSliceTextStyle:{
		                	fontSize: 15
		                },
		                colors: ['Blue','Maroon','Yellow','Orange','Green'],
		                legend: {
		        	    	position: 'labeled',
		        	    	labeledValueText:'value',
		        	    	textStyle: {
		        	            color: 'black',
		        	            fontSize: 15,
		        	        }
		        	    },
		        	    chartArea:{width:'100%',height:'75%'},	
	                    'height':300
		              };
		        
		
		          var container = document.getElementById('performance_chart');
		    	  var chart = new google.visualization.PieChart(container);
		    	  var btnSave = document.getElementById('save-pdfPerformance');
		    	  
		    	  google.visualization.events.addListener(chart, 'ready', function () {
		    	    btnSave.disabled = false;
		    	  });

		    	  
		    	  btnSave.addEventListener('click', function () {
		    	    var doc = new jsPDF();
		    	    doc.addImage(chart.getImageURI(), 0, 0);
		    	    doc.save('TransporterSummary.pdf');
		    	  }, false);

			      chart.draw(data, options);
		      }
			</script>
	  	<div class="card p-1" >
	  	<h4 class="text-center">Shares</h4>
	 	<div class="text-left" >
	 		<button type="button" class="btn btn-success" id="save-pdfPerformance" disabled >Export</button>
	 	</div>
	 	<div id="performance_chart"></div>
	 	</div>
	 	</div>
	 	
	 		  	<div class="col-sm-4" >
	  	<script type="text/javascript">
				// Load the Visualization API and the corechart package.	
				google.charts.load('current', {'packages':['corechart']});
					
			     // Set a callback to run when the Google Visualization API is loaded.
				google.charts.setOnLoadCallback(drawChart);
			
					function drawChart() {
				        var data = google.visualization.arrayToDataTable([   
				          ['State', 'Cities'],
				          ['Maharashtra',<%=8%>],
				          ['Gujarat',<%=5%>],
				          ['Tamil Nadu',<%=5%>],
				          ['Punjab',<%=3%>]
				        ]);
				
				        var options = {
				       
				               title: 'No of cities in each state',
				                titleTextStyle:{
				                	fontSize: 16
				                	},
				                curveType: 'function',
				                pieHole: 0.4,
				                pieSliceTextStyle:{
				                	fontSize: 15
				                },
				                colors: ['Blue','Maroon','Yellow','Orange'],
				                legend: {
				        	    	position: 'labeled',
				        	    	labeledValueText:'value',
				        	    	textStyle: {
				        	            color: 'black',
				        	            fontSize: 15,
				        	        }
				        	    },
				        	    chartArea:{width:'100%',height:'75%'},	
			                    'height':300
				              };
				        
				
				          var container = document.getElementById('performance_chart2');
				    	  var chart = new google.visualization.PieChart(container);
				    	  var btnSave = document.getElementById('save-pdfPerformance2');

	
				    	  
				    	  google.visualization.events.addListener(chart, 'ready', function () {
				    	    btnSave.disabled = false;
				    	  });

				    	  
				    	  btnSave.addEventListener('click', function () {
				    	    var doc = new jsPDF();
				    	    doc.addImage(chart.getImageURI(), 0, 0);
				    	    doc.save('TransporterSummary.pdf');
				    	  }, false);

					      chart.draw(data, options);
				      }
				</script>
	  	<div class="card p-1" >
	  	<h4 class="text-center">State & Cities</h4>
	 	<div class="text-left" >
	 		<button type="button" class="btn btn-success" id="save-pdfPerformance2" disabled >Export</button>
	 	</div>
	 	<div id="performance_chart2"></div>
	 	</div>
	 	</div>
			<div class="col-sm-4" >
			<script type="text/javascript">
		
		// Load the Visualization API and the corechart package.	
		google.charts.load('current', {'packages':['corechart']});
			
	     // Set a callback to run when the Google Visualization API is loaded.
		google.charts.setOnLoadCallback(drawChart);
	
			function drawChart() {
		        var data = google.visualization.arrayToDataTable([     //for fixed number of records
		          ['State', 'Rice Output'],
		          ['Maharashtra',<%=500%>],
				  ['Gujarat',<%=50%>],
				  ['Tamil Nadu',<%=1000%>],
				  ['Punjab',<%=300%>],
			  	  ['UP',<%=800%>]
		        ]);
		
		        var options = {
		                title: 'Rice Output in tonnes',
		                titleTextStyle:{
		                	fontSize: 16
		                	},
		                curveType: 'function',
		                pieHole: 0.4,
		                pieSliceTextStyle:{
		                	fontSize: 15
		                },
		                colors: ['Blue','Maroon','Yellow','Orange','Green'],
		                legend: {
		        	    	position: 'labeled',
		        	    	labeledValueText:'value',
		        	    	textStyle: {
		        	            color: 'black',
		        	            fontSize: 15,
		        	        }
		        	    },
		        	    chartArea:{width:'100%',height:'75%'},	
	                    'height':300
		              };
		        
		        function selectHandler() {
		        	//alert("in select handler..")
		            var selectedItem = chart.getSelection()[0];
		        	//alert("selected item...")
		            if (selectedItem) {
		              var task = data.getValue(selectedItem.row, 0);
		              alert('The user selected ' + task);

		    		  if(task=='Maharashtra'){
		    			$('#myModal').modal('show');

		    		  }

		    		  if(task=='Tamil Nadu'){
		    			$('#myModal1').modal('show');

		    		  }

		            }
		          }
		
		          var container = document.getElementById('performance_chart3');
		    	  var chart = new google.visualization.PieChart(container);
		    	  var btnSave = document.getElementById('save-pdfPerformance3');

				  google.visualization.events.addListener(chart, 'select', selectHandler);
		    	  
		    	  google.visualization.events.addListener(chart, 'ready', function () {
		    	    btnSave.disabled = false;
		    	  });

		    	  
		    	  btnSave.addEventListener('click', function () {
		    	    var doc = new jsPDF();
		    	    doc.addImage(chart.getImageURI(), 0, 0);
		    	    doc.save('TransporterSummary.pdf');
		    	  }, false);

			      chart.draw(data, options);
		      }
			
			$(function () {
		        $(document).ready(function () {
		            dt_basic = $('#example1').DataTable({
		                /* order: [[2, 'desc']], */
		                dom: '<"d-flex justify-content-between align-items-center mx-0 row"<"col-sm-12 col-md-6"l><"col-sm-12 col-md-4"f><"col-sm-12 col-md-2 dt-action-buttons text-end"B>>t<"d-flex justify-content-between mx-0 row"<"col-sm-12 col-md-6"i><"col-sm-12 col-md-6"p>>',
		                displayLength: -1,
		                lengthMenu: [[-1, 10, 25, 50], ["All", 10, 25, 50]],
		                buttons: [
		                    {
		                        extend: 'collection',
		                        className: 'btn btn-outline-secondary dropdown-toggle me-2',
		                        text: feather.icons['share'].toSvg({ class: 'font-small-4 me-50' }) + 'Export',
		                        buttons: [
		                            {
		                                extend: 'print',
		                                text: feather.icons['printer'].toSvg({ class: 'font-small-4 me-50' }) + 'Print',
		                                className: 'dropdown-item',
										title: 'Template',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'csv',
		                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
		                                className: 'dropdown-item',
										title: 'Template',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'excel',
		                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
		                                className: 'dropdown-item',
										title: 'Template',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'pdf',
		                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
		                                className: 'dropdown-item',
										title: 'Template',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'copy',
		                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
		                                className: 'dropdown-item',
										title: 'Template',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                           
		                        ],
		                        init: function (api, node, config) {
		                            $(node).removeClass('btn-secondary');
		                            $(node).parent().removeClass('btn-group');
		                            setTimeout(function () {
		                                $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex');
		                            }, 50);
		                        }
		                    },
		                    
		                ],
		                 responsive: true,
		                language: {
		                    paginate: {
		                        // remove previous & next text from pagination
		                        previous: '&nbsp;',
		                        next: '&nbsp;'
		                    }
		                }
		            });

		            $('div.head-label').html('<h6 class="mb-0"></h6>');

		            $("#but_showhide").on("click", function () {
		                var checked_arr = $("#parent_filter_select2").val();
		                var unchecked_arr = [0, 1, 2, 3, 4, 5, 6];
		                var defaultArray = [0, 1, 2, 3, 4];

		                unchecked_arr.forEach(element => {
		                    dt_basic.columns(element).visible(false);
		                });
		                checked_arr.forEach(element => {
		                    dt_basic.columns(element).visible(true);
		                });

		                console.log(checked_arr)

		                if (checked_arr.length == 0) {
		                    defaultArray.forEach(element => {
		                        dt_basic.columns(element).visible(true);
		                    });
		                }
		            });
		        });

		        $.fn.select2.amd.define(
		            "select2/selectAllAdapter",
		            ["select2/utils", "select2/dropdown", "select2/dropdown/attachBody"],
		            function (Utils, Dropdown, AttachBody) {
		                function SelectAll() { }
		                SelectAll.prototype.render = function (decorated) {
		                    var self = this,
		                        $rendered = decorated.call(this),
		                        $selectAll = $(
		                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-check-square-o"></i> Select All</button>'
		                        ),
		                        $unselectAll = $(
		                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-square-o"></i> Unselect All</button>'
		                        ),
		                        $btnContainer = $('<div style="margin-top:3px;">')
		                            .append($selectAll)
		                            .append($unselectAll);
		                    if (!this.$element.prop("multiple")) {
		                        // this isn't a multi-select -> don't add the buttons!
		                        return $rendered;
		                    }
		                    $rendered.find(".select2-dropdown").prepend($btnContainer);
		                    $selectAll.on("click", function (e) {
		                        var $results = $rendered.find(".select2-results__option[aria-selected=false]");
		                        $results.each(function () {
		                           
		                            var $result = $(this);
		                            console.log($result);
		                            // Get the data object for it
		                            var data = $result.data('data');

		                            // Trigger the select event
		                            self.trigger('select', {
		                                data: data
		                            });
		                        });
		                        self.trigger("close");
		                    });
		                    $unselectAll.on("click", function (e) {
		                        var $results = $rendered.find(
		                            ".select2-results__option[aria-selected=true]"
		                        );
		                        $results.each(function () {
		                            self.trigger("unselect", {
		                                data: $(this).data("data"),
		                            });
		                        });
		                        self.trigger("close");
		                    });
		                    return $rendered;
		                };

		                return Utils.Decorate(Utils.Decorate(Dropdown, AttachBody), SelectAll);
		            }
		        );



		        $("#parent_filter_select2").select2({
		            placeholder: "Select",
		            dropdownAdapter: $.fn.select2.amd.require("select2/selectAllAdapter"),
		        });
		    });
			
			$(function () {
		        $(document).ready(function () {
		            dt_basic = $('#example2').DataTable({
		                /* order: [[2, 'desc']], */
		                dom: '<"d-flex justify-content-between align-items-center mx-0 row"<"col-sm-12 col-md-6"l><"col-sm-12 col-md-4"f><"col-sm-12 col-md-2 dt-action-buttons text-end"B>>t<"d-flex justify-content-between mx-0 row"<"col-sm-12 col-md-6"i><"col-sm-12 col-md-6"p>>',
		                displayLength: -1,
		                lengthMenu: [[-1, 10, 25, 50], ["All", 10, 25, 50]],
		                buttons: [
		                    {
		                        extend: 'collection',
		                        className: 'btn btn-outline-secondary dropdown-toggle me-2',
		                        text: feather.icons['share'].toSvg({ class: 'font-small-4 me-50' }) + 'Export',
		                        buttons: [
		                            {
		                                extend: 'print',
		                                text: feather.icons['printer'].toSvg({ class: 'font-small-4 me-50' }) + 'Print',
		                                className: 'dropdown-item',
										title: 'Template',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'csv',
		                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
		                                className: 'dropdown-item',
										title: 'Template',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'excel',
		                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
		                                className: 'dropdown-item',
										title: 'Template',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'pdf',
		                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
		                                className: 'dropdown-item',
										title: 'Template',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'copy',
		                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
		                                className: 'dropdown-item',
										title: 'Template',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                           
		                        ],
		                        init: function (api, node, config) {
		                            $(node).removeClass('btn-secondary');
		                            $(node).parent().removeClass('btn-group');
		                            setTimeout(function () {
		                                $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex');
		                            }, 50);
		                        }
		                    },
		                    
		                ],
		                 responsive: true,
		                language: {
		                    paginate: {
		                        // remove previous & next text from pagination
		                        previous: '&nbsp;',
		                        next: '&nbsp;'
		                    }
		                }
		            });

		            $('div.head-label').html('<h6 class="mb-0"></h6>');

		            $("#but_showhide").on("click", function () {
		                var checked_arr = $("#parent_filter_select2").val();
		                var unchecked_arr = [0, 1, 2, 3, 4, 5, 6];
		                var defaultArray = [0, 1, 2, 3, 4];

		                unchecked_arr.forEach(element => {
		                    dt_basic.columns(element).visible(false);
		                });
		                checked_arr.forEach(element => {
		                    dt_basic.columns(element).visible(true);
		                });

		                console.log(checked_arr)

		                if (checked_arr.length == 0) {
		                    defaultArray.forEach(element => {
		                        dt_basic.columns(element).visible(true);
		                    });
		                }
		            });
		        });

		        $.fn.select2.amd.define(
		            "select2/selectAllAdapter",
		            ["select2/utils", "select2/dropdown", "select2/dropdown/attachBody"],
		            function (Utils, Dropdown, AttachBody) {
		                function SelectAll() { }
		                SelectAll.prototype.render = function (decorated) {
		                    var self = this,
		                        $rendered = decorated.call(this),
		                        $selectAll = $(
		                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-check-square-o"></i> Select All</button>'
		                        ),
		                        $unselectAll = $(
		                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-square-o"></i> Unselect All</button>'
		                        ),
		                        $btnContainer = $('<div style="margin-top:3px;">')
		                            .append($selectAll)
		                            .append($unselectAll);
		                    if (!this.$element.prop("multiple")) {
		                        // this isn't a multi-select -> don't add the buttons!
		                        return $rendered;
		                    }
		                    $rendered.find(".select2-dropdown").prepend($btnContainer);
		                    $selectAll.on("click", function (e) {
		                        var $results = $rendered.find(".select2-results__option[aria-selected=false]");
		                        $results.each(function () {
		                           
		                            var $result = $(this);
		                            console.log($result);
		                            // Get the data object for it
		                            var data = $result.data('data');

		                            // Trigger the select event
		                            self.trigger('select', {
		                                data: data
		                            });
		                        });
		                        self.trigger("close");
		                    });
		                    $unselectAll.on("click", function (e) {
		                        var $results = $rendered.find(
		                            ".select2-results__option[aria-selected=true]"
		                        );
		                        $results.each(function () {
		                            self.trigger("unselect", {
		                                data: $(this).data("data"),
		                            });
		                        });
		                        self.trigger("close");
		                    });
		                    return $rendered;
		                };

		                return Utils.Decorate(Utils.Decorate(Dropdown, AttachBody), SelectAll);
		            }
		        );



		        $("#parent_filter_select2").select2({
		            placeholder: "Select",
		            dropdownAdapter: $.fn.select2.amd.require("select2/selectAllAdapter"),
		        });
		    });
		</script>
			<div class="card p-1">
			<h4 class="text-center">State Output</h4>
			<div class="text-left" >
	 		<button type="button" class="btn btn-success" id="save-pdfPerformance3" disabled >Export</button>
	 	</div>
	 	<div id="performance_chart3"></div>
			</div>
			</div><!--sm-4 -->
			</div>       <!-- row ends here -->
			
			
			<div class="row mt-1">
				<div class="col-sm-4">
				<script type="text/javascript">
				// Load the Visualization API and the corechart package.	
				google.charts.load('current', {'packages':['corechart']});
					
			     // Set a callback to run when the Google Visualization API is loaded.
				google.charts.setOnLoadCallback(drawChart);
			
					function drawChart() {
				        var data = google.visualization.arrayToDataTable([   
				          ['Engine', 'Liters'],
				          ['Engine1',<%=5%>],
						  ['Engine2',<%=4%>],
						  ['Engine3',<%=4.5%>],
						  ['Engine4',<%=4%>],
					  	  ['Engine5',<%=6%>]
				        ]);
				
				        var options = {
				        		is3D: true,
				               title: 'Liters Consumed in 1 hr',
				                titleTextStyle:{
				                	fontSize: 16
				                	},
				                curveType: 'function',
				                pieHole: 0.4,
				                pieSliceTextStyle:{
				                	fontSize: 15
				                },
				                colors: ['Blue','Maroon','Yellow','Orange','Green'],
				                legend: {
				        	    	position: 'labeled',
				        	    	labeledValueText:'value',
				        	    	textStyle: {
				        	            color: 'black',
				        	            fontSize: 15,
				        	        }
				        	    },
				        	    chartArea:{width:'100%',height:'75%'},	
			                    'height':300
				              };
				        
				
				          var container = document.getElementById('performance_chart4');
				    	  var chart = new google.visualization.PieChart(container);
				    	  var btnSave = document.getElementById('save-pdfPerformance4');

	
				    	  
				    	  google.visualization.events.addListener(chart, 'ready', function () {
				    	    btnSave.disabled = false;
				    	  });

				    	  
				    	  btnSave.addEventListener('click', function () {
				    	    var doc = new jsPDF();
				    	    doc.addImage(chart.getImageURI(), 0, 0);
				    	    doc.save('TransporterSummary.pdf');
				    	  }, false);

					      chart.draw(data, options);
				      }
				</script>
			    <div class="card p-1">
					<h4 class="text-center">Fuel Consumption</h4>
					<div class="text-left" >
	 				<button type="button" class="btn btn-success" id="save-pdfPerformance4" disabled >Export</button>
				</div>
				<div id="performance_chart4"></div>
			</div>
		  </div>
		  <div class="col-sm-4">
		  <!-- write chart javascript code for performance_chart5 here  -->
		  <div class="card p-1">
					<h4 class="text-center">Title</h4>
					<div class="text-left" >
	 				<button type="button" class="btn btn-success" id="save-pdfPerformance5" disabled >Export</button>
				</div>
				<div id="performance_chart5"></div>
			</div>
		  </div>
		  <div class="col-sm-4">
		  <!-- write chart javascript code for performance_chart6 here  -->
		  <div class="card p-1">
					<h4 class="text-center">Title</h4>
					
					<div class="text-left" >
	 				<button type="button" class="btn btn-success" id="save-pdfPerformance6" disabled >Export</button>
				</div>
				<div id="performance_chart6"></div>
			</div>
		  </div>
		</div><!-- row mt-1 ends here -->
			</div>
			
<!-- Included new footer file -->
<%@ include file="footernew1.jsp"%>
<!-- Included new footer file -->
</body>
</html>