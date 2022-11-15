<%@ include file="headernew2.jsp"%>  
<%@ page import="java.util.ArrayList"%>             
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FleetView DashBoard Report</title>

	
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
<script type="text/javascript" src="js/jspdf.min.js"></script>

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
 
</script>

</head>

<%! 
Connection conn,conn1;
String data1,sql,sql1,data2,jcode,origin,destination,startdate,vehlist;
Statement st,st1,st2,st3,st4;
%>

<%
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st1=conn1.createStatement();
st2=conn1.createStatement();
st=conn.createStatement();
st3=conn.createStatement();
st4=conn.createStatement();
PreparedStatement ps = null;
PreparedStatement ps1 = null;
PreparedStatement ps2 = null;
ResultSet rs4 = null;

String 	username="";
vehlist=session.getAttribute("VehList").toString();
username=(String)session.getAttribute("usertypevalue");
System.out.println("User ::  "+username);

String TypeofUser = session.getAttribute("TypeofUser").toString();

System.out.println(" TypeofUser ::  "+session.getAttribute("TypeofUser").toString());

/* String plansql = "select PickUpDateTime,PickUpLocation,DropDateTime,DropLocation,Status,EntryBy,count(*) as Count"
				+"from db_gps.t_RequestData where Status='Pending' group by PickUpDateTime,PickUpLocation,"
				+"DropLocation order by PickUpDateTime"; */
		
//String PlanQuery = "select * from db_gps.RequestData where RequesterId";
//String sql = "select * from db_gps.t_RequestData";

String RequestId=null;
String datex1, datex2, data1, data2;
String vehiclecode="";
String VehRegNo="";
String vehiclecode1="";
String VehRegNo1="";
String type="",status="";

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
String mdt = datex1;
String mdt1 = datex2;

System.out.println("Query Pass date params===> dt ::   "+dt+" dt1 ::   "+dt1);

username=(String)session.getAttribute("usertypevalue");
String Vehiclelist="";
Vehiclelist=(String)session.getAttribute("VehList");
System.out.println("Vehiclelist is:: "+Vehiclelist);
ResultSet rs13 = null;

double TotalVehicleCount=0;
String str="string,with,comma";
ArrayList aList= new ArrayList(Arrays.asList(Vehiclelist.split("\\s*,\\s*")));
for(int i=0;i<aList.size();i++)
{
   // System.out.println(" -->"+aList.get(i));
    TotalVehicleCount=aList.size();
}
System.out.println("Size :: "+TotalVehicleCount);

//ArrayList <String> VehArr = new ArrayList<String>();
List<String> VehArr = Arrays.asList(str.split("\\s*,\\s*"));

System.out.println("Initial Array List Size is:: "+VehArr.size());
/* String NewVehiclelist = Vehiclelist.replaceAll(",", " ");
NewVehiclelist = Vehiclelist.replaceAll(")", "");
NewVehiclelist = Vehiclelist.replaceAll("(", "");
 */
 String NewVehiclelist = Vehiclelist.replaceAll("\\p{P}"," ");
 System.out.println("New Vehiclelist is:: "+NewVehiclelist);

%>

<body>

	<div class="app-content content " style="margin-left:0px !important">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left mb-1 col-md-9 col-12">
					<div class="row breadcrumbs-top">
						
						<div class="col-12">
							<h2 class="content-header-title  mb-0">FleetView DashBoard - <%=username %></h2>
						</div>
					</div>
				</div>
				<form name="custreport" id="custreport"  method="get" >
				<div class="row col-12">
		    <div class="col-md-3"></div>
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
							<!-- <button class="btn btn-danger" onclick="history.back()">Back</button> -->
			<button id="savePage" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" >
				Save Dashboard</button>
						  </div>
					</div>
				</div>
	
			</div>
</div>
<!-- Performance Chart -->	
<%

System.out.println("dt is:" + dt );
System.out.println("dt1 is:" + dt1 );
String dtfinal[]=dt.split("-");
String dtfinalized=dtfinal[2];
String dt1final[]=dt1.split("-");
String dt1finalized=dt1final[2];
double dtfinalizede=Double.parseDouble(dtfinalized);
String VehicleDiffrencee="";
double dtfinalizedee=Double.parseDouble(dt1finalized);

double noofdays= (dtfinalizedee - dtfinalizede) ;
System.out.println("Initial no of days is:: "+ noofdays);

noofdays= noofdays + 1;
System.out.println("Final no of days is:: "+ noofdays);

String SqlPerformance="select case when sum(Distance) is null then 0 else sum(Distance) end as  PerformanceCount from db_gpsExceptions.t_vehall_ds where TheDate>='"+dt+" 00:00:00' and TheDate<='"+dt1+" 23:59:59'  and VehCode in  "+Vehiclelist+" ";
String PerformanceData="";
double VehCountNew =0;String paramratiocount="";
String TotalPerformanceVehicleCount = "";
System.out.println("Sql Query for Performance Chart is:: "+SqlPerformance);
ps = conn.prepareStatement(SqlPerformance);
rs13 = ps.executeQuery();
while(rs13.next()){
	 
	 double fixedval=200;
	  System.out.println("initially total vehicle count is :" + TotalVehicleCount);
	  
	  //  VehCountNew = TotalVehicleCount*fixedval;
	  System.out.println("Final no of days is:: "+ noofdays);

	  
	  VehCountNew = TotalVehicleCount*fixedval*noofdays;
	  String ParamName = "Revenue Paying Mileage";
	  String ParamNameTotal = "Lost Revenue Mileage";
	  Double ParamRatio = rs13.getDouble("PerformanceCount");
	  paramratiocount=Double.toString(ParamRatio);
	  
	double  VehicleDiffrence = (TotalVehicleCount*fixedval*noofdays)-(ParamRatio);
	VehicleDiffrencee=Double.toString(VehicleDiffrence);
	 System.out.println("Vehicle Diffrence:: "+VehicleDiffrence);
	 
	 PerformanceData+="["+"'"+ParamName+"',"+ParamRatio+"],";		  
	 TotalPerformanceVehicleCount="["+"'"+ParamNameTotal+"',"+VehicleDiffrence+"],";	
	} 

%>
<div class="content-body">
<input type="hidden" id="vehicledifference" name="vehicledifference" value=<%=VehicleDiffrencee %>>
<input type="hidden" id="paramratio" name="paramratio" value=<%=paramratiocount %>>

<div class="modal" id="myModalLost">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			
			  <h5 class="modal-title" id="exampleModalCenterTitle">Vehicles which should be utilised for Lost Revenue Mileage of  <%=VehicleDiffrencee %> Km  from <%=datex1 %> to <%=datex2%> for <%=username %> </h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="lostMileage" class="table table-bordered">
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
						<%
						int i_lost=1;
						String VehicleregNumber,Ownername,TheDate,Distance,TheDatefinal,Location;
						Statement stlost = conn1.createStatement();
						String sqllost = "select vehregno,Transporter,TheDate,Distance,location from db_gpsExceptions.t_vehall_ds where TheDate>='"+dt+"' and TheDate<='"+dt1+"'  and VehCode in "+vehlist+" and Distance='0' group by VehCode,TheDate order by VehCode,TheDate" ;
						ResultSet rslost = stlost.executeQuery(sqllost);
						while(rslost.next()){
							
							VehicleregNumber=rslost.getString("vehregno");
							   Ownername=rslost.getString("Transporter");
							   TheDate=rslost.getString("TheDate");
								Distance=rslost.getString("Distance");
								TheDatefinal = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));
							   Location=rslost.getString("location");
							   %>
							   <tr>
        	<td align="right"><%=i_lost%></td>
        	<td align="left"><%=VehicleregNumber%></td>
        	<td align="left"><%=TheDatefinal %></td>
        	<td align="right"><%=Distance %></td>
        	<td align="left"><%=Location %></td>
        	
        	 	
        			</tr>
							   
						<%
						i_lost++;
						}
							
						%>
					</tbody>
					
				</table>
				<%
				stlost.close();
				rslost.close();
				%>
			</div>
			</div>
		</div>
	  </div>
	</div>

