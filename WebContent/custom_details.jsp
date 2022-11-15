<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headernew1.jsp"%>
    <%-- <%@ include file="Connections/conn.jsp" %> --%>
    <%@page import="java.util.Date"%>
  <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  %>
    
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
 	
<script language="javascript">
function Validate()
{ 
    
	if(document.getElementById("data").value=="") 
	{
		alert("Please Select The from date.");
		return false;
	}
	if(document.getElementById("data1").value =="")
  	{
		alert("please select To Date");
		return false;
  	}  		
		return datevalidate();
	return true;
	
}
function datevalidate()
{
	var date1=document.getElementById("data").value;
	var date2=document.getElementById("data1").value;
	var dm1,dd1,dy1,dm2,dd2,dy2;
	dy1=date1.substring(0,4);
	dy2=date2.substring(0,4);
	dm1=date1.substring(5,7);
	dm2=date2.substring(5,7);
	dd1=date1.substring(8,10);
	dd2=date2.substring(8,10);
	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var year=date.getFullYear();
	
	if(dy1>year || dy2>year)
	{
		alert("selected date should not be greater than todays date");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;

		return false;
	
	}
	else if(year==dy1 && year==dy2) if(dm1>month || dm2>month)
	{
		alert("selected date should not be greater than todays date");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;

		return false;
	
	}

	if(dm1==month){
		if(dd1>day || dd2>day)
		{
		alert("selected date should not be greater than todays date");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;

		return false;
	
		}
	}
	if(dy1>dy2)
	{
		alert("From date year is should not be greater than to date year");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;
		return false;
	}
	
	else if(year==dy1 && year==dy2) if(dm1>dm2)
	{
		alert("From date month is should not be greater than to date month");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;
		return false;
	}
	if(dm1==dm2) {
	if(dd1 > dd2)
	{
		alert("From date is should not be greater than to date");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;
		return false;
	}
	}
	return true;
}
</script>
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
<%!
String VehicleCode, fromdate, todate, desc,vehregno;
//,fromtime,totime;
String datenew1,datenew2;
Connection conn;
Statement st;
String sql;
boolean flag=true;
%>
<%
	Connection conn=null;
	Statement st=null, st1=null,st2=null,st20=null,st21=null;
