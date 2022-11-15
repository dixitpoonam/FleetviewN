<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page">
	<%@page import="java.sql.*"%>
	<%@ include file="headernew1.jsp"%>

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
<script>

function onchn()
{
	
	try
	{
	var owner = document.getElementById("sens_val").value;
	//alert("owner"+owner);
	var ajaxRequest;  // The variable that makes Ajax possible!
	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}  
	catch (e)
	{
		// Internet Explorer Browsers
		try
		{
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} 
		catch (e)
		{
			try
			{
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			catch (e)
			{
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function()
	{
		//alert("owner22"+owner);

		if(ajaxRequest.readyState == 4)
		{
			//alert("owner33"+owner);

			try
			{
			var reslt=ajaxRequest.responseText;
		//alert(reslt);
 
		var finalres=reslt.trim();	
		finalres=finalres.split("#");		
		//alert("After trim"+finalres[0]);
		//alert("After trim"+finalres[1]);

		
		document.getElementById("minval").value=finalres[0];
		document.getElementById("maxval").value=finalres[1];;

		
			}
			catch(e)
			{
				//alert(e);
			}
		} 
	};
	
	var queryString = "?owner="+owner;
	ajaxRequest.open("GET", "AjaxGetminmax.jsp" + queryString, true);
	ajaxRequest.send(null); 
	}
	catch(e)
	{
		alert(e);
	}

	
}
</script>
<script>
function graphlink()
{

	var v=document.getElementById("Vehicle").value;
	var from=document.getElementById("fromdate").value;
/* 	alert(from); */
	var todate=document.getElementById("todate").value;
	var sens_val=document.getElementById("sens_val").value;
	var min=document.getElementById("minval").value;
		var max=document.getElementById("maxval").value;
	/* alert(todate); */
	/* alert(b);
	alert(a);
	alert(v); */

	location.assign("humditygraph.jsp?vehcode="+v+"&data="+from+"&data1="+todate+"&minval="+min+"&maxval="+max+"&sens_val="+sens_val+"");
}

</script>
<style type="text/css">
.hr{
      size: 100%;
   }
</style>
</head>
<body onload="ondemand()">
	<input type="hidden" id="PageName" name="PageName"
		value="<%=PageName%>" />
	<%
		String username = "";
			username = (String) session.getAttribute("usertypevalue");

			System.out.println("Session name----------------->:" + username);

			String datex1, datex2, data1, data2;
	%>
	<%
		Connection conn = null;
			Statement st = null, st1 = null, st2 = null, st20 = null, st21 = null;
			Statement stmt1 = null, stmt2 = null, stmt3 = null, stmt4 = null;
	%>
	<%
		try {

				Class.forName(MM_dbConn_DRIVER);
				conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

				Class.forName(MM_dbConn_DRIVER);
				conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

				st20 = conn.createStatement();
				st21 = conn.createStatement();
				st2 = conn.createStatement();
				st = conn.createStatement();
				st1 = conn.createStatement();

				stmt1 = conn.createStatement();
				stmt2 = conn.createStatement();
				stmt3 = conn.createStatement();
				stmt4 = conn.createStatement();

			} catch (Exception e) {

			}
	%>
	<%
		String VehicleCode = "", sql = "", vehregno = "";

			String Min = "";
			String Max = "";
			String trans = "";
			String Minhum = "", Maxhum = "";
			String ssql = "select * from t_defaultvals where OwnerName='" + trans + "'";
			////System.out.println("ssql::" + ssql);

			String SensorValue = request.getParameter("sens_val");
			////System.out.println("Minhum::Maxhum:: " + Minhum +":"+Maxhum);
			if (SensorValue == null) {
				SensorValue = "Sensor1";
	%>
	<script type="text/javascript">	
			 	document.getElementById("sens_val").value = '<%out.print(SensorValue);%>';
			 	document.getElementById("sens_val").selected=true;
			 	
			 	</script>
	<%
		} else {
				SensorValue = request.getParameter("sens_val");
				System.out.println("SensorValue on Selected " + SensorValue);
	%>
	<script type="text/javascript">	
			 
			 	document.getElementById("sens_val").value = '<%out.print(SensorValue);%>';
			 	document.getElementById("sens_val").selected=true;
			 	
			 	</script>
	<%
		}
	%>
	<%
		int colcount = 0; //special code for detailed view
			String setSequence = "";
			String detailViewSequence = "", ColumnList = "";
			boolean setDefFlag = false;

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
		String ddx = request.getQueryString();
			String bt = request.getParameter("button");
			System.out.println(" buttom :- " + bt);

			if (bt == null || bt.equals("null")) {
				System.out.println("Inside On load");

				datex1 = session.getAttribute("today").toString(); //dd-MMM-yyyy

				datex2 = session.getAttribute("today").toString();
				VehicleCode = request.getParameter("vehcode");
				////System.out.println("Inside Button not Clicked");

				ResultSet rst = st2.executeQuery(ssql);
				if (rst.next()) {
					Minhum = rst.getString("Mintemp1");
					Maxhum = rst.getString("Maxtemp1");
				}
			} else {

				System.out.println("Inside ELSSSSSSSSS ");

				datex1 = request.getParameter("data");
				datex2 = request.getParameter("data1");

				VehicleCode = request.getParameter("Vehicle");

			}

			sql = "select * from t_vehicledetails where VehicleCode='" + VehicleCode + "'";
			ResultSet rst23 = st.executeQuery(sql);
			if (rst23.next()) {
				vehregno = rst23.getString("VehicleRegNumber");

			}

			System.out.println(" datex1 " + datex1 + " datex2 " + datex2);

			String dt = new SimpleDateFormat("yyyy-MM-dd")
					.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

			String dttime = "" + dt + " 00:00:00";

			String dt1 = new SimpleDateFormat("yyyy-MM-dd")
					.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

			String dt1time = "" + dt1 + " 23:59:59";

			System.out.println("Query pass date params:  from:" + dt + " to: " + dt1);

			System.out.println("Query pass date time  params:  from:" + dttime + " to: " + dt1time);

			String Selection1 = request.getParameter("basicSelect1");
			System.out.println("selection1:" + Selection1);

			String Selection2 = request.getParameter("basicSelect2");
			System.out.println("selection2:" + Selection2);

			String Selection3 = request.getParameter("basicSelect3");
			System.out.println("selection3:" + Selection3);

			String Selection4 = request.getParameter("basicSelect4");
			System.out.println("selection4:" + Selection4);
	%>
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-6 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0">
								Sensor Detail Report From
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
			<br>
			<!-- ****************************************** -->

			<!-- Form Comes here -->

			<form name="formreport" id="formreport" method="post">
				<div class="row">
					<!-- row main start -->
					<div class="row col-12">
						<!--  row 1 -->

						<div class="col-md-3">
							<!-- col 3-->
							<label for="basicSelect">Vehicle</label>
							<div class="input-group input-group-merge">
								<select class="form-select" name="Vehicle" id="Vehicle">
									<option value="<%=VehicleCode%>"><%=vehregno%></option>
									<%
										String ven = "";
											String vehlist = session.getAttribute("VehList").toString();
											String veh = "select VehicleRegNumber,VehicleCode  from db_gps.t_vehicledetails where vehiclecode in "
													+ vehlist + " order by VehicleRegNumber";
											////System.out.println("vendor1"+veh);
											ResultSet rstvendor = st1.executeQuery(veh);
											while (rstvendor.next()) {
												ven = rstvendor.getString("VehicleRegNumber");
									%>
									<option value="<%=rstvendor.getString("VehicleCode")%>"><%=rstvendor.getString("VehicleRegNumber")%></option>
									<%
										}
									%>

								</select>

							</div>
						</div>
						<!-- col 3 -->



						<div class="col-md-2">
							<!-- col 1 -->
							<label for="from">From:</label>
							<div class="input-group input-group-merge">
								<input type="text" name="data" id="data" class="form-control"
									value="<%=datex1%>"> <span class="input-group-text"><svg
										xmlns="http://www.w3.org/2000/svg" width="14" height="14"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-calendar">
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
						<div class="col-md-1">
							<label for="basicSelect">HH:</label>
							<div class="input-group input-group-merge">
								<select name="ftime1" id="ftime1" class="form-select">
									<%
										if (bt == null) {
									%>

									<option value="00" selected>00</option>
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
										for (int i = 10; i < 24; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}
											} else {
												String hour = request.getParameter("ftime1");
												////System.out.println("Hour In else :- "+hour);
									%>
									<option value="<%=hour%>" selected><%=hour%></option>
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
										for (int i = 10; i < 24; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}

											}
									%>
								</select>
							</div>
						</div>
						<div class="col-md-1">
							<label for="basicSelect">MM</label>
							<div class="input-group input-group-merge">
								<select name="ftime2" id="ftime2" class="form-select">
									<%
										if (bt == null) {
									%>
									<option value="00" selected>00</option>
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
										for (int i = 10; i < 60; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}
											} else {
												String min = request.getParameter("ftime2");
												////System.out.println("Minute  In else :- "+min );
									%>
									<option value="<%=min%>" selected><%=min%></option>
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
										for (int i = 10; i < 60; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}

											}
									%>

								</select>
							</div>
						</div>
						<div class="col-md-2">
							<!-- col 2 -->
							<label for="to">To:</label>
							<div class="input-group input-group-merge">
								<input type="text" id="data1" name="data1" class="form-control"
									value="<%=datex2%>" /> <span class="input-group-text"><svg
										xmlns="http://www.w3.org/2000/svg" width="14" height="14"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-calendar">
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
						<div class="col-md-1">
							<label for="basicSelect">HH:</label>
							<div class="input-group input-group-merge">
								<select name="ftime1" id="ftime1" class="form-select">
									<%
										if (bt == null) {
									%>

									<option value="00" selected>23</option>
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
										for (int i = 10; i < 24; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}
											} else {
												String hour = request.getParameter("ftime1");
												////System.out.println("Hour In else :- "+hour);
									%>
									<option value="<%=hour%>" selected><%=hour%></option>
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
										for (int i = 10; i < 24; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}

											}
									%>
								</select>
							</div>
						</div>

						<div class="col-md-1">
							<label for="basicSelect">MM</label>
							<div class="input-group input-group-merge">
								<select name="ftime2" id="ftime2" class="form-select">
									<%
										if (bt == null) {
									%>
									<option value="00" selected>59</option>
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
										for (int i = 10; i < 60; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}
											} else {
												String min = request.getParameter("ftime2");
												////System.out.println("Minute  In else :- "+min );
									%>
									<option value="<%=min%>" selected><%=min%></option>
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
										for (int i = 10; i < 60; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}

											}
									%>

								</select>
							</div>
						</div>
						</div> <!-- row end -->
                        
                        <div class="row col-12">
								<div class="col-md-3">
									<!-- col 3-->
									<label for="basicSelect">Sensor </label>
									<div class="input-group input-group-merge">
										<select class="form-select" name="sens_val" id="sens_val"
											name="sens_val" onchange="onchn();">
											<option value="<%=SensorValue%>"><%=SensorValue%></option>
											<option value="Sensor1">Sensor 1</option>
											<option value="Sensor2">Sensor 2</option>
											<option value="Sensor3">Sensor 3</option>
											<option value="Sensor4">Sensor 4</option>
											<option value="Sensor6">Sensor 6</option>
											<option value="Sensor7">Sensor 7</option>
											<option value="Sensor8">Sensor 8</option>
											<option value="Sensor9">Sensor 9</option>
										</select>
		
									</div>
								</div>
						<!-- col 3 -->
						<div class="col-md-2">
								<label>Min</label></b> 
								<input   class="form-control" type="text" id="minval" name="minval" value="<%=Minhum%>" placeholder="0"> 
						</div>
				          <div class="col-md-2">
							 <label>Max</label>
							  <input  class="form-control" type="text" id="maxval" name="maxval" value="<%=Maxhum%>" placeholder="0">
						   </div>	
						
                        <%--   <td align="left"><label for="to"
							style="height: 30px; width: 50px;">Min</label></b> <input type="text"
							id="minval" name="minval" value="<%=Minhum%>"
							style="text-align: center; color: gray; width: 20px"> <label
							id="phone4" style="display: none;"> <font face="Arial"
								size="2" color="pink">Enter only Sensor Format Ex. 12 or
									12.5 or -20.10&nbsp;</font></label> <label id="phone10" style="display: none;">
								<font face="Arial" size="2" color="pink">Please Enter
									Sensor Ex. 12 or 12.5 or -20.10&nbsp;</font>
						</label> <label for="to" style="height: 30px; width: 50px;">Max</label> <input
							type="text" id="maxval" name="maxval" value="<%=Maxhum%>"
							style="text-align: center; color: gray; width: 20px"></b> <label
							id="phone6" style="display: none;"> <font face="Arial"
								size="2" color="pink">Enter only Sensor Format Ex. 12 or
									12.5 or -20.10&nbsp;</font></label> <label id="phone8" style="display: none;">
								<font face="Arial" size="2" color="pink">Please Enter
									Sensor Ex. 12 or 12.5 or -20.10&nbsp;</font>
						</label></td> --%>
						
							<div class="col-md-2">
								<!-- col 5 -->
								<input type="submit" class="btn btn-primary"
									style="margin-top: 20px;" name="button" onclick="return chk()"
									value="Submit">
							</div>
							<div class="col-md-3">
							
							</div>
							<!-- col 5 -->


					</div>
					<!-- row main end -->
					<br>
			</form>
			<div class="row col-12">
				<div class="col-10">
                 </div>
					<div class="col-2">
					   <button type="button" class="btn btn-primary"><a href="#" onclick="graphlink()" style="color:white"><b>Sensor Graph</b></a></button> 
						<!-- <a href="#" onclick="graphlink()" class="hr" >Sensor Graph</a> -->
					</div>
			
			</div>
			<br> <br> <br>

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
											<th>Sr No</th>
											<th>Date-Time</th>
											<th>Speed</th>
											<th>Distance</th>
											<th>Location</th>
											<th><%=SensorValue%></th>
										</tr>
									</thead>
									<tbody>
										<%
											DecimalFormat df = new DecimalFormat("0.00");
												Calendar cal = Calendar.getInstance();
												String dateinterval = "", mininterval = "";

												String interval = request.getParameter("interval");
												String Vehicle = request.getParameter("Vehicle");

												////System.out.println("Interval is------>:"+interval);

												java.util.Date date1 = new java.util.Date();
												java.util.Date date2 = new java.util.Date();

												////System.out.println(date1);
												////System.out.println(date2);
												long millis = 0;
												long millis1 = 0;
												long millis2 = 0;

												////System.out.println("Interval is------>:"+Vehicle);

												String fromdate = "", todate = "";
												String Bt1 = request.getParameter("button");

												String days1 = "", interval1 = "";
												if (Bt1 == null) {

													fromdate = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
													todate = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());

													fromdate = fromdate + " 00:00:00";
													todate = todate + " 23:59:59";

													String a = "23";
													String b = "59";

													interval1 = "60";

													VehicleCode = request.getParameter("vehcode");
										%>

										<script>
		document.getElementById("ttime1").value = '<%out.print(a);%>';
		document.getElementById("ttime2").value = '<%out.print(b);%>';
		</script>

										<%
											mininterval = " select *  from db_gps.t_veh" + VehicleCode + " where Sen1>=" + Minhum
															+ ".00 and Sen1<=" + Maxhum + ".00 and TheFieldDataDateTime >= '" + fromdate
															+ "' and TheFieldDataDateTime <='" + todate
															+ "'  and TheFiledTextFileName in('SI') order by Thefielddatadatetime";

													System.out.println("Query is in:" + mininterval);

													////System.out.println("Button not Press:"+days1);
													////System.out.println("Button not Press:"+interval1);

												} else {

													String date12 = request.getParameter("data");
													String ftime1 = request.getParameter("ftime1");
													String ftime2 = request.getParameter("ftime2");
													String Minhum1 = request.getParameter("minval");
													String Maxhum1 = request.getParameter("maxval");

													System.out.println("---===>Minhum1::Maxhum1::" + Minhum1 + "::" + Maxhum1);

													int len = Minhum1.length();
													int len2 = Maxhum1.length();

													String tosr = String.valueOf(len);

													if (tosr.equalsIgnoreCase("1")) {
														System.out.println("---===>tosr:" + tosr);
														Minhum1 = "0" + Minhum1;

													}

													String tosr1 = String.valueOf(len2);

													if (tosr1.equalsIgnoreCase("1")) {
														System.out.println("---===>tosr1:" + tosr1);
														Maxhum1 = "0" + Maxhum1;

													}

													String date13 = request.getParameter("data1");
													String ttime1 = request.getParameter("ttime1");
													String ttime2 = request.getParameter("ttime2");

													String fromtime = ftime1 + ":" + ftime2 + ":00";

													String totime = ttime1 + ":" + ttime2 + ":59";
										%>
										<script>
		document.getElementById("data").value = '<%out.print(date12);%>';
		document.getElementById("data1").value = '<%out.print(date13);%>';
		document.getElementById("ftime1").value = '<%out.print(ftime1);%>';
		document.getElementById("ftime2").value = '<%out.print(ftime2);%>';
		
		document.getElementById("ttime1").value = '<%out.print(ttime1);%>';
		document.getElementById("ttime2").value = '<%out.print(ttime2);%>';
		document.getElementById("minval").value = '<%out.print(Minhum1);%>';
		document.getElementById("maxval").value = '<%out.print(Maxhum1);%>';

		</script>
			                           <%
											fromdate = new SimpleDateFormat("yyyy-MM-dd")
															.format(new SimpleDateFormat("dd-MMM-yyyy").parse(date12));

													todate = new SimpleDateFormat("yyyy-MM-dd")
															.format(new SimpleDateFormat("dd-MMM-yyyy").parse(date13));

													fromdate = fromdate + " " + fromtime;
													todate = todate + " " + totime;

													VehicleCode = request.getParameter("Vehicle");

													System.out.println("SensorValue on Selected " + SensorValue);

													if (SensorValue.equalsIgnoreCase("Sensor1")) {
														mininterval = "select *  from db_gps.t_veh" + VehicleCode + " where Sen1>=" + Minhum1
																+ ".00 and Sen1<=" + Maxhum1 + ".00 and TheFieldDataDateTime >= '" + fromdate
																+ "' and TheFieldDataDateTime <='" + todate
																+ "'  and TheFiledTextFileName in('SI') order by Thefielddatadatetime ";

													} else if (SensorValue.equalsIgnoreCase("Sensor2")) {
														mininterval = "select *  from db_gps.t_veh" + VehicleCode + " where Sen2>=" + Minhum1
																+ ".00 and Sen2<=" + Maxhum1 + ".00 and TheFieldDataDateTime >= '" + fromdate
																+ "' and TheFieldDataDateTime <='" + todate
																+ "'  and TheFiledTextFileName in('SI') order by Thefielddatadatetime ";

													} else if (SensorValue.equalsIgnoreCase("Sensor3")) {
														mininterval = "select *  from db_gps.t_veh" + VehicleCode + " where Sen3>=" + Minhum1
																+ ".00 and Sen3<=" + Maxhum1 + ".00 and TheFieldDataDateTime >= '" + fromdate
																+ "' and TheFieldDataDateTime <='" + todate
																+ "'  and TheFiledTextFileName in('SI') order by Thefielddatadatetime ";

													} else if (SensorValue.equalsIgnoreCase("Sensor4")) {
														mininterval = "select *  from db_gps.t_veh" + VehicleCode + " where Sen4>=" + Minhum1
																+ ".00 and Sen4<=" + Maxhum1 + ".00 and TheFieldDataDateTime >= '" + fromdate
																+ "' and TheFieldDataDateTime <='" + todate
																+ "'  and TheFiledTextFileName in('SI') order by Thefielddatadatetime ";

													}

													else if (SensorValue.equalsIgnoreCase("Sensor6")) {
														mininterval = "select *  from db_gps.t_veh" + VehicleCode + " where Sen6>=" + Minhum1
																+ ".00 and Sen6<=" + Maxhum1 + ".00 and TheFieldDataDateTime >= '" + fromdate
																+ "' and TheFieldDataDateTime <='" + todate
																+ "'  and TheFiledTextFileName in('SI') order by Thefielddatadatetime ";

													} else if (SensorValue.equalsIgnoreCase("Sensor7")) {
														mininterval = "select *  from db_gps.t_veh" + VehicleCode + " where Sen7>=" + Minhum1
																+ ".00 and Sen7<=" + Maxhum1 + ".00 and TheFieldDataDateTime >= '" + fromdate
																+ "' and TheFieldDataDateTime <='" + todate
																+ "'  and TheFiledTextFileName in('SI') order by Thefielddatadatetime ";

													} else if (SensorValue.equalsIgnoreCase("Sensor8")) {
														mininterval = "select *  from db_gps.t_veh" + VehicleCode + " where Sen8>=" + Minhum1
																+ ".00 and Sen8<=" + Maxhum1 + ".00 and TheFieldDataDateTime >= '" + fromdate
																+ "' and TheFieldDataDateTime <='" + todate
																+ "'  and TheFiledTextFileName in('SI') order by Thefielddatadatetime ";

													} else if (SensorValue.equalsIgnoreCase("Sensor9")) {
														mininterval = "select *  from db_gps.t_veh" + VehicleCode + " where Sen9>=" + Minhum1
																+ ".00 and Sen9<=" + Maxhum1 + ".00 and TheFieldDataDateTime >= '" + fromdate
																+ "' and TheFieldDataDateTime <='" + todate
																+ "'  and TheFiledTextFileName in('SI') order by Thefielddatadatetime ";

													}

													System.out.println("Query after enter submit:" + mininterval);
												}

												String VhNumber = "";
												String sql12 = "select * from t_vehicledetails where VehicleCode='" + VehicleCode + "'";
												ResultSet rs121 = st.executeQuery(sql12);
												if (rs121.next()) {
													VhNumber = rs121.getString("VehicleRegNumber");

												}

												VhNumber = VhNumber.replace(" ", "");
												////System.out.println("=============================>"+VhNumber);

												String data = new SimpleDateFormat("dd-MMM-yyyy")
														.format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));

												data1 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));
										%>

										<%
											int dist = 0;

												int i = 1;
												int j = 2;
												String maxh = "", minh = "";
												String ssqll = "select * from t_defaultvals where OwnerName='" + trans + "'";
												ResultSet rst2 = stmt4.executeQuery(ssqll);
												if (rst2.next()) {

													if (SensorValue.equalsIgnoreCase("Sensor1")) {
														minh = rst2.getString("Mintemp1");

														maxh = rst2.getString("Maxtemp1");

													} else if (SensorValue.equalsIgnoreCase("Sensor2")) {
														minh = rst2.getString("Mintemp2");

														maxh = rst2.getString("Maxtemp2");

													} else if (SensorValue.equalsIgnoreCase("Sensor3")) {
														minh = rst2.getString("Mintemp3");

														maxh = rst2.getString("Maxtemp3");

													} else if (SensorValue.equalsIgnoreCase("Sensor4")) {
														minh = rst2.getString("Mintemp4");

														maxh = rst2.getString("Maxtemp4");

													} else if (SensorValue.equalsIgnoreCase("Sensor6")) {
														minh = rst2.getString("MinHumidity");

														maxh = rst2.getString("MaxHumidity");

													} else if (SensorValue.equalsIgnoreCase("Sensor7")) {
														minh = rst2.getString("Minhumi2");

														maxh = rst2.getString("Maxhumi2");

													} else if (SensorValue.equalsIgnoreCase("Sensor8")) {
														minh = rst2.getString("Minhumi3");

														maxh = rst2.getString("Maxhumi3");

													} else if (SensorValue.equalsIgnoreCase("Sensor9")) {
														minh = rst2.getString("Minhumi4");

														maxh = rst2.getString("Maxhumi4");

													}
													//System.out.println("Maxhu:"+maxh);

												}

												if (maxh.equals("-") || maxh.equalsIgnoreCase("-") || maxh == "-" || minh.equals("-")
														|| minh.equalsIgnoreCase("-") || minh == "-" || minh == "" || maxh == "") {
													minh = "0.00";
													maxh = "0.00";
												}

												ResultSet rs12 = stmt3.executeQuery(mininterval);

												while (rs12.next()) {
													dt = rs12.getString("Thefielddatadatetime").substring(0, 19);

													dt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
															.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dt));

													double Sen11 = 0.00;
													String Sen1 = "-";
													if (SensorValue.equalsIgnoreCase("Sensor1")) {
														Sen1 = rs12.getString("Sen1");

													} else if (SensorValue.equalsIgnoreCase("Sensor2")) {
														Sen1 = rs12.getString("Sen2");

													} else if (SensorValue.equalsIgnoreCase("Sensor3")) {
														Sen1 = rs12.getString("Sen3");

													} else if (SensorValue.equalsIgnoreCase("Sensor4")) {
														Sen1 = rs12.getString("Sen4");

													} else if (SensorValue.equalsIgnoreCase("Sensor6")) {
														Sen1 = rs12.getString("Sen6");
													} else if (SensorValue.equalsIgnoreCase("Sensor7")) {
														Sen1 = rs12.getString("Sen7");
													} else if (SensorValue.equalsIgnoreCase("Sensor8")) {
														Sen1 = rs12.getString("Sen8");
													} else if (SensorValue.equalsIgnoreCase("Sensor9")) {
														Sen1 = rs12.getString("Sen9");
													}

													System.out.println("Sen1:" + Sen1);

													try {
														if (Sen1.equals(" NAN") || Sen1.equalsIgnoreCase(" NAN") || Sen1 == " NAN" || Sen1.equals("NAN")
																|| Sen1.equalsIgnoreCase("NAN") || Sen1 == "NAN" || Sen1.equals("-")
																|| Sen1.equalsIgnoreCase("-") || Sen1 == "-" || Sen1.equals("TD")
																|| Sen1.equalsIgnoreCase("TD") || Sen1 == "TD") {

															//	System.out.println("INN IFF:"+Sen1);
															Sen11 = 0.00;

														} else {
															Sen11 = Double.parseDouble(Sen1);

														}
													} catch (Exception e) {
														e.printStackTrace();
													}

													//	System.out.println("date:"+rs12.getString("TheFieldDataDate"));

													System.out.println("maxh:" + maxh);
													if (i == 1) {
														dist = rs12.getInt("Distance");

														date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
																.parse(rs12.getString("TheFieldDataDate") + " " + rs12.getString("TheFieldDataTime"));

													}

													////System.out.println("Calculation Part is Below:");

													date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
															.parse(rs12.getString("TheFieldDataDate") + " " + rs12.getString("TheFieldDataTime"));

													System.out.println("maxh:" + maxh);
													double Maxhu = Double.parseDouble(maxh);
													//System.out.println("Maxhu:"+Maxhu);
													System.out.println("minh:" + minh);
													double Minhu = Double.parseDouble(minh);
													//System.out.println("Minhu:"+Minhu);

													//System.out.println("Sen11::"+Sen11+"Maxhu::"+Maxhu);
										%>

										<tr>

											<td align="right"><b><%=i%></b></td>
											<td align="center"><b><%=dt1%></b></td>
											<%
												
											%>


											<td align="right"><b><%=rs12.getString("Speed")%></b></td>



											<%
												if (session.getAttribute("distformat").toString().equalsIgnoreCase("ML")) {
											%>



											<td align="right"><b><%=(int) fleetview.KM_TO_MILES1(rs12.getInt("Distance") - dist)%></b></td>

											<%
												} else {
											%>



											<td align="right"><b><%=rs12.getInt("Distance") - dist%></b></td>







											<%
												}
											%>



											<td align="center"><b><%=rs12.getString("TheFieldSubject")%></b></td>


											<%
												if (Sen1.equals(" NAN") || Sen1.equalsIgnoreCase(" NAN") || Sen1 == " NAN" || Sen1.equals("NAN")
																|| Sen1.equalsIgnoreCase("NAN") || Sen1 == "NAN" || Sen1.equals("0.00")
																|| Sen1.equalsIgnoreCase("0.00") || Sen1 == "0.00") {
															Sen1 = "Disconnection";
											%>
											<td align="right"><b><%=Sen1%></b></td>
											<%
												} else {
											%>


											<td align="right"><b><%=df.format(Sen11)%></b></td>
											<%
												}
											%>







										</tr>

										<%
											i++;

												}

												String data123 = new SimpleDateFormat("dd-MMM-yyyy")
														.format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));

												String data1234 = new SimpleDateFormat("dd-MMM-yyyy")
														.format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));
										%>


									</tbody>
									<tfoot>
										<tr>
											<th>Sr No</th>
											<th>Date-Time</th>
											<th>Speed</th>
											<th>Distance</th>
											<th>Location</th>
											<th><%=SensorValue%></th>
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
	<input type="hidden" name="graphveh" id="graphveh"
		value=<%=VehicleCode%>>


	<input type="hidden" name="fromdate" id="fromdate" value=<%=data123%>>
	<input type="hidden" name="todate" id="todate" value=<%=data1234%>>


	<div class="modal" id="SetCustomModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Custom Column Selection for Sensor
						Detail Report</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<%
					int kk = 0;
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
											<input type="text" id="net_id1<%=kk%>" name="net_id1<%=kk%>"
												style="width: 70px; padding: 4px 5px 2px 5px; border: none; text-align: right; font: normal 11px Arial, Helvetica, sans-serif;"
												value="<%=kk%>" readonly />
										</div> <input type="checkbox" name="check<%=kk%>" id="check<%=kk%>" />
									</td>
									<td><input type="text" name="clname<%=kk%>"
										id="clname<%=kk%>" value="<%=stcol.nextToken()%>"
										readonly="readonly" style="border: none" /></td>
								</tr>
								<%
									kk++;
										}
								%>
							</tbody>
						</table>

						<input type="hidden" name="checkedNumber" id="checkedNumber"
							value="<%=kk%>" /> <input type="hidden" name="reportno"
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
</jsp:useBean>