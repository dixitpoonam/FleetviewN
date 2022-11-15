<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>

<%@ include file="headernew1.jsp" %>

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
<body>
	<%!Connection conn = null, conn1 = null;
	Statement st23 = null, st24 = null, st25 = null, st26 = null, st27 = null, st28 = null, st29 = null, stt = null;
	Statement st30 = null, st31 = null, st32 = null, st33 = null, st34 = null, st35 = null, st36 = null;
	Statement st37 = null, st38 = null, st39 = null, st40 = null, st41 = null, st42 = null, st43 = null;
	Statement st44 = null, st45 = null, st46 = null, st47 = null, st48 = null, st49 = null, st50 = null;
	Statement st51 = null, st52 = null, st53 = null, st54 = null, st55 = null, st56 = null, st57 = null, st58 = null,
			st59 = null;

	Statement st, st1, stcom, strch, st2, st3, st11, stt1, stt2, st12, st13, st14, st15, st16, st4, sto, st20, st21,
			st22, strep, stdev, stmain1, stonl;
	String fromdate, search = "", todate, sql, sql1, sql2, sql3, transporter, pageflag, datenew1, datenew2,
			fromdatetime, todatetime, vendor1, category1, startp, endp, ven = "", startp1, endp1, vendername = "",

			categoryname, startplacename, endplacename, statusname, vehino, vehicleno, vehiclecode, Sqlv = "",
			distributorname = "";
	String sqlname = null, briefing = "", sqlbrif = null, Dbriefing = "", etaclose = "", reportclose = "",
			tripsrch = "", vehsrch = "", spsrch = "", driv = "";
	String epsrch = "", ownsrch = "", statuasrch = "", statuarsrun = "", etaclose1 = "", sdtime1 = "", sddate1 = "",
			etdate = "", repdate = "", reportclose1 = "", drivername = "";
	String enteredBy = "";
	int i = 0;
	String sum = "";%>


	<%
		//Class.forName(MM_dbConn_DRIVER); 
		/* conn = fleetview.ReturnConnection();
		conn1 = fleetview.ReturnConnection1(); */

		conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		st = conn.createStatement();
		stt = conn.createStatement();

		st1 = conn.createStatement();
		st2 = conn.createStatement();
		st3 = conn1.createStatement();
		st11 = conn.createStatement();
		stt1 = conn.createStatement(); //  *********************************
		stt2 = conn.createStatement();
		st12 = conn.createStatement();
		st13 = conn.createStatement();
		st14 = conn.createStatement();
		st15 = conn.createStatement();
		st16 = conn.createStatement();
		sto = conn.createStatement();
		st4 = conn.createStatement();
		stdev = conn.createStatement();
		st20 = conn.createStatement();
		st21 = conn.createStatement();
		st22 = conn.createStatement();
		strep = conn.createStatement();
		strch = conn.createStatement();
		stcom = conn.createStatement();
		st23 = conn.createStatement();
		st24 = conn.createStatement();
		st25 = conn.createStatement();
		st26 = conn.createStatement();
		st27 = conn.createStatement();
		st28 = conn.createStatement();
		st29 = conn.createStatement();
		st30 = conn.createStatement();
		st31 = conn.createStatement();
		st32 = conn.createStatement();
		st33 = conn.createStatement();
		st34 = conn.createStatement();
		st35 = conn.createStatement();
		st36 = conn.createStatement();

		st37 = conn.createStatement();
		String dtt = "";
		String dtt1 = "";
		st38 = conn1.createStatement();
		st39 = conn1.createStatement();
		st40 = conn1.createStatement();
		st41 = conn1.createStatement();
		st42 = conn1.createStatement();
		st43 = conn1.createStatement();

		st44 = conn1.createStatement();
		st45 = conn1.createStatement();
		st46 = conn1.createStatement();
		st47 = conn1.createStatement();
		st48 = conn1.createStatement();
		st49 = conn1.createStatement();
		st50 = conn1.createStatement();
		st51 = conn1.createStatement();
		st52 = conn1.createStatement();
		st53 = conn1.createStatement();
		st54 = conn1.createStatement();
		st55 = conn1.createStatement();
		st56 = conn1.createStatement();
		st57 = conn.createStatement();
		st58 = conn.createStatement();
		st59 = conn.createStatement();
		stmain1 = conn1.createStatement();
		stonl = conn.createStatement();
		String fromtime = "";
		String totime = "";
	%>
	<%
		String STripId = "";
		String searchstatus1 = "Set";
		int discount = 0, diskm = 0;
		try {
			search = request.getParameter("searchid");
			System.out.println("searchid--" + search);
			System.out.println("getQueryString--" + request.getQueryString());

			if (!(null == request.getQueryString()) && (null == search)) {
				fromdate = new SimpleDateFormat("yyyy-MM-dd")
						.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));
				todate = new SimpleDateFormat("yyyy-MM-dd")
						.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data2")));
				transporter = request.getParameter("transporter");
	%>
	<input type="hidden" id="data11" name="data11" value="<%=fromdate%>"></input>
	<input type="hidden" id="data22" name="data22" value="<%=todate%>"></input>
	<input type="hidden" id="transporter1" name="transporter1"
		value="<%=transporter%>"></input>

	<%
		session.setAttribute("reportno", "Report No:9.0");
				datenew1 = request.getParameter("data1");
				datenew2 = request.getParameter("data2");
				vendername = request.getParameter("vendor");
				categoryname = request.getParameter("category");
				startplacename = request.getParameter("startp");
				endplacename = request.getParameter("endp");
				statusname = request.getParameter("status");
				vehino = request.getParameter("vehicle");
				pageflag = "MyTrip";

				if (vehino.length() > 0) {
					int i = vehino.indexOf(',');
					vehino = vehino.substring(i + 1);
				}
			} else {

				Calendar c = Calendar.getInstance(); // this takes current date
				c.set(Calendar.DAY_OF_MONTH, 1);
				System.out.println(" current date " + new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime()));
				datenew1 = new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());

				datenew2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
				statusname = "Open";
				vendername = "ALL";
				categoryname = "ALL";
				startplacename = "ALL";
				endplacename = "ALL";
				drivername = "All";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String datex1, datex2, data1, data2;
		String tripp = "";
		String bt = request.getParameter("submit");
		System.out.println(" buttom :- " + bt);

		if (bt == null || bt.equals("null")) {

			datex1 = datex2 = session.getAttribute("today").toString();
			
			/* Calendar c = Calendar.getInstance(); // this takes current date
			c.set(Calendar.DAY_OF_MONTH, 1);
			System.out.println(" current date " + new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime()));
 */			
 			//datex1 = new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
			statusname = "Open";
			fromtime = "00:00:00";
			totime = "23:59:59";

			tripp = request.getParameter("Trip");

		} else {

			System.out.println("Inside ELSSSSSSSSS ");
			statusname = request.getParameter("status");

			data1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));
			data2 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data2")));

			datex1 = request.getParameter("data1");
			datex2 = request.getParameter("data2");

			String ftime1 = request.getParameter("ftime1");
			String ftime2 = request.getParameter("ftime2");

			String ttime1 = request.getParameter("ttime1");
			String ttime2 = request.getParameter("ttime2");

			fromtime = ftime1 + ":" + ftime2 + ":00";

			totime = ttime1 + ":" + ttime2 + ":59";
			tripp = request.getParameter("Trip");
	%>
	<script>

