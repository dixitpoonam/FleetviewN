<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
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
list=""
nodes=[];

	function ondemand(){
		alert("in method...")
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
	alert("ii "+i);
	document.getElementById("tableheaderslength").value =i;
	alert("list:"+list);
	 var flag=document.getElementById("setDefFlag").value;
	alert("flag "+flag); 
	
	
	if(flag == "false")
		{
		alert("flag is false..");
		
		ajaxRequest = new XMLHttpRequest();
		
		
		var ajaxRequest;
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				
			} 
		};
		alert("in ajax call.."+(nodes.length/2));
		 ajaxRequest.open("GET", "ReSet.jsp?call=SetDefault&reportno="+<%=reportno%>+"&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true); 
		ajaxRequest.send(); 
		}
	}
</script>
 
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
</head>
<body onload="ondemand()">
<input type="hidden" id="PageName" name="PageName"
				value="<%=PageName%>" />
<%! 
Connection conn,conn1;
String sql,sql1,jcode,origin,destination,startdate;
Statement st,st1,st2;
/* String datex1, datex2, data1, data2; */

String datex1, datex2, data1, data2;
String vehiclecode="";
String VehRegNo="";
String vehiclecode1="";
String VehRegNo1="";
String type="",status="";

%>	
<%
	Connection conn=null;
	Statement st=null, st1=null,st2=null,st20=null,st21=null;
%>
<%
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st1=conn1.createStatement();
st2=conn1.createStatement();
st=conn.createStatement();
PreparedStatement ps = null;
ResultSet rs4 = null;ResultSet rs6 = null;ResultSet rs8 = null;

String 	username="";String ETA="";
username=(String)session.getAttribute("usertypevalue");
System.out.println("username is :-" + username);

	

%>			
<%

username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 



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
	//for report conversion use this query
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


<%
String ddx = request.getQueryString();

String bt=request.getParameter("button");
System.out.println(" buttom :- "+bt);
	
	if (bt== null || bt.equals("null")) {
		System.out.println("Inside On load");
		
		datex1 =  session.getAttribute("PresentMonthFirst").toString();  //dd-MMM-yyyy
		
		datex2 = session.getAttribute("today").toString();
		
	} else {
		
		System.out.println("Inside ELSSSSSSSSS ");
		
		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");
		
	}

System.out.println(" datex1 "+datex1+" datex2 "+datex2);

String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

String dttime=""+dt+" 00:00:00";


String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

String dt1time=""+dt1+" 23:59:59";

System.out.println("Query pass date params:  from:"+dt+" to: "+dt1);
	
System.out.println("Query pass date time  params:  from:"+dttime+" to: "+dt1time);

String Selection1 = request.getParameter("basicSelect1");
System.out.println("selection1:"+Selection1);

String Selection2 = request.getParameter("basicSelect2");
System.out.println("selection2:"+Selection2);

String Selection3 = request.getParameter("basicSelect3");
System.out.println("selection3:"+Selection3);

String Selection4 = request.getParameter("basicSelect4");
System.out.println("selection4:"+Selection4);

String requesttype1=request.getParameter("RequestType");

String Status21=request.getParameter("Status");




if(requesttype1==null || requesttype1==" " || requesttype1=="")
{
	type="Material Movement";
}
else
{
	type=request.getParameter("RequestType");
	  
}

System.out.println("Type :- "+type);

if(Status21==null || Status21==" " || Status21=="")
{
	  status="Scheduled";
}
else
{
	  
	 status=request.getParameter("Status");
}


System.out.println("Status :- "+status);


%>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left mb-1 col-md-3 col-12 ">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Schedule Report</h3>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-9 col-12 d-md-block d-none ">
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
	<!-- ****************************************** -->	

