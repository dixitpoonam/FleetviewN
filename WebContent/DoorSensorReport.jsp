<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="headernew1.jsp"%>
<%
	classes fleetview = new classes();
	fleetview.getConnection(MM_dbConn_DRIVER, MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
%>
<%@page import="com.fleetview.beans.classes"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Tracking System</title>
<!-- Included our css file start-->
<link rel="stylesheet" type="text/css"
	href="css/table/dataTables.bootstrap5.min.css">
<link rel="stylesheet" type="text/css"
	href="css/table/responsive.bootstrap5.min.css">
<link rel="stylesheet" type="text/css"
	href="css/table/buttons.bootstrap5.min.css">
<link rel="stylesheet" type="text/css"
	href="css/table/rowGroup.bootstrap5.min.css">
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
<script type="text/javascript">
function article(programName,width,height)
{
	var temp = "menubar=yes,toolbar=no,location=no,status=yes,scrollbars=yes,resizable=yes,width="+width+",height="+height; displayWindow=window.open(programName,"displayWindow",temp) ;
}
function fun(aa)
{
	//alert(aa.value);
	document.searchform.h.value=aa.value;
}

function poponclick(lat,lon)
{	
	var url="shownewmap.jsp?lat=" +lat+ "&long=" +lon;
	testwindow = window.open(url,"Show on Map", "width=900,height=500");
    testwindow.moveTo(250,100);
}
function showFTPImage(imageName)
{	
	var url="androidFtpImage.jsp?imageName=" +imageName;
	testwindow1 = window.open(url,"Image", "width=500,height=500");
    testwindow1.moveTo(250,100);
}
function showFTPImage1(imageName)
{	
	var url="cameraFtpImage.jsp?imageName=" +imageName;
	testwindow1 = window.open(url,"Image", "width=500,height=500");
    testwindow1.moveTo(250,100);
}
function popup22(vehcd,imeino)
{

	var url="shownewmap.jsp?Vehcode=" +vehcd+ "&imeino=" +imeino;
	testwindow = window.open(url,"Show on Map", "width=900,height=500");
    testwindow.moveTo(250,100);
}
</script>
</head>

<body onload="ondemand();">
	<input type="hidden" id="PageName" name="PageName"
		value="<%=PageName%>" />
	<%
		String username = "";
		username = (String) session.getAttribute("usertypevalue");

		System.out.println("Session name----------------->:" + username);

		String datex1 = "", datex2 = "", data1 = "", data2 = "", dt = "", dt1 = "";
	%>
	<%!Connection conn = null, conn1 = null;
	Statement st = null, st1 = null, st2 = null, st20 = null, st21 = null, stx = null, stmt = null;
	String aa, regno, sq, searchveh, sql;
	ResultSet rs_rh, rs_cnt;

	Statement st3 = null;
	Statement st4 = null;
	Statement st5 = null;

	String date1 = "";
	String date2 = "";
	String from = "";
	String to = "";
	String fromdate = "";
	String todate = "";

	String time1 = "";
	String time2 = "";
	String time3 = "";
	String time4 = "";

	String vehno = "";

	int colcount = 0; //special code for detailed view
	String setSequence = "";
	String detailViewSequence = "", ColumnList = "";
	boolean setDefFlag = false;%>
	<%
		try {
			conn = fleetview.ReturnConnection();
			Calendar calendar = Calendar.getInstance();
			//conn1=fleetview.ReturnConnection1();
			st = conn.createStatement();
			stx = conn.createStatement();
			st1 = conn.createStatement();
			stmt = conn.createStatement();
			//out.print(session.getAttribute("usertypevalue").toString());
			st20 = conn.createStatement();
			st21 = conn.createStatement();
	%>
	<%
		//for report conversion use this query
			String setdefault = "select * from db_gps.ColumnDisplayMaster where userid='"
					+ session.getAttribute("UserID").toString() + "' and reportno='" + reportno + "'";
			System.out.println("set custom query:" + setdefault);
			ResultSet rssetdefault = st20.executeQuery(setdefault);
			if (rssetdefault.next()) {
				setDefFlag = true;
				colcount = rssetdefault.getInt("ColumnCount");
				setSequence = rssetdefault.getString("SetSequence");
				detailViewSequence = rssetdefault.getString("DetailViewSequence");
				ColumnList = rssetdefault.getString("ColumnList");
			} else {
				//for report conversion use this query
				String setdefault1 = "select * from db_gps.ColumnDisplayMaster where userid='default' and reportno='"
						+ reportno + "'";
				System.out.println("set custom query1:" + setdefault1);

				ResultSet rssetdefault1 = st21.executeQuery(setdefault1);
				if (rssetdefault1.next()) {
					setDefFlag = true;

					colcount = rssetdefault1.getInt("ColumnCount");
					setSequence = rssetdefault1.getString("SetSequence");
					detailViewSequence = rssetdefault1.getString("DetailViewSequence");
					ColumnList = rssetdefault1.getString("ColumnList");
				}

			}

			System.out.println("set default flag " + setDefFlag);
			System.out.println("column count " + colcount);
			System.out.println("set sequence " + setSequence);
			System.out.println("detailed view sequence " + detailViewSequence);
	%>
	<input type="hidden" id="setDefFlag" name="setDefFlag"
		value="<%=setDefFlag%>">
	<%
		String vehlist = "";

			String frompage = request.getParameter("frompage");

			//System.out.println("The vehicle list>>>>"+vehlist);

			if (frompage != null && frompage.equalsIgnoreCase("OS")) {
				String thedate = request.getParameter("data");
				String thedate1 = request.getParameter("data1");
				dt = new SimpleDateFormat("dd-MMM-yyyy")
						.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate)); //dt
				time1 = new SimpleDateFormat("HH:mm:ss")
						.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate));
				dt1 = new SimpleDateFormat("dd-MMM-yyyy")
						.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1)); //dt1
				time2 = new SimpleDateFormat("HH:mm:ss")
						.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1));
			} else {
				System.out.println("In else date");
				datex1 = request.getParameter("data");
				datex2 = request.getParameter("data1");
				from = request.getParameter("from");
				// fromdate= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(from));
				// time3= new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(from));

				to = request.getParameter("to");
				// todate= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(to));
				// time4= new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(to));

				System.out.println("date1 " + dt);
				System.out.println("date2 " + dt1);
				System.out.println("From " + from);
				System.out.println("To " + to);
				// time1 =":00";

				// time2 = ":59";
			}
	%>
	<%
		int i = 1;
			String datenew1 = "";
			String datenew2 = "";
			String statVal = "";
			String chbxAll = "";
			String catval = "";
			String VehNo1 = "", vehcode = "";
			int counter = 0;
			if (request.getParameter("data") != null) {
				datenew1 = request.getParameter("data");
				datenew2 = request.getParameter("data1");
			} else {
				datenew1 = datenew2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
			}

			DateFormat df123 = new SimpleDateFormat("dd-MMM-yyyy");
			DateFormat df1234 = new SimpleDateFormat("yyyy-MM-dd");
			String dataDate1 = df1234.format(df123.parse(datenew1));
			String dataDate2 = df1234.format(df123.parse(datenew2));
	%>

	<%
		String ddx = request.getQueryString();
			String bt = request.getParameter("button");
			System.out.println(" buttom :- " + bt);

			if (bt == null || bt.equals("null")) { //onload........
				System.out.println("Inside On load");

				datex1 = session.getAttribute("today").toString(); //dd-MMM-yyyy

				datex2 = session.getAttribute("today").toString();

			} else { // onsubmit...........

				System.out.println("Inside ELSSSSSSSSS ");

				datex1 = request.getParameter("data");
				datex2 = request.getParameter("data1");

			}

			System.out.println(" datex1 " + datex1 + " datex2 " + datex2);

			dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

			String dttime = "" + dt + " 00:00:00";

			dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

			String dt1time = "" + dt1 + " 23:59:59";

			System.out.println("Query pass date params:  from:" + dt + " to: " + dt1);

			System.out.println("Query pass date time  params:  from:" + dttime + " to: " + dt1time);

			String Selection1 = request.getParameter("basicSelect1");
			System.out.println("selection1:" + Selection1);
	%>
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left mb-1 col-md-6 col-12 ">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0">
								Door Sensor Report From
								<%=datex1%>
								To
								<%=datex2%>
								Of
								<%=username%></h3>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-6 col-12 d-md-block d-none ">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">

							<button id="detailedView"
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0">
								Detailed View</button>

							<button
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0"
								data-bs-toggle="modal" data-bs-target="#SetCustomModal">
								Set Custom</button>

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
			<!-- ****************************************** -->
			<!-- Form Comes here -->

			<form name="formreport" id="formreport" method="post">

				<div class="row">
					<!--  row 1 -->
					<div class="col-md-2"></div>
					<div class="col-md-2">
						<!-- col 1 -->
						<label for="from">From:</label>
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
						            changeYear: true  });  } );
										});
						   </script>

					</div>
					<!-- col 1 -->

					<div class="col-md-2">
						<!-- col 2 -->
						<label for="to">To:</label>
						<div class="input-group input-group-merge">
							<input type="text" id="data1" name="data1" class="form-control"
								value="<%=datex2%>" /> <span class="input-group-text"><svg
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
				          	   $( "#data1" ).datepicker({
							   dateFormat: 'dd-M-yy',
							   changeMonth: true,
					            changeYear: true
								/* minDate: 0,
								maxDate:7 */}); } );
			
									});
			           </script>
					</div>
					<!-- col 2 -->
					<div class="col-md-2">
						<!-- col 3-->
						<label for="basicSelect">Vehicle:</label>
						<div class="input-group input-group-merge">
							<select class="form-select" id="Vehicle1" name="Vehicle1">
								<%
									VehNo1 = request.getParameter("Vehicle1");
										System.out.println("Vehicle1-------------------- " + VehNo1);

										vehlist = session.getAttribute("VehList").toString();
										//  Change here
										///String unit = "Select a.VehicleRegNumber as vehno from db_gps.t_vehicledetails a,db_gps.t_jpgsnap b  where a.unitid = b.unitid and  a.VehicleCode in "+vehlist+" and a.status='-' group by a.VehicleRegNumber order by VehicleRegNumber ";
										String unit = "Select VehicleRegNumber as vehno from db_gps.t_vehicledetails where VehicleCode in "
												+ vehlist + " group by VehicleRegNumber order by VehicleRegNumber";

										System.out.println("taking vehicel list   " + unit);
										ResultSet rstunit = st1.executeQuery(unit);
										System.out.println("unit is " + unit);
										String tdydate1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date());
										while (rstunit.next()) {
											vehno = rstunit.getString("vehno");
											//vehcode=rstunit.getString("VehicleCode") ;
											//System.out.println("Query veh no  "+vehno);

											if (null != VehNo1) { //System.out.println("in IF veh no  "+vehno);
								%>
								<option value="<%=vehno%>" <%if (VehNo1.equals(vehno)) {%>
									Selected <%}%>><%=vehno%></option>
								<%
									} else {
								%><option value="<%=vehno%>"><%=vehno%></option>
								<%
									//VehNo1=vehno;
												//System.out.println("in else veh no  "+vehno);
											}

										}
								%>
							</select>
						</div>
					</div>
					<!-- col 3 -->

					<div class="col-2">
						<!-- col 5 -->
						<input type="submit" class="btn btn-primary mt-1"
							 name="button" id="button"
							onclick="return chk()" value="Submit">
					</div>
					<!-- col 5 -->



				</div>
				<!-- row main end -->
				<br>
			</form>
			<%-- <%
				if (VehNo1 == null || VehNo1 == " ") {
			%>
			<font size="3" face="arial" color="black"><b>No Data</b></font>
			<%
				}
			%>
 --%>
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
											<th>Vehicle</th>
											<th>Updated</th>
											<th>Location</th>
											<th>Status</th>
											<th>ImageTime</th>
											<th>Image</th>
										</tr>
									</thead>
									<tbody>
										<%
											int j = 1;
												int sr_no = 0, r_cnt = 0;
												String rh_flg = "N";

												String today = "";
												int i_cnt = 0, rw_cnt = 0;
												long millisecdiff = 0, miliseconds1 = 0, miliseconds2 = 0, ticks = 0;
												double lat, lon;
												String date = "", time = "", empname = "", sensor = "";
												String imeino = "";
												String flg = "N";
												String Value1 = "", Value2 = "", Value3 = "";
												String stat, rh_stat, rh_st1, rh_st2, rh_date;
												String location = "", filename = "";
												String jpgfilename = "", CaptureDateTime = "";
												//			DateFormat df;
												//			java.util.Date rh_time;
												String dt11 = new SimpleDateFormat("yyyy-MM-dd")
														.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew1));

												String dt111 = new SimpleDateFormat("yyyy-MM-dd")
														.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew2));

												String online = "select VehicleCode,VehicleRegNumber from db_gps.t_vehicledetails where VehicleRegNumber='"
														+ VehNo1 + "'";
												//		String online="select VehicleCode,Empname from t_vehicledetails where OwnerName='Airtel'";
												ResultSet onrs = st.executeQuery(online);
												System.out.println("**********" + online);

												while (onrs.next()) {
													System.out.println("Hii");
													int ccnt = 0;//initially 0
													long secdiff = 0, mindiff = 0, hrdiff = 0;
													String timeInHHmm = "00:00", final_time = "";
													long sdiff = 0, mdiff = 0, hdiff = 0;
													long rh_total_time = 0;
													String UnitID = "";
													//int UnitID=onrs.getInt("UnitID");;
													DateFormat df = new SimpleDateFormat("HH 'hours', mm 'mins,' ss 'seconds'");
													int vehcode1 = onrs.getInt("VehicleCode");
													System.out.println("vehcode1***>" + vehcode1);
													//empname=onrs.getString("Empname");
													imeino = onrs.getString("VehicleRegNumber");
													// sql="SELECT * FROM db_gps.t_veh"+vehcode1+"  where Sen1 <> '-' order by TheFieldDataDate desc,TheFieldDataTime desc limit 1";
													sql = "Select * from db_gps.t_veh" + vehcode1
															+ " where TheFiledTextFileName in ('DO','DS','DO1','DS1','DO2','DS2') and TheFieldDataDate between '"
															+ dt11 + "' and '" + dt111 + "' order by Thefielddatadatetime asc";
													ResultSet rstnew1 = stx.executeQuery(sql);
													if (!rstnew1.next()) {
										%>
										<font size="3" face="arial" color="black"><b>No
												Data</b></font>
										<%
											}
													System.out.println("VehCode sql======>" + sql);
													while (rstnew1.next()) {

														date = rstnew1.getString("TheFieldDataDate");

														time = rstnew1.getString("TheFieldDataTime");
														lat = rstnew1.getDouble("LatinDec");
														lon = rstnew1.getDouble("LonginDec");
														sensor = rstnew1.getString("TheFiledTextFileName");
														//filename=rstnew1.getString("Sen1");

														String date1 = new SimpleDateFormat("yyyy-MM-dd").format(rstnew1.getDate("TheFieldDataDate"));
														String time1 = rstnew1.getString("TheFieldDataTime");

														//System.out.println("date----------"+date1);
														//System.out.println("Time----------"+time1);
														if (sensor.equals("DO")) {
															sensor = "Open";
														} else if (sensor.equals("DS")) {
															sensor = "Close";
														}

														else if (sensor.equals("DO1")) {
															sensor = "Manhole Open";
														} else if (sensor.equals("DS1")) {
															sensor = "Manhole Close";
														} else if (sensor.equals("DO2")) {
															sensor = "Valve Open";
														} else if (sensor.equals("DS2")) {
															sensor = "Valve Close";
														}

														//lat=rstnew1.getDouble("LatinDec");

														location = rstnew1.getString("TheFieldSubject");
										%>
										<tr>

											<!--							<td><div align="left"></div></td>-->

											<%-- <td><div align="left"><a href="cameraDetailReport.jsp?imeino=<%=imeino%>&Vehcode=<%=vehcode1%>" target="_blank"><%=imeino%></a></div></td> --%>
											<td style="text-align: right"><%=i%></td>
											<td><div align="left"><%=imeino%></div></td>
											<td class="bodyText"><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstnew1.getDate("TheFieldDataDate"))%>
													<%=" " + rstnew1.getString("TheFieldDataTime")%></div></td>


											<%
												if (location.equals("No GPS")) {
											%>
											<td><div align="left"><%=location%></div></td>
											<%
												} else {
											%>
											<%-- <td><div align="left"><a href="#!" onclick="showFTPImage1('<%=location%>');"><img width="50" height="50" src="http://myfleetview.com/images1/ProcessedCameraImages/<%=location%>"/></a></div></td> --%>
											<td><div align="left">
													<a href="#"
														onclick="javascript: poponclick(<%=lat%>,<%=lon%>)"><%=location%></a>
												</div></td>
											<%
												}
											%>
											<td><div align="left"><%=sensor%></div></td>

											<%
												try {

																String sqlcnt = " Select snapdatetime,jpgfilename from db_gps.t_jpgsnap where vehid="
																		+ vehcode1 + " and  snapdatetime >= '" + date1 + " " + time1
																		+ "' and category='Road' order by snapdatetime  limit 1";
																//String sqlcnt=" Select snapdatetime,jpgfilename from db_gps.t_jpgsnap where vehid=9631 and  snapdatetime > '2016-02-22 09:42:59' ";
																//select snapdatetime,jpgfilename from db_gps.t_jpgsnap where vehid=9631 and  snapdatetime > '2016-02-22 09:42:59' order by snapdatetime  limit 1;
																//Select snapdatetime,jpgfilename from db_gps.t_jpgsnap where vehid=9631 and  snapdatetime > '2016-02-22 09:42:59' limit 1
																ResultSet rs3 = st3.executeQuery(sqlcnt);
																System.out.println("Query for image==>" + sqlcnt);
																//System.out.println("sqlcount----------"+sqlcnt);

																if (rs3.next()) {
																	jpgfilename = rs3.getString("jpgfilename");
																	CaptureDateTime = rs3.getString("snapdatetime");
																	//CaptureDateTime= fmt.format(CaptureDateTime);	
																	CaptureDateTime = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
																			.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(CaptureDateTime));
																}
															} catch (Exception e) {
																e.printStackTrace();
															}
											%>
											<td><div align="right"><%=CaptureDateTime%></div></td>
											<%-- <td><div align="left"><a href="#" onclick="showFTPImage1('<%=jpgfilename%>');"><%=jpgfilename%></a></div></td> --%>
											<td><a href="#!"
												onclick="showFTPImage1('<%=jpgfilename%>');"><img
													width="50" height="50"
													src="http://myfleetview.com/images1/ProcessedCameraImages/<%=jpgfilename%>" /></a>
											</td>
											<%
												i++;
															counter = counter + i;

														}

													}
											%>
										
									</tbody>
									<tfoot>
										<tr>
											<th>Sr.No.</th>
											<th>Vehicle</th>
											<th>Updated</th>
											<th>Location</th>
											<th>Status</th>
											<th>ImageTime</th>
											<th>Image</th>
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
	<%
		} catch (Exception e) {
			System.out.print("Exception -->" + e);
			e.printStackTrace();
		}
	%>

	<%
		fleetview.closeConnection();
		fleetview.closeConnection1();
	%>

	<div class="modal" id="SetCustomModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Custom Column Selection for Door
						Sensor</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<%
					int i = 0;
					//String showList= "Sr.No.,VehRegNo,Transporter,VehicleType,Total Distance,Total RunHrs";   //for Template Only 
					String showList = "" + ColumnList;
				%>
				<!-- change this to ReSet.jsp for conversion  -->
				<form id="customselect" name="customselect" method="get"
					action="ReSet.jsp">
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
									StringTokenizer stcol = new StringTokenizer(showList, ",");
									while (stcol.hasMoreTokens()) {
								%><tr>
									<td>
										<div align="left">
											<input type="text" id="net_id1<%=i%>" name="net_id1<%=i%>"
												style="width: 70px; padding: 4px 5px 2px 5px; border: none; text-align: right; font: normal 11px Arial, Helvetica, sans-serif;"
												value="<%=i%>" readonly />
										</div> <input type="checkbox" name="check<%=i%>" id="check<%=i%>" />
									</td>
									<td><input type="text" name="clname<%=i%>"
										id="clname<%=i%>" value="<%=stcol.nextToken()%>"
										readonly="readonly" style="border: none" /></td>
								</tr>
								<%
									i++;
									}
								%>
							</tbody>
						</table>

						<input type="hidden" name="checkedNumber" id="checkedNumber"
							value="<%=i%>" /> <input type="hidden" name="reportno"
							id="reportno" value="<%=reportno%>"> <input type="hidden"
							id="tableheaders" name="tableheaders" value=""> <input
							type="hidden" id="tableheaderslength" name="tableheaderslength">
						<input type="hidden" id="call" name="call" value="SetCustom">
						<input type="hidden" name="pagename" id="pagename"
							value="<%=PageName%>">


					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Submit</button>

						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">Close</button>
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
</script>
	<!--New Script code added for table Start end-->



	<!--New Script code added for table Start end-->

</body>
</html>