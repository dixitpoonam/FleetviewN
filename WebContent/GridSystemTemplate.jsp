<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headernew1.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Tracking System</title>
<!-- Included our css file start-->
	<link rel="stylesheet" type="text/css" href="css/table/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/responsive.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/buttons.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/rowGroup.bootstrap5.min.css">
	<script src="https://unpkg.com/feather-icons@4.10.0/dist/feather.min.js"></script>
	
	<link rel="stylesheet" href="css/table/TemplateCSS.css">
	<script type="text/javascript" src="js/loader.js"></script>
    <script src="js/jspdf.min.js"></script>
	<!-- Included our css file End -->
	
	<!-- Included our Js file Start-->

	<script src="js/datatable/jquery.dataTables.min.js"></script>
	<script src="js/datatable/moment.js"></script>
	<link rel="stylesheet" href="css/table/jquery-ui.css">

	<script src="js/datatable/jquery-ui.js"></script>

    <script src="js/datatable/dataTables.bootstrap5.min.js"></script>
    <script src="js/datatable/dataTables.responsive.min.js"></script>
    <script src="js/datatable/responsive.bootstrap5.js"></script>
    <script src="js/datatable/datatables.checkboxes.min.js"></script>
    <script src="js/datatable/datatables.buttons.min.js"></script>
    <script src="js/datatable/jszip.min.js"></script>
    <script src="js/datatable/pdfmake.min.js"></script>
    <script src="js/datatable/vfs_fonts.js"></script>
    <script src="js/datatable/buttons.html5.min.js"></script>
    <script src="js/datatable/buttons.print.min.js"></script>
    <script src="js/datatable/dataTables.rowGroup.min.js"></script>
 	<!-- Included our Js file End-->
 <script>	
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
</script>
<style type="text/css">
.cardCss{
           width:610px;
           height:400px;
        }
td {
     padding: 5px;
     text-align: center;
   }
</style>
</head>
<body onload="ondemand()">
<%
	Connection conn=null;
	Statement st=null, st1=null,st2=null,st20=null,st21=null;
%>
<%
	try
	{
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
	    st20=conn.createStatement();
	    st21=conn.createStatement();
		
	}
	catch(Exception e)
	{
		
	}
	
%>
<%
int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;

//for report conversion use this query
String setdefault="select * from db_gps.ColumnDisplayMaster where userid='"+session.getAttribute("UserID").toString()+"' and reportno='"+reportno+"'";
System.out.println("set custom query:"+setdefault);
ResultSet rssetdefault=st20.executeQuery(setdefault);
if(rssetdefault.next())
{
	setDefFlag=true;    
	colcount = rssetdefault.getInt("ColumnCount");
	setSequence = rssetdefault.getString("SetSequence");
	detailViewSequence = rssetdefault.getString("DetailViewSequence");
	ColumnList= rssetdefault.getString("ColumnList");
}
else
{
	String setdefault1="select * from db_gps.ColumnDisplayMaster where userid='default' and reportno='"+reportno+"'";
	System.out.println("set custom query1:"+setdefault1);

	ResultSet rssetdefault1=st21.executeQuery(setdefault1);
	if(rssetdefault1.next())
	{
		setDefFlag=true;   
		
		colcount = rssetdefault1.getInt("ColumnCount");
		setSequence = rssetdefault1.getString("SetSequence");
		detailViewSequence = rssetdefault1.getString("DetailViewSequence");
		ColumnList= rssetdefault1.getString("ColumnList");
	}
	
}

System.out.println("set default flag "+setDefFlag);
System.out.println("column count "+colcount);
System.out.println("set sequence "+setSequence);
System.out.println("detailed view sequence "+detailViewSequence);


%>
<input type="hidden" id="setDefFlag" name="setDefFlag" value="<%=setDefFlag%>">
<input type="hidden" id="PageName" name="PageName"
				value="<%=PageName%>" />
<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 


String datex1, datex2, data1, data2;
%>
<%
String ddx = request.getQueryString();
String bt=request.getParameter("button");
System.out.println(" buttom :- "+bt);
	
	if (bt== null || bt.equals("null")) {
		
		datex1 =  session.getAttribute("PresentMonthFirst").toString();  //dd-MMM-yyyy
		data1 = data2 = session.getAttribute("CurrentMonthFirst").toString();   //yyyy-mm-dd
		datex2 = session.getAttribute("today").toString();
	} else {
		
		System.out.println("Inside ELSSSSSSSSS ");
		
				
		data1 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(request.getParameter("data")));
		data2 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(request.getParameter("data1")));

		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");
		
	}

System.out.println(" datex1 "+datex1+" datex2 "+datex2);

String dt = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
	.parse(datex1));