document.getElementById("ftime1").value = '<%out.print(ftime1);%>';
document.getElementById("ftime2").value = '<%out.print(ftime2);%>';

document.getElementById("ttime1").value = '<%out.print(ttime1);%>';
document.getElementById("ttime2").value = '<%out.print(ttime2);%>';
	</script>
	<%
		}

		System.out.println("trip:: " + tripp);

		System.out.println(" datex1 " + datex1 + " datex2 " + datex2);

		dtt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

		dtt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

		dtt = dtt + " " + fromtime;
		dtt1 = dtt1 + " " + totime;
	%>
	<%
		String role = "";

		String username = "";
		username = (String) session.getAttribute("usertypevalue");

		System.out.println("Session name----------------->:" + username);
	%>
	<%-- <%
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
			//setDefFlag=true;    uncomment this line for report conversion testing
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
				//setDefFlag=true;   uncomment this line for report conversion

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
	<input type="hidden" id="setDefFlag" name="setDefFlag"  value="<%=setDefFlag%>">
 --%>	
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0">
								My Trips Report From <%=datex1%> To <%=datex2%> Of <%=username%></h3>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
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
			
			<!-- Form Comes Here  -->
			
			<form name="formreport" id="formreport" method="post">
				<div class="row col-12">
					<div class="col-md-2">
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
								$(function() {
									$("#data").datepicker({
										dateFormat : 'dd-M-yy',
										changeMonth : true,
										changeYear : true
									});
								});

							});
						</script>
						</div>
					
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
			maxDate:7  */
});
} );
			
});

			   </script>
			   </div>
					
					<div class="col-md-1">
					<label for="basicSelect">HH:</label>
						<div class="input-group input-group-merge">
					<select name="ttime1" id="ttime1" class="form-select">
									<%
										if (bt == null) {
									%>
									<option value="23" selected>23</option>

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
											} else {
												String hour = request.getParameter("ttime1");
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
					<label for="basicSelect">MM:</label>
						<div class="input-group input-group-merge">
					          <select name="ttime2" id="ttime2" class="form-select">
									<%
										if (bt == null) {
									%>
									<option value="59" selected>59</option>
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
											} else {
												String min = request.getParameter("ttime2");
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
					<div class="col-md-1">
					<label for="basicSelect">Status/Category:</label>
						<div class="input-group input-group-merge">
							<select id="status" name="status" class="form-select" onChange="statuscloser(this.value)">
								<option value="Open" <%if (statusname.equals("Open")) {%>
									Selected <%}%>>Open</option>
								<option value="Closed" <%if (statusname.equals("Closed")) {%>
									Selected <%}%>>Closed</option>

								<option value="Cancelled"
									<%if (statusname.equals("Cancelled")) {%> Selected <%}%>>Cancelled</option>
								<option value="All" <%if (statusname.equals("All")) {%>
									Selected <%}%>>All</option>
							</select>
							</div>
					</div>
					
					<div class="col-md-2">
					<label for="search">Trip ID:</label>
		    	<div class="input-group input-group-merge">
                     <input type="text" id="Trip" class="form-control" name="Trip" placeholder="Enter Trip ID" />
                </div>
					</div>
				 <div class="col-md-1">
				<input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="button" onclick="return chk()"  value="Submit">
			</div>
		
				</div> <!-- col-md-12  -->
				<input type="hidden" name="transporter" id="transporter" value="<%=session.getAttribute("usertypevalue").toString()%>">
				<input type="hidden" name="colorvalue" id="colorvalue" value="all">
				
			</form>
			<!-- Table Comes Here  -->
			<a href="detailed_report2.jsp?fromdata=<%=datex1%>&todata=<%=datex2%>&status=<%=statusname%>">
			<button type="button" class="btn btn-primary" style="margin-top: 20px;" name="button">Detail Report</button>
			</a>


			<!-- Table section div Ends Here  -->
		</div>
	</div>
	<!-- set custom function div comes here  -->

</body>
</html>