<div class="modal" id="myModalRevenue">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle"> Revenue Paying Mileage  <%=paramratiocount%> Km Bifurcation details from <%=datex1 %> to <%=datex2 %> for <%=username %> </h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="revenueMileage" class="table table-bordered">
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
					<%
					int i_revenue=1;
					Statement strev = conn1.createStatement();
					String sqlrev ="select vehregno,Transporter,TheDate,Distance,Location from db_gpsExceptions.t_vehall_ds where TheDate>='"+dt+"' and TheDate<='"+dt1+"'  and VehCode in "+vehlist+" and Distance <> '0' group by VehCode,TheDate order by VehCode,TheDate";
					ResultSet rsrev =  strev.executeQuery(sqlrev);
					while(rsrev.next()){
						VehicleregNumber=rsrev.getString("vehregno");
		        		Ownername=rsrev.getString("Transporter");
		        		//FromDatetime=rsrev.getString("FromDatetime");
		        		TheDate=rsrev.getString("TheDate");
		        		Distance=rsrev.getString("Distance");
		        		TheDatefinal = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));
		        		Location=rsrev.getString("Location");
		        		
		        		 %>
		                 <tr>      
		             	 <td align="right"><%=i_revenue%></td>
		            	 <td align="left"><%=VehicleregNumber %></td>
		                 <td align="right"><%=TheDatefinal %></td>
		              	 <td align="right"><%=Distance%></td>
		                 <td align="left"><%=Location%></td>
		  
		           </tr>
		            <%
						i_revenue++;
					}
					%>
					</tbody>
					
				</table>
					<% 
					strev.close();
					rsrev.close();
					%>
			</div>
			</div>
		</div>
	  </div>
			</div>
			
			<div class="modal" id="ModalScheduled">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle">Vehicle Utilization</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="UtilScheduled" class="table table-bordered">
										<thead>
											<tr>
												<th>SrNo</th>
												<th>Vehicle</th>
												<th>DriverName</th>
												<th>TripID</th>
												<th>StartDate</th>
												<th>Utilization Type</th>
												<th>Location</th>
											</tr>
										</thead>
										<tbody>
						<%
						int i_sch = 1;
						String drivername="",tripid="";
						Statement stsch = conn.createStatement();
						String sqlsch="select vehregno,ownername,drivername,tripid,startdate,StartPlace  from db_gps.t_startedjourney where jstatus in ('Running','tobeclosed') and startdate >='"+dt+"'   and startdate <='"+dt1+"' and vehid in  "+vehlist+" group by vehid,startdate order by vehid,startdate";
						ResultSet rssch = stsch.executeQuery(sqlsch);
						while(rssch.next()){
							VehicleregNumber=rssch.getString("vehregno");
			        		Ownername=rssch.getString("ownername");
			        		drivername= rssch.getString("drivername");
			        		
			        		Location=rssch.getString("StartPlace");
			        	//	System.out.println("datefinalized is:"+ datefinalized);
			        		
			        		
			        		tripid=rssch.getString("tripid");
			        		TheDate=rssch.getString("startdate");
			        		startdate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));
			        		%><tr>
			               	 <td align="right"><%=i_sch%></td>
			               	 <td align="left"><%=VehicleregNumber %></td>
			                 <td align="left"><%=drivername %></td>
			                 <td align="right"><%=tripid%></td>
			                 <td align="right"><%=startdate%></td>
			                 <td align="left">Scheduled </td>
			                 <td align="left"><%=Location%></td>
			                  </tr>
						
						<%
						i_sch++;
						}
						%>
					</tbody>
					
				</table>
		<%
		stsch.close();
		rssch.close();
		%>
			</div>
			</div>
		</div>
	  </div>
			</div>
			
			<div class="modal" id="ModalUnused">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle">Vehicle Utilization</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="UtilUnused" class="table table-bordered">
					<thead>
						<tr>
							<tr>
												<th>SrNo</th>
												<th>Vehicle</th>
												<th>DriverName</th>
												<th>TripID</th>
												<th>StartDate</th>
												<th>Utilization Type</th>
												<th>Location</th>
											</tr>
					</thead>
					<tbody>
						<%
						int i_un=1;
			        	Statement stunused = conn.createStatement();
			        	Statement stsub = conn.createStatement();
			        	String countt="";String subQuery="";
			        	String sqlunused = "select distinct (vehiclecode) as count from db_gps.t_vehicledetails where vehiclecode in   "+vehlist+" AND vehiclecode NOT IN ( select distinct(vehid) from db_gps.t_startedjourney where jstatus in ('Running','tobeclosed') and startdate >='"+dt+" 00:00:00' and startdate <='"+dt1+" 23:59:59' and vehid in  "+vehlist+")" ;
			        	System.out.println("83 sql2---->"+sqlunused); 
			        	ResultSet rsunused = stunused.executeQuery(sqlunused);
			        
			        while(rsunused.next()){
			        	
			        	countt=rsunused.getString("count");
			        	System.out.println("countt is" + countt);
			        	
			        	subQuery="select vehregno ,ownername,drivername,tripid,startdate,startplace  from db_gps.t_startedjourney where jstatus in ('Running','tobeclosed') and startdate >='"+dt+"'   and startdate <='"+dt1+"' and vehid = "+countt+" group by vehid,startdate order by vehid,startdate desc";
			        	System.out.println("subQuery isss---->"+subQuery); 
			        	  ResultSet rssub = stsub.executeQuery(subQuery);
			                if(rssub.next()){
			        	VehicleregNumber=rssub.getString("vehregno");
			        		Ownername=rssub.getString("ownername");
			        		drivername= rssub.getString("drivername");
			        		Location=rssub.getString("startplace");
			        		
			        		
			        	//	System.out.println("datefinalized is:"+ datefinalized);
			        		
			        		
			        		tripid=rssub.getString("tripid");
			        		TheDate=rssub.getString("startdate");
			        		startdate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));
			        	
			        %>
			        	<tr>
			        	<td align="right"><%=i_un%></td>
			        	<td align="left"><%=VehicleregNumber%></td>
			        	<td align="left"><%=drivername %></td>
			        	<td align="right"><%=tripid %></td>
			        	<td align="right"><%=startdate %></td>
			        	<td align="left">Unused </td>
			            <td align="left"><%=Location %></td>
			        	</tr>
			        <%
			        	i_un++;
			        	}
			                
			                
			        } 
			     System.out.println("i is" + i_un);
			   if(i_un==0){
				   %>
				   <script> alert("Trip Entry Details not exists for these vehicle count!!");</script>
			   <%}
			        %>
					</tbody>
					
				</table>
		<%
		stunused.close();
		stsub.close();
		rsunused.close();
	//	rssub.close();
		%>
			</div>
			</div>
		</div>
	  </div>
			</div>
		
		
	<div class="modal" id="ModalUpto10km">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle"> Vehicles who travelled Distance<=10Km from <%=datex1 %> to <%=datex2 %> for <%=username %> </h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="UtilUpto10km" class="table table-bordered">
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
						<%
						int i_10=1;
			        	Statement stupto10 = conn.createStatement();
			        	String sqlupto10 = "select vehcode,vehregno,transporter,distance,TheDate,Location from db_gpsExceptions.t_vehall_ds where Distance <=10 and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+vehlist+"  group by vehcode,thedate order by vehcode,thedate" ;
			        	System.out.println("sqlupto10: "+sqlupto10); 
			        	ResultSet rsupto10 = stupto10.executeQuery(sqlupto10);
						while(rsupto10.next()){
		        		
		        		VehicleregNumber=rsupto10.getString("vehregno");
		        		Ownername=rsupto10.getString("Transporter");
		        		
		        		TheDate=rsupto10.getString("TheDate");
		        		Distance=rsupto10.getString("Distance");
		        		TheDatefinal = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));
		        		Location=rsupto10.getString("Location");
		        		%>
											<tr>
												<td align="right"><%=i_10%></td>
												<td align="left"><%=VehicleregNumber%></td>
												<td align="right"><%=TheDatefinal%></td>
												<td align="right"><%=Distance%></td>
												<td align="left"><%=Location%></td>


											</tr>

											<%
												i_10++;
												}
											%>	
			        	</tbody>
			        	</table>
			        <%
			        stupto10.close();
			        rsupto10.close();%>
			       </div>
			</div>
		</div>
	  </div>
			</div>		