String dttime=""+dt+" 00:00:00";


String dt1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
	.parse(datex2));

String dt1time=""+dt1+" 23:59:59";

System.out.println("Query pass date params:  from:"+dt+" to: "+dt1);
	
System.out.println("Query pass date time  params:  from:"+dttime+" to: "+dt1time);

%>
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h2 class="content-header-title  mb-0">Daily Status Report</h2>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">
							<button
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0"
								data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
								Register Complaint</button>
							<button id="kt_engage_demos_toggle"
								class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0">
								<span id="kt_engage_demos_label">Help</span>
							</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Form Comes here -->

			<form name="formreport" id="formreport" method="post">
				<div class="row col-12 mb-1">
					<div class="col-4"></div>
					<div class="col-3">
					<label class="tcolor">Date</label>
						<div class="input-group input-group-merge">
							<input type="text" name="data" id="data" class="form-control"
								value="<%=datex1%>"> <span class="input-group-text"><svg
									xmlns="http://www.w3.org/2000/svg" width="14" height="14"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-calendar">
									<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
									<line x1="16" y1="2" x2="16" y2="6"></line>
									<line x1="8" y1="2" x2="8" y2="6"></line>
									<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
						</div>
						<script>
						$(document).ready(function() {
							$( function() {
   				 $( "#data" ).datepicker({
		    dateFormat: 'dd-M-yy',
			changeMonth: true,
            changeYear: true
	});
  } );
				
});
				   </script>
					</div>
					<div class="col-2">
						<button type="submit" class="btn btn-primary"
							style="margin-top: 20px;" name="button" onclick="return chk()"
							value="Submit">Submit</button>
					</div>
					<div class="col-2 mt-1">
					  <button id="savePage" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" >
				           Save Dashboard</button>
					</div>
				</div>
			</form>


			<!-- Table Starts here -->
			<div class="content-body">
				<!-- Basic table -->
				<section id="">
					<div class="row">
						<div class="col-6 mb-1">
							<div class="card cardCss">
								<div class="card-body">
									<h5 class="card-title">Daily Status - Hindustan Unilever Limited_Chiplun On 25 Jul 2022</h5>
									<table class="table table-primary">
                                        <thead>
                                        <tr>
                                            <th>Sr.No.</th>
                                            <th>VehRegNo</th>
                                            <th>Transporter</th>
                                            <th>VehicleType</th>
                                            
                                        </tr>
                                    </thead>
                                     <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>8574</td>
                                            <td>ABC</td>
                                            <td><a href="#">Origin</a></td>
                                            
                                        </tr>
                                    
                                    	 <tr>
                                            <td>2</td>
                                            <td>8574</td>
                                            <td>XYZ</td>
                                            <td><a href="#">Origin</a></td>
                                            
                                        </tr>
                                    
                                    
                                    	 <tr>
                                            <td>3</td>
                                            <td>8574</td>
                                            <td>PQR</td>
                                            <td><a href="#">Origin</a></td>
                                             
                                        </tr>
                                        
                                        <tfoot>
                                    <tr>
                                            <th>Sr.No.</th>
                                            <th>VehRegNo</th>
                                            <th>Transporter</th>
                                            <th>VehicleType</th>
                                           
                                        </tr>
                                    </tfoot>      
                                    </table>
								</div>
							</div>
						</div>
						<div class="col-6 mb-1">
							<div class="card cardCss">
								<div class="card-body">
									<h5 class="card-title">Top 3 Vehicles Today for Hindustan Unilever Limited_Chiplun On 25 Jul 2022</h5>
								<table class="table table-primary">
                                        <thead>
                                        <tr>
                                            <th>Sr.No.</th>
                                            <th>VehRegNo</th>
                                           
                                            
                                        </tr>
                                    </thead>
                                     <tbody>
                                        <tr >
                                            <td class="align-middle">1</td>
                                            <td>8574</td>
                                       </tr>
                                    
                                    	 <tr>
                                            <td class="align-middle">2</td>
                                            <td>8574</td>
                                        </tr>
                                    
                                    
                                    	 <tr>
                                            <td class="align-middle">3</td>
                                            <td>8574</td>
                                        </tr>
                                        
                                        <tfoot>
                                         <tr>
                                            <th>Sr.No.</th>
                                            <th>VehRegNo</th>
                                        </tr>
                                    </tfoot>      
                                    </table>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-6 mb-1">
							<div class="card cardCss">
								<div class="card-body">
									<h5 class="card-title">Chart Title</h5>
									<div class="text-left" >
	 								  <button type="hidden" class="" id="save-pdfPerformance" ></button>
	 							   </div>
	 							   <div id="performance_chart" style="border:width=1"></div>
							<script type="text/javascript">
		
							// Load the Visualization API and the corechart package.	
							google.charts.load('current', {'packages':['corechart']});
								
						     // Set a callback to run when the Google Visualization API is loaded.
							google.charts.setOnLoadCallback(drawChart);
						
								function drawChart() {
							        var data = google.visualization.arrayToDataTable([
							          ['Range', 'Total'],
							          ['A',<%=10%>],
							          ['B',<%=20%>],
							          ['C',<%=30%>],
							          ['D',<%=40%>]
							        ]);
							
							        var options = {
							               // title: 'Speed Statistics',
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
						                    'height':250
						                    
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
								</div>
							</div>
						</div>
						<div class="col-6 mb-1">
							<div class="card cardCss">
								<div class="card-body">
									<h5 class="card-title">Column Graph Title</h5>
				                   <div id="columnchart_values"></div>
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
									        height:300,
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
								</div>
							</div>
						</div>
					</div>
						
					<div class="row">
						<div class="col-6 mb-1">
							<div class="card cardCss">
								<div class="card-body">
									<h5 class="card-title">Card title</h5>
									<table class="table table-secondary">
                                        <thead>
                                        <tr>
                                            <th>Sr.No.</th>
                                            <th>VehRegNo</th>
                                            <th>Transporter</th>
                                            <th>VehicleType</th>
                                            
                                        </tr>
                                    </thead>
                                     <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>8574</td>
                                            <td>ABC</td>
                                            <td><a href="#">Origin</a></td>
                                            
                                        </tr>
                                    
                                    	 <tr>
                                            <td>2</td>
                                            <td>8574</td>
                                            <td>XYZ</td>
                                            <td><a href="#">Origin</a></td>
                                            
                                        </tr>
                                    
                                    
                                    	 <tr>
                                            <td>3</td>
                                            <td>8574</td>
                                            <td>PQR</td>
                                            <td><a href="#">Origin</a></td>
                                             
                                        </tr>
                                        
                                        <tfoot>
                                    <tr>
                                            <th>Sr.No.</th>
                                            <th>VehRegNo</th>
                                            <th>Transporter</th>
                                            <th>VehicleType</th>
                                           
                                        </tr>
                                    </tfoot>      
                                    </table>
								</div>
							</div>
						</div>
						<div class="col-6 mb-1">
							<div class="card cardCss">
								<div class="card-body">
									<h5 class="card-title">Top 5 Vehicle Stop Hrs Rating</h5>
									<table class="table table-success table-striped">
                                        <thead>
                                        <tr>
                                            <th>Sr.No.</th>
                                            <th>VehRegNo</th>
                                            <th>Transporter</th>
                                            <th>VehicleType</th>
                                            
                                        </tr>
                                    </thead>
                                     <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>8574</td>
                                            <td>ABC</td>
                                            <td><a href="#">Origin</a></td>
                                            
                                        </tr>
                                    
                                    	 <tr>
                                            <td>2</td>
                                            <td>8574</td>
                                            <td>XYZ</td>
                                            <td><a href="#">Origin</a></td>
                                            
                                        </tr>
                                    
                                    
                                    	 <tr>
                                            <td>3</td>
                                            <td>8574</td>
                                            <td>PQR</td>
                                            <td><a href="#">Origin</a></td>
                                             
                                        </tr>
                                        
                                        <tfoot>
                                    <tr>
                                            <th>Sr.No.</th>
                                            <th>VehRegNo</th>
                                            <th>Transporter</th>
                                            <th>VehicleType</th>
                                           
                                        </tr>
                                    </tfoot>      
                                    </table>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
	 //Save the whole page
	 //May not work with some jsPDF versions as the command to new & add image changes
	
      let pageSave = document.getElementById('savePage');
      if(savePage){
        pageSave.addEventListener('click', function () {
        var doc = new jsPDF('p', 'pt', 'a4', false) /* Creates a new Document*/
		/* ew jsPDF(orientation, unit, format, hotfixes: [])
		https://rawgit.com/MrRio/jsPDF/master/docs/jsPDF.html */
        doc.setFontSize(15); /* Define font size for the document */
        let chartTitle = 'FleetView DashBoard : <%=username %>'
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
          doc.save('Dashboard' + '.pdf') /* Prompts user to save file on his/her machine */
          }, false);
      }
	</script>        
							   
							   
<!-- Included new footer file -->

<%@ include file="footernew1.jsp"%>
<!-- Included new footer file -->


<!--New Script code added Start -->
<script>
	$(window).on('load', function () {
		if (feather) {
			feather.replace({
				width: 14,
				height: 14
			});
		}
	})
</script>

			
</body>
</html>