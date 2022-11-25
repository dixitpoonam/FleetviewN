
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headernew1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard Template 1</title>
<!-- Included our css file start-->
	<link rel="stylesheet" type="text/css" href="css/table/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/responsive.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/buttons.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/rowGroup.bootstrap5.min.css">
	<script src="https://unpkg.com/feather-icons@4.10.0/dist/feather.min.js"></script>
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
 	
<script type="text/javascript" src="js/loader.js"></script>
<script src="js/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

<script type="text/javascript" src="js/loader.js"></script>
<script type="text/javascript" src="js/jspdf.min.js"></script>


<script>
list=""
nodes=[];

	function ondemand(){
		//alert("in method...")
	const element = document.getElementById("example1");
	//alert("elements:"+element);
	nodes = element.getElementsByTagName("th");	
	//alert("nodes:"+nodes.length);

	heads = document.getElementsByTagName("th");

	for( i=0;i<(nodes.length/2);i++){
	//alert(heads[i].innerHTML);
	if (list=="")
		{
		list = heads[i].innerHTML;
		}
	else{
	    list= list+","+heads[i].innerHTML
	}

	}
	console.log(list);
	document.getElementById("tableheaders").value = list;
	//alert("ii "+i);
	document.getElementById("tableheaderslength").value =i;
	//alert("list:"+list);
	 var flag=document.getElementById("setDefFlag").value;
	//alert("flag "+flag); 
	
	
	if(flag == "false")
		{
		//alert("flag is false..");
		
		ajaxRequest = new XMLHttpRequest();
		
		
		var ajaxRequest;
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{

			} 
		};
		//alert("in ajax call.."+(nodes.length/2));
		ajaxRequest.open("GET", "ReSet.jsp?call=SetDefault&reportno="+<%=reportno%>+"&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true);
		ajaxRequest.send(); 
		}
	}

</script>