%>
<%
	String empnamee="";
	VehicleCode=request.getParameter("vehcode");
	datenew1=request.getParameter("data");
	//System.out.println(datenew1);
	String myfromdate =new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew1));
	datenew2=request.getParameter("data1");
	//System.out.println(datenew2);
	String mytodate =new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew2));

	Class.forName(MM_dbConn_DRIVER); 
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st=conn.createStatement();
		sql="select * from t_vehicledetails where VehicleCode='"+VehicleCode+"'";
		ResultSet rst=st.executeQuery(sql);
		if(rst.next())
		{
			vehregno=rst.getString("VehicleRegNumber");
		}
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
	    st20=conn.createStatement();
	    st21=conn.createStatement();
		
	
	
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
						<h2 class="content-header-title  mb-0">Custom Detail Report</h2>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
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

			<!-- Form Comes here -->
			
 <form name="customdetail" id="formreport" method="get">
	 <input type="hidden" name="vehcode" value="<%=VehicleCode%>">
	
		    <div class="row col-12">
		    
		    <div class="col-md-2"></div>
			  <div class="col-md-2">
				<label for="from">From:</label>
				<div class="input-group input-group-merge" >
					<input type="text"  id="data" name="data"  class="form-control" value="<%=datenew1%>"> 
					<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
				</div>
				   <script>
						$(document).ready(function() {
							$( function() {
				   				 $( "#data" ).datepicker({
						    dateFormat: 'dd-M-yy',
							changeMonth: true,
				            changeYear: true});
				  					} ); });
				   </script>	  
			</div>
			  <div class="col-md-1">
				<label for="basicSelect">HH:</label>
					<div class="input-group input-group-merge">
				<select name="ftime1" id="ftime1" class="form-select">
					<option value="00">00</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<%
						for(int i=10;i<24;i++)
						{
						%>
							<option value="<%=i%>"><%=i%></option>
						<%
						}		
					%>		
				</select>
				</div>
			</div>
					
			<div class="col-md-1">
				<label for="basicSelect">MM:</label>
					<div class="input-group input-group-merge">
				<select name="ftime2" id="ftime2" class="form-select">
					<option value="00">00</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<%
						for(int i=10;i<60;i++)
						{
						%>
							<option value="<%=i%>"><%=i%></option>
						<%
						}		
					%>		
				</select>
				</div>
			</div>
			
			<div class="col-md-2">
				<label for="to">To:</label>
				<div class="input-group input-group-merge" >
					<input type="text" id="data1" name="data1"  
					class="form-control" value="<%=datenew2%>"/> 
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
						maxDate:7 */});  } );
			
                     });
	            </script>
		     </div>
		     <div class="col-md-1">
				<label for="basicSelect">HH:</label>
					<div class="input-group input-group-merge">
				<select name="ttime1" id="ttime1" class="form-select">
						<option value="00">00</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<%
							for(int i=10;i<23;i++)
							{
							%>
								<option value="<%=i%>"><%=i%></option>
							<%
							}		
						%>
						<option value="23" selected>23</option>	
				</select>
				</div>
			</div>
					
			<div class="col-md-1">
				<label for="basicSelect">MM:</label>
					<div class="input-group input-group-merge">
				<select name="ttime2" id="ttime2" class="form-select">
					<option value="00">00</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<%
						for(int i=10;i<59;i++)
						{
						%>
							<option value="<%=i%>"><%=i%></option>
						<%
						}		
					%>
					<option value="59" selected>59</option>		
				</select>
				</div>
			</div>

			<div class="col-md-2">
				<button type="submit" class="btn btn-primary" style="margin-top: 20px;" name="button" onclick="return chk()"  value="Submit">Submit</button>
			</div>
		</div><br>
		<%
	
			if(!(null==request.getParameter("data")))
			{	
				fromdate = request.getParameter("data");
				todate =request.getParameter("data1");
			}
	     %>
  </form>