<!-- Form Comes here -->
		
	<form name="formreport" id="formreport" method="post">
		<div class="row">  <!-- row main start -->  
		    <div class="col-md-1"></div>
			    <div class="col-md-2"> <!-- col 1 -->
					  <label for="from">From:</label>
							<div class="input-group input-group-merge" >
								<input type="text" name="data" id="data"  class="form-control" value="<%=datex1%>">  								<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
 							</div>
						   <script>
								    $(document).ready(function() {
									$( function() {
		   				            $( "#data" ).datepicker({
								    dateFormat: 'dd-M-yy',
									changeMonth: true,
						            changeYear: true  });  } );
										});
						   </script>
						  
			     </div>  <!-- col 1 -->
			     
			    <div class="col-md-2"> <!-- col 2 -->
				   <label for="to">To:</label>
						<div class="input-group input-group-merge" >
							<input type="text" id="data1" name="data1"  
							class="form-control" value="<%=datex2%>"/> 
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
								maxDate:7 */}); } );
			
									});
			           </script>
		     </div>  <!-- col 2 -->
		      
		    <div class="col-md-2">  <!-- col 3-->
		         <label for="basicSelect">Plan Type:</label>
					<div class="input-group input-group-merge">
							<select class="form-select" id="basicSelect1" name="RequestType" id="RequestType">
								<option value="<%=type%>"> <%=type%> </option>
								<%
						       	String sqlregno = "select distinct(PlanType) as vehiclecode from db_gps.t_PlanData where PlanType!='-' order by PlanType";
								System.out.println("*******"+sqlregno);
						        ResultSet rsregno = st.executeQuery(sqlregno);
								while(rsregno.next())
								{
									 vehiclecode= rsregno.getString("vehiclecode");
									
								    //	System.out.println("*******");
									//System.out.println("*vehicles******"+vehicles);
									//System.out.println("*VehRegNo******"+VehRegNo);
									//System.out.println("-anil veh-------"+vehicles.equalsIgnoreCase(rsregno.getString("VehicleRegNumber")));
									%>	
							<option style="font-size: 13px; face:san-serif; color:black" value="<%=vehiclecode%>"><%=vehiclecode%></option>
							<%
						}%>
							</select>
							
		          </div>
		    </div>  <!-- col 3 -->
		    
		    <div class="col-md-2"> <!-- col 4 -->
		         <label for="basicSelect">Status:</label>
					<div class="input-group input-group-merge">
							<select class="form-select"  name="Status" id="Status">
								<option  value="<%=status%>"><%=status%></option>
								 <%
            
								       	String sqlregno1 = "select distinct(Status) as vehiclecode from db_gps.t_VehicleScheduleData order by Status";
										System.out.println("*******"+sqlregno1);
								        ResultSet rsregno1 = st.executeQuery(sqlregno1);
										while(rsregno1.next())
										{
											 vehiclecode1= rsregno1.getString("vehiclecode");
											
											
									         
											%>	
									<option style="font-size: 13px; face:san-serif; color:black" value="<%=vehiclecode1%>"><%=vehiclecode1%></option>
									<%
									 
											
								}%>
								
							</select>
							
		          </div>
		    </div>   <!-- col 4 -->
		 
          
            <div class="row col-1">
					<div class="col-md-2">  <!-- col 5 -->
						<input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="button" onclick="return chk()"  value="Submit">
					</div> <!-- col 5 -->
					
		   </div>
		   
	   </div> <!-- row main end -->  
		   <br>
			</form>
			
			
						<!-- Table Starts here -->
	<div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">
							<thead>
								<tr>
									<th>Sr.No.</th>
									<th>Requester</th>
									<th>ScheduleId</th>
									<th>Type</th>
									<th>RequestID </th>
									<th>PickUp DateTime</th>
									<th>Origin</th>
									<th>Destination</th>
									<th>Status</th>
									<th>EntryDate</th>
									<th>Trip ID</th>
									<th>VehicleRegNo</th>
									<th>Vehicle Code</th>
								</tr>
										
									</thead>
									<tbody>
										<%  

String requesttype=request.getParameter("RequestType");

String Status1=request.getParameter("Status");
String briefid = "",rid = "",plannedstatus = "No";
	String tridriver="",triorigin="",tridest="",tristart="";
String  DriverCode="";
String DriverName="";

String TripId="";
if(requesttype==null || requesttype==" " || requesttype=="")
{
	  requesttype="Material Movement";
}
else
{
	  requesttype=request.getParameter("RequestType");
	  
}

System.out.println("Type :- "+requesttype);

if(Status1==null || Status1==" " || Status1=="")
{
	  Status1="Scheduled";
}
else
{
	  
	  Status1=request.getParameter("Status");
}