<div class="modal" id="Modal10to200km">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle"> Vehicles who travelled Distance > 10Km and Distance <= 200Km from <%=datex1 %> to <%=datex2 %> for <%=username %> </h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="Util10to200km" class="table table-bordered">
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
						<%
						int i_range=1;
			        	Statement strange = conn1.createStatement();
			        	String sqlrange = "select vehcode,vehregno,transporter,distance,TheDate,location from db_gpsExceptions.t_vehall_ds where  Distance > 10 and Distance <= 200 and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+vehlist+"  group by vehcode,thedate order by vehcode,thedate" ;
			        	System.out.println("sqlrange: "+sqlrange); 
			        	ResultSet rsrange = strange.executeQuery(sqlrange);
						while(rsrange.next()){
		        		
		        		VehicleregNumber=rsrange.getString("vehregno");
		        		Ownername=rsrange.getString("Transporter");
		        		
		        		TheDate=rsrange.getString("TheDate");
		        		Distance=rsrange.getString("Distance");
		        		TheDatefinal = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));
		        		Location=rsrange.getString("Location");
		        		%>
											<tr>
												<td align="right"><%=i_range%></td>
												<td align="left"><%=VehicleregNumber%></td>
												<td align="right"><%=TheDatefinal%></td>
												<td align="right"><%=Distance%></td>
												<td align="left"><%=Location%></td>


											</tr>

											<%
												i_range++;
												}
											%>	
			        	</tbody>
			        	</table>
			        <%
			        strange.close();
			        rsrange.close();
			        %>
			       </div>
			</div>
		</div>
	  </div>
			</div>		