<%
if(!(null==request.getParameter("data")))
{
/* all code comes here */
%>
   <div class="d-grid gap-2 col-8 mx-auto mt-2">
      <h3>Detail Report for Vehicle <%=vehregno%> from <%=datenew1 %>  to <%=datenew2%></h3>
   </div>		
			
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
                                            <th>Sr.</th>
											<th>Date-Time</th>
											<th>Speed</th>
											<th>Distance</th>
											<th>Location</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% 
                                        String fromtime = "00:00:00";
										String totime ="23:59:59";	
										sql="select * from t_veh"+VehicleCode+" where concat(TheFieldDataDate,' ',TheFieldDataTime) >='"+myfromdate+" "+fromtime+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) <='"+mytodate+" "+totime+"' and TheFiledTextFileName in ('SI','OF','ON') order by concat(TheFieldDataDate,' ',TheFieldDataTime) asc";
										System.out.println(sql);
										ResultSet rst1=st.executeQuery(sql);
										String location="";
										int i=1;
										int x=0;
										int dist=0;
										
										if(rst1.first())
										{
											if(i==1)
											{
												dist=rst1.getInt("Distance");
												//System.out.println("dist::>>"+dist);
											}
										%>
										<tr>
											<td><div align="right"><%=i%></div></td>
											<td><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheFieldDataDate"))%> <%=rst1.getString("TheFieldDataTime")%></div></td>
											<td><div align="right">&nbsp;&nbsp;<%=rst1.getInt("Speed")%></div></td>
											<td><div align="right"><%=rst1.getInt("Distance")-dist%></div></td>
											<td><div align="left"><a href="#"  onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec")%>&long=<%=rst1.getString("LonginDec")%>&discription=<%=rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%= rst1.getString("TheFieldSubject") %></a></div></td>
										</tr>
									<%
									i++;
									}
									while(rst1.next())
									 {
											
											if(rst1.getString("TheFiledTextFileName").equals("SI"))
											{
												
												if(rst1.getInt("Speed")==0)
												{
													
													if(flag)
													{
														
														flag=false;
														x=1;
														%>
														<tr >
															<td class="bodyText"><div align="right"><%=i%></div></td>
															<td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheFieldDataDate"))%>  <%=" "+rst1.getString("TheFieldDataTime")%></div></td>
															<td class="bodyText" ><div align="right">&nbsp;&nbsp;<%="Stop"%></div></td>
															<td class="bodyText"><div align="right"><%=rst1.getInt("Distance")-dist%></div></td>
															<td class="bodyText"><div align="left"><a href="#"  onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec")%>&long=<%=rst1.getString("LonginDec")%>&discription=<%=rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%= rst1.getString("TheFieldSubject") %></a></div></td>	
														</tr>
														<%
														i++;
													}
												}
												
												else
												{//SI wid  sp>0
													if(x==1)
													{
														flag=true;
														%>
														<tr>
															<td class="bodyText"><div align="right"><%=i%></div></td>
															<td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheFieldDataDate"))%>  <%=" "+rst1.getString("TheFieldDataTime")%></div></td>
															<td class="bodyText"><div align="right">&nbsp;&nbsp;<%="Start"%></div></td>
															<td class="bodyText"><div align="right"><%=rst1.getInt("Distance")-dist%></div></td>
															<td class="bodyText"><div align="left"><a href="#"  onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec")%>&long=<%=rst1.getString("LonginDec")%>&discription=<%=rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%= rst1.getString("TheFieldSubject") %></a></div></td>
															
																							
														</tr>
														<%
														i++;
														x++;
													}
													
													flag=true;	
													%>
													<tr>
														<td class="bodyText"><div align="right"><%=i%></div></td>
														<td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheFieldDataDate"))%>  <%=" "+rst1.getString("TheFieldDataTime")%></div></td>
														<td class="bodyText"><div align="right">&nbsp;&nbsp;<%=rst1.getInt("Speed")%></div></td>
														<td class="bodyText"><div align="right"><%=rst1.getInt("Distance")-dist%></div></td>
														<td class="bodyText"><div align="left"><a href="#"  onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec")%>&long=<%=rst1.getString("LonginDec")%>&discription=<%=rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%= rst1.getString("TheFieldSubject") %></a></div></td>
														
																							
														
													</tr>
													<%
													i++;
												}
											}//ens of SI check
											else
										    {
												if(rst1.getString("TheFiledTextFileName").equals("OF"))
										    
												{
													String long1,long2,long3,lat1,lat2,lat3,loc1,loc2,loc3;
													int ds1,ds2,ds3;
													java.util.Date dt11=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
													loc1=rst1.getString("TheFieldSubject");
													lat1=rst1.getString("LatinDec");
													long1=rst1.getString("LonginDec");
													ds1=rst1.getInt("Distance");
													if(rst1.next())
													{
														if(rst1.getString("TheFiledTextFileName").equals("ON")||rst1.getString("TheFiledTextFileName").equals("SI"))
														{
															if(rst1.getString("TheFiledTextFileName").equals("SI"))
															{
																java.util.Date dt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
																loc2=rst1.getString("TheFieldSubject");
																lat2=rst1.getString("LatinDec");
																long2=rst1.getString("LonginDec");
																ds2=rst1.getInt("Distance");
																long hrs=00,mins=00;
																long mils1=dt11.getTime();
																long mils2=dt2.getTime();
																long mils3=mils2-mils1;
																mils3=mils3/1000/60;
																
																if(mils3 > 20)
																{
																	%>
																	<tr>
																<td class="bodyText"><div align="right"><%=i%></div></td>
																<td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(dt11)%></div></td>
																<%
																if(mils3>=60)
																{
																	hrs=mils3/60;
																	mins=mils3%60;
																	%>
																	<td class="bodyText"><div align="right">&nbsp;&nbsp;<%=""+hrs+" Hrs. "+mins+" Mins. OFF"%></div></td>
																	<%								
																}
																
																else
																{
																	
																	%>
																<td class="bodyText"><div align="right">&nbsp;&nbsp;<%="00 Hrs. "+mils3+" Mins. OFF"%></div></td>
																<%
																}
																%>
																
																
																<td class="bodyText"><div align="right"><%=ds1-dist%></div></td>
																<td class="bodyText"><div align="right"><a href="#"  onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec")%>&long=<%=rst1.getString("LonginDec")%>&discription=<%=rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%= rst1.getString("TheFieldSubject") %></a></div></td>					
																	
																			</tr>
																			<%		
															i++;
															%>
															
															<tr>
																	<td class="bodyText"><div align="right"><%=i%></div></td>
																	<td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(dt2)%></div></td>
																	<td class="bodyText"><div align="right">&nbsp;&nbsp;<%="ON"%></div></td>
																	<td class="bodyText"><div align="right"><%=ds2-dist%></div></td>
																	<td class="bodyText"><div align="left"><a href="#"  onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec")%>&long=<%=rst1.getString("LonginDec")%>&discription=<%=rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%= rst1.getString("TheFieldSubject") %></a></div></td>					
															</tr>	
																							
															<%		
															i++;
															%>
															
															<tr>
																	<td class="bodyText"><div align="right"><%=i%></div></td>
																	<td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(dt2)%></div></td>
																	<td class="bodyText"><div align="right">&nbsp;&nbsp;<%="START"%></div></td>
																	<td class="bodyText"><div align="right"><%=ds2-dist%></div></td>
																	<td class="bodyText"><div align="left"><a href="#"  onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec")%>&long=<%=rst1.getString("LonginDec")%>&discription=<%=rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%= rst1.getString("TheFieldSubject") %></a></div></td>					
																						
															</tr>	
															<%		
																i++;
																flag=true;
															%>
															
															<tr>
																	<td class="bodyText"><div align="right"><%=i%></div></td>
																	<td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(dt2)%></div></td>
																	<td class="bodyText"><div align="right">&nbsp;&nbsp;<%=rst1.getInt("Speed")%></div></td>
																	<td class="bodyText"><div align="right"><%=ds2-dist%></div></td>
																	<td class="bodyText"><div align="left"><a href="#"  onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec")%>&long=<%=rst1.getString("LonginDec")%>&discription=<%=rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%= rst1.getString("TheFieldSubject") %></a></div></td>					
																	
															</tr>	
															<%
																	i++;
																}
															}//end of SI check after OF stamp
															
															else if(rst1.getString("TheFiledTextFileName").equals("ON"))
															{
																java.util.Date dt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
																loc2=rst1.getString("TheFieldSubject");
																lat2=rst1.getString("LatinDec");
																long2=rst1.getString("LonginDec");
																ds2=rst1.getInt("Distance");
																long hrs=00,mins=00;
																long mils1=dt11.getTime();
																long mils2=dt2.getTime();
																long mils3=mils2-mils1;
																mils3=mils3/1000/60;
																
																if(mils3 > 20)
																{
																	if(rst1.next())
																	{
																		if(rst1.getString("TheFiledTextFileName").equals("SI"))
																		{
																			loc3=rst1.getString("TheFieldSubject");
																			//System.out.println("Stamp::>>"+rst1.getString("TheFiledTextFileName"));
																			lat3=rst1.getString("LatinDec");
																			long3=rst1.getString("LonginDec");
																			ds3=rst1.getInt("Distance");
																			
																			%>
																			<tr>
																		<td class="bodyText"><div align="right"><%=i%></div></td>
																		<td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(dt11)%></div></td>
																		<%
																		if(mils3>=60)
																		{
																			hrs=mils3/60;
																			mins=mils3%60;
																			%>
																			<td class="bodyText"><div align="right">&nbsp;&nbsp;<%=""+hrs+" Hrs. "+mins+" Mins. OFF"%></div></td>
																			<%								
																		}
																		
																		else
																		{
																			
																			%>
																		<td class="bodyText"><div align="right">&nbsp;&nbsp;<%="00 Hrs. "+mils3+" Mins. OFF"%></div></td>
																		<%
																		}
																		%>
																		
																		
																		<td class="bodyText"><div align="right"><%=ds1-dist%></div></td>
																		<td class="bodyText"><div align="right"><a href="#"  onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec")%>&long=<%=rst1.getString("LonginDec")%>&discription=<%=rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%= rst1.getString("TheFieldSubject") %></a></div></td>
																		</tr>
																					<%		
																			i++;
																					%>
																					<tr>
																						<td class="bodyText"><div align="right"><%=i%></div></td>
																						<td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(dt2)%></div></td>
																						<td class="bodyText"><div align="right">&nbsp;&nbsp;<%="ON"%></div></td>
																						<td class="bodyText"><div align="right"><%=ds3-dist%></div></td>
																						<td class="bodyText"><div align="left"><a href="#"  onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec")%>&long=<%=rst1.getString("LonginDec")%>&discription=<%=rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%= rst1.getString("TheFieldSubject") %></a></div></td>	
																					
																					</tr>	
																							<%
																							i++;
																							if(rst1.getInt("Speed")==0)
																							{%>
																								<tr>
																								<td class="bodyText"><div align="right"><%=i%></div></td>
																								<td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheFieldDataDate"))%>  <%=" "+rst1.getString("TheFieldDataTime")%></div></td>
																								<td class="bodyText"><div align="right">&nbsp;&nbsp;<%="Stop"%></div></td>
																								<td class="bodyText"><div align="right"><%=ds3-dist%></div></td>
																								<td class="bodyText"><div align="left"><a href="#"  onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec")%>&long=<%=rst1.getString("LonginDec")%>&discription=<%=rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%= rst1.getString("TheFieldSubject") %></a></div></td>	
																								
																						
																							</tr>
																							<%
																							i++;
																			}
																		}
																	}
																}
															}//end of ON stamp after OF stamp
														}//end of SI or ON stamp check
													}
												}//end of OF stamp check
												//flag=true;
										    }
										}//end of while loop
									 
									 if(rst1.last())
									 {
									 %>
									 	<tr>
									 		<td class="bodyText"><div align="right"><%=i%></div></td>
									 		<td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheFieldDataDate"))%> <%=rst1.getString("TheFieldDataTime")%></div></td>
									 		<td class="bodyText"><div align="right">&nbsp;&nbsp;<%=rst1.getInt("Speed")%></div></td>
									 		<td class="bodyText"><div align="right"><%=rst1.getInt("Distance")-dist%></div></td>
									 		<td class="bodyText"><div align="right"><%= rst1.getString("TheFieldSubject") %></div></td>	
									 	
									 												
									 	</tr>
									 <%
									 i++;

									 }
									 %>
								</tbody>
                                    <tfoot>
                                    <tr>
                                        <th>Sr.</th>
										<th>Date-Time</th>
										<th>Speed</th>
										<th>Distance</th>
										<th>Location</th>   
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
						<h4 class="modal-title">Custom Column Selection for Detail Report for Vehicle </h4>
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
						<input type="hidden" name="paramflag" id="paramflag" value="true">
                        <input type="hidden" name="parameters" id="parameters" value="<%=request.getQueryString()%>"> 
				
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
<%
/* code end here*/
}

%>							   
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
</script>

<!--New Script code added for table Start end-->
			
			

<!--New Script code added for table Start end-->
	
			
</body>
</html>