<script>	
 	function chk(){
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
</head>

<%
	Connection conn=null,conn1=null;
	Statement st20=null,st21=null;
	Statement st,st1,st2,st3,st4, st5, st6, st7, st8, st9, st10;
	ResultSet rst0=null;
	String sql,sql1,vehicle, msg;
	
	int oscountall=0,oscountall1=0,oscountall2=0,oscountall3=0;
	int racountall=0,racountall1=0,racountall2=0,racountall3=0;
	int rdcountall=0,rdcountall1=0,rdcountall2=0,rdcountall3=0;
	int dtcountall=0,dtcountall1=0,dtcountall2=0,dtcountall3=0;
	String oss="",raa="",rdd="",spp="";
	int j=0;
	String fidDate, data1, data2,showdate,showdate1,trips,user;
	int oscount, racount,rdcount, stcount,cdcount, dtcount,rhcount,osduration,osduration1,tpcount,tpcount1,dcount,dcount1,vcount, vcount1;
	String ndcount;
	int oscount1, racount1,rdcount1, ndcount1, stcount1,cdcount1, dtcount1,rhcount1,transportercount;
	double rtcount;
	String ss="", vv="";
	double OverSpeed,Accelaration,Decelaration,Rating,Rating1,Accelaration1,Decelaration1,OverSpeed1;

%>

<%
	String datex1 = "", datex2 = "";

	String dd = request.getParameter("button");
	if (dd == null) {
		System.out.println("On load");

		datex1 =  session.getAttribute("today").toString();  //dd-MMM-yyyy
		datex2 = session.getAttribute("today").toString();
		vehicle="All";
		msg="Run Analysis Report";

	} else {
		System.out.println("On submit");
		
		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");	
		vehicle=request.getParameter("vehicle");
		
	} //end of else
	
	 user = session.getAttribute("usertypevalue").toString();
	
	System.out.println(" datex1 "+datex1+" datex2 "+datex2);

	String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

	String dttime=""+dt+" 00:00:00";


	String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

	String dt1time=""+dt1+" 23:59:59";


	System.out.println("Query pass date params:  from:"+dt+" to: "+dt1);

		
	System.out.println("Query pass date time  params:  from:"+dttime+" to: "+dt1time);	
	
	
%>

<body onload="ondemand()">

<%
	try
	{
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    st20=conn.createStatement();
	    st21=conn.createStatement();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
%>

<%
	String val ="";
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

<%
			
				
				st=conn.createStatement();
				st1=conn.createStatement();
				st2=conn1.createStatement();
				st3=conn1.createStatement();
				st4=conn1.createStatement();
				st5=conn1.createStatement();
				st6=conn1.createStatement();
				st7=conn1.createStatement();
				st8=conn1.createStatement();
				st9=conn1.createStatement();
				st10=conn1.createStatement();

				int os=0,ra=0,rd=0,stops=0,rh=0,dist =0;//dt=dist here
				int os1=0,ra1=0,rd1=0,stops1=0,rh1=0;
				int os2=0,ra2=0,rd2=0,dt2=0,stops2=0,rh2=0;
				int os3=0,ra3=0,rd3=0,stops3=0,rh3=0;
				int kmcountall=0,rhcountall=0,stopcountall=0;
				int kmcountall1=0,rhcountall1=0,stopcountall1=0;
				int kmcountall2=0,rhcountall2=0,stopcountall2=0;
				int kmcountall3=0,rhcountall3=0,stopcountall3=0;

				String cd="",nd="";
				double totkmtrav=0, avgspeedoffleet=0, avgrunspeedoffleet=0;
				
				String title="";
				if(dd==null){
					title="The Exception Analysis Report";
				}
				else{
					title="The Exception Analysis Report On Graph for Vehicle "+vehicle+" from "+datex1+" to "+datex2;
				}
				
				
									
%>

<input type="hidden" id="setDefFlag" name="setDefFlag" value="<%=setDefFlag%>">
<div class="app-content content " id="allcontent">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left mb-1 col-md-3 col-12">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0"><%=title%></h3>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-9 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
	
		<button id="detailedView" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" >
			Detailed View</button>
	 
		<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#SetCustomModal">
			Set Custom</button>

		<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
			Register Complaint</button>
		
			<button id="kt_engage_demos_toggle" class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0" >
				<span id="kt_engage_demos_label">Help</span>
			</button>
		
					  </div>
				</div>
			</div>
			
		</div>
		<!-- form comes here  -->
		<form name="formreport" id="formreport" method="get">
		    <div class="row col-12">
		    <div class="col-md-2"></div>
		    <div class="col-md-2">
		    	<label for="basicSelect">Vehicle</label>
						<div class="input-group input-group-merge">
							<select class="form-select" name="vehicle" id="vehicle">
								<%
									sql="select * from t_vehicledetails where VehicleCode in "+session.getAttribute("VehList").toString()+" order by VehicleCode";
									ResultSet rst=st.executeQuery(sql);
									//runtotal=0;
									//stoptotal=0;
									//nighttotal=0;
									while(rst.next())
									{
				
								%>
							<option value="<%=rst.getString("VehicleRegNumber")%>" <% if(vehicle.equals(rst.getString("VehicleRegNumber"))){ %>Selected<% } %> ><%=rst.getString("VehicleRegNumber")%></option>				
								<%
										}
								%>
							</select>
							<script>
									const mySel = document.getElementById("basicSelect"); 
									mySel.addEventListener("change",function() 
											{ 
												localStorage.setItem("selValue",this.value); // save it 
											}); 
									
									let val = localStorage.getItem("selValue"); 
									if (val) 
										mySel.value=val; // set the dropdown 
									    // trigger the change in case there are other events on the select 
									mySel.onchange(); 
							</script>
							
		   				 </div>
		    </div>
		    
			<div class="col-md-2">
				

				<label for="from">From:</label>
				<div class="input-group input-group-merge" >
				
					<input type="text" name="data" id="data"  class="form-control" value="<%=datex1%>"> 
					<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
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
			
			<div class="col-md-2">
				<label for="to">To:</label>
				<div class="input-group input-group-merge" >
				
					<input type="text" id="data1" name="data1"  class="form-control" value="<%=datex2%>"/> 
					<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
				</div>
					<script>
	
												$(document).ready(function() {
													$( function() {
											$( "#data1" ).datepicker({
									dateFormat: 'dd-M-yy',
									changeMonth: true,
							            changeYear: true
										 /* minDate: 0,
										maxDate:7  */
							});
							} );
										
							});
	
				   	</script>
			</div>

			<div class="col-md-2">
				<input type="submit" class="btn btn-primary" style="margin-top: 10px;" name="button" onclick="return chk()"  value="Submit">
			</div>
		</div><br>
	</form>


<%
		if(!(null==request.getQueryString()))
		{			
%>
		<b>Note: Please select at least 2 weeks.This graph does not show any graph line for lower date range.</b><br><br>
	    <!-- table starts here  -->
	    <div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">               
									<thead>
										<tr>
											<th>WEEK</th>
											<th>Date Range</th>
											<th>OS</th>
											<th>RA</th>
											<th>RD</th>
											<th>Distance</th>
											<th>Stops</th>
											<th>Run Hrs</th>
											<th>CD</th>
											<th>ND</th>
										</tr>
									</thead>
				<tbody>
					
					<%
											//String val="";
											long weekmiliseconds=60*60*1000*24*6;
														
											java.util.Date fromdate=new SimpleDateFormat("dd-MMM-yyyy").parse(datex1);
											Format formatter = new SimpleDateFormat("yyyy-MM-dd");
											long frommils = fromdate.getTime();//Miliseconds for From Dtae
											
											java.util.Date todate=new SimpleDateFormat("dd-MMM-yyyy").parse(datex2);
											long tomils = todate.getTime();//Miliseconds for ToDtae
											
											long frommils1= frommils+weekmiliseconds;
											int i=1;
											
												sql="select * from t_vehicledetails where VehicleRegNumber='"+vehicle+"'";
												ResultSet rst1=st.executeQuery(sql);
												if(rst1.next())
												{	
													oss="[";
													raa="[";
													rdd="[";
													spp="[";
													while(frommils1<=tomils)
													{
														int cnt=0;
														int cnt1=0;
														java.util.Date date1= new java.util.Date();
														date1.setTime(frommils);
														String fromdate1=new SimpleDateFormat("yyyy-MM-dd").format(date1);
														
														java.util.Date date2= new java.util.Date();
														date2.setTime(frommils1);
														String todate1=new SimpleDateFormat("yyyy-MM-dd").format(date2);
															oscountall=0;
															racountall=0;
															rdcountall=0;
															dtcountall=0;
															stopcountall=0;
															rhcountall=0;
													sql="select distinct(TheDate),OSCount,RACount,RDCount,CRCount,Distance,StopCount,RDuration,ND from t_veh"+rst1.getString("vehicleCode")+"_ds  where TheDate between '"+fromdate1+"' and '"+todate1+"' order by TheDate Asc";
													rst0=st4.executeQuery(sql);
													
													while(rst0.next())
													{
															os=rst0.getInt("OSCount");
															ra=rst0.getInt("RACount");
															rd=rst0.getInt("RDCount");
															dist=rst0.getInt("Distance");
															stops=rst0.getInt("StopCount");
															rh=rst0.getInt("RDuration");
															nd=rst0.getString("ND");
															if(nd.equals("Yes"))
															{
																cnt++;
															}
															cd=rst0.getString("CRCount");
															if(cd.equals("Yes"))
															{
																cnt1++;
															}
															oscountall=oscountall+os;
															racountall=racountall+ra;
															rdcountall=rdcountall+rd;
															dtcountall=dtcountall+dist;
															stopcountall=stopcountall+stops;
															rhcountall=rhcountall+rh;
													}
													j++;
					%>
					
		<tr>
							<td style="text-align:right"><%=j %> </td>
							<td style="text-align:left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate1)) %>  <b><font>&nbsp; To &nbsp;</font></b> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate1)) %></td>
							<td style="text-align:right"><%=oscountall %></td>
							<td style="text-align:right"><%=racountall %></td>
							<td style="text-align:right"><%=rdcountall %></td>
							<td style="text-align:right"><%=dtcountall%></td>
							<td style="text-align:right"><%=stopcountall%></td>
							<td style="text-align:right"><%=rhcountall %></td>
							
								<%
								
								  val+="["+"'week "+j+"',"+oscountall+","+racountall+","+rdcountall+","+stopcountall+"],";		  
								 
								
									if(cnt>0)
									{
								%>
											<td style="text-align:left">YES</td>
								<%
									}
									else
									{
								%>
											<td style="text-align:left">NO</td>
								<%
									}
								%>
								<%
									if(cnt1>0)
									{
								%>
											<td style="text-align:left">YES</td>
								<%
									}
									else
									{
								%>
											<td style="text-align:left">NO</td>
								<%
									}
								%>
		</tr>
			<%	
							oss=oss+"["+j+","+oscountall+"],";
							raa=raa+"["+j+","+racountall+"],";
							rdd=rdd+"["+j+","+rdcountall+"],";
							spp=spp+"["+j+","+stopcountall+"],";
							frommils=frommils1+24*60*60*1000;
							frommils1= frommils+weekmiliseconds;
					}
						oss=oss.substring(0,oss.length()-1)+"]";
						raa=raa.substring(0,raa.length()-1)+"]";
						rdd=rdd.substring(0,rdd.length()-1)+"]";
						spp=spp.substring(0,spp.length()-1)+"]";
												
				}
				System.out.println("val----=-"+ val);
			
			%>
			</tbody>
					<tfoot>
								<tr>
										<th>WEEK</th>
										<th>Date Range</th>
										<th>OS</th>
										<th>RA</th>
										<th>RD</th>
										<th>Distance</th>
										<th>Stops</th>
										<th>Run Hrs</th>
										<th>CD</th>
										<th>ND</th>
								</tr>
				   </tfoot>

		</table>
								
								
								<%} %>
							</div>
							</div>
							</div>
							</section>
							
							<!-- script for chart -->
							
		<script type="text/javascript">
      
			  google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawChart);
		
		      function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['Week', 'OS', 'RA','RD','STOP'],
		          <%=val%>
		          
		        ]);
		
		        var options = {
		          title: 'Exception Analysis on Graph',
		          //curveType: 'function',
		          legend: { position: 'bottom' },
		          'height':300,
		          
		        };
		
		        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
		
		        chart.draw(data, options);
		        
		        var btnSave = document.getElementById('save_chart');  
				  google.visualization.events.addListener(chart, 'ready', function () {
				    btnSave.disabled = false;
				  });
		
				  btnSave.addEventListener('click', function () {
				    var doc = new jsPDF('l', 'mm', [297, 210]);
				    doc.addImage(chart.getImageURI(), 0, 0);
				    doc.save('Exception Analysis on Graph.pdf');
				  }, false);
		      }
    </script>
							
							
							<!-- script for chart -->
							
							
						<div class="row mt-1">
							<div class="col-md-2"></div>
							<div class="col-md-8">
							<div class="card p-2">
								<h4 class="text-center">WEEKLY GRAPH</h4>
									<div class="text-left" >
		 								<button type="button" class="btn btn-success" id="save_chart" >Export</button>                                   
		 							</div>
	 							<div id="chart_div" style="border:width=1"></div>
							</div>
							</div>
						</div>
						
							</div>
							</div>
							</div>
							