<div class="modal" id="ModalAbove200km">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle"> Vehicles who travelled Distance > 200Km  from <%=datex1%> to <%=datex2%> for <%=username %> </h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="UtilAbove200km" class="table table-bordered">
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
						<%
						int i_200=1;
			        	Statement st200 = conn1.createStatement();
			        	String sql200 = "select vehcode,vehregno,transporter,distance,TheDate,location from db_gpsExceptions.t_vehall_ds where  Distance > 200 and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+vehlist+" group by vehcode,thedate order by vehcode,thedate" ;
			        	System.out.println("sql above 200: "+sql200); 
			        	ResultSet rs200 = st200.executeQuery(sql200);
						while(rs200.next()){
		        		
		        		VehicleregNumber=rs200.getString("vehregno");
		        		Ownername=rs200.getString("Transporter");
		        		
		        		TheDate=rs200.getString("TheDate");
		        		Distance=rs200.getString("Distance");
		        		TheDatefinal = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));
		        		Location=rs200.getString("Location");
		        		%>
											<tr>
												<td align="right"><%=i_200%></td>
												<td align="left"><%=VehicleregNumber%></td>
												<td align="right"><%=TheDatefinal%></td>
												<td align="right"><%=Distance%></td>
												<td align="left"><%=Location%></td>
											</tr>

											<%
												i_200++;
												}
											%>	
			        	</tbody>
			        	</table>
			        <%
			        st200.close();
			        rs200.close();
			        %>
			       </div>
			</div>
		</div>
	  </div>
			</div>		


				
	<div id='graph-images' style='display:none'></div>
	
	<div class="row mt-1">
	  	<div class="col-sm-4" >
	  	<div class="card p-1" >
	  	<h4 class="text-center">Performance</h4>
	 	<div class="text-left" >
	 		<button type="button" class="btn btn-success" id="save-pdfPerformance" disabled >Export</button>
	 	</div>
		<script type="text/javascript">
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChart);
	
			function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['Date', 'TravelPerDay'],
		          <%=PerformanceData%>
		          <%=TotalPerformanceVehicleCount%>
		        ]);
		
		        var options = {
		                title: 'Expected <%=VehCountNew%> km for <%=TotalVehicleCount%> vehicles',
		                titleTextStyle:{
		                	fontSize: 16
		                	},
		                curveType: 'function',
		                pieHole: 0.4,
		                pieSliceTextStyle:{
		                	fontSize: 15
		                },
		                colors: ['Green', 'Red', 'Brown'],
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
		            var selectedItem = chart.getSelection()[0];
		            if (selectedItem) {
		              var task = data.getValue(selectedItem.row, 0);
		              alert('The user selected ' + task);

		    		  if(task=='Lost Revenue Mileage'){
		    			  //alert("in condition......Lost Revenue Mileage");
		    			  $('#myModalLost').modal('show');
		    			
		    		  }

		    		  if(task=='Revenue Paying Mileage'){
		    			$('#myModalRevenue').modal('show');

		    		  }

		            }
		          }
		
		          var container = document.getElementById('performance_chart');
		    	  var chart = new google.visualization.PieChart(container);
		    	  var btnSave = document.getElementById('save-pdfPerformance');
		
		    	  google.visualization.events.addListener(chart, 'click', selectHandler)
		    	  
		    	  google.visualization.events.addListener(chart, 'ready', function () {
		    	    btnSave.disabled = false;
		    	    var content = '<img src="' + chart.getImageURI() + '">';
			           $('#graph-images').append(content);
		    	  });
		
		    	  
		    	  btnSave.addEventListener('click', function () {
		    	    var doc = new jsPDF();
		    	    doc.addImage(chart.getImageURI(), 50, 30);
		    	    doc.save('Performance_Summary.pdf');
		    	  }, false);
		
			      chart.draw(data, options);
		      }
			
			$(function () {
		        $(document).ready(function () {
		            dt_basic = $('#lostMileage').DataTable({
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
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'csv',
		                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'excel',
		                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'pdf',
		                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'copy',
		                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
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
		            dt_basic = $('#revenueMileage').DataTable({
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
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'csv',
		                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'excel',
		                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'pdf',
		                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'copy',
		                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
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
	 	<div id="performance_chart"></div>
		</div>
		</div><!-- sm-4 end  -->
		
		<!-- Utilization Trip Chart  -->
	  
	  <%
	///Code for Query for Unused Vehicles/////////////////
	  String SqlUtilization2="select count(*) as count from db_gps.t_vehicledetails where vehiclecode in   "+Vehiclelist+" AND vehiclecode NOT IN ( select distinct(vehid) from db_gps.t_startedjourney where jstatus in ('Running','tobeclosed') and startdate >='"+dt+" 00:00:00' and startdate <='"+dt1+" 23:59:59' and vehid in  "+Vehiclelist+")";
	  String ParamRatio2="";
	  System.out.println("Query for UNUsed Vehicles!!!!!:: "+SqlUtilization2);
	  ps = conn.prepareStatement(SqlUtilization2);
	  rs13 = ps.executeQuery();
	  while(rs13.next()){
	  	 
	  	  
	  	  
	  	   ParamRatio2 = rs13.getString("count");
	  	  System.out.println("Count for Unused Vehicles!!!!!::  "+ParamRatio2);
	  	  
	  	 	}

		///Code for Query for Used Vehicles/////////////////
	  String SqlUtilization="select count(distinct vehid)as UtilizationCount from db_gps.t_startedjourney where jstatus in ('Running','tobeclosed') and startdate >='"+dt+" 00:00:00' and startdate <='"+dt1+" 23:59:59' and vehid in  "+Vehiclelist+"  ";
	  	 
				String UtilizationData="";
	  String datadate=datex1;
	  System.out.println("datadate is :-" + datadate);
	  
	  String datadate1=datex2;
	  System.out.println("datadate1 is :-" + datadate1);
	  %>
	  <input type="hidden" id="datafirst" name="datafirst" value=<%=datadate %> >
	  <input type="hidden" id="datafirstone" name="datafirstone" value=<%=datadate1%> >
	  
	  <%
	
	  String TotalUtilizaationVehicleCount = "";
	  System.out.println("Query for Used Vehicles!!!!!::  "+SqlUtilization);
	  ps = conn.prepareStatement(SqlUtilization);
	  rs13 = ps.executeQuery();
	  while(rs13.next()){
	  	 
	  	  
	  	  String ParamName = "Scheduled Vehicles";
	  	  String ParamNameTotal = "Unused Vehicles";
	  	  
	  	  String ParamRatio = rs13.getString("UtilizationCount");
	  	  System.out.println("Utilization Count::  "+ParamRatio);
	  	  
	  	  float ParamRatioRound = Float.valueOf(ParamRatio.trim()).floatValue();
	  	
	  /* 	  float TotalUtilizaationVehicleCountRound = Float.valueOf(TotalVehicleCount).floatValue();
	  	  
	  	  ParamRatioRound = Math.round(ParamRatioRound); 
	  	 float VehicleDiffrence = TotalVehicleCount-ParamRatioRound;*/
	  	float VehicleDiffrenced = Float.valueOf(ParamRatio2.trim()).floatValue();

	  	UtilizationData+="["+"'"+ParamName+"',"+ParamRatioRound+"],";		  
	  	TotalUtilizaationVehicleCount="["+"'"+ParamNameTotal+"',"+VehicleDiffrenced+"],";
	  	%>
	  	<input type="hidden" id="VehCountNew" name="VehCountNew" value=<%=VehicleDiffrenced %>>
		
	  	<%
	  	} 
	System.out.println("totalvehicle ISSSSSSSSSSS" +TotalVehicleCount);
	  
	  %>
	  	<input type="hidden" id="TotalVehicleCountone" name="TotalVehicleCountone" value=<%=TotalVehicleCount %>>
		
		
		
		<div class="col-sm-4" >
	  	<div class="card p-1" >
	  	<h4 class="text-center">Utilization Trip</h4>
	 	<div class="text-left" >
	 		<button type="button" class="btn btn-success" id="save-pdfPerformance2" disabled >Export</button>
	 	</div>
	 	<div id="performance_chart2"></div>
	 	
	 	<script>/* Chart Script Comes Here  */
	 // Load the Visualization API and the corechart package.	
		google.charts.load('current', {'packages':['corechart']});
			
	     // Set a callback to run when the Google Visualization API is loaded.
		google.charts.setOnLoadCallback(drawChart);
	
			function drawChart() {
		        var data = google.visualization.arrayToDataTable([   
		        	['Date', 'TravelPerDay'],
			          <%=UtilizationData%>
			          <%=TotalUtilizaationVehicleCount%>
		        ]);
		
		        var options = {
		       
		               title: 'Utilization Trip  for <%=TotalVehicleCount%> vehicles from <%=mdt%> to <%=mdt1%> ',
		                titleTextStyle:{
		                	fontSize: 16
		                	},
		                curveType: 'function',
		                pieHole: 0.4,
		                pieSliceTextStyle:{
		                	fontSize: 15
		                },
		                colors: ['Green', 'Red', 'Brown'],
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
		        	var selection = chart.getSelection();
		   	  	 
		  	    	 var category = data.getValue(chart.getSelection()[0].row, 0);
		  		  	  alert(category);
		  		  	 
		  		  	  var datadate = document.getElementById("datafirst").value.trim();
		  		  	 var datadate1 = document.getElementById("datafirstone").value.trim();
		  		  	// alert("datafirst:"+datadate);
		  		  	// alert("datafirstone:"+datadate1);
		  		    var vvv=document.getElementById("VehCountNew").value.trim();
		  		    var www=document.getElementById("TotalVehicleCountone").value.trim();
		  		    // alert(vvv);
		  			//alert(www);	
		  		   if(!(vvv==www)) 
		  		    { 
		  		  	  
		  		  	 // newwindow=window.open('GaugeChartOdometerFleetViewdetailed.jsp?violtype=VehicleUtilization&category='+category+'&data='+datadate+'&data1='+datadate1+'','testWindow','height=800,width=600');
		  		  	  if(category=="Scheduled Vehicles"){
		  		  		  $('#ModalScheduled').modal('show');
		  		  	  }else{  //Unused Vehicles
		  		  		$('#ModalUnused').modal('show');
		  		  	  }
		  		  	  
		  		  	   if (window.focus) 
		  		  	   {
		  		  		  newwindow.focus() 
		  		  	   }
		  	    	 
		  		  	   chart.setSelection();  // nulls out the selection 
		  		 	
		  		    }else{
		  				alert("Trip Entry Details not exists for these vehicle count!!");
		  		  }
		  		 chart.setSelection();
		          }
		        
		          var container = document.getElementById('performance_chart2');
		    	  var chart = new google.visualization.PieChart(container);
		    	  var btnSave = document.getElementById('save-pdfPerformance2');

		    	  google.visualization.events.addListener(chart, 'select', selectHandler);
		    	  
		    	  google.visualization.events.addListener(chart, 'ready', function () {
		  	  	    btnSave.disabled = false;
		  	  	  var content = '<img src="' + chart.getImageURI() + '">';
		            $('#graph-images').append(content);
		  	  	 
		  	  	 });
		    	  
		    	  btnSave.addEventListener('click', function () {
		  	  	    var doc = new jsPDF();
		  	  	    doc.addImage(chart.getImageURI(), 50, 30);
		  	  	    doc.save('UtilizationTrip_Summary.pdf');
		  	  	  }, false);

		    	

			      chart.draw(data, options);
		      }
			
			$(function () {
		        $(document).ready(function () {
		            dt_basic = $('#UtilScheduled').DataTable({
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
										title: 'Vehicle Utilization - Unused',
		                                exportOptions: { columns: [0,1,2,3,4,5,6] }
		                            },
		                            {
		                                extend: 'csv',
		                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization - Unused',
		                                exportOptions: { columns: [0,1,2,3,4,5,6] }
		                            },
		                            {
		                                extend: 'excel',
		                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization - Unused',
		                                exportOptions: { columns: [0,1,2,3,4,5,6] }
		                            },
		                            {
		                                extend: 'pdf',
		                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization - Unused',
		                                exportOptions: { columns: [0,1,2,3,4,5,6] }
		                            },
		                            {
		                                extend: 'copy',
		                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization - Unused',
		                                exportOptions: { columns: [0,1,2,3,4,5,6] }
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
		            dt_basic = $('#UtilUnused').DataTable({
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
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'csv',
		                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'excel',
		                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'pdf',
		                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'copy',
		                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
		                                className: 'dropdown-item',
										title: 'Lost Revenue Mileage',
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
	 	
		</div>
		</div>
	
	<!-- Utilization Km Chart  -->
	
	<%
	
	String UtilizationKmValueslessthan10="";
	String UtilizationKmlessthan10="";
	String sqlUtilizationKmlessthan10="select count(distinct vehcode) as UtilizationKmCount from db_gpsExceptions.t_vehall_ds where Distance <= 10 and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+Vehiclelist+"";
	
	System.out.println("Sql Query for Chart is:: "+sqlUtilizationKmlessthan10);
	ps = conn.prepareStatement(sqlUtilizationKmlessthan10);
	rs13 = ps.executeQuery();
	while(rs13.next()){
		  String ParamName = "Upto 10 Kms";
		  String ParamRatio = rs13.getString("UtilizationKmCount");
		  
		  UtilizationKmValueslessthan10+="["+"'"+ParamName+"',"+ParamRatio+"],";		  
		  UtilizationKmlessthan10=ParamRatio;
		  System.out.println("Less than 10 ::  "+ParamRatio);
		} 
	
	/* Chart Values of Usage > 10 and <=200 */
	
	String UtilizationKmValueslessthan200="";
	String Usage_greater_than11_less_than200="";
	String sqlUsage_greater_than10_less_than200="select count(distinct vehcode) as UtilizationKmCount from db_gpsExceptions.t_vehall_ds where Distance > 10 and Distance <= 200 and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+Vehiclelist+" ";
	System.out.println("Sql Query for Chart is:: "+sqlUsage_greater_than10_less_than200);
	ps = conn.prepareStatement(sqlUsage_greater_than10_less_than200);
	rs13 = ps.executeQuery();
	while(rs13.next()){
		  String ParamName = "10 Kms to 200 Kms";
		  String ParamRatio = rs13.getString("UtilizationKmCount");
		  
		  UtilizationKmValueslessthan200+="["+"'"+ParamName+"',"+ParamRatio+"],";		  
		  Usage_greater_than11_less_than200=ParamRatio;
		  System.out.println("UtilizationKmCount Count > 11 and <=200 ::  "+Usage_greater_than11_less_than200);
		} 
	
	/* Chart Values of Usage > 300 */
	String UtilizationKmValuesgreaterthan200="";
	String Usage_greater_than200="";
	String sqlUsage_greater_than200="select count(distinct vehcode) as UtilizationKmCount from db_gpsExceptions.t_vehall_ds where Distance > 200 and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+Vehiclelist+" ";
	System.out.println("Sql Query for Chart is:: "+sqlUsage_greater_than200);
	ps = conn.prepareStatement(sqlUsage_greater_than200);
	rs13 = ps.executeQuery();
	while(rs13.next()){
		  String ParamName = "More than 200 Kms";
		  String ParamRatio = rs13.getString("UtilizationKmCount");
		  
		  UtilizationKmValuesgreaterthan200+="["+"'"+ParamName+"',"+ParamRatio+"],";		  
		  Usage_greater_than200=ParamRatio;
		  System.out.println("UtilizationKmCount Count > 200 ::  "+sqlUsage_greater_than200);
		} 
	
	
	%>
		

     <div class="col-sm-4" >
	  	<div class="card p-1" >
	  	<h4 class="text-center">Utilization km</h4>
	 	<div class="text-left" >
	 		<button type="button" class="btn btn-success" id="save-pdfUtilizationKm" disabled >Export</button>
	 	</div>
	 	<script>/* Chart Script Comes Here  */
		// Load the Visualization API and the corechart package.	
		google.charts.load('current', {'packages':['corechart']});
			
	     // Set a callback to run when the Google Visualization API is loaded.
		google.charts.setOnLoadCallback(drawChart);
	
			function drawChart() {
		        var data = google.visualization.arrayToDataTable([   
		        	 ['Date', 'TravelPerDay'],
			          <%=UtilizationKmValueslessthan10%>
			          <%=UtilizationKmValueslessthan200%>
			          <%=UtilizationKmValuesgreaterthan200%>
		        ]);
		
		        var options = {
		        		is3D: false,
		               title: 'Count of Vehicles for Distance Travelled(in km) from <%=mdt%> to <%=mdt1%> ',
		                titleTextStyle:{
		                	fontSize: 16
		                	},
		                curveType: 'function',
		                pieHole: 0.4,
		                pieSliceTextStyle:{
		                	fontSize: 15
		                },
		                colors: ['Red','Orange','Green'],
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
		        
				  function selectHandler(){
					  
					  var selection = chart.getSelection();
					  	 
			  	      var category = data.getValue(chart.getSelection()[0].row, 0);
			  		  	  alert(category);
			  		  	  
			  		  if(category=='Upto 10 Kms'){
			  			  $('#ModalUpto10km').modal('show');
			  			  
			  		  }else if(category=='10 Kms to 200 Kms'){
			  			$('#Modal10to200km').modal('show');
			  			  
			  		  }else if(category=='More than 200 Kms'){
			  			$('#ModalAbove200km').modal('show');
			  		  }
					  
				  }
		        
		          var container = document.getElementById('performance_chart3');
		    	  var chart = new google.visualization.PieChart(container);
                  var btnSave = document.getElementById('save-pdfUtilizationKm');
		
				
                  google.visualization.events.addListener(chart, 'select', selectHandler)
		    	  
		    	  google.visualization.events.addListener(chart, 'ready', function () {
		    	    btnSave.disabled = false;
		    	    var content = '<img src="' + chart.getImageURI() + '">';
			           $('#graph-images').append(content);
		    	  });
		    	  
		    	  btnSave.addEventListener('click', function () {
			  	  	    var doc = new jsPDF();
			  	  	    doc.addImage(chart.getImageURI(), 50, 30);
			  	  	    doc.save('UtilizationKm.pdf');
			  	  	  }, false);
		    	  
		    	  
			      chart.draw(data, options);
		      }

			$(function () {
		        $(document).ready(function () {
		            dt_basic = $('#UtilUpto10km').DataTable({
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
										title: 'Vehicle Utilization Upto 10km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'csv',
		                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization Upto 10km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'excel',
		                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization Upto 10km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'pdf',
		                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization Upto 10km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'copy',
		                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization Upto 10km',
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
		            dt_basic = $('#Util10to200km').DataTable({
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
										title: 'Vehicle Utilization  between 10km to 200km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'csv',
		                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization  between 10km to 200km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'excel',
		                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization  between 10km to 200km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'pdf',
		                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization  between 10km to 200km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'copy',
		                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization  between 10km to 200km',
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
		            dt_basic = $('#UtilAbove200km').DataTable({
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
										title: 'Vehicle Utilization Above 200km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'csv',
		                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization Above 200km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'excel',
		                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization Above 200km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'pdf',
		                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization Above 200km',
		                                exportOptions: { columns: [0,1,2,3,4] }
		                            },
		                            {
		                                extend: 'copy',
		                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
		                                className: 'dropdown-item',
										title: 'Vehicle Utilization Above 200km',
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
	 	<div id="performance_chart3"></div>
		</div>
		</div>
		</div><!-- row mt-1 ends here -->
		
		<!-- ====================================1st row ends here================================================== -->

<!-- Vehicle Runtime / Utilization Time-->
	
	<%
	
	String UtilizationTimeValueslessthan30="";
	
	String sqlAvgRunTime="select COUNT(distinct vehcode) as AvgRuntimeDuration from db_gpsExceptions.t_vehall_ds where RDurationinHrs <=0.5 and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+Vehiclelist+" ";
	System.out.println("Sql Query for sqlPerformance Chart is:: "+sqlAvgRunTime);
	ps = conn.prepareStatement(sqlAvgRunTime);
	rs13 = ps.executeQuery();
	while(rs13.next()){
		 
	String ParamName = "Upto 30 Mins";
		  String ParamRatio = rs13.getString("AvgRuntimeDuration");
		  float ParamRatioRound = Float.valueOf(ParamRatio.trim()).floatValue();
		  ParamRatioRound = Math.round(ParamRatioRound);
		  System.out.println("AvgRunTime Count::  "+ParamRatioRound);
		  
		  UtilizationTimeValueslessthan30+="["+"'"+ParamName+"',"+ParamRatioRound+"],";		   
		} 
	
	
	String UtilizationTimeValuesBetween31To2Hr="";
	
	String sqlAvgRunTime31to2hr="select COUNT(distinct vehcode) as AvgRuntimeDuration from db_gpsExceptions.t_vehall_ds where RDurationinHrs >0.5 and RDurationinHrs <=2 and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+Vehiclelist+" ";
	System.out.println("Sql Query for sqlPerformance Chart is:: "+sqlAvgRunTime31to2hr);
	ps = conn.prepareStatement(sqlAvgRunTime31to2hr);
	rs13 = ps.executeQuery();
	while(rs13.next()){
		 
	 String ParamName = "30 Mins. To 2 Hrs";
		  String ParamRatio = rs13.getString("AvgRuntimeDuration");
		  float ParamRatioRound = Float.valueOf(ParamRatio.trim()).floatValue();
		  ParamRatioRound = Math.round(ParamRatioRound);
		  System.out.println("AvgRunTime Count::  "+ParamRatioRound);
		  
		  UtilizationTimeValuesBetween31To2Hr+="["+"'"+ParamName+"',"+ParamRatioRound+"],";		  
		 
		} 
	
	
	String UtilizationKmValuesgreaterthan2Hr="";
	
	String sqlAvgRunTimegreaterthan2Hr="select COUNT(distinct vehcode) as AvgRuntimeDuration from db_gpsExceptions.t_vehall_ds where RDurationinHrs >2 and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+Vehiclelist+" ";
	System.out.println("Sql Query for sqlPerformance Chart is:: "+sqlAvgRunTimegreaterthan2Hr);
	ps = conn.prepareStatement(sqlAvgRunTimegreaterthan2Hr);
	rs13 = ps.executeQuery();
	while(rs13.next()){
		 
	 String ParamName = "More Than 2 Hrs";
		  String ParamRatio = rs13.getString("AvgRuntimeDuration");
		  float ParamRatioRound = Float.valueOf(ParamRatio.trim()).floatValue();
		  ParamRatioRound = Math.round(ParamRatioRound);
		  System.out.println("AvgRunTime Count::  "+ParamRatioRound);
		  
		  UtilizationKmValuesgreaterthan2Hr+="["+"'"+ParamName+"',"+ParamRatioRound+"],";		  
		 
		}%>
		
		<div class="modal" id="ModalUpto30min">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle">Vehicles with RunDurationinHrs <=0.5Hrs from <%=datex1 %> to <%=datex2 %> for <%=username %></h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="RuntimeUpto30" class="table table-bordered">
										<thead>
											<tr>
												<th>SrNo</th>
												<th>Vehicle</th>
												<th>Date</th>
												<th>Run Duration(Hrs)</th>
												<th>Location</th>
											</tr>
										</thead>
										<tbody>
						<%
						int i_30=1;
					    String RDurationinHrs="";
			        	Statement st30 = conn1.createStatement();
			        	String sql30 = "select vehregno,transporter,RDurationinHrs,TheDate,Location from db_gpsExceptions.t_vehall_ds where RDurationinHrs <=0.5 and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+vehlist+"  group by vehcode,TheDate order by vehcode,TheDate" ;
			        	System.out.println("sql upto 30min: "+sql30); 
			        	ResultSet rs30 = st30.executeQuery(sql30);
						while(rs30.next()){
		        		
							VehicleregNumber=rs30.getString("vehregno");
			        		Ownername=rs30.getString("Transporter");
			        		//FromDatetime=rs30.getString("FromDatetime");
			        		TheDate=rs30.getString("TheDate");
			        		RDurationinHrs=rs30.getString("RDurationinHrs");
			        		TheDatefinal = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));
			        		Location=rs30.getString("Location");
		        		%>
											<tr>
												<td align="right"><%=i_30%></td>
												<td align="left"><%=VehicleregNumber%></td>
												<td align="right"><%=TheDatefinal%></td>
												<td align="right"><%=RDurationinHrs%></td>
												<td align="left"><%=Location%></td>
											</tr>

											<%
												i_30++;
												}
											%>	
			        	</tbody>
			        	</table>
			        <%
			        st30.close();
			        rs30.close();
			        %>
			       </div>
			</div>
		</div>
	  </div>
			</div>	
			
			<div class="modal" id="ModalUpto30min">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle">Vehicles with RunDurationinHrs <=0.5Hrs from <%=datex1 %> to <%=datex2 %> for <%=username %></h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="Runtime30to2hrs" class="table table-bordered">
										<thead>
											<tr>
												<th>SrNo</th>
												<th>Vehicle</th>
												<th>Date</th>
												<th>Run Duration(Hrs)</th>
												<th>Location</th>

											</tr>
										</thead>
										<tbody>
						<%
						int i30_2hrs=1;
					    
			        	Statement st30_2hrs = conn1.createStatement();
			        	String sql30_2hrs = "select vehregno,transporter,RDurationinHrs,TheDate,location from db_gpsExceptions.t_vehall_ds where RDurationinHrs >0.5 and RDurationinHrs <=2  and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+vehlist+" group by vehcode,TheDate order by vehcode,TheDate" ;
			        	System.out.println("sql 30min-2hrs: "+sql30_2hrs); 
			        	ResultSet rs30_2hrs = st30_2hrs.executeQuery(sql30_2hrs);
						while(rs30_2hrs.next()){
							VehicleregNumber=rs30_2hrs.getString("vehregno");
							Ownername=rs30_2hrs.getString("Transporter");
							TheDate=rs30_2hrs.getString("TheDate");
							RDurationinHrs=rs30_2hrs.getString("RDurationinHrs");
							TheDatefinal = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));
						     Location=rs30_2hrs.getString("Location");
					     
					  %>
											<tr>
												<td align="right"><%=i30_2hrs%></td>
												<td align="left"><%=VehicleregNumber%></td>
												<td align="right"><%=TheDatefinal%></td>
												<td align="right"><%=RDurationinHrs%></td>
												<td align="left"><%=Location%></td>
											</tr>

											<%
											i30_2hrs++;
												}
											%>	
			        	</tbody>
			        	</table>
			        <%
			        st30_2hrs.close();
			        rs30_2hrs.close();
			        %>
			       </div>
			</div>
		</div>
	  </div>
	</div>
	
				<div class="modal" id="ModalAbove2hrs">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle">Vehicles with RunDurationinHrs > 2 Hrs from <%=datex1 %> to <%=datex2 %> for <%=username %></h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="RuntimeAbove2hrs" class="table table-bordered">
										<thead>
											<tr>
												<th>SrNo</th>
												<th>Vehicle</th>
												<th>Date</th>
												<th>Run Duration(Hrs)</th>
												<th>Location</th>
											</tr>
										</thead>
										<tbody>
						<%
						int i_2hrs=1;
					    
			        	Statement st_2hrs = conn1.createStatement();
			        	String sql_2hrs = "select vehregno,transporter,RDurationinHrs,TheDate,location from db_gpsExceptions.t_vehall_ds where RDurationinHrs >2 and TheDate >='"+dt+"' and TheDate <='"+dt1+"' and vehcode in  "+vehlist+" group by vehcode,TheDate order by vehcode,TheDate" ;
			        	System.out.println("sql above 2hrs: "+sql_2hrs); 
			        	ResultSet rs_2hrs = st_2hrs.executeQuery(sql_2hrs);
						while(rs_2hrs.next()){
							VehicleregNumber=rs_2hrs.getString("vehregno");
							Ownername=rs_2hrs.getString("Transporter");
							TheDate=rs_2hrs.getString("TheDate");
							RDurationinHrs=rs_2hrs.getString("RDurationinHrs");
							TheDatefinal = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));
						     Location=rs_2hrs.getString("Location");
					     
					  %>
											<tr>
												<td align="right"><%=i_2hrs%></td>
												<td align="left"><%=VehicleregNumber%></td>
												<td align="right"><%=TheDatefinal%></td>
												<td align="right"><%=RDurationinHrs%></td>
												<td align="left"><%=Location%></td>
											</tr>

											<%
											i_2hrs++;
												}
											%>	
			        	</tbody>
			        	</table>
			        <%
			        st_2hrs.close();
			        rs_2hrs.close();
			        %>
			       </div>
			</div>
		</div>
	  </div>
	</div>

<div class="modal" id="ModalOffRoadUpto2">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle">OffRoad Vehicles Upto 2 Days for <%=username %></h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="OffRoadUpto2" class="table table-bordered">
					<thead>
						<tr>
							<th>SrNo</th>
							<th>Vehicle</th>
							<th>Date Time</th>
							<th>Location</th>

						</tr>
					</thead>
					<tbody>
						<%
						int i_off2=1;
						String OffRoadDate="",datefin="",Timed="";
						Statement st_off2 = conn.createStatement();
						String sql_off2 = "select  vehicleregno,vehiclecode,transporter,thedate,Location,TheTime from db_gps.t_onlinedata where DATE(TheDate) >= DATE_SUB('"+dt1+"',INTERVAL 1 DAY) and  DATE(TheDate) <= '"+dt1+"'   and Vehiclecode in  "+vehlist+" group by vehicleregno,thedate order by vehicleregno,thedate";
						ResultSet rs_off2 = st_off2.executeQuery(sql_off2);
						while(rs_off2.next()){
							 VehicleregNumber=rs_off2.getString("vehicleregno");
			            	 Ownername=rs_off2.getString("transporter");
			            	 OffRoadDate=rs_off2.getString("thedate");
			            	 datefin = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(OffRoadDate));
			            	 Location=rs_off2.getString("Location");
			            	 Timed=rs_off2.getString("TheTime");
			            	 TheDate=datefin+" "+Timed;%>
						
						<tr> 
         
   	 <td align="right"><%=i_off2%></td>
   	 <td align="left"><%=VehicleregNumber %></td>
     <td align="right"><%=TheDate%></td>
     <td align="left"><%=Location%></td>           
   </tr>
						
						
						<%
						i_off2++;
						}%>
					</tbody>
					
				</table>
		<%
		
		%>
			</div>
			</div>
		</div>
	  </div>
			</div>
	
	<div class="modal" id="ModalOffRoad3to7">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle">OffRoad Vehicles 3 Days To 7 Days for <%=username %></h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="OffRoad3to7" class="table table-bordered">
					<thead>
						<tr>
							<th>SrNo</th>
							<th>Vehicle</th>
							<th>Date Time</th>
							<th>Location</th>

						</tr>
					</thead>
					<tbody>
						<%
						int ioff3_7=1;
						Statement stoff3_7=conn.createStatement();
						String sqloff3_7="select  vehicleregno,vehiclecode,transporter,thedate,location,thetime from db_gps.t_onlinedata where DATE(TheDate) > DATE_SUB('"+dt1+"',INTERVAL 7 DAY) and DATE(TheDate) <=  DATE_SUB('"+dt1+"',INTERVAL 2 DAY)    and Vehiclecode in  "+vehlist+" group by vehicleregno,thedate order by vehicleregno,thedate";
						ResultSet rsoff3_7=stoff3_7.executeQuery(sqloff3_7);
						while(rsoff3_7.next()){
							VehicleregNumber=rsoff3_7.getString("vehicleregno");
						  	 Ownername=rsoff3_7.getString("transporter");
						  	OffRoadDate=rsoff3_7.getString("thedate");
							Timed=rsoff3_7.getString("thetime");
							Location=rsoff3_7.getString("location");
						  	datefin = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(OffRoadDate));
						    TheDate=datefin + " "+Timed;%>
							
							<tr>      
             	 <td align="right"><%=ioff3_7%></td>
            	 <td align="left"><%=VehicleregNumber %></td>
                 <td align="right"><%=TheDate%></td>
               	 <td align="left"><%=Location%></td>
               	
              	    </tr> 
						
						   <% 
						   ioff3_7++;
						}
						%>
					</tbody>
					
				</table>
		<%
		 stoff3_7.close();
		 rsoff3_7.close();
		%>
			</div>
			</div>
		</div>
	  </div>
			</div>
	
	<div class="modal" id="ModalOffRoadAbove7">
			<div class="modal-dialog" >
        <div class="modal-content" style="width:950px">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalCenterTitle">OffRoad  Vehicles More than 7 days for <%=username %></h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="OffRoadAbove7" class="table table-bordered">
					<thead>
						<tr>
							<th>SrNo</th>
							<th>Vehicle</th>
							<th>Date Time</th>
							<th>Location</th>
						</tr>
					</thead>
					<tbody>
						<%
						int ioff_7 = 1;
						Statement stoff_7 = conn.createStatement();
						String sqloff_7 = "select  vehicleregno,vehiclecode,transporter,thedate,location,thetime from db_gps.t_onlinedata where  DATE(TheDate) <  DATE_SUB('"+dt1+"',INTERVAL 7 DAY)    and Vehiclecode in  "+vehlist+" group by vehicleregno,thedate order by vehicleregno,thedate";
						ResultSet rsoff_7 = stoff_7.executeQuery(sqloff_7);
						while(rsoff_7.next()){
							VehicleregNumber=rsoff_7.getString("vehicleregno");
						  	 Ownername=rsoff_7.getString("transporter");
						  	 OffRoadDate=rsoff_7.getString("thedate");
						  	 datefin = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(OffRoadDate));
						  	 Timed=rsoff_7.getString("thetime");
							 Location=rsoff_7.getString("location");
							 TheDate=datefin + " "+Timed;%>
							 
							 <tr>      
             	 <td align="right"><%=ioff_7%></td>
            	 <td align="left"><%=VehicleregNumber %></td>
                 <td align="right"><%=TheDate%></td>
               	 <td align="left"><%=Location%></td>
               	
             </tr>
							
						<%
						ioff_7++;
						}
						%>
					</tbody>
					
				</table>
		<%
		stoff_7.close();
		rsoff_7.close();
		%>
			</div>
			</div>
		</div>
	  </div>
			</div>
	
		
		<div class="row mt-1">
					<div class="col-sm-4">
						<div class="card p-1">
							<h4 class="text-center">Utilization Time</h4>

							<div class="text-left">
								<button type="button" class="btn btn-success"
									id="save-pdfUtilizationtime" disabled>Export</button>
							</div>
							<script>
							/* Chart Script Comes Here  */
							// Load the Visualization API and the corechart package.	
							google.charts.load('current', {'packages':['corechart']});
								
						     // Set a callback to run when the Google Visualization API is loaded.
							google.charts.setOnLoadCallback(drawChart);
						
								function drawChart() {
							        var data = google.visualization.arrayToDataTable([   
							        	 ['Date', 'TravelPerDay'],
								          <%=UtilizationTimeValueslessthan30%>
			          						<%=UtilizationTimeValuesBetween31To2Hr%>
			         						 <%=UtilizationKmValuesgreaterthan2Hr%>
							        ]);
							
							        var options = {
							        		is3D: false,
							               title: 'Count of vehicles for Time Travelled(in Hr) from <%=mdt%> to <%=mdt1%> ',
							                titleTextStyle:{
							                	fontSize: 16
							                	},
							                curveType: 'function',
							                pieHole: 0.4,
							                pieSliceTextStyle:{
							                	fontSize: 15
							                },
							                colors: ['Red','Orange','Green'],
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
							        
									  function selectHandler(){
										  
										  var selection = chart.getSelection();
										  	 
								  	      var category = data.getValue(chart.getSelection()[0].row, 0);
								  		  	  alert(category);
								  		  	  
								  		  if(category=='Upto 30 Mins'){
								  			  $('#ModalUpto30min').modal('show');
								  			  
								  		  }
								  		   else if(category=='30 Mins. To 2 Hrs'){
								  			$('#Modal30to2hrs').modal('show');
								  			  
								  		  }else if(category=='More Than 2 Hrs'){
								  			$('#ModalAbove2hrs').modal('show');
								  		  }
										  
									  }
							        
							          var container = document.getElementById('performance_chart4');
							    	  var chart = new google.visualization.PieChart(container);
					                  var btnSave = document.getElementById('save-pdfUtilizationtime');
							
									
					                  google.visualization.events.addListener(chart, 'select', selectHandler)
							    	  
							    	  google.visualization.events.addListener(chart, 'ready', function () {
							    	    btnSave.disabled = false;
							    	    var content = '<img src="' + chart.getImageURI() + '">';
								           $('#graph-images').append(content);
							    	  });
							    	  
							    	  btnSave.addEventListener('click', function () {
								  	  	    var doc = new jsPDF();
								  	  	    doc.addImage(chart.getImageURI(), 50, 30);
								  	  	    doc.save('UtilizationTime.pdf');
								  	  	  }, false);
							    	  
							    	  
								      chart.draw(data, options);
							      }
								
								$(function () {
							        $(document).ready(function () {
							            dt_basic = $('#RuntimeUpto30').DataTable({
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
															title: 'Runtime Upto 30 minutes',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'csv',
							                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
							                                className: 'dropdown-item',
															title: 'Runtime Upto 30 minutes',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'excel',
							                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
							                                className: 'dropdown-item',
															title: 'Runtime Upto 30 minutes',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'pdf',
							                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
							                                className: 'dropdown-item',
															title: 'Runtime Upto 30 minutes',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'copy',
							                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
							                                className: 'dropdown-item',
															title: 'Runtime Upto 30 minutes',
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
							            dt_basic = $('#Runtime30to2hrs').DataTable({
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
															title: 'Runtime From 30 minutes to 2 hours',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'csv',
							                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
							                                className: 'dropdown-item',
															title: 'Runtime From 30 minutes to 2 hours',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'excel',
							                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
							                                className: 'dropdown-item',
															title: 'Runtime From 30 minutes to 2 hours',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'pdf',
							                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
							                                className: 'dropdown-item',
															title: 'Runtime From 30 minutes to 2 hours',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'copy',
							                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
							                                className: 'dropdown-item',
															title: 'Runtime From 30 minutes to 2 hours',
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
							            dt_basic = $('#RuntimeAbove2hrs').DataTable({
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
															title: 'Runtime Above 2 hours',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'csv',
							                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
							                                className: 'dropdown-item',
															title: 'Runtime Above 2 hours',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'excel',
							                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
							                                className: 'dropdown-item',
															title: 'Runtime Above 2 hours',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'pdf',
							                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
							                                className: 'dropdown-item',
															title: 'Runtime Above 2 hours',
							                                exportOptions: { columns: [0,1,2,3,4] }
							                            },
							                            {
							                                extend: 'copy',
							                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
							                                className: 'dropdown-item',
															title: 'Runtime Above 2 hours',
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
							<div id="performance_chart4"></div>
						</div>
					</div>
					
							  <%
	String OffRoadValuesUpto2Days="";
	
	String sqlOffRoadValuesUpto2Days="select count(*) as OffRoadCount from db_gps.t_onlinedata where DATE(TheDate) >= DATE_SUB('"+dt1+"',INTERVAL 1 DAY) and  DATE(TheDate) <= '"+dt1+"' and Vehiclecode in "+Vehiclelist+"";
	System.out.println("Sql Query for sqlOffRoad Chart upto 2 days is:: "+sqlOffRoadValuesUpto2Days);
	ps = conn.prepareStatement(sqlOffRoadValuesUpto2Days);
	rs13 = ps.executeQuery();
	while(rs13.next()){
		 
		  
		  String ParamName = "Upto 2 Days";
		  String ParamRatio = rs13.getString("OffRoadCount");
		  System.out.println("OffRoad Count::  "+ParamRatio);
		 
		  OffRoadValuesUpto2Days+="["+"'"+ParamName+"',"+ParamRatio+"],";		  
		 
		} 
	
	String OffRoadValues3To7Days="";
	
	String sqlOffRoadValues3To7Days="select count(*) as OffRoadCount from db_gps.t_onlinedata where DATE(TheDate) > DATE_SUB('"+dt1+"',INTERVAL 7 DAY) and DATE(TheDate) <= DATE_SUB('"+dt1+"',INTERVAL 2 DAY)  and Vehiclecode in "+Vehiclelist+"";
	System.out.println("Sql Query for sqlOffRoad Chart 3 TO 7 days is:: "+sqlOffRoadValues3To7Days);
	ps = conn.prepareStatement(sqlOffRoadValues3To7Days);
	rs13 = ps.executeQuery();
	while(rs13.next()){
		 
		  
		  String ParamName = "3 Days To 7 Days";
		  String ParamRatio = rs13.getString("OffRoadCount");
		  System.out.println("OffRoad Count::  "+ParamRatio);
		  OffRoadValues3To7Days+="["+"'"+ParamName+"',"+ParamRatio+"],";		  
		 
		} 
	
	String OffRoadValues8Days="";
	
	String sqlOffRoadValues8Days="select count(*) as OffRoadCount from  db_gps.t_onlinedata  where  DATE(TheDate) < DATE_SUB('"+dt1+"',INTERVAL 7 DAY)  and Vehiclecode in "+Vehiclelist+"";
	System.out.println("Sql Query for sqlOffRoad Chart 8 DAYS is:: "+sqlOffRoadValues8Days);
	ps = conn.prepareStatement(sqlOffRoadValues8Days);
	rs13 = ps.executeQuery();
	while(rs13.next()){
		 
		  
		  String ParamName = "More Than 7 Days";
		  String ParamRatio = rs13.getString("OffRoadCount");
		  System.out.println("OffRoad Count::  "+ParamRatio);
		 
		  OffRoadValues8Days+="["+"'"+ParamName+"',"+ParamRatio+"],";		  
		 
		} 
	
	%>
					
		<div class="col-sm-4">
		  <div class="card p-1">
					<h4 class="text-center">Off Road</h4>
					<div class="text-left" >
	 				<button type="button" class="btn btn-success" id="save-pdfPerformance5" disabled >Export</button>
				</div>
				<script>
				 google.charts.load("current", {packages:["corechart"]});
			      google.charts.setOnLoadCallback(drawChart);
			      function drawChart() {
			        var data = google.visualization.arrayToDataTable([
			        	['Date', 'TravelPerDay'],
			            <%=OffRoadValuesUpto2Days%>
			        	<%=OffRoadValues3To7Days%>
			        	<%=OffRoadValues8Days%>
			        ]);
			
			        var options = {
			            title: 'Count of Off Road Vehicles from <%=mdt1%>',
				        is3D: true,
		              titleTextStyle:{
		              	fontSize: 15,
		              	bold: true,
		              	},
		              curveType: 'function',
		              pieHole: 0.4,
		              pieSliceTextStyle:{
		              	fontSize: 15
		              },
		              colors: ['Green','Orange','Red'],
		              legend: {
		      	    	position: 'labeled',
		      	    	labeledValueText:'value',
		      	    	textStyle: {
		      	            color: 'black',
		      	            fontSize: 15,
		      	        }
		      	    },
		      	    chartArea:{left: 10, width:'100%',height:'85%'},	
		              'height':300
		            };
			        
			       
			        	function selectHandler() {
				        	//alert("in select handler..")
				            var selectedItem = chart.getSelection()[0];
				        	//alert("selected item...")
				            if (selectedItem) {
				              var task = data.getValue(selectedItem.row, 0);
				              alert('The user selected ' + task);

				    		  if(task=='Upto 2 Days'){
				    			$('#ModalOffRoadUpto2').modal('show');

				    		  }

				    		  if(task=='3 Days To 7 Days'){
				    			$('#ModalOffRoad3to7').modal('show');

				    		  }
				    		  
				    		  if(task=='More Than 7 Days'){
					    			$('#ModalOffRoadAbove7').modal('show');

					    		  }

				            }
				          }
			        	
			        
			
			        var container = document.getElementById('performance_chart5');
			    	  var chart = new google.visualization.PieChart(container);
			    	  var btnSave = document.getElementById('save-pdfPerformance5');
			    	  
			    	  google.visualization.events.addListener(chart, 'click', selectHandler)
			    	  
			    	 google.visualization.events.addListener(chart, 'ready', function () {
							    	    btnSave.disabled = false;
							    	    var content = '<img src="' + chart.getImageURI() + '">';
								           $('#graph-images').append(content);
							    	  });
							    	  
							    	  btnSave.addEventListener('click', function () {
								  	  	    var doc = new jsPDF();
								  	  	    doc.addImage(chart.getImageURI(), 50, 30);
								  	  	    doc.save('OffRoad.pdf');
								  	  	  }, false);
							    	  
							    	  chart.draw(data, options);		    	  
			      }
			      
			      $(function () {
				        $(document).ready(function () {
				            dt_basic = $('#OffRoadUpto2').DataTable({
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
												title: 'Vehicles Off Road Upto 2 Days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'csv',
				                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road Upto 2 Days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'excel',
				                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road Upto 2 Days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'pdf',
				                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road Upto 2 Days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'copy',
				                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road Upto 2 Days',
				                                exportOptions: { columns: [0,1,2,3] }
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
				            dt_basic = $('#OffRoad3to7').DataTable({
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
												title: 'Vehicles Off Road from 3 to 7 days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'csv',
				                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road from 3 to 7 days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'excel',
				                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road from 3 to 7 days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'pdf',
				                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road from 3 to 7 days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'copy',
				                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road from 3 to 7 days',
				                                exportOptions: { columns: [0,1,2,3] }
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
				            dt_basic = $('#OffRoadAbove7').DataTable({
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
												title: 'Vehicles Off Road Above 7 days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'csv',
				                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road Above 7 days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'excel',
				                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road Above 7 days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'pdf',
				                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road Above 7 days',
				                                exportOptions: { columns: [0,1,2,3] }
				                            },
				                            {
				                                extend: 'copy',
				                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
				                                className: 'dropdown-item',
												title: 'Vehicles Off Road Above 7 days',
				                                exportOptions: { columns: [0,1,2,3] }
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
				<div id="performance_chart5"></div>
			</div>
		  </div>
		  

		  <div class="col-sm-4">
		  <!-- write chart javascript code for performance_chart6 here  -->
		  <div class="card p-1">
					<h4 class="text-center"></h4>
					
					<div class="text-left" >
	 				<button type="button" class="btn btn-success" id="save-pdfPerformance6" disabled >Export</button>
				</div>
				<div id="performance_chart6"></div>
			</div>
		  </div>
			
				</div> <!-- end of mt-1  -->
				
				
		</div>
		</div>
		</div>
	<%
	conn.close();
	conn1.close();
	%>
	      
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
	
</body>
<br><br>
 <%@ include file="footernew1.jsp"%> 

</html>