System.out.println("Status :- "+Status1);

String sql = "select * from db_gps.t_VehicleScheduleData as a INNER JOIN db_gps.t_startedjourney as b  ON a.TripID= b.TripID where  a.Category ='"+requesttype+"' and a.Status='"+Status1+"' and a.EntryDate >='"+dt+" 00:00:00'  and a.EntryDate <='"+dt1+" 23:59:59'and (b.JStatus='Running' or b.JStatus='tobeclosed') and b.OwnerName like '"+username+"'  order by a.ScheduleNo";
System.out.println("Query is : "+sql);
ps = conn.prepareStatement(sql);
rs4 = ps.executeQuery();
int i=1;String todate="";

while(rs4.next()){	
    	  String PlanId = rs4.getString("PlanId");
    	  String ScheduleNo = rs4.getString("ScheduleNo");
    	  String PickUpDateTime = rs4.getString("DateTime");
    	  System.out.println("PickUpDateTime is-->>"+ PickUpDateTime);
    	  
    	  String PickUpDate[]=PickUpDateTime.split("\\s+");
    	  String x=PickUpDate[0];
    	  System.out.println("x is-->>"+ PickUpDate[0]);
    	  String y=PickUpDate[1];
    	  System.out.println("y is-->>"+ PickUpDate[1]);
    	  String yfinal=y.substring(0,8);
    	  System.out.println("yfinal is-->>"+ yfinal);
     	 
    	  String ytime[]=y.split(":");
    	  String yh=ytime[0];
    	  System.out.println("yh is-->>"+ yh);
    	  String ym=ytime[1];
    	  System.out.println("ym is-->>"+ ym);
    	  
    	  String ys=ytime[2].substring(0,2);
    	  System.out.println("ys is-->>"+ ys);
    	  
    	  String RequesterName=rs4.getString("OwnerName");
    	  String Type = rs4.getString("Category");
    	  String RequestId = rs4.getString("RequestId");
    	  String ScheduleEntryDateTime=rs4.getString("EntryDate");
    	  String dateformated1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(ScheduleEntryDateTime));
    	  String dateformated2=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(PickUpDateTime));
     	 
    	  String Origin=rs4.getString("StartPlace");
    	  String Destination=rs4.getString("EndPlace");
    	  System.out.println("Destination is:-->>"+ Destination);
    	  String Status=rs4.getString("Status");
    	 TripId=rs4.getString("TripID");
    	  String VehicleRegNo=rs4.getString("VehicleRegNo");
    	  String VehicleCode=rs4.getString("VehicleCode");
    	  
    	  

String sql2="select * from db_gps.t_RequestData where RequestType ='People Movement' and Status='Scheduled' and EntryDateTime >='"+dt+" 00:00:00' and EntryDateTime <='"+dt1+" 23:59:59'  and ScheduleNo='"+ScheduleNo+"'";   	  
System.out.println("Query2 is : "+sql2);
ps = conn.prepareStatement(sql2);
rs6 = ps.executeQuery();