<div class="modal" id="SetCustomModal">
  <div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Dashboard Report </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
				int kk=0; 
				 
				String showList=""+ColumnList;     
			%>	
				                                     
		<form id="customselect" name="customselect" method="get" action="ReSet.jsp">  
					  <div class="modal-body">
					
						<table class="table table-bordered">
									<thead>
										<tr>
											<th>Chk &nbsp;/&nbsp;UnChk</th>
											<th>Col. Name</th>
										</tr>
									</thead>
									<tbody>
										<%
										
											StringTokenizer stcol = new StringTokenizer(showList,","); 
											while(stcol.hasMoreTokens()){
										%>
										<tr>
											<td>
												<div align="left"><input type="text" id="net_id1<%=kk %>" name="net_id1<%=kk %>" style="width:70px;padding: 4px 5px 2px 5px;
												border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif; " value="<%=kk %>" readonly/>                  
												</div>
												<input type="checkbox" name="check<%=kk %>"   id="check<%=kk %>"  />
											</td>
											<td><input type="text" name="clname<%=kk %>"   id="clname<%=kk %>"  value="<%=stcol.nextToken()%>" readonly="readonly" style="border:none" /></td>
										</tr>
										<%kk++;}%>
									</tbody>
						</table>
								
								<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=kk %>"/>
								<input type="hidden" name="reportno" id="reportno" value="<%=reportno%>">
								<input type="hidden" id="tableheaders" name="tableheaders" value="">
								<input type="hidden" id="tableheaderslength" name="tableheaderslength">
								<input type="hidden" id="call" name="call" value="SetCustom">
								<input type="hidden" name="pagename" id="pagename" value="<%=PageName%>">
								
				
				</div>
				<!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
    
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
				</form>
				</div>
				</div>
				</div>          


							   
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
<!--New Script code added End -->


<!--New Script code added For table Start -->

<script>
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
								title: 'New Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
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
                // responsive: true,
                language: {
                    paginate: {
                        // remove previous & next text from pagination
                        previous: '&nbsp;',
                        next: '&nbsp;'
                    }
                }
            });

             dt_basic.columns([<%=detailViewSequence%>]).visible(false) ,

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


         $("#detailedView").on("click", function () {

            dt_basic.columns([<%=detailViewSequence%>]).visible(true),

                $('#example1').addClass('table-responsive');

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
                    if (!this.$element.prop("multiple")) 
                    {
                        // this isn't a multi-select -> don't add the buttons!
                        return $rendered;
                    }
                    
                    $rendered.find(".select2-dropdown").prepend($btnContainer);
                    $selectAll.on("click", function (e) {
                        var $results = $rendered.find(".select2-results__option[aria-selected=false]");
                        $results.each(function () {
                            //   self.trigger("select", {
                            // 	data: $(this).data("data"),
                            //   });
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
        // $("#example1").DataTable({
        //   "responsive": true, "lengthChange": false, "autoWidth": false,
        //   "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        // }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    });
</script>
<!--New Script code added for table Start end-->
			
			

<!--New Script code added for table Start end-->
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
		
</body>

</html>