while(rs6.next()){	 	  
    	  
    	  String DropDateTime=rs6.getString("DropDateTime");
System.out.println("DropDateTime is-->>"+ DropDateTime);
    	  
    	  String DropDate[]=DropDateTime.split("\\s+");
    	  String x1=DropDate[0];
    	  System.out.println("x1 is-->>"+ DropDate[0]);
    	  String y1=DropDate[1];
    	  System.out.println("y1 is-->>"+ DropDate[1]);
    	  
    	  
    	  String y1time[]=y1.split(":");
    	  String y1h=y1time[0];
    	  System.out.println("y1h is-->>"+ y1h);
    	  String y1m=y1time[1];
    	  System.out.println("y1m is-->>"+ y1m);
    	  
    	  String y1s="00";
    	     	  
    
    	  String sql4="select * from db_gps.t_startedjourney where TripID='"+TripId+"'";   	  
    	  System.out.println("Query4 is : "+sql4);
    	  ps = conn.prepareStatement(sql4);
    	  rs8 = ps.executeQuery();


    	  while(rs8.next()){	
    		   DriverCode=rs8.getString("DriverCode");
    		  System.out.println("DriverCode is-->>"+ DriverCode);
    		  
    		  DriverName=rs8.getString("DriverName");
    		  System.out.println("DriverName is-->>"+ DriverName);
    		  ETA=rs8.getString("ETA");
    		  
    		  System.out.println("ETA is-->>"+ ETA);
    		  
    		  
  			boolean flag = false;
  			try
  			{
  			String sql9 = "select * from db_gps.t_briefing where tripid = '"+TripId+"'";
  			System.out.println("sql 9 is:->>"+sql9);
  			ResultSet rs1 = st1.executeQuery(sql9);
  			if(rs1.next())
  			{
  				briefid = rs1.getString("Briefid");
  			}

  			String sql10 = "select * from db_gps.t_intermediatejrmroute where  Tripid = '"+TripId+"' and briefid = '"+briefid+"' and driverid = '"+DriverCode+"'  order by advancedtrackid asc ,row asc limit 1 ";
  			System.out.println("sql 10 is:->>"+sql10);
  			rs1 = st1.executeQuery(sql10);
  			if(rs1.next())
  			{
  				rid = rs1.getString("advancedrouteid");
  				plannedstatus = "Yes";
  				flag = true;
  			}
  			
  			
  			}
  			catch(Exception e)
  			{
  				briefid = "";
  				rid = "";
  				plannedstatus = "No";
  			} 
  			
  				
  					todate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
  				
  				
  			
    		  
    		  
 %>
 
  <tr>			
 				<td style="font-size: 11px; face:san-serif; color:black" ><%=i %></td>	
 				<td style="font-size: 11px; face:san-serif; color:black" ><%=RequesterName %></td>	
 					
 				<%-- <td style="font-size: 13px; face:san-serif; color:black" ><%=PlanId %></td> --%>
 				<td style="font-size: 11px;face:san-serif; text-align: right;color:black" ><a href="PlanDetails.jsp?RequestId=<%=RequestId %>&PlanId=<%=PlanId %>"><%=rs4.getString("ScheduleNo") %></a></td>
 				<td style="font-size: 11px; face:san-serif; color:black" ><%=Type %></td>
 				<td style="font-size: 11px;text-align: right; face:san-serif; color:black" ><%=RequestId %></td>
                <td style="font-size: 11px; text-align: right;face:san-serif; color:black" ><%=dateformated2 %></td>
                <td style="font-size: 11px;face:san-serif;text-align: left; color:black" ><%=Origin %></td>
                <td style="font-size: 11px;face:san-serif;text-align: left; color:black" ><%=Destination %></td>
                <td style="font-size: 11px;face:san-serif;text-align: left; color:black" ><%=Status %></td>
                <td style="font-size: 11px;face:san-serif; text-align: right;color:black" ><%=dateformated1 %></td>
                 <td style="font-size: 11px;text-align: center;face:san-serif; color:black" >
                 <% if(TripId.equals("-")){%>
			<font size="2"><%=TripId%></font>
			<% } else {%>
                             
                 
                 <a href="javascript:toggleDetails1(<%=i%>,true);" title="Click To See the Reports"><font size="2">
				<%=TripId %></font></a><% }%>
				
				<div class="popup" id="popupx<%=i%>">
					<table border="1" bgcolor="white">
		   				<tr>  
						<td> 
							<a href="ActAndPlanJrnyCompOnMap.jsp?tripid=<%=TripId %>&vehcode=<%=VehicleCode%>&data=<%=x%>&data1=<%=todate%>&ftime1=<%=yh%>&ftime2=<%=ym%>&ftime3=<%=ys%>&ttime1=<%=y1h%>&ttime2=<%=y1m%>&ttime3=<%=y1s%>&pg=st&pstatus=No&brifid=<%=briefid %>&rid=<%=rid %>&driverid=<%=DriverCode %>" onclick="toggleDetails1(<%=i%>,false);">Show Trip on Map </a>
						</td>
		   				</tr>
		   			
				<tr>
				   			<td>				   									 
				   			<a href="edittrip.jsp?vehno=<%=VehicleRegNo%>
				   							&ReportDateTime=<%=PickUpDateTime%>
				   							&strloc=<%=Origin%>
				   							&strdate=<%=x%>
				   							&StartTime=<%=yfinal %>
				   							&ETA=<%=ETA%>
				   							&endp=<%=Destination%>
				   							&driverid=<%=DriverCode%>
				   							&drivern=<%=DriverName%>
				   							&tripid=<%=TripId%>" onclick="toggleDetails1(<%=i%>,false);">Edit Trip </a>
							</td>
						</tr>
						<tr>
						<td> 
						<a href="javascript:toggleDetails1(<%=i%>,true);" onclick="javascript:window.open ('CancelTrip.jsp?vehno=<%=VehicleRegNo%>&tripid=<%=TripId%>','win3','scrollbars=1,resizeable=0,width=500,height=500');";>Cancel Trip</a>
		  				</td>
		   				</tr>
		   				
<%
				//}
String pageflag="currentposition";
%>
						<tr>
						<td>
						<a href="javascript: flase;" onClick="window.open ('endtrip.jsp?tripid=<%=TripId%>&vehcode=<%=VehicleCode%>&vehno=<%=VehicleRegNo%>&pageflag=<%=pageflag%>', 'win1', 'width=850, height=550, location=0, menubar=0, scrollbars=yes, status=0, toolbar=0, resizable=0'); javascript:toggleDetails1(<%=i%>,false);">End Trip </a>
						
						</td>
		   				</tr>
			  			
			  			
			  			<tr>
						<td> 
							<a href="javascript:toggleDetails1(<%=i%>,false);">Close </a>
						</td>
		   				</tr>
		   			</table>
		   		</div>			
				
				</td>
                  <td style="font-size: 11px;face:san-serif; color:black" ><%=VehicleRegNo %></td>
                   <td style="font-size: 11px;text-align: right;face:san-serif; color:black" ><%=VehicleCode %></td>
                <%-- <td style="font-size: 13px;face:san-serif; color:black" ><a href="SubmitPlanNew.jsp?PickupDate=<%=PickUpDateTime %>&PickUpLocation=<%=PickUpLocation %>&DropLocation=<%=DropLocation%>"><%=rs4.getString("Count") %></a></td> --%>
               
            </tr>     
            <%
i++; 
}
} }%>
									<tfoot>
									<tr>
										<th>Sr.No.</th>
										<th>Requester</th>
										<th>ScheduleId</th>
										<th>Type</th>
										<th>RequestID </th>
										<th>PickUp DateTime</th>
										<th>Origin</th>
										<th>Destination</th>
										<th>Status</th>
										<th>EntryDate</th>
										<th>Trip ID</th>
										<th>VehicleRegNo</th>
										<th>Vehicle Code</th>
								  </tr>
									</tfoot>
								</table>
							</div>
							</div>
							</div>
							</section>
							</div>
							</div>
							</div>
							
							<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Schedule Report </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int kk=0; 
			//String showList= "Sr.No.,VehRegNo,Transporter,VehicleType,Total Distance,Total RunHrs";   //for Template Only 
			String showList=""+ColumnList;    
			%>                                  <!-- change this to ReSet.jsp for conversion  -->		
			<form id="customselect" name="customselect" method="get" action="ReSet.jsp">  
			<div class="modal-body">
			
				<table class="table table-bordered">
							<thead>
							<tr>
							<th>Chk &nbsp;/&nbsp;UnChk</th>
							<th>Col. Name</th>
							</tr>
							</thead>
							<tbody><%
							
							StringTokenizer stcol = new StringTokenizer(showList,","); 
							while(stcol.hasMoreTokens()){
							%><tr>
							<td>
							<div align="left"><input type="text" id="net_id1<%=kk %>" name="net_id1<%=kk %>" style="width:70px;padding: 4px 5px 2px 5px;
							border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif; " value="<%=kk %>" readonly/>                  
						</div>
						<input type="checkbox" name="check<%=kk %>"   id="check<%=kk %>"  /></td>
						<td><input type="text" name="clname<%=kk %>"   id="clname<%=kk %>"  value="<%=stcol.nextToken()%>" readonly="readonly" style="border:none" /></td>
							</tr>
							<%kk++;}%></tbody>
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
                    if (!this.$element.prop("multiple")) {
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
</script><!--New Script code added for table Start end-->
			
			

<!--New Script code added for table Start end-->
			
</body>

<%
rs4.close(); 
ps.close();
conn.close();

%>
</html>