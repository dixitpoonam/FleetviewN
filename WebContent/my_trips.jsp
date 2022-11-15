   <%@ include file="/Connections/conn.jsp"%>
<%-- <%@ include file="headernew.jsp"%> --%>
<jsp:include page="headernew.jsp">
	<jsp:param name="reportname" value="my_trips.jsp" />
</jsp:include>
<%@page import="java.util.Date"%>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page">
	<%
		fleetview.getConnection(MM_dbConn_DRIVER, MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
			fleetview.getConnection1(MM_dbConn_DRIVER, MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	%>
	<link href="css/currentPositions.css" rel="stylesheet" type="text/css"></link>
	<script src="includes/mytripinclude.js" type="text/javascript"></script>
	<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">

<title></title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"></script>





<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css ">
<script type="text/javascript" src="datatablejs/bootstrap.js"></script>

<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js "></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js "></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js "></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js "></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>

<script type="text/javascript" src="datatablejs/buttons.colVis.min.js"></script>



<style>
td.highlight {
	background-color: whitesmoke !important;
}
</style>
<script type="text/javascript">
function toggleDetails(id, show)
{
	var popup = document.getElementById("popup"+id);
	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
			} else {
		popup.style.visibility = "hidden";
	}
}
</script>
<script type="text/javascript">
 
	 $(document).ready(function() {
		    $('#example').DataTable( {
		    //	"pagingType": "full_numbers",
		    	
		        dom: 'Blfrtip',
		        "bLengthChange" : false,
		        buttons: [
		        	
		        	{
		        		extend: 'collection',
		        		
		        		text: 'Export',
		        		buttons: [
		        			{
		                        extend: 'excel',
		                        title: 'My Trip Report ', 
		                         exportOptions: {
		                        	 columns: [0,1,2,4,5,6,7,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49]
					            }, 
		                    },
		                    {
		                        extend: 'pdf',
		                        orientation: 'landscape',
		                        pageSize: 'LEGAL',
		                        title: 'My Trip  Report ', 
		                       exportOptions: {
		                    	   columns: [0,1,2,4,5,6,7,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49]
					            }, 
		                     },
		                    {
		                        extend: 'csv',
		                        title: 'My Trip  Report ', 
		                        exportOptions: {
		                        	columns: [0,1,2,4,5,6,7,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49]
					            }, 
		                    },
		                    {
		                        extend: 'print',
		                        title: 'My Trip  Report ',
		                        exportOptions: {
		                        	columns: [0,1,2,4,5,6,7,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49]
					            },
		                    },
		                    {
		                        extend: 'copy',
		                        title: 'My Trip  Report ',
		                         exportOptions: {
		                        	 columns: [0,1,2,4,5,6,7,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49]
					            },
		                   },
		                    
		            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
			            				
		                    
		            			]
		        	},
		        	
		            'colvis',
		            'pageLength'
		        ],
		        
		        
		        "oLanguage": {
		        	   "sSearch": "Search"
		        	 },
		        
		        	 lengthMenu: [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100 ]],        
		       
		/*           "aoColumns": [
		        	    null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			     	    null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
			            null,
				    null,
			            null,
			            null,
			            null
		        ] 
 */		    
		    	
		    } );} );

	 jQuery.extend( jQuery.fn.dataTableExt.oSort, {
		 "date-uk-pre": function ( a ) {
		    var ukDatea = a.split('/');
		    return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
		 },

		 "date-uk-asc": function ( a, b ) {
		    return ((a < b) ? -1 : ((a > b) ? 1 : 0));
		 },

		 "date-uk-desc": function ( a, b ) {
		    return ((a < b) ? 1 : ((a > b) ? -1 : 0));
		 }



	 } );
</script>

<script>



function srk1(username,data1,ftime1,ftime2,data2,ttime1,ttime2,statusname,trip,EDate,ETime,status,Vehid)
{


    

  //  alert("Hello");
    
	location.assign("statustrip.jsp?username="+username+"&data1="+data1+"&ftime1="+ftime1+"&ftime2="+ftime2+"&data2="+data2+"&ttime1="+ttime1+"&ttime2="+ttime2+"&statusname="+statusname+"&tripid="+trip+"&EDate="+EDate+"&ETime="+ETime+"&status="+status+"&Vehid="+Vehid+"");
 
    
	return true;
	
}


</script>


</head>
<body>
	<%!Connection conn = null, conn1 = null;
	Statement st23 = null, st24 = null, st25 = null, st26 = null, st27 = null, st28 = null, st29 = null,stt=null;
	Statement st30 = null, st31 = null, st32 = null, st33 = null, st34 = null, st35 = null, st36 = null;
	Statement st37 = null, st38 = null, st39 = null, st40 = null, st41 = null, st42 = null, st43 = null;
	Statement st44 = null, st45 = null, st46 = null, st47 = null, st48 = null, st49 = null, st50 = null;
	Statement st51 = null, st52 = null, st53 = null, st54 = null, st55 = null, st56 = null, st57 = null,st58 = null,st59 = null;

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
	String enteredBy="";
	int i = 0;
	String sum = "";%>


	<%
		//Class.forName(MM_dbConn_DRIVER); 
			conn = fleetview.ReturnConnection();
			conn1 = fleetview.ReturnConnection1();
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
			String dtt ="";
			String dtt1 ="";
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
			String fromtime ="";
			String totime ="";
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
String tripp="";
			String bt = request.getParameter("submit");
			System.out.println(" buttom :- " + bt);

			if (bt == null || bt.equals("null")) {

				datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
				data1 = data2 = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

				Calendar c = Calendar.getInstance(); // this takes current date
				c.set(Calendar.DAY_OF_MONTH, 1);
				System.out.println(" current date " + new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime()));
				//datex1 = new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
				statusname = "Open";
				fromtime="00:00:00";
				totime="23:59:59";
				
				tripp = request.getParameter("Trip");


			} else {

				System.out.println("Inside ELSSSSSSSSS ");
				statusname = request.getParameter("status");

				data1 = new SimpleDateFormat("yyyy-MM-dd")
						.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));
				data2 = new SimpleDateFormat("yyyy-MM-dd")
						.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data2")));

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
		<%	}

			
			System.out.println("trip:: "+tripp);

			System.out.println(" datex1 " + datex1 + " datex2 " + datex2);

			 dtt = new SimpleDateFormat("yyyy-MM-dd")
					.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

			 dtt1 = new SimpleDateFormat("yyyy-MM-dd")
					.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));
			 
			 dtt = dtt + " " + fromtime;
				dtt1 = dtt1 + " " + totime;
	%>
	<%
		String role = "";

			String username = "";
			username = (String) session.getAttribute("usertypevalue");

			System.out.println("Session name----------------->:" + username);
	%>
	<form name="formreport" id="formreport" method="get">
		<input type="hidden" id="username" name="username"
			value=<%=username%>>

		<div align="center" style="font-size: 13px;">
			<font><b> My Trip Report From <%=datenew1%> To <%=datenew2%>
					Of <%=username%></b></font>


			<table border="0" width=700 align="center">

				<br></br>
				<tr>
					<td><div style="display: flex; flex-direction: row; justify-content: center; align-items: center">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From</label>
							&nbsp;&nbsp; <input type="text" id="data1" name="data1"
								style="text-align: center; color: gray; font-size: 12px;"
								value="<%=datex1%>" size="10" readonly
								class="element text medium"/ >
							<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "data1",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "data1"       // ID of the button
			    }
			  );
			</script>
<select name="ftime1" id="ftime1"
									style="text-align: center; color: gray; font-size: 12px;">
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

								</select> <select name="ftime2" id="ftime2"
									style="text-align: center; color: gray; font-size: 12px;">
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
							</div></td>
					<td><div
							style="display: flex; flex-direction: row; justify-content: center; align-items: center">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To</label>
							&nbsp;&nbsp; <input type="text" id="data2" name="data2"
								style="text-align: center; color: gray; font-size: 12px;"
								value="<%=datex2%>" size="10" readonly
								class="element text medium" />
							<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "data2",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",    // the date format
			      button      : "data2"       // ID of the button
			    }
			  );
			</script>
<select name="ttime1" id="ttime1"
									style="text-align: center; color: gray; font-size: 12px;">
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

								</select> <select name="ttime2" id="ttime2"
									style="text-align: center; color: gray; font-size: 12px;">
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
							</div></td>

					<td><div
							style="display: flex; flex-direction: row; justify-content: center; align-items: center">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Status/Category</label>
							&nbsp;&nbsp; <select id="status" name="status"
								onChange="statuscloser(this.value)">
								<option value="Open" <%if (statusname.equals("Open")) {%>
									Selected <%}%>>Open</option>
								<option value="Closed" <%if (statusname.equals("Closed")) {%>
									Selected <%}%>>Closed</option>

								<option value="Cancelled"
									<%if (statusname.equals("Cancelled")) {%> Selected <%}%>>Cancelled</option>
								<option value="All" <%if (statusname.equals("All")) {%>
									Selected <%}%>>All</option>
							</select>
						</div></td>


<td>

<div style="display: flex; flex-direction: row; justify-content: center; align-items: center">
							<label>&nbsp;&nbsp;TripID</label>       
							   <input type="text"    style="width: 90px;" name="Trip" id="Trip" value=""   placeholder="Enter Trip ID"  />
</div></td>



					<td><input type="hidden" name="transporter" id="transporter"
						value="<%=session.getAttribute("usertypevalue").toString()%>">
						<input type="hidden" name="colorvalue" id="colorvalue" value="all"></input>
						<div
							style="display: flex; flex-direction: row; justify-content: center; align-items: center">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
								type="submit" name="submit" id="submit" onclick="searchclear();"
								style="text-align: center; color: gray; font-size: 12px;"
								value="Submit">
						</div></td>




				</tr>
				
				
				
			</table>

<table >


<tr align="left">
				<td align="left">
				<a href="detailed_report2.jsp?fromdata=<%=datex1%>&todata=<%=datex2%>&status=<%=statusname%>">Detail Report</a></td>
				
				</tr>
				</table>

	<%
		try {
				sum = "";

				DecimalFormat twoDForm1 = new DecimalFormat("##.#");
				double totKm = 0, remKm = 0;
				Statement st4, sttemp, stopen, stveh;
				String sql = "", sql1, sql2, sql3, sqlopen, sqlveh;

				ResultSet rs2 = null;
				String sttdate = "", comments = "-";
				String vehdesc1 = "-", bgcolor1 = "", bgcolor2 = "", temptime = "", vehmodel1 = "-", vehtype1 = "-",
						tripcat1 = "-", adv1 = "-", freight1 = "-", endedby1 = "-", weight1 = "-", vendor11 = "-",
						reptdttme1 = "-", tripid1 = "";
				String gpname1 = "", ETA1 = "", today = "", lastweek = "", sdate = "", edate = "", lastmonth = "",
						startDate = "", startCode = "", startTime = "", endCode = "", TransTime = "",
						updatedTm = "", scheTmDt = "", updtetime = "", DisDate = "", ETADate = "";
				int km1 = 0, km2 = 0, km3 = 0, km4 = 0, km5 = 0, km6 = 0, km7 = 0, km8 = 0, km9 = 0, kmrun1 = 0,
						kmrun2 = 0, kmrundist = 0, todaysdist = 0;
				long diffDays = 0, tTime = 0;
				java.util.Date dt1 = null;
				String ftime1 = "00";
				String ftime2 = "00";
				String ftime3 = "00";
				String ttime1 = "00";
				String ttime2 = "00";
				String ttime3 = "00";
				String dateformat = "dd-MMM-yyy";
				System.out.println("statusname::" + statusname);

				dateformat = session.getAttribute("dateformat").toString();
				today = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
				String currenttime = new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
				System.out.println("Hi date m");

				st4 = conn.createStatement();
				stveh = conn.createStatement();
				stopen = conn.createStatement();
				String mydate1, mydate2;

				String myvehlist = request.getParameter("VehList");
	%>

	<%
		
	%>


<table id="example" class="display"  style="width: 100%;">
		<thead>

			<tr>
				<%
					if (statusname.equalsIgnoreCase("Open") || statusname.equalsIgnoreCase("Cancelled")) 
					{
						%>

						<th class="hed" id="src1col" valign="top">Sr No</th>
				<th class="hed" id="vehcol" valign="top">Asset ID</th>
				<th align="center" style="display: none">TripID</th>
												<th class="hed" id="tripcol" valign="top">TripID</th>
												
																		<th class="hed" id="desccol" valign="top">Status</th>
												<th class="hed" id="ownercol" valign="top">JStatus</th>
												<th class="hed" id="ownercol" valign="top">VehType</th>
						
										<th class="hed" id="tripcol" valign="top">Trip Color</th>
						
						<th class="hed" id="desccol" valign="top">Desc</th>
						<th class="hed" id="modcol" valign="top">Model</th>
						<th class="hed" id="typecol" valign="top">Type</th>
						<th class="hed" id="ownercol" valign="top">Owner</th>
						<th class="hed" id="ownercol" valign="top">Group</th>

						<th class="hed" id="updtetmecol" valign="top">Updated Dat-Time</th>
						<th class="hed" id="curposcol" valign="top">Current Position</th>
						<th class="hed" id="drivcol" valign="top">Driver</th>
						<th class="hed" id="stplacecol" valign="top">Start Place</th>
						<th class="hed" id="stdatecol" valign="top">Start Date-Time</th>
						<th class="hed" id="endplacecol" valign="top">End Place</th>
						<th class="hed" id="etacol" valign="top">ETA</th>
						<th class="hed" id="etacol" valign="top">ETA Delay</th>

						<th class="hed" id="FixedTimecol" valign="top">FixedTime</th>
						<th class="hed" id="FixedKmcol" valign="top">FixedKm</th>
						<th class="hed" id="kmsruncol" valign="top">Kms run</th>
						<th class="hed" id="kmstoruncol" valign="top">Kms to run</th>

						<th class="hed" id="vendorcol" valign="top">Customer</th>

						<th class="hed" id="cmtcol" valign="top">Trip Days</th>
						<th class="hed" id="cmtcol" valign="top">Trip Time</th>

						<th class="hed" id="cmtcol" valign="top">Run Hrs</th>
						<th class="hed" id="cmtcol" valign="top">Avg hrs/day</th>
						<th class="hed" id="cmtcol" valign="top">Run Hr Violation</th>
						<th class="hed" id="cmtcol" valign="top">OS</th>
						<th class="hed" id="cmtcol" valign="top">OS(sec)</th>

						<th class="hed" id="cmtcol" valign="top">RA</th>
						<th class="hed" id="cmtcol" valign="top">RD</th>
						<th class="hed" id="cmtcol" valign="top">DV</th>
						<th class="hed" id="cmtcol" valign="top">CD</th>
						<th class="hed" id="cmtcol" valign="top">ND</th>
						<th class="hed" id="cmtcol" valign="top">ND Distance</th>
						<th class="hed" id="cmtcol" valign="top">ND Duration</th>
						<th class="hed" id="cmtcol" valign="top">DC</th>
						<th class="hed" id="cmtcol" valign="top">DC Km</th>

						<th class="hed" id="cmtcol" valign="top">AVG Speed</th>
						<th class="hed" id="cmtcol" valign="top">Stops</th>
						<th class="hed" id="cmtcol" valign="top">Violations</th>
						<th class="hed" id="cmtcol" valign="top">Rating</th>
						<th class="hed" id="cmtcol" valign="top">EntryBy</th>
						<th class="hed" id="cmtcol" valign="top">CloseBy</th>
						<%
							}
					else if(statusname.equalsIgnoreCase("All"))
					{%>
								<th class="hed" id="src1col" valign="top">Sr No</th>
								<th class="hed" id="vehcol" valign="top">Asset ID</th>
								<th align="center" style="display: none">TripID</th>
								<th class="hed" id="tripcol" valign="top">TripID</th>
								<th class="hed" id="desccol" valign="top">Status</th>
								<th class="hed" id="ownercol" valign="top">JStatus</th>
								<th class="hed" id="ownercol" valign="top">VehType</th>		
								<th class="hed" id="tripcol" valign="top">Trip Color</th>		
								<th class="hed" id="desccol" valign="top">Desc</th>
								<th class="hed" id="modcol" valign="top">Model</th>
								<th class="hed" id="typecol" valign="top">Type</th>
								<th class="hed" id="ownercol" valign="top">Owner</th>
								<th class="hed" id="ownercol" valign="top">Group</th>
								<th class="hed" id="updtetmecol" valign="top">Updated Dat-Time</th>
								<th class="hed" id="curposcol" valign="top">Current Position</th>
								<th class="hed" id="curposcol" valign="top" style="display:none">Current Position</th>
								<th class="hed" id="drivcol" valign="top">Driver</th>
								<th class="hed" id="stplacecol" valign="top">Start Place</th>
								<th class="hed" id="stdatecol" valign="top">Start Date-Time</th>
								<th class="hed" id="endplacecol" valign="top">End Place</th>
								<th class="hed" id="enddttime" valign="top">End Date-Time</th>
								<th class="hed" id="etacol" valign="top">ETA</th>
								<th class="hed" id="etacol" valign="top">ETA Delay</th>
								<th class="hed" id="FixedTimecol" valign="top">FixedTime</th>
								<th class="hed" id="FixedKmcol" valign="top">FixedKm</th>
								<th class="hed" id="kmsruncol" valign="top">Kms run</th>
								<th class="hed" id="kmstoruncol" valign="top">Kms to run</th>
								<th class="hed" id="vendorcol" valign="top">Customer</th>
								<th class="hed" id="cmtcol" valign="top">Trip Days</th>
								<th class="hed" id="cmtcol" valign="top">Trip Time</th>
								<th class="hed" id="cmtcol" valign="top">Run Hrs</th>
								<th class="hed" id="cmtcol" valign="top">Avg hrs/day</th>
								<th class="hed" id="cmtcol" valign="top">Run Hr Violation</th>
								<th class="hed" id="cmtcol" valign="top">OS</th>
								<th class="hed" id="cmtcol" valign="top">OS(sec)</th>
								<th class="hed" id="cmtcol" valign="top">RA</th>
								<th class="hed" id="cmtcol" valign="top">RD</th>
								<th class="hed" id="cmtcol" valign="top">DV</th>
								<th class="hed" id="cmtcol" valign="top">CD</th>
								<th class="hed" id="cmtcol" valign="top">ND</th>
								<th class="hed" id="cmtcol" valign="top">ND Distance</th>
								<th class="hed" id="cmtcol" valign="top">ND Duration</th>
								<th class="hed" id="cmtcol" valign="top">DC</th>
								<th class="hed" id="cmtcol" valign="top">DC Km</th>
								<th class="hed" id="cmtcol" valign="top">AVG Speed</th>
								<th class="hed" id="cmtcol" valign="top">Stops</th>
								<th class="hed" id="cmtcol" valign="top">Violations</th>
								<th class="hed" id="cmtcol" valign="top">Rating</th>
								<th class="hed" id="cmtcol" valign="top">EntryBy</th>
								<th class="hed" id="cmtcol" valign="top">CloseBy</th>
				<% 	}
					else {
						%>
						<th class="hed" id="src1col" valign="top">Sr No</th>
						<th class="hed" id="vehcol" valign="top">Asset ID</th>
				        <th align="center" style="display: none">TripID</th>
						<th class="hed" id="desccol" valign="top">TripID</th>
						<th class="hed" id="desccol" valign="top">Status</th>
						<th class="hed" id="ownercol" valign="top">JStatus</th>
						<th class="hed" id="ownercol" valign="top">VehType</th>
						<th class="hed" id="tripcol" valign="top">Trip Color</th>
						<th class="hed" id="modcol" valign="top">Owner</th>


						<th class="hed" id="typecol" valign="top">StartPlace</th>
						<th class="hed" id="ownercol" valign="top">StartDate-Time</th>

						<th class="hed" id="updtetmecol" valign="top">EndPlace</th>
						<th class="hed" id="curposcol" valign="top">EndDate-Time</th>
						<th class="hed" id="etadelayclosed" valign="top">ETA</th>
						<th class="hed" id="etadelayclosed" valign="top">ETA Delay</th>
						<th class="hed" id="stplacecol" valign="top">StartKm</th>
						<th class="hed" id="stdatecol" valign="top">EndKm</th>
						<th class="hed" id="endplacecol" valign="top">KmTravelled</th>
						<th class="hed" id="etacol" valign="top">UnloadDateTime</th>
						<th class="hed" id="etacol" valign="top">DriverName</th>

						<th class="hed" id="FixedTimecol" valign="top">Vendor</th>
						<th class="hed" id="FixedKmcol" valign="top">OSCount</th>
						<th class="hed" id="kmsruncol" valign="top">RACount</th>
						<th class="hed" id="kmstoruncol" valign="top">RDCount</th>


						<th class="hed" id="cmtcol" valign="top">OSDuration</th>
						<th class="hed" id="cmtcol" valign="top">NDCount</th>

						<th class="hed" id="cmtcol" valign="top">DisconnectionCount</th>
						<th class="hed" id="cmtcol" valign="top">EntryBy</th>
						<th class="hed" id="cmtcol" valign="top">CloseBy</th>



						<%
			}
				%>
			</tr>
		</thead>
		
		<tbody>
			<%
				int racount = 0, rdcount = 0, cdcount = 0, ndcount = 0, stopcount = 0, Runhrcount = 0, Diccount = 0,
								oscount = 0, osdur = 0, violationcount = 0, datadayscount = 0, datadaystotal = 0;
						double osavg = 0.00;
						int osduration = 0;
						int osduration1 = 0, cntosdur = 0;
						double rating = 0.0, cntrating = 0.0;
						double RD = 0;
						double RA = 0;
						double OS = 0;
						double dt = 0.0, dt122 = 0.0, runhrs = 0.0, avgrunhrs = 0.0;
						int dt11 = 0, cntdt = 0, dv = 0, cntnd12 = 0, cntnd122 = 0;

						int cntdisconn = 0, cntdisconn1 = 0;
						double cntrda = 0;
						int cntst = 0;
						double cntrh = 0.0;
						double cntcd = 0;
						double cntdv = 0;
						double cntnd = 0;
						double cntndk = 0;
						double disk = 0;
						double cntfc = 0;
						double stopdur = 0.0;
						double totstopdur = 0.00;
						double cntavgos = 0.0;
						double cntavgra = 0.0;
						double cntavgrd = 0.0; //code to get system date as data2 and yesterdays date as a data1.
						double cntft = 0;
						double cntfa = 0;
						double cntavg = 0.0;
						double tot_dur = 0.0;
						float daysBetween = 0;
						float daysBetween1 = 0;
						float FinalETADelayDays = 0;
						int nddist = 0;
						String ndduration = "00:00:00", avggspeed = "", todatetime = "";
						String tbname = "t_vehall_ds";
						java.util.Date enddte1, strdte1;
						long millisecdiff = 0, miliseconds1 = 0, miliseconds2 = 0, secdiff = 0, mindiff = 0, hrdiff = 0,
								etime;
						String Time = "00:00:00";
						String Time1 = "00:00:00";
String bgcol="Gray";
						//String trip="";
						String trip1 = "";
						String stst = "";

						if (statusname.equalsIgnoreCase("Open")) {
							stst = "Running";
							//	sql="select * from db_gps.t_startedjourney where Jstatus in('Running','tobeclosed') and (OwnerName = '"+session.getAttribute("usertypevalue").toString()+"' or GPName = '"+session.getAttribute("usertypevalue").toString()+"' OR Vendor='"+session.getAttribute("usertypevalue").toString()+"') and Vehid in"+session.getAttribute("VehList").toString()+"AND  StartDate BETWEEN '"+dtt+" 00:00:00' AND '"+dtt1+" 23:59:59' order by concat(StartDate,' ',StartTime) desc";

						} else if (statusname.equalsIgnoreCase("Cancelled")) {
							stst = "Cancelled";
							//	sql="select * from db_gps.t_startedjourney where Jstatus='Cancelled' and (OwnerName = '"+session.getAttribute("usertypevalue").toString()+"' or GPName = '"+session.getAttribute("usertypevalue").toString()+"' OR Vendor='"+session.getAttribute("usertypevalue").toString()+"') AND Vehid in"+session.getAttribute("VehList").toString()+"AND  StartDate BETWEEN '"+dtt+" 00:00:00' AND '"+dtt1+" 23:59:59' order by StartDate desc";

						}

						int i = 0;
						int j = 1, k = 0;
						
						String vehtype ="";
							
						
						
						
						
						if(tripp == null || tripp.equals("null") || tripp.equals(""))
						{
						if (statusname.equalsIgnoreCase("Open") || statusname.equalsIgnoreCase("Cancelled")) {
							//stst="Running";
							sql = "select * from db_gps.t_startedjourney where Jstatus in('" + stst+ "','tobeclosed') and  Vehid in "+ session.getAttribute("VehList").toString() + " AND  concat(StartDate,' ',StartTime)>= '" + dtt+"'  order by concat(StartDate,' ',StartTime) desc";
									
									
							System.out.println("\n\n started journey query-->>" + sql);
							ResultSet rsttrips = st.executeQuery(sql);

							while (rsttrips.next()) {
								k++;
								i++;
								
								String sqql = "select vehtype from db_gps.t_vehicledetails where VehicleRegNumber='"+rsttrips.getString("VehRegNo")+"' and status='-' ";
								System.out.println(">>>>>>>sqql>>>>>>>>n " + sqql);

								ResultSet rstttrips = stt.executeQuery(sqql);

								if (rstttrips.next()) {
									 vehtype = rstttrips.getString("vehtype");

								}
								
								String trip = rsttrips.getString("Tripid");

								String JStatus = rsttrips.getString("JStatus");
								
								bgcol=rsttrips.getString("tripcolor");
								DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

								Calendar now123 = Calendar.getInstance();
								String sysdate22 = "";
								String sysdate221 = dateFormat.format(now123.getTime());
								System.out.println(">>>>>>>>>>>>>>>n " + sysdate22);
								String tripstartdate = "";

								String sysdate = "";
								String systime = "";
								String sysdate2233 = new SimpleDateFormat("yyyy-MM-dd")
										.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sysdate221));
								System.out.println(">>>>>>>>>>>>>>>nsysdate2233 " + sysdate2233);

								/* String sql211="select Vehid,TripID,StartDate,StartTime from db_gps.t_startedjourney where Vehid='"+rsttrips.getString("VehId")+"'"; 
								ResultSet rs211=st23.executeQuery(sql211);
								//System.out.println(">>>>>>>rrrrrrrrr1" +sql2);
								if(rs211.next())
								{
									//racount=rs211.getInt("racount");
								}
								*/

								String sql222 = "select StartDate,StartTime,TripID,JStatus from db_gps.t_startedjourney where Vehid='"
										+ rsttrips.getString("VehId")
										+ "' and  (JStatus='Running' OR JStatus='tobeclosed' OR JStatus='completed') and concat(startdate,' ',starttime) > '"
										+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
										+ "' order by StartDate,StartTime  limit 1";

								// String sql222="select StartDate,StartTime,TripID from db_gps.t_startedjourney where Vehid='"+rsttrips.getString("VehId")+"' and  JStatus='Running' OR JStatus='tobeclosed' OR JStatus='completed' and   concat(startdate,' ',starttime)<='"+rsttrips.getDate("StartDate")+" "+rsttrips.getTime("StartTime")+"' order by rid desc limit 1"; 
								ResultSet rs222 = st57.executeQuery(sql222);
								System.out.println(">>>>>>>rrrrrrrrr222" + sql222);
								if (rs222.next()) {
									trip1 = rs222.getString("TripId");
									sysdate = rs222.getString("StartDate");
									systime = rs222.getString("StartTime");

									System.out.println("Trip---" + trip + " Trip1" + trip1);

									if (trip.equalsIgnoreCase(trip1)) {
										trip = rsttrips.getString("Tripid");
										sysdate22 = dateFormat.format(now123.getTime());

										System.out.println("In If Loop>>>trip" + trip + "sysdate22" + sysdate22);
										//sysdate223=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sysdate22));

									} else {
										trip = trip1;
										sysdate22 = sysdate + " " + systime;
										//System.out.println("In Else>>>trip"+sysdate+" "+systime);
										System.out.println("In Else>>>trip" + trip + "sysdate22" + sysdate22);

									}
									//racount=rs222.getInt("racount");
								}

								sysdate22 = dateFormat.format(now123.getTime());

								try {
									String sql22 = "select count( * ) as racount from db_gpsExceptions.t_vehall_ra where VehCode ='"
											+ rsttrips.getString("VehId") + "'  AND TheDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND TheDatetime <= '" + sysdate22 + "'";
									ResultSet rs22 = st25.executeQuery(sql22);
									System.out.println(">>>>>>>rrrrrrrrr1" + sql22);
									if (rs22.next()) {
										racount = rs22.getInt("racount");
									}

									String sql33 = "select count( * ) as rdcount from db_gpsExceptions.t_vehall_rd where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND TheDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND TheDatetime <= '" + sysdate22 + "'";
									ResultSet rs33 = st26.executeQuery(sql33);
									System.out.println(">>>>>>>rrrrrrrr2" + sql33);
									if (rs33.next()) {
										rdcount = rs33.getInt("rdcount");
									}

									String sql55 = "select count( * ) as cdcount from db_gpsExceptions.t_vehall_crcopy where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND FromDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND FromDatetime <= '" + sysdate22 + "'";
									ResultSet rs55 = st27.executeQuery(sql55);
									System.out.println(">>>>>>>rrrrrrr3" + sql55);
									if (rs55.next()) {
										cdcount = rs55.getInt("cdcount");
									}

									String sql66 = "select count( * ) as ndcount from db_gpsExceptions.t_vehall_nd where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND FromDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND FromDatetime <= '" + sysdate22 + "'";
									ResultSet rs66 = st28.executeQuery(sql66);
									System.out.println(">>>>>>>rrrrrrrrr4" + sql66);
									if (rs66.next()) {
										ndcount = rs66.getInt("ndcount");
									}

									String sql77 = "select count( * ) as oscount from db_gpsExceptions.t_vehall_overspeed where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND FromDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND FromDatetime <= '" + sysdate22 + "'";
									ResultSet rs77 = st29.executeQuery(sql77);
									System.out.println(">>>>>>>rrrrrrrrr5" + sql77);
									if (rs77.next()) {
										oscount = rs77.getInt("oscount");
									}

									String sqlDic = "select count( * ) as Diccount from db_gps.t_disconnectionData where vehicleCode='"
											+ rsttrips.getString("VehId")
											+ "' AND Duration>='0:30' and Reason ='Disconnection' and ignoredstamp='no'  and ((OffTimeFrom >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "'  and OffTimeFrom<='" + sysdate22 + "') or (OffTimeTo >='"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "'  and OffTimeTo<='" + sysdate22 + "') or (OffTimeFrom <='"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' and OffTimeTo >='" + sysdate22 + "')) ";
									ResultSet rsdic = st30.executeQuery(sqlDic);
									System.out.println(">>>>>>>rrrrrrrrr7" + sqlDic);
									if (rsdic.next()) {
										Diccount = rsdic.getInt("Diccount");
									}

									String sqlRunhr = "select count( * ) as Runhrcount from db_gpsExceptions.t_vehall_ds where vehcode ='"
											+ rsttrips.getString("VehId") + "' and RDuration > '10:00:00'  AND thedate >= '"
											+ rsttrips.getDate("StartDate") + "' AND thedate <= '" + sysdate22 + "'";
									ResultSet rsRun = st31.executeQuery(sqlRunhr);
									System.out.println(">>>>>>>rrrrrrrrr8" + sqlRunhr);
									if (rsRun.next()) {
										Runhrcount = rsRun.getInt("Runhrcount");
									}
									String sql11 = "select Tripid from db_gps.t_startedjourney where  Tripid = '" + trip+ "'  ";
											
									ResultSet rs17 = st32.executeQuery(sql11);
									if (rs17.next()) {
										violationcount = racount + rdcount + cdcount + ndcount + oscount + Diccount
												+ Runhrcount;
										System.out.println(">>>>>>>sum++------------" + violationcount);
									} else {
										violationcount = 0;

									}

								} catch (Exception e) {
									violationcount = 0;
								}

								//sum=oscount+racount+rdcount+ndcount+Diccount;

								System.out.println(">>>>>>>sum------------" + violationcount);

								comments = rsttrips.getString("Loadcomments");
								totKm = rsttrips.getDouble("FIxedKM");
								tTime = rsttrips.getLong("FIxedTime");
								gpname1 = rsttrips.getString("GPName");
								ETA1 = rsttrips.getString("ETA");
								ETADate = ETA1;
								if (!(null == ETA1)) {
									ETA1 = new SimpleDateFormat("dd-MMM-yyyy HH:MM:SS")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETA1));
								}
								String curpos = "", lat = "", lon = "";
								kmrundist = 0;
								kmrun1 = 0;
								kmrun2 = 0;
								String vehno = rsttrips.getString("VehRegNo");
								sql = "select * from t_onlinedata where VehicleCode='" + rsttrips.getString("VehId") + "'";
								ResultSet rs1 = st1.executeQuery(sql);
								try {
									if (rs1.next()) {
										curpos = rs1.getString("Location");
										temptime = rs1.getString("TheTime");
										updtetime = new SimpleDateFormat(dateformat)
												.format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("TheDate")))
												+ " " + rs1.getString("TheTime");
										lat = rs1.getString("LatitudePosition");
										lon = rs1.getString("LongitudePosition");
									}
								} catch (Exception exc) {
									exc.printStackTrace();
								}

								
								try {
									sql = "select Distance from t_veh" + rsttrips.getString("VehId")
											+ " where TheFieldDataDateTime between '" + rsttrips.getString("StartDate")
											+ " " + rsttrips.getString("StartTime") + "' AND '" + today + " " + currenttime
											+ "' and TheFiledTextFileName='SI' order by TheFieldDataDateTime asc limit 1";
									ResultSet rstkmrun1 = st1.executeQuery(sql);
									if (rstkmrun1.next()) {
										kmrun1 = rstkmrun1.getInt("Distance");
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
								try {
									
									
									sql = "select Distance from t_veh" + rsttrips.getString("VehId")
											+ " where TheFieldDataDateTime between '" + rsttrips.getString("StartDate")
											+ " " + rsttrips.getString("StartTime") + "' AND '" + today + " " + currenttime
											+ "' and TheFiledTextFileName='SI' order by TheFieldDataDateTime desc limit 1";
									ResultSet rstkmrun2 = st1.executeQuery(sql);
									if (rstkmrun2.next()) {
										kmrun2 = rstkmrun2.getInt("Distance");
									}
								} catch (Exception e1) {
									e1.printStackTrace();
								}
								try {
									long myMilisec;
									sql = "select * from db_gps.t_startedjourney where StartDate='"
											+ rsttrips.getDate("StartDate") + "'and StartTime='"
											+ rsttrips.getTime("StartTime") + "' and StartCode='"
											+ rsttrips.getString("StartCode") + "' and EndCode='"
											+ rsttrips.getString("EndCode") + "' and Vehid=" + rsttrips.getString("VehId")
											+ "";
									ResultSet rstTotKm = st3.executeQuery(sql);
									if (rstTotKm.next()) {
										sql3 = "select * from db_gps.t_castrolroutes where StartPlace = '"
												+ rsttrips.getString("StartPlace") + "' and EndPlace = '"
												+ rsttrips.getString("EndPlace") + "' || EndPlace = '"
												+ rsttrips.getString("StartPlace") + "' and StartPlace = '"
												+ rsttrips.getString("EndPlace") + "' limit 1 ";
										ResultSet rst123 = st4.executeQuery(sql3);
										if (totKm == 0 && tTime == 0)
											if (rst123.next()) {
												totKm = rst123.getDouble("Km");
												tTime = rst123.getLong("TTime");
											}
									}
									
									System.out.println("KM Run 1 "+kmrun2);
									
									System.out.println("KM Run 2 "+kmrun1);
									
									kmrundist = kmrun2 - kmrun1; //Finding tot run km by vehicle after trip started.

									remKm = totKm - kmrundist;
									// Adding todays km also
									if (kmrundist >= 0) {
										kmrundist = kmrundist;
									} else {
										kmrundist = 0;
									}
									myMilisec = (tTime * 60 * 60 * 1000);
									if (!(null == ETADate)) {
										ETADate = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
												.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETADate));
										DisDate = ETADate;
									} else {
										if (myMilisec != 0) {
											java.util.Date resultdate = new java.util.Date();
											SimpleDateFormat sdftimemilli = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
											Date startDtTm = sdftimemilli.parse(rsttrips.getString("StartDate") + " "
													+ rsttrips.getString("StartTime"));
											long start = startDtTm.getTime();
											long totdate = start + myMilisec;
											resultdate.setTime(totdate);
											DisDate = new SimpleDateFormat(dateformat + " HH:mm:ss").format(resultdate);
										} else {
											DisDate = "NA";
										}
									}
								} catch (Exception e11) {
									System.out.println("---I am in exception--kmrundist-");
									e11.printStackTrace();
								}

								sdate = rsttrips.getString("Startdate");

								String STime = rsttrips.getString("StartTime");
								try {
									fromdate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdate));
									fromdate = fromdate + " " + STime;
									fromdatetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdate)) + " " + STime;
								} catch (Exception e) {
									fromdate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd").parse(sdate));
									fromdate = fromdate + " " + STime;
								}

								try {

									java.util.Date sdt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(fromdate);
									ftime1 = "" + sdt.getHours();
									ftime2 = "" + sdt.getMinutes();
									ftime3 = "" + sdt.getSeconds();
									;
								}

								catch (Exception e) {
									ftime1 = "00";
									ftime2 = "00";
									ftime3 = "00";
								}
								edate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
								try {
									todate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(edate));
								} catch (Exception e) {
									todate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd").parse(edate));
								}
								
								if (updtetime.equalsIgnoreCase("NA") || DisDate.equalsIgnoreCase("NA")) {
									//System.out.println("\n\n in NA");
									bgcolor1 = "";
									bgcolor2 = "";
								} else {
									try {
										sttdate = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
												.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
														.parse(rsttrips.getString("StartDate")));
									} catch (Exception ee) {
										sttdate = new SimpleDateFormat("dd-MMM-yyyy").format(
												new SimpleDateFormat("yyyy-MM-dd").parse(rsttrips.getString("StartDate")))
												+ " " + rsttrips.getString("StartTime");
									}
									SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
									Date date1 = sdf1.parse(updtetime);
									Date date2 = sdf1.parse(sttdate);
									Date date3 = sdf1.parse(DisDate);
									float timdiff = 0, avg;
									long msec = date1.getTime() - date2.getTime();
									timdiff = (float) (msec / 1000 / 60 / 60);
									avg = (kmrundist / timdiff);
									if (date1.compareTo(date3) > 0) {
									} else {
									}
								}
			%>
			<%
				//System.out.println("\n\n color value-->>" + request.getParameter("colorvalue"));
								//System.out.println("\n\n bgcolor value-->>" + bgcolor2);
			%>
			<tr>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="src1col<%=k%>"><%=i%></td>
				<td WIDTH="6%" id="vehcol<%=k%>"
					style="background-color:<%=bgcolor1%>"><div align="right">
					
					
					
 <%=rsttrips.getString("VehRegNo")%></td>
 
 
 
 <td style="text-align: left; display: none"><%=rsttrips.getString("TripId")%></td>
 
 
 <td>
 
<div align="right"  >
<font size="10">
<a href="javascript:toggleDetails(<%=i%>,true);" title="Click To See the Reports"><font size="2"><%=rsttrips.getString("TripId")%></font></a> </font><br />
<div class="popup" id="popup<%=i%>">
<table border="1" bgcolor="white">

<tr>
									<td>
										<%
											String briefid = "", rid = "", plannedstatus = "No"; 
															boolean flag = false;
															sql1 = "select * from db_gps.t_briefing where tripid = '" + rsttrips.getString("TripId")
																	+ "'";
															rs1 = st1.executeQuery(sql1);
															if (rs1.next()) {
																briefid = rs1.getString("Briefid");
															}
															sql1 = "select * from db_gps.t_intermediatejrmroute where  Tripid = '"
																	+ rsttrips.getString("TripId") + "' and briefid = '" + briefid
																	+ "' and driverid = '" + rsttrips.getString("DriverCode")
																	+ "'  order by advancedtrackid asc ,row asc limit 1 ";
															rs1 = st1.executeQuery(sql1);
															//System.out.println("\n\n in t_intermediatejrmroute" + sql1);
															if (rs1.next()) {
																rid = rs1.getString("advancedrouteid");
																plannedstatus = "Yes";
																flag = true;
															}
															
															//dtt=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrips.getString("StartDate")));;
															//dtt1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(updtetime));
																	// .format(new SimpleDateFormat("dd-MMM-yyyy").
										%>
										 
										 

<%
									if (gpname1.equalsIgnoreCase("Castrol")) {
													} else {
														String tripflag = "true";
													//	System.out.println("\n\n in castrol");
														String strdate12 = rsttrips.getString("StartTime");
													//	System.out.println("\n\n in NA 1");

														if (strdate12 == null) {

														} else {

															strdate12 = new SimpleDateFormat("HH:mm:ss")
																	.format(new SimpleDateFormat("HH:MM:SS").parse(strdate12));
														}
														//System.out.println("\n\n in NA 2");
														String ETA = "";
														String NA = "NA";
														ETA = DisDate;
														//System.out.println("\n\nETA " + ETA);

														//System.out.println("\nNA " + NA);
														if (ETA.equalsIgnoreCase(NA)) {
															//System.out.println("\n\n in NA 3");
															ETA = null;
														} else {
															//System.out.println("\n\n in NA 4");
															ETA = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
																	.format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(DisDate));
															//System.out.println("\n\n in ETA" + ETA);

														}
														
														try {
															java.util.Date edt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETA);
															ttime1 = "" + edt.getHours();
															ttime2 = "" + edt.getMinutes();
															ttime3 = "" + edt.getSeconds();
														} catch (Exception e) {
															ttime1 = "23";
															ttime2 = "59";
															ttime3 = "59";
														}
														
														
								%>
								<a href="ActAndPlanJrnyCompOnMap.jsp?tripid=<%=rsttrips.getString("TripId")%>&vehcode=<%=rsttrips.getString("VehId")%>&data=<%=rsttrips.getString("StartDate")+" "+rsttrips.getString("StartTime")%>&data1=<%=ETA%>&ftime1=<%=ftime1%>&ftime2=<%=ftime2%>&ftime3=<%=ftime3%>&ttime1=<%=ttime1%>&ttime2=<%=ttime2%>&ttime3=<%=ttime3%>&pg=cm&pstatus=<%=plannedstatus%>&brifid=<%=briefid%>&rid=<%=rid%>&driverid=<%=rsttrips.getString("DriverCode")%>"
										onclick="javascript:toggleDetails(<%=j%>,false);">Show
											Trip On Map</a> 
									</td>
								</tr>
								<tr>
									<td>
									 <a href="edittrip.jsp?vehno=<%=rsttrips.getString("VehRegNo")%>&ReportDateTime=<%=rsttrips.getString("ReportDateTime")%>&strloc=<%=rsttrips.getString("StartPlace")%>&StartTime=<%=rsttrips.getString("StartTime")%>&ETA=<%=ETA%>&endp=<%=rsttrips.getString("EndPlace")%>&driverid=<%=rsttrips.getString("DriverCode")%>&drivern=<%=rsttrips.getString("DriverName")%>&tripid=<%=rsttrips.getString("Tripid")%>&tripflag=<%=tripflag%>">Edit Trip </a>
									
									<%-- <a href="edittrip.jsp?vehno=<%=rsttrips.getString("VehRegNo")%>&ReportDateTime=<%=rsttrips.getString("StartDate")%>&strloc=<%=rsttrips.getString("StartPlace")%>&StartTime=<%=strdate12%>&ETA=<%=ETA%>&endp=<%=rsttrips.getString("EndPlace")%>&driverid=<%=rsttrips.getString("DriverCode")%>&drivern=<%=rsttrips.getString("DriverName")%>&tripid=<%=rsttrips.getString("Tripid")%>&tripflag=<%=tripflag%>">Edit Trip </a> --%> 
									</td>
								</tr>
								
								
								<%} %>
								
								<tr><td>
								 <a href="via_point_report.jsp?vehcode=<%=rsttrips.getString("VehId")%>&fromdata=<%=rsttrips.getString("StartDate")%> <%=rsttrips.getString("StartTime") %>&tripid=<%=rsttrips.getString("Tripid")%>&todata=<%=dtt1%>&status=Open">Via Point Report</a></td>
								
								</tr>
								<tr>
								
								<tr><td>
								 <a href="detailed_report1.jsp?vehcode=<%=rsttrips.getString("VehId")%>&fromdata=<%=rsttrips.getString("StartDate")%> <%=rsttrips.getString("StartTime") %>&tripid=<%=rsttrips.getString("Tripid")%>&todata=<%=dtt1%>&status=Open">Detail Report</a></td>
								
								</tr>
								<tr>
									<td><a href="javascript:toggleDetails(<%=j%>,true);"
										onclick="javascript:window.open ('CancelTrip.jsp?vehno=<%=rsttrips.getString("VehRegNo")%>&tripid=<%=rsttrips.getString("Tripid")%>','win3','scrollbars=1,resizeable=0,width=300,height=300');";>Cancel
											Trip</a></td>
								</tr>
								<tr>
									<td><a href="javascript: false"
										onclick="javascript:window.open('endtrip.jsp?tripid=<%=rsttrips.getString("Tripid")%>&vehcode=<%=rsttrips.getString("VehId")%>&vehno=<%=rsttrips.getString("VehRegNo")%>&pageflag=<%=pageflag%>','','menubar=1,resizable=2,width=900,height=700,location=no');">End
											Trip</a></td>
								</tr>

<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
</table>
</div> </div></td>
<td id="ownercol<%=k%>"><%=rsttrips.getString("loadstatus")%></td>
<td id="ownercol<%=k%>"><%=rsttrips.getString("JStatus")%></td>

<td id="ownercol<%=k%>"><%=vehtype%></td>




				<%
				String tripcol=rsttrips.getString("tripcolor");
				if(bgcol=="Amber" || bgcol.equalsIgnoreCase("Amber"))
				{
					//System.out.println("bgcol::"+bgcol);

					bgcol="orange";
				}
				else if(bgcol=="" || bgcol.equalsIgnoreCase("-"))
				{
					bgcol="Gray";
					tripcol="No Data";
				}
				else
				{
					bgcol=bgcol;

				}
				%>
				<td style="color:<%=bgcol%>"
					id="ownercol<%=k%>"><%=tripcol%></td>
				<%
					try {
										sqlveh = "Select VehDesc,VehModel,VehType1 from t_vehicledetails where VehicleRegNumber='"
												+ rsttrips.getString("VehRegNo") + "' and status='-' order by VehicleRegNumber";
										ResultSet rstveh = stveh.executeQuery(sqlveh);
										//System.out.println("veh desc open" + sqlveh);
										if (rstveh.next()) {
											vehdesc1 = rstveh.getString("VehDesc");
											if (vehdesc1 == null || vehdesc1.equalsIgnoreCase("null")) {
												vehdesc1 = "-";
											}
											vehmodel1 = rstveh.getString("VehModel");
											if (vehmodel1 == null || vehmodel1.equalsIgnoreCase("null")) {
												vehmodel1 = "-";
											}
											vehtype1 = rstveh.getString("VehType1");
											if (vehtype1 == null || vehtype1.equalsIgnoreCase("null")) {
												vehtype1 = "-";
											}
										} else {
											vehdesc1 = "-";
											vehmodel1 = "-";
											vehtype1 = "-";
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
				%>
				<td style="background-color:<%=bgcolor1%>" id="desccol<%=k%>"><%=vehdesc1%></td>
				<td style="background-color:<%=bgcolor1%>" id="modcol<%=k%>"><%=vehmodel1%></td>
				<td style="background-color:<%=bgcolor1%>" id="typecol<%=k%>"><%=vehtype1%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="ownercol<%=k%>"><%=rsttrips.getString("OwnerName")%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="ownercol<%=k%>"><%=rsttrips.getString("GPName")%></td>

					


				<td style="background-color:<%=bgcolor1%>"
					id="updtetmecol<%=j%><%=k%>"><div align="right"><%=updtetime%>
					</div></td>
				<td WIDTH="8%" style="background-color:<%=bgcolor1%>"
					id="curposcol<%=j%><%=k%>"><div align="left">
						<a
							href="shownewmap.jsp?lat=<%=lat%>&long=<%=lon%>&discription=<%="<b>" + vehno + "</b><br>"%><%=curpos%>"
							onclick="popWin = open('shownewmap.jsp?lat=<%=lat%>&long=<%=lon%>&discription=<%="<b>" + vehno + "</b><br>"%><%=curpos%>','myWin','width=500,height=500');popWin.focus();return false">
							<%=curpos%>
						</a>
					</div></td>
				<td style="background-color:<%=bgcolor1%>" id="drivcol<%=j%><%=k%>"><div
						align="left"><%=rsttrips.getString("DriverName") + "(" + rsttrips.getString("DriverCode") + ")"%></div></td>
				<td style="background-color:<%=bgcolor1%>"
					id="stplacecol<%=j%><%=k%>"><div align="left"><%=rsttrips.getString("StartPlace")%></div></td>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="stdatecol<%=j%><%=k%>">
					<%
						try {
											out.print(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
													.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
															.parse(rsttrips.getString("StartDate"))));
										} catch (Exception ee) {
											out.print(new SimpleDateFormat("dd-MMM-yyyy").format(
													new SimpleDateFormat("yyyy-MM-dd").parse(rsttrips.getString("StartDate")))
													+ "<br>" + rsttrips.getString("StartTime"));
										}

										//ETA Delay

										String FinalStart = "", FinalEnd = "";
										try {
											FinalStart = rsttrips.getString("StartDate") + " " + "00:00:00";

										} catch (Exception ee) {
											// FinalStart=rsttrips.getString("StartDate")+" "+STime;
										}

										try {
											FinalEnd = rsttrips.getString("ETA");
										} catch (Exception ee) {
											// FinalEnd=rsttrips.getString("EndDate")+" "+ETime;

										}

										//System.out.println("FinalStart: " + FinalStart);
										//System.out.println("FinalEnd: " + FinalEnd);

										String ETA123 = "", FinalStart123 = "";

										if (FinalStart == null) {
											FinalStart123 = "-";
										} else {

											FinalStart123 = new SimpleDateFormat("dd MM yyyy")
													.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(FinalStart));

										}

										if (FinalEnd == null) {
											ETA123 = "-";
										}

										else {
											ETA123 = new SimpleDateFormat("dd MM yyyy")
													.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(FinalEnd));

										}
										//System.out.println("FinalStart123: " + FinalStart123);

										SimpleDateFormat myFormat = new SimpleDateFormat("dd MM yyyy");
										String dateBeforeString = FinalStart123;
										String dateAfterString = ETA123;

										try {
											Date dateBefore = myFormat.parse(dateBeforeString);
											Date dateAfter = myFormat.parse(dateAfterString);
											long difference = dateAfter.getTime() - dateBefore.getTime();
											daysBetween = (difference / (1000 * 60 * 60 * 24));
											/* You can also convert the milliseconds to days using this method
											 * float daysBetween = 
											 *         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
											 */
											//System.out.println("Number of Days ETA ETA date Days: " + daysBetween);
										} catch (Exception e) {
											e.printStackTrace();
										}

										
										String Curdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());

										String ETAsysdate123="";
										
										if(JStatus.equals("Running"))
										{
										 ETAsysdate123 = new SimpleDateFormat("dd MM yyyy")
												.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Curdate));
										}else if(JStatus.equals("Cancelled")){
											ETAsysdate123=new SimpleDateFormat("dd MM yyyy")
													.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsttrips.getString("StartDate")));	
										}
										

										try {
											Date dateBefore1 = myFormat.parse(FinalStart123);
											Date dateAfter1 = myFormat.parse(ETAsysdate123);
											long difference1 = dateAfter1.getTime() - dateBefore1.getTime();
											daysBetween1 = (difference1 / (1000 * 60 * 60 * 24));
											/* You can also convert the milliseconds to days using this method
											 * float daysBetween = 
											 *         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
											 */
										//	System.out.println("Number of Days ETA With Current Days: " + daysBetween1);
										} catch (Exception e) {
											e.printStackTrace();
										}

										FinalETADelayDays = daysBetween1 - daysBetween;
										//System.out.println("FinalETADelayDays--------------------------: " + FinalETADelayDays);

										if (FinalETADelayDays > 0.0) {
											FinalETADelayDays = FinalETADelayDays;
										} else {
											FinalETADelayDays = 0;

										}

										int finaletadelay = Math.round(FinalETADelayDays); // 3
					%>
				</td>
				<td style="background-color:<%=bgcolor1%>"
					id="endplacecol<%=j%><%=k%>"><div align="left"><%=rsttrips.getString("EndPlace")%></div></td>
				<td style="background-color:<%=bgcolor1%>" id="etacol<%=j%><%=k%>"><div
						align="right"><%=DisDate%>
					</div></td>
				<td style="background-color:<%=bgcolor1%>" id="etacol<%=j%><%=k%>"><div
						align="right"><%=finaletadelay%></div></td>

				<%
					if (tTime == 0 && totKm == 0) {
				%>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="FixedTimecol<%=k%>"><br>NA</td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="FixedKmcol<%=k%>"><br>NA</td>
				<%
					} else {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="FixedTimecol<%=k%>"><br> <%=tTime%></td>
				<%
					System.out.println("FixedTIme----->" + tTime);
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="FixedKmcol<%=k%>"><br> <%=twoDForm1.format(totKm)%></td>
				<%
					System.out.println("FixedKm----->" + totKm);
				%>
				<%
					}
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmsruncol<%=k%>"><%=kmrundist%></td>
				<%
					if (tTime == 0 && totKm == 0) {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmstoruncol<%=k%>"><div align="left">NA</div></td>
				<%
					} else {
										if (remKm >= 0) {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmstoruncol<%=k%>"><%=twoDForm1.format(remKm)%></td>
				<%
					} else {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmstoruncol<%=k%>">0</td>

				<%
					}
									}
				%>
				<%
					sqlopen = "Select EntryBy,EndedBy,Weight,Vendor,ReportDateTime,Frieght,Advance,TripCategory from db_gps.t_startedjourney where tripid='"
											+ rsttrips.getString("Tripid") + "'";
									ResultSet rssopen = stopen.executeQuery(sqlopen);
									if (rssopen.next()) {
										enteredBy = rssopen.getString("EntryBy");
										endedby1 = rssopen.getString("EndedBy");
										weight1 = rssopen.getString("Weight");
										if (weight1 == null || weight1.equalsIgnoreCase("null")) {
											weight1 = "-";
										}
										vendor11 = rssopen.getString("Vendor");

										if (vendor11.equalsIgnoreCase("select") || vendor11 == null
												|| vendor11.equalsIgnoreCase("null")) {
											vendor11 = "-";
										}
										tripcat1 = rssopen.getString("TripCategory");
										if (tripcat1.equalsIgnoreCase("select") || tripcat1 == null
												|| tripcat1.equalsIgnoreCase("null")) {
											tripcat1 = "-";
										}
										freight1 = rssopen.getString("Frieght");
										if (freight1 == null || freight1.equalsIgnoreCase("null")) {
											freight1 = "-";
										}
										adv1 = rssopen.getString("Advance");
										if (adv1 == null || adv1.equalsIgnoreCase("null")) {
											adv1 = "-";
										}
									} else {
										endedby1 = "-";
										weight1 = "-";
										vendor11 = "-";
										tripcat1 = "-";
										freight1 = "-";
										adv1 = "-";

									} //out.println("Mila");
								//	System.out.println(											"Sum Violations----------------------------------------- " + violationcount);
									//New Paramater Addeed For Posco
									try {
										todatetime = sysdate22;
										fromdatetime = rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime");
									} catch (Exception e) {
										todatetime = sysdate22;
										fromdatetime = rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime");

									}

									String sqlND = "select SUM(Distance) as distance,Sum(Time_to_Sec(Duration)) as duration from db_gpsExceptions.t_veh"
											+ rsttrips.getString("VehId") + "_nd where concat(FromDate,' ',FromTime) >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' and concat(FromDate,' ',FromTime)<='" + sysdate22 + "'";
									//System.out.println(k + "ND Distance>>>>>>  ++++++++   " + sqlND);

									ResultSet rsND = st38.executeQuery(sqlND);
									//System.out.println(k + "ND Distance>>>>>> -------    " + sqlND);

									if (rsND.next()) {
										nddist = rsND.getInt("distance");
										ndduration = rsND.getString("duration");
										//System.out.println(nddist + "ND Distance Raw ND Duration>>>>>>     " + ndduration);

										if (ndduration == null || ndduration.equalsIgnoreCase("null")) {
											//System.out.println("ND Distance>>>>>>     " + ndduration);

											ndduration = "00:00";

										} else {
											String rundur = "";
											int min = 0, hrs = 0, min1 = 0;

											min1 = rsND.getInt("duration") / 60;
											hrs = min1 / 60;
											min = min1 % 60;
											int sec = rsND.getInt("duration");
											Date d = new Date(sec * 1000L);
											SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss"); // HH for 0-23
											df.setTimeZone(TimeZone.getTimeZone("GMT"));
											String time = df.format(d);

											if (hrs > 9) {
												rundur = rundur + hrs;
											} else {
												rundur = "0" + hrs;
											}

											if (min > 9) {
												rundur = rundur + ":" + min;
											} else {
												rundur = rundur + ":0" + min;
											}
											ndduration = rundur;
											//System.out.println("ND Duration Min>>>>>>     " + min1);
											//System.out.println("ND Duration Final>>>>>>     " + time);

											//System.out.println(k + "ND Distance Duration>>>>>>     " + ndduration);
										}

									}

									//System.out.println(nddist + " Final ND Distance>>>>>>   " + ndduration);

									String sqlcount111 = "select sum(Duration) as osdur from db_gpsExceptions.t_vehall_overspeed where VehCode='"
											+ rsttrips.getString("VehId") + "' and FromDate >='" + rsttrips.getDate("StartDate")
											+ "' AND ToDate <='" + sysdate2233 + "'";
									ResultSet rstcounts11 = st39.executeQuery(sqlcount111);
									//System.out.println("sqlcount111==>" + sqlcount111);
									while (rstcounts11.next()) {
										osduration = rstcounts11.getInt("osdur");
									}

									//System.out.println("osdur" + osduration);

									String sqlcount12 = "select count(*) as StopCount from db_gpsExceptions.t_vehall_stsp where VehCode='"
											+ rsttrips.getString("VehId") + "' and FromDatetime >='"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' and FromDatetime <='" + sysdate22 + "'";
								//	System.out.println(											">>>>>>>>>>>@@@@@@@@@@<<<<<<<<<<<<<<<<<<  sqlcount---------- " + sqlcount12);

									ResultSet rstcounts12 = stmain1.executeQuery(sqlcount12);
									//System.out.println("sqlcount1==>" + sqlcount12);
									while (rstcounts12.next()) {

										int stsp = rstcounts12.getInt("StopCount");
										cntst = cntst + stsp;
									}

									// String sqlcount="select SUM(OSCount),SUM(RACount),SUM(RDCount),SUM(CRCount),SUM(Distance),SUM(StopCount), SUM(RDuration), SUM(FACount),SUM(FTCount),SUM(RDinSec),SUM(RDurationinHrs),sum(Osduration),sum(FTCount),sum(FACount),sum(FC),AVG(FAVG) as FAVG,sum(NDCount),Sec_To_Time(SUM(Time_To_Sec(NDDurationinHrs))),SUM(Time_To_Sec(NDDurationinHrs)),sum(NDKm),sum(NDIntimation),sum(NDReason),sum(DCCount) from db_gpsExceptions.t_vehall_ds where VehCode='"+rsttrips.getString("VehId")+"' and TheDate >='"+rsttrips.getDate("StartDate")+" "+rsttrips.getTime("StartTime")+"' AND TheDate <='"+sysdate22+"'";

									String sqlcount = "select * from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ "' AND TheDate <='" + sysdate2233 + "'";

									//17 18
									//System.out											.println(">>>>>>>>>>>@@@@@@@@@@<<<<<<<<<<<<<<<<<<  sqlcount---------- " + sqlcount);

									ResultSet rstcounts = stmain1.executeQuery(sqlcount);
									//System.out.println("sqlcount==>" + sqlcount);

									try {
										//String sqlos="SELECT sum(Duration)as duration FROM t_veh"+aa+"_overspeed  where concat(FromDate,' ',FromTime) >='"+data1+" 00:00:00' and ToDate <='"+data2+" 23:59:59' order by concat(FromDate,' ',FromTime)";
										//System.out.println("sqlos--->"+sqlos);
										//ResultSet rstos=st4.executeQuery(sqlos);
										//if(rstos.next())
										//{

										while (rstcounts.next()) {
											//osduration=rstcounts.getDouble("OSDuration");
											/* osduration1=rstcounts.getInt("Osduration");
											osduration=osduration+osduration1; */
											/* System.out.println("DCcount"+cntdisconn);
											System.out.println("OS Duration--->"+osduration); */

											cntdisconn1 = rstcounts.getInt("DCCount");
											cntdisconn = cntdisconn + cntdisconn1;
											//System.out.println("DCcount" + cntdisconn);

											//dt122=rstcounts.getDouble("Distance");
											dt = kmrundist;
											//System.out.println("Distance" + dt);

											cntnd122 = rstcounts.getInt("NDKm");
											cntnd12 = cntnd12 + cntnd122;
											//System.out.println("NDKm" + cntnd12);

											/* int stsp=rstcounts.getInt("StopCount");
											cntst=cntst+stsp; */

											if (cntnd12 > 0) {
												cntndk += cntnd12;

											}

										}
										/* System.out.println(" OS Duration Final--->" + osduration);
										System.out.println("DCcount" + cntdisconn);
										System.out.println("Distance" + dt);
										System.out.println("NDKm" + cntnd12);
										System.out.println("Stop Count" + cntst); */

										cntdt += dt;
										//System.out.println("CNTDT=====" + cntdt);
										//}
									} catch (Exception e) {
										e.printStackTrace();
										System.out.println("Exception>>>>>>>>>>>>>1111:");
									}
									//cntosdur= cntosdur + osduration1;
									//System.out.println("CNTOSDUR====="+cntosdur);

									String sqlcount11 = "select Sec_To_Time(SUM(Time_To_Sec(NDDurationinHrs))) as nddur from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " " + rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22 + "'";
									ResultSet rstcounts1 = st39.executeQuery(sqlcount11);
									//System.out.println("sqlcount==>" + sqlcount11);
									while (rstcounts1.next()) {
										Time = rstcounts1.getString("nddur");
									}

								///	System.out.println("NDDuration" + Time);

									String datadays = "select count(*) as count from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " " + rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22 + "'";
									ResultSet datadaysrs = st40.executeQuery(datadays);
									//System.out.println("datadays====>>>>>" + datadays);

									if (datadaysrs.next()) {
										datadayscount = datadaysrs.getInt("count");
										//System.out.println("DataDaysCount====>>>>>" + datadayscount);
										datadaystotal = datadaystotal + datadayscount;
										//System.out.println("DataDaysCount====>>>>>" + datadaystotal);

									}

									String sql5 = "Select SUM(RDurationinHrs) as runhrs from db_gpsExceptions.t_veh"
											+ rsttrips.getString("VehId") + "_ds where   TheDate >='"
											+ rsttrips.getDate("StartDate") + "' AND TheDate <='" + sysdate2233 + "'";
									if (i == 52) {
									}
									ResultSet rs = st41.executeQuery(sql5);
									if (rs.next()) {
										if (null == rs.getString("runhrs") || rs.getString("runhrs").equalsIgnoreCase("null")) {
											runhrs = 00.00;

										} else {
											runhrs = rs.getDouble("runhrs");
										}
									}
									datadayscount = datadayscount + 1;
									avgrunhrs = runhrs / datadayscount;

									int j1 = 0;
									sql5 = "Select RDurationinHrs  from db_gpsExceptions.t_veh" + rsttrips.getString("VehId")
											+ "_ds where  TheDate >='" + rsttrips.getDate("StartDate") + " "
											+ rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22 + "'";
									if (i == 52) {
									}
									rs = st42.executeQuery(sql5);
									while (rs.next()) {
										if (rs.getDouble("RDurationinHrs") > 10.00) {
											j1++;
										}
									}
									DecimalFormat twoDForm = new DecimalFormat("00.00");

									/* 
									try
									{
									 dt=rstcounts.getDouble(5);
									 dt11=rstcounts.getInt(5);
									}
									catch(Exception e)
									{
										e.printStackTrace();
										System.out.println("Exception= in distance=>"+e);	
										dt=0.00;
										dt11=0;
									} */

									//System.out.println("dt==>" + dt);
									//System.out.println("dt11==>" + dt11);
									/* cntdt+=dt;
									System.out.println("CNTDT====="+cntdt);
									  		 */

									NumberFormat nfrating = NumberFormat.getInstance();
									nfrating.setMaximumFractionDigits(2);
									nfrating.setMinimumFractionDigits(2);

									if (dt > 0.0) {
										try {
											try {
												RD = ((rdcount / dt) * 100);
											} catch (Exception e) {
												e.printStackTrace();
												RD = 0;
											}
											try {
												RA = ((racount / dt) * 100);
											} catch (Exception e) {
												e.printStackTrace();
												RA = 0;
											}
											try {
												OS = ((osduration / dt) * 10);
											} catch (Exception e) {
												e.printStackTrace();
												OS = 0;
											}
											if (dt > 0) {
												rating = RA + RD + OS;
											} else {
											}
										} catch (Exception e) {
											System.out.println("RA+RD+OS=====>");
											e.printStackTrace();
										}
									} else {
									}
									cntrating = rating + cntrating;
									//System.out.println("RA+RD+OS=====>" + RA + "----" + RD + "-----" + OS);

								//	System.out.println("IN OS Avg" + osduration + "" + dt);

									NumberFormat nfos = NumberFormat.getInstance();
									nfos.setMaximumFractionDigits(2);
									nfos.setMinimumFractionDigits(2);

									//int osduration=fleetview.getOSDurationforDateRange(aa,data1,data2);

									if (osduration > 0.0 && dt > 0.0) {
										try {

											//System.out.println("distance --->" + dt);
											try {
												osavg = (osduration * 10) / dt;
											} catch (Exception e) {
												e.printStackTrace();
												osavg = 0;
											}
											//System.out.println("OS avg--->" + osavg);
											//out.print(osavg);
											//out.print(osavg);

										} catch (Exception e) {
											System.out.println("Osduration=====>");
											e.printStackTrace();
										}
									} else {
										osavg = 0.0;
										//out.print(osavg);
									}
									cntavgos += osavg;

									NumberFormat nfra = NumberFormat.getInstance();
									nfra.setMaximumFractionDigits(2);
									nfra.setMinimumFractionDigits(2);
									double raavg = 0.0;

									if (racount > 0 && dt > 0.0) {
										try {

											//System.out.println("RA --->" + racount);
											//System.out.println("dccount---------" + Diccount);
											try {
												raavg = (racount / dt) * 100;
											} catch (Exception e) {
												e.printStackTrace();
												raavg = 0;
											}
											//System.out.println("RA avg--->" + raavg);
											//out.print(raavg);
										} catch (Exception e) {
											System.out.println("RAavg=====>");
											e.printStackTrace();

										}
									} else //if(dt==0.0 && ra>0 ||ra==0) 
									{
										raavg = 0.0;
									}
									cntavgra += raavg;

									NumberFormat nfrd = NumberFormat.getInstance();
									nfrd.setMaximumFractionDigits(2);
									nfrd.setMinimumFractionDigits(2);
									double rdavg = 0.0;

									if (rdcount > 0 && dt > 0.0) {

										try {
											//System.out.println("RD -->" + rdcount);
											try {
												rdavg = (rdcount / dt) * 100;
											} catch (Exception e) {
												e.printStackTrace();
												rdavg = 0;
											}
											System.out.println("RD avg--->" + rdavg);
											//out.print(rdavg);
										} catch (Exception e) {
											rdavg = 0;
											System.out.println("RDavg=====>");
											e.printStackTrace();
										}

									} else //if(dt==0.0 && rd>0 ||rd==0 )
									{
										rdavg = 0.00;
										//cntavgrd+=rdavg;
									}
									cntavgrd += rdavg;

									//System.out.println("DCcount" + cntdisconn);
									String sqldisconn = "Select SUM(Distance) as Distance  from db_gps.t_disconnectionData where vehicleCode='"
											+ rsttrips.getString("VehId") + "' and  OffTimeTo <='" + sysdate22
											+ "' and  OffTimeFrom >='" + rsttrips.getDate("StartDate")
											+ " 00:00:00' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";

									ResultSet rstdis = st43.executeQuery(sqldisconn);

									//System.out.println("Distance of disconnection query is " + sqldisconn);

									diskm = 0;
									while (rstdis.next()) {
										diskm = diskm + rstdis.getInt("Distance");
										//System.out.println("DISKM=====" + diskm);
									}

									String sqlstop = "select sum(DayStopDurationinHrs) as stopduration from db_gpsExceptions."
											+ tbname + " where VehCode='" + rsttrips.getString("VehId") + "' and TheDate <='"
											+ sysdate22 + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " 00:00:00' order by TheDate desc";
									ResultSet rststop = st44.executeQuery(sqlstop);
									if (rststop.next()) {
										stopdur = rststop.getDouble("stopduration");
										double d1 = stopdur;
										DecimalFormat f = new DecimalFormat("##.00");
										totstopdur = totstopdur + rststop.getDouble("stopduration");

									}

									/*  cntdisconn=cntdisconn+rstcounts.getInt(23);
									System.out.println("DCcount"+cntdisconn); */

									String avgspeed = "Select * from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " " + rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22
											+ "' and AvgSpeedConsidered='Yes' ";
								//	System.out.println("avgspeed==>" + avgspeed);
									ResultSet rstavg = st45.executeQuery(avgspeed);
									if (rstavg.next()) {
										avggspeed = "Yes";
									} else {
										avggspeed = "No";

										System.out.println("in NO");
									}

									//System.out.println("datadayscount::" + datadayscount);
				%>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="vendorcol<%=k%>"><%=vendor11%></td>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=datadayscount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>">
					<%
						try {
											String ETime = todatetime;
											long hrs, mins;
											double hrslong = 0.00;
											java.util.Date enddte11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(todatetime);
											java.util.Date strdte11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
													.parse(fromdatetime);
											long x = enddte11.getMinutes();
											long y = strdte11.getMinutes();
											long timediff = enddte11.getTime() - strdte11.getTime();//msec
											long mins11 = timediff / 1000 / 60;
											if (mins11 >= 60) {
												hrdiff = mins11 / 60;//2
												if ((y > x) && (x != 0)) {
													mins = y - x;
													mins = 60 - mins;
													out.print(hrdiff + ":" + mins);
												//	System.out.println("IF-----------------" + hrdiff + ":" + mins);
												} else if ((x > y) && (y != 0)) {
													mins = x - y;
													out.print(hrdiff + ":" + mins);
												//	System.out.println("ELSEIF-----------------" + hrdiff + ":" + mins);

												} else if (x == y) {
													mins = x - y;
													out.print(hrdiff + ":" + mins);
													//System.out.println("ELSEIF2-----------------" + hrdiff + ":" + mins);

												} else if ((x == 0) && (y > x)) {
													mins = 60 - y;
													out.print(hrdiff + ":" + mins);
													//System.out.println("ELSEIF3-----------------" + hrdiff + ":" + mins);

												} else if (y == 0) {
													mins = x + y;
													out.print(hrdiff + ":" + mins);
													//System.out.println("ELSEIF4-----------------" + hrdiff + ":" + mins);

												}

											}

											String enddte = enddte11 + " " + ETime;
											String strtdte = strdte11 + " " + STime;
											long tmeinmils = enddte11.getTime() - strdte11.getTime();
											long hours = tmeinmils / (1000 * 60 * 60);
											String extractstrtminutes = STime.substring(3, 5);
											String extractendminutes = ETime.substring(3, 5);
											int totmins = Integer.parseInt(extractstrtminutes)
													+ Integer.parseInt(extractendminutes);

											if (totmins >= 60) {

												hrdiff = hrdiff + 1;
												totmins = totmins - 60;
											}

										} catch (Exception e) {

										}
					%>
				</td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=twoDForm.format(runhrs)%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=twoDForm.format(avgrunhrs)%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=Runhrcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=oscount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=osduration%></td>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=racount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=rdcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=dv%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cdcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=ndcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cntnd12%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=ndduration%></td>
				<%-- <td style="text-align: left;background-color:<%=bgcolor1%>" id="cmtcol<%=k%>"><%=nddist%></td>
		     <td style="text-align: left;background-color:<%=bgcolor1%>" id="cmtcol<%=k%>"><%=ndduration%></td> --%>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cntdisconn%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=diskm%></td>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=avggspeed%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cntst%></td>
				<%--      <td style="text-align: left;background-color:<%=bgcolor1%>" id="cmtcol<%=k%>"><%=cntst%></td>
		 --%>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=violationcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=nfrating.format(cntrating)%></td>
	<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=enteredBy%></td>
					
<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=endedby1%></td>


			</tr>
			<%
				osduration = 0;
								cntdisconn = 0;
								dt = 0.0;
								cntnd12 = 0;
								cntdt = 0;

								cntrating = 0.0;
								cntst = 0;
							}
							j++;

						}

						else if (statusname.equalsIgnoreCase("Closed")) {
							
							sql = "select distinct(tripid),Gpname,pod,Vehid,TripRating,VehRegNo,tripcolor,OwnerName,StartPlace,StartCode,StartDate,StartTime,EndPlace,EndCode,EndDate,EndTime,StartKm,EndKm,KmTravelled,UnloadDateTime,LoadingDelay,UnloadingDelay,JourneyStatus,DriverID,DriverName,JDCode,Weight,Vendor,Unloadingcomments,DelayReason,OSCount,RACount,RDCount,dvcount,OSDuration,NDCount,DisconnectionCount,DateDIFF(EndDate,StartDate) as noofdays,RunHrVio from t_completedjourney where  vehid in "+ session.getAttribute("VehList").toString() + " and  StartDate BETWEEN '" + dtt+"' AND '" + dtt1+"'  order by StartDate desc";
							///System.out.println("\n\n journey query-->>" + sql);
							ResultSet rsttrips = st.executeQuery(sql);
							String tripcolor = "",status="";
							while (rsttrips.next()) {
								k++;
								i++;
								String trip = rsttrips.getString("Tripid");
								String EDate=rsttrips.getString("EndDate");
								String	ETime=rsttrips.getString("EndTime");
								String	Vehid=rsttrips.getString("Vehid");
								

								String sqqql = "select vehtype from db_gps.t_vehicledetails where VehicleRegNumber='"+rsttrips.getString("VehRegNo")+"' and status='-' ";
								System.out.println(">>>>>>>sqql>>>>>>>>n " + sqqql);

								ResultSet rstttrips = stt.executeQuery(sqqql);

								if (rstttrips.next()) {
									 vehtype = rstttrips.getString("vehtype");

								}
								
								String ETA="";
								String sqql = "select * from db_gps.t_startedjourney where Tripid='"+trip+"' and StartDate BETWEEN '" + dtt+ "'  AND '" + dtt1+ "' order by concat(StartDate,' ',StartTime) desc limit 1";
								//System.out.println("\n\n started journey sqql-->>" + sqql);
								ResultSet ss = st22.executeQuery(sqql);

								if (ss.next()) {
									 tripcolor = ss.getString("tripcolor");
									 status = ss.getString("loadstatus");
									 endedby1= ss.getString("EndedBy");
									 enteredBy = ss.getString("EntryBy");
									 ETA = ss.getString("ETA");
								}								

								if(endedby1.equals("-"))
								{
									endedby1="Auto";
								}
								
								%>
								
								<tr>
								<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=i%></td>
								<td WIDTH="6%" id="vehcol<%=k%>"
					style="background-color:<%=bgcolor1%>"><div align="right">
 <%=rsttrips.getString("VehRegNo")%></td>

				<td style="text-align: left; display: none"><%=rsttrips.getString("TripId")%></td>
									<td>
<div align="right"  >
<font size="10">
<a href="javascript:toggleDetails(<%=i%>,true);" title="Click To See the Reports"><font size="2"><%=rsttrips.getString("TripId")%></font></a> </font><br />
<div class="popup" id="popup<%=i%>">
<table border="1" bgcolor="white"><%-- <tr>
<td><a href="detailed_report1.jsp?vehcode=<%=rsttrips.getString("VehId")%>&fromdata=<%=dtt%>&todata=<%=dtt1%>&status=close" onclick="javascript:toggleDetails(<%=i%>,false);">Detail Report</a>
</td></tr> --%><tr>
<td>
<%
String briefid = "",rid = "",plannedstatus = "No";
boolean flag = false;
String sql11 = "select * from db_gps.t_briefing where tripid = '"+rsttrips.getString("TripId")+"'";
ResultSet rs1 = st43.executeQuery(sql11);
System.out.println("Inside Comp While briefing:- "+sql11);
if(rs1.next())
{briefid = rs1.getString("Briefid");}
sql1 = "select * from db_gps.t_intermediatejrmroute where  Tripid = '"+rsttrips.getString("TripId")+"' and briefid = '"+briefid+"' and driverid = '"+rsttrips.getString("DriverId")+"'  order by advancedtrackid asc ,row asc limit 1 ";
rs1 = st44.executeQuery(sql1);
System.out.println("Inside Comp While inter :- "+sql1);
if(rs1.next())
{rid = rs1.getString("advancedrouteid");
	plannedstatus = "Yes";
	flag = true;}

//start datetime calculation

String STime = rsttrips.getString("StartTime");
try {
	fromdate = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsttrips.getString("Startdate")));
	fromdate = fromdate + " " + STime;
	fromdatetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
			.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsttrips.getString("Startdate"))) + " " + STime;
} catch (Exception e) {
	fromdate = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrips.getString("Startdate")));
	fromdate = fromdate + " " + STime;
}

try {

	java.util.Date sdt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(fromdate);
	ftime1 = "" + sdt.getHours();
	ftime2 = "" + sdt.getMinutes();
	ftime3 = "" + sdt.getSeconds();
	;
}

catch (Exception e) {
	ftime1 = "00";
	ftime2 = "00";
	ftime3 = "00";
}

 
//to datetime calculation

try {
	todate = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsttrips.getString("EndDate")));
} catch (Exception e) {
	todate = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrips.getString("EndDate")));
}
try {
	java.util.Date edt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsttrips.getString("EndDate"));
	ttime1 = "" + edt.getHours();
	ttime2 = "" + edt.getMinutes();
	ttime3 = "" + edt.getSeconds();
} catch (Exception e) {
	ttime1 = "23";
	ttime2 = "59";
	ttime3 = "59";
}		


%>
<a href="ActAndPlanJrnyCompOnMap.jsp?tripid=<%=rsttrips.getString("TripId")%>&vehcode=<%=rsttrips.getString("VehId")%>&data=<%=rsttrips.getString("StartDate")%>&data1=<%=rsttrips.getString("EndDate")%>&ftime1=<%=ftime1 %>&ftime2=<%=ftime2 %>&ftime3=<%=ftime3 %>&ttime1=<%=ttime1 %>&ttime2=<%=ttime2 %>&ttime3=<%=ttime3 %>&pg=cm&pstatus=<%=plannedstatus %>&brifid=<%=briefid %>&rid=<%=rid %>&driverid=<%=rsttrips.getString("DriverId")%>" onclick="javascript:toggleDetails(<%=i%>,false);">Show Trip On Map</a>
</td></tr><tr><td>
<a href="#" onclick="javascript:window.open('TripwiseException.jsp?startDate=<%=rsttrips.getString("StartDate")%>&endDate=<%=rsttrips.getString("EndDate")%>&trans=<%=request.getParameter("transporter") %>&vehcode=<%=rsttrips.getString("VehId")%>&tripid=<%=rsttrips.getString("Tripid")%>')">TripWise Exception</a>
</td></tr>
<%-- <tr><td>

<a href="#" onclick="javascript:window.open('trippdf.jsp?tripid=<%=rsttrips.getString("Tripid")%>&owner=<%=rsttrips.getString("OwnerName")%>&vid=<%=rsttrips.getString("VehId")%>&vehRegNo=<%=rsttrips.getString("VehRegNo")%>')">Print</a>


</td></tr> --%>
<tr><td>
<a href="#" onclick="javascript:window.open('endtrip.jsp?tripid=<%=rsttrips.getString("Tripid")%>&EDate=<%=EDate%>&ETime=<%=ETime%>&vehcode=<%=rsttrips.getString("VehId")%>','','menubar=1,scrollbars=1,resizeable=0,width=500,height=600');">Change Unload Time</a>
</td></tr>

<tr><%-- <td>
<a href="#" onclick="javascript:window.open('statustrip.jsp?tripid=<%=rsttrips.getString("Tripid")%>&EDate=<%=EDate%>&ETime=<%=ETime%>&status=<%=status %>&vehcode=<%=rsttrips.getString("VehId")%>','','menubar=1,scrollbars=1,resizeable=0,width=300,height=300');">Change Load/Unload Status</a>
</td> --%>
	<td style="font-size: 11px; face:san-serif; color:blue" align="left"><a  href="#" onclick="return srk1('<%=username%>','<%=data1%>','<%=ftime1%>','<%=ftime2%>','<%=data2%>','<%=ttime1%>','<%=ttime2%>','<%=statusname%>','<%=trip%>','<%=EDate%>','<%=ETime%>','<%=status%>','<%=Vehid %>')"><b>Change Load/Unload Status</b></a></td>


</tr>


<%if(role.equalsIgnoreCase("Castrolsuperadmin") || role.equals("Castrolsuperadmin") ) {%>
<tr><td>
<a href="#" onclick="javascript:window.open('OverrideReport.jsp?tripid=<%=rsttrips.getString("Tripid")%>&vid=<%=rsttrips.getString("VehId")%>&vehRegNo=<%=rsttrips.getString("VehRegNo")%>&Transporter=<%=rsttrips.getString("OwnerName")%>&SD=<%=rsttrips.getString("StartDate") %>&ED=<%=rsttrips.getString("EndDate") %>&ST=<%=rsttrips.getString("StartTime") %>&ET=<%=rsttrips.getString("EndTime") %>')">
Violation Override</a></td></tr>
<%}%>

<%
  //eta and eta delay calculation

String FinalStart = "", FinalEnd = "";
try {
FinalStart = rsttrips.getString("StartDate");// + " " + "00:00:00";


} catch (Exception ee) {
// FinalStart=rsttrips.getString("StartDate")+" "+STime;
}

try {
FinalEnd = ETA;
} catch (Exception ee) {
// FinalEnd=rsttrips.getString("EndDate")+" "+ETime;

}

System.out.println("FinalStart: " + FinalStart);
System.out.println("FinalEnd: " + FinalEnd);

String ETA123 = "", FinalStart123 = "";

if (FinalStart == null) {
FinalStart123 = "-";
} else {

FinalStart123 = new SimpleDateFormat("dd MM yyyy")
.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(FinalStart));

}

if (FinalEnd == null) {
ETA123 = "-";
}

else {
ETA123 = new SimpleDateFormat("dd MM yyyy")
.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(FinalEnd));

}
//System.out.println("FinalStart123: " + FinalStart123);

SimpleDateFormat myFormat = new SimpleDateFormat("dd MM yyyy");
String dateBeforeString = FinalStart123;
String dateAfterString = ETA123;

try {
Date dateBefore = myFormat.parse(dateBeforeString);               //parse StartDate
Date dateAfter = myFormat.parse(dateAfterString);                //parse  ETA
long difference = dateAfter.getTime() - dateBefore.getTime();
daysBetween = (difference / (1000 * 60 * 60 * 24));
/* You can also convert the milliseconds to days using this method
* float daysBetween = 
*         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
*/
//System.out.println("Number of Days ETA ETA date Days: " + daysBetween);
} catch (Exception e) {
e.printStackTrace();
}


//String Curdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());

String ETAsysdate123="";


ETAsysdate123 = new SimpleDateFormat("dd MM yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsttrips.getString("EndDate"))); //parse

try {
Date dateBefore1 = myFormat.parse(FinalStart123);   //parse   start date
Date dateAfter1 = myFormat.parse(ETAsysdate123);    //parse  end date
long difference1 = dateAfter1.getTime() - dateBefore1.getTime();   //trip duration
daysBetween1 = (difference1 / (1000 * 60 * 60 * 24));

/* You can also convert the milliseconds to days using this method
* float daysBetween = 
*         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
*/
//	System.out.println("Number of Days ETA With Current Days: " + daysBetween1);

} catch (Exception e) {
e.printStackTrace();
}

FinalETADelayDays = daysBetween1 - daysBetween;
System.out.println("FinalETADelayDays--------------------------: " + FinalETADelayDays);

if (FinalETADelayDays > 0.0)   //To ensure ETA Delay is not negative
{
FinalETADelayDays = FinalETADelayDays;
} else 
{
FinalETADelayDays = 0;
}

int finaletadelay = Math.round(FinalETADelayDays);    //etadelay
%>
<tr><td>

<%-- <a href="#" onclick="javascript:window.open('TripSummaryInvoice.jsp?tripid=<%=rsttrips.getString("Tripid")%>&owner=<%=rsttrips.getString("OwnerName")%>&vid=<%=rsttrips.getString("VehId")%>&vehRegNo=<%=rsttrips.getString("VehRegNo")%>')">Trip Summary</a>
 --%>
<a href="TripSummaryInvoice.jsp?tripid=<%=rsttrips.getString("TripId")%>&vehcode=<%=rsttrips.getString("VehId")%>&data=<%=dtt%>&data1=<%= dtt1%>&ftime1=<%=ftime1 %>&ftime2=<%=ftime2 %>&ftime3=<%=ftime3 %>&ttime1=<%=ttime1 %>&ttime2=<%=ttime2 %>&ttime3=<%=ttime3 %>&pg=cm&pstatus=<%=plannedstatus %>&brifid=<%=briefid %>&rid=<%=rid %>&driverid=<%=rsttrips.getString("DriverId")%>" onclick="javascript:toggleDetails(<%=i%>,false);">Trip Summary</a>


</td></tr>

<tr>
<td>
<a href="detailed_report1.jsp?vehcode=<%=rsttrips.getString("VehId")%>&fromdata=<%=rsttrips.getString("StartDate")%> <%=rsttrips.getString("StartTime") %>&tripid=<%=rsttrips.getString("Tripid")%>&todata=<%=rsttrips.getString("EndDate")%> <%=rsttrips.getString("EndTime") %>&status=close">Detail Report</a></td>

<%-- <a href="detailed_report1.jsp?vehcode=<%=rsttrips.getString("VehId")%>&fromdata=<%=rsttrips.getString("StartDate")%>&todata=<%=dtt1%>&status=close">Detail Report</a></td>
 --%></tr>

<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
</table>
</div> </div></td>
<td id="ownercol<%=k%>"><%=status%></td>
<td id="ownercol<%=k%>"><%=rsttrips.getString("JourneyStatus")%></td>

<td id="ownercol<%=k%>"><%=vehtype%></td>


									
<%
				if(tripcolor=="Amber" || tripcolor.equalsIgnoreCase("Amber"))
				{
					//System.out.println("bgcol::"+bgcol);

					bgcol="orange";
				}
				else if(tripcolor=="" || tripcolor.equalsIgnoreCase("-"))
				{
					bgcol="Gray";
					tripcolor="No Data";
				}
				else
				{
					bgcol=tripcolor;

				}
				%>
				<td style="color:<%=bgcol%>"
				id="src1col<%=k%>"><%=tripcolor%></td>
									
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("OwnerName")%></td>
									
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("StartPlace")%></td>
									
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
													.parse(rsttrips.getString("StartDate"))))%></td>
									
								
									
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("EndPlace")%></td>
									
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
													.parse(rsttrips.getString("EndDate"))))%></td>
													
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
													.parse(ETA))%></td>
									
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=finaletadelay%></td>		 <!-- logical error	-->
									
										<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("StartKm")%></td>
									
										<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("EndKm")%></td>
									
										<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("KmTravelled")%></td>
									
											<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>">
									<%if(rsttrips.getString("UnloadDateTime")=="-" || rsttrips.getString("UnloadDateTime").equals("-"))
										{%>
										-
									<%	}else
									{
										%>
									<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
													.parse(rsttrips.getString("UnloadDateTime")))%>
													
													<%} %></td>
									
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("DriverName")%></td>
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("Vendor")%></td>
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("OSCount")%></td>
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("RACount")%></td>
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("RDCount")%></td>
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("OSDuration")%></td>
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("NDCount")%></td>
									<td style="text-align: right;background-color:<%=bgcolor1%>"
									id="src1col<%=k%>"><%=rsttrips.getString("DisconnectionCount")%></td>
									<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=enteredBy%></td>
									<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=endedby1%></td>
									</tr>
								
						<%	}
						}
						else if (statusname.equalsIgnoreCase("All")) {
							
							System.out.println("ALL");


							//stst="Running";
							sql = "select * from db_gps.t_startedjourney where   Vehid in"
									+ session.getAttribute("VehList").toString() + " AND  concat(StartDate,' ',StartTime) >= '" + dtt+"'  order by concat(StartDate,' ',StartTime) desc";
							System.out.println("\n\n started journey query-->>" + sql);
							ResultSet rsttrips = st.executeQuery(sql);

							while (rsttrips.next()) {
								
								
								String sqql = "select vehtype from db_gps.t_vehicledetails where VehicleRegNumber='"+rsttrips.getString("VehRegNo")+"' and status='-' ";
								System.out.println(">>>>>>>sqql>>>>>>>>n " + sqql);

								ResultSet rstttrips = stt.executeQuery(sqql);

								if (rstttrips.next()) {
									 vehtype = rstttrips.getString("vehtype");

								}
								
								k++;
								i++;
								String trip = rsttrips.getString("Tripid");
								String JStatus=rsttrips.getString("JStatus");
bgcol=rsttrips.getString("tripcolor");
								DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

								Calendar now123 = Calendar.getInstance();
								String sysdate22 = "";
								String sysdate221 = dateFormat.format(now123.getTime());
								System.out.println(">>>>>>>>>>>>>>>n " + sysdate22);
								String tripstartdate = "";

								String sysdate = "";
								String systime = "";
								String sysdate2233 = new SimpleDateFormat("yyyy-MM-dd")
										.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sysdate221));
								System.out.println(">>>>>>>>>>>>>>>nsysdate2233 " + sysdate2233);

								/* String sql211="select Vehid,TripID,StartDate,StartTime from db_gps.t_startedjourney where Vehid='"+rsttrips.getString("VehId")+"'"; 
								ResultSet rs211=st23.executeQuery(sql211);
								//System.out.println(">>>>>>>rrrrrrrrr1" +sql2);
								if(rs211.next())
								{
									//racount=rs211.getInt("racount");
								}
								*/

								String sql222 = "select StartDate,StartTime,TripID,JStatus from db_gps.t_startedjourney where Vehid='"
										+ rsttrips.getString("VehId")
										+ "' and  concat(startdate,' ',starttime) > '"
										+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
										+ "' order by StartDate,StartTime  limit 1";

								// String sql222="select StartDate,StartTime,TripID from db_gps.t_startedjourney where Vehid='"+rsttrips.getString("VehId")+"' and  JStatus='Running' OR JStatus='tobeclosed' OR JStatus='completed' and   concat(startdate,' ',starttime)<='"+rsttrips.getDate("StartDate")+" "+rsttrips.getTime("StartTime")+"' order by rid desc limit 1"; 
								ResultSet rs222 = st57.executeQuery(sql222);
								System.out.println(">>>>>>>rrrrrrrrr222" + sql222);
								if (rs222.next()) {
									trip1 = rs222.getString("TripId");
									sysdate = rs222.getString("StartDate");
									systime = rs222.getString("StartTime");

									System.out.println("Trip---" + trip + " Trip1" + trip1);

									if (trip.equalsIgnoreCase(trip1)) {
										trip = rsttrips.getString("Tripid");
										sysdate22 = dateFormat.format(now123.getTime());

										System.out.println("In If Loop>>>trip" + trip + "sysdate22" + sysdate22);
										//sysdate223=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sysdate22));

									} else {
										trip = trip1;
										sysdate22 = sysdate + " " + systime;
										//System.out.println("In Else>>>trip"+sysdate+" "+systime);
										System.out.println("In Else>>>trip" + trip + "sysdate22" + sysdate22);

									}
									//racount=rs222.getInt("racount");
								}

								sysdate22 = dateFormat.format(now123.getTime());

								try {
									String sql22 = "select count( * ) as racount from db_gpsExceptions.t_vehall_ra where VehCode ='"
											+ rsttrips.getString("VehId") + "'  AND TheDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND TheDatetime <= '" + sysdate22 + "'";
									ResultSet rs22 = st25.executeQuery(sql22);
									System.out.println(">>>>>>>rrrrrrrrr1" + sql22);
									if (rs22.next()) {
										racount = rs22.getInt("racount");
									}

									String sql33 = "select count( * ) as rdcount from db_gpsExceptions.t_vehall_rd where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND TheDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND TheDatetime <= '" + sysdate22 + "'";
									ResultSet rs33 = st26.executeQuery(sql33);
									System.out.println(">>>>>>>rrrrrrrr2" + sql33);
									if (rs33.next()) {
										rdcount = rs33.getInt("rdcount");
									}

									String sql55 = "select count( * ) as cdcount from db_gpsExceptions.t_vehall_crcopy where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND FromDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND FromDatetime <= '" + sysdate22 + "'";
									ResultSet rs55 = st27.executeQuery(sql55);
									System.out.println(">>>>>>>rrrrrrr3" + sql55);
									if (rs55.next()) {
										cdcount = rs55.getInt("cdcount");
									}

									String sql66 = "select count( * ) as ndcount from db_gpsExceptions.t_vehall_nd where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND FromDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND FromDatetime <= '" + sysdate22 + "'";
									ResultSet rs66 = st28.executeQuery(sql66);
									System.out.println(">>>>>>>rrrrrrrrr4" + sql66);
									if (rs66.next()) {
										ndcount = rs66.getInt("ndcount");
									}

									String sql77 = "select count( * ) as oscount from db_gpsExceptions.t_vehall_overspeed where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND FromDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND FromDatetime <= '" + sysdate22 + "'";
									ResultSet rs77 = st29.executeQuery(sql77);
									System.out.println(">>>>>>>rrrrrrrrr5" + sql77);
									if (rs77.next()) {
										oscount = rs77.getInt("oscount");
									}

									String sqlDic = "select count( * ) as Diccount from db_gps.t_disconnectionData where vehicleCode='"
											+ rsttrips.getString("VehId")
											+ "' AND Duration>='0:30' and Reason ='Disconnection' and ignoredstamp='no'  and ((OffTimeFrom >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "'  and OffTimeFrom<='" + sysdate22 + "') or (OffTimeTo >='"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "'  and OffTimeTo<='" + sysdate22 + "') or (OffTimeFrom <='"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' and OffTimeTo >='" + sysdate22 + "')) ";
									ResultSet rsdic = st30.executeQuery(sqlDic);
									System.out.println(">>>>>>>rrrrrrrrr7" + sqlDic);
									if (rsdic.next()) {
										Diccount = rsdic.getInt("Diccount");
									}

									String sqlRunhr = "select count( * ) as Runhrcount from db_gpsExceptions.t_vehall_ds where vehcode ='"
											+ rsttrips.getString("VehId") + "' and RDuration > '10:00:00'  AND thedate >= '"
											+ rsttrips.getDate("StartDate") + "' AND thedate <= '" + sysdate22 + "'";
									ResultSet rsRun = st31.executeQuery(sqlRunhr);
									System.out.println(">>>>>>>rrrrrrrrr8" + sqlRunhr);
									if (rsRun.next()) {
										Runhrcount = rsRun.getInt("Runhrcount");
									}
									String sql11 = "select Tripid from db_gps.t_startedjourney where  Tripid = '" + trip
											+ "' and (OwnerName='" + session.getAttribute("usertypevalue").toString()
											+ "' OR GPName='" + session.getAttribute("usertypevalue").toString()
											+ "' OR Vendor='" + session.getAttribute("usertypevalue").toString() + "') ";
									ResultSet rs17 = st32.executeQuery(sql11);
									if (rs17.next()) {
										violationcount = racount + rdcount + cdcount + ndcount + oscount + Diccount
												+ Runhrcount;
										System.out.println(">>>>>>>sum++------------" + violationcount);
									} else {
										violationcount = 0;

									}

								} catch (Exception e) {
									violationcount = 0;
								}

								//sum=oscount+racount+rdcount+ndcount+Diccount;

								System.out.println(">>>>>>>sum------------" + violationcount);

								comments = rsttrips.getString("Loadcomments");
								totKm = rsttrips.getDouble("FIxedKM");
								tTime = rsttrips.getLong("FIxedTime");
								gpname1 = rsttrips.getString("GPName");
								ETA1 = rsttrips.getString("ETA");
								ETADate = ETA1;
								if (!(null == ETA1)) {
									ETA1 = new SimpleDateFormat("dd-MMM-yyyy HH:MM:SS")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETA1));
								}
								String curpos = "", lat = "", lon = "";
								kmrundist = 0;
								kmrun1 = 0;
								kmrun2 = 0;
								String vehno = rsttrips.getString("VehRegNo");
								sql = "select * from t_onlinedata where VehicleCode='" + rsttrips.getString("VehId") + "'";
								ResultSet rs1 = st1.executeQuery(sql);
								try {
									if (rs1.next()) {
										curpos = rs1.getString("Location");
										temptime = rs1.getString("TheTime");
										updtetime = new SimpleDateFormat(dateformat).format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("TheDate")))
												+ " " + rs1.getString("TheTime");
										lat = rs1.getString("LatitudePosition");
										lon = rs1.getString("LongitudePosition");
									}
								} catch (Exception exc) {
									exc.printStackTrace();
								}

								
								String Enddate="",End_date="";
								
								String EndDatetime="Select * from db_gps.t_completedjourney where tripid='"+rsttrips.getString("TripId")+"'";
								System.out.println("Trip Date :- "+EndDatetime);
								
								ResultSet rsend=st58.executeQuery(EndDatetime);
								if(rsend.next())
								{
									Enddate=rsend.getString("EndDate")+" "+rsend.getString("EndTime");
									End_date = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsend.getString("EndDate")));
								}
								
								
								try {
									if(JStatus.equals("Completed")){
									sql = "select Distance from t_veh" + rsttrips.getString("VehId")
											+ " where TheFieldDataDateTime between '" + rsttrips.getString("StartDate")
											+ " " + rsttrips.getString("StartTime") + "' AND '" + Enddate + "' and   TheFiledTextFileName='SI' order by TheFieldDataDateTime asc limit 1";
									}else if( JStatus.equals("Running") || JStatus.equals("Cancelled"))
											{sql = "select Distance from t_veh" + rsttrips.getString("VehId")
											+ " where TheFieldDataDateTime between '" + rsttrips.getString("StartDate")
											+ " " + rsttrips.getString("StartTime") + "' AND '" + today + " " + currenttime
											+ "' and TheFiledTextFileName='SI' order by TheFieldDataDateTime asc limit 1";
										
									}
									ResultSet rstkmrun1 = st1.executeQuery(sql);
									if (rstkmrun1.next()) {
										kmrun1 = rstkmrun1.getInt("Distance");
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
								
								
								
								try {
									if(JStatus.equals("Completed")){
									sql = "select Distance from t_veh" + rsttrips.getString("VehId")
											+ " where TheFieldDataDateTime between '" + rsttrips.getString("StartDate")
											+ " " + rsttrips.getString("StartTime") + "' AND '"+Enddate+"' and TheFiledTextFileName='SI' order by TheFieldDataDateTime desc limit 1";
									}else if( JStatus.equals("Running") || JStatus.equals("Cancelled"))
									{
										sql = "select Distance from t_veh" + rsttrips.getString("VehId")
										+ " where TheFieldDataDateTime between '" + rsttrips.getString("StartDate")
										+ " " + rsttrips.getString("StartTime") + "' AND '" + today + " " + currenttime
										+ "' and TheFiledTextFileName='SI' order by TheFieldDataDateTime asc limit 1";
										
							}
									ResultSet rstkmrun2 = st1.executeQuery(sql);
									if (rstkmrun2.next()) {
										kmrun2 = rstkmrun2.getInt("Distance");
									}
								} catch (Exception e1) {
									e1.printStackTrace();
								}
								try {
									long myMilisec;
									sql = "select * from db_gps.t_startedjourney where StartDate='"
											+ rsttrips.getDate("StartDate") + "'and StartTime='"
											+ rsttrips.getTime("StartTime") + "' and StartCode='"
											+ rsttrips.getString("StartCode") + "' and EndCode='"
											+ rsttrips.getString("EndCode") + "' and Vehid=" + rsttrips.getString("VehId")
											+ "";
									ResultSet rstTotKm = st3.executeQuery(sql);
									if (rstTotKm.next()) {
										sql3 = "select * from db_gps.t_castrolroutes where StartPlace = '"
												+ rsttrips.getString("StartPlace") + "' and EndPlace = '"
												+ rsttrips.getString("EndPlace") + "' || EndPlace = '"
												+ rsttrips.getString("StartPlace") + "' and StartPlace = '"
												+ rsttrips.getString("EndPlace") + "' limit 1 ";
										ResultSet rst123 = st4.executeQuery(sql3);
										if (totKm == 0 && tTime == 0)
											if (rst123.next()) {
												totKm = rst123.getDouble("Km");
												tTime = rst123.getLong("TTime");
											}
									}
									
System.out.println("KM Run 1 "+kmrun2);
									
									System.out.println("KM Run 2 "+kmrun1);
									
									kmrundist = kmrun2 - kmrun1; //Finding tot run km by vehicle after trip started.

									remKm = totKm - kmrundist;
									// Adding todays km also
									if (kmrundist >= 0) {
										kmrundist = kmrundist;
									} else {
										kmrundist = 0;
									}
									
									myMilisec = (tTime * 60 * 60 * 1000);
									if (!(null == ETADate)) {
										ETADate = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
												.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETADate));
										DisDate = ETADate;
									} else {
										if (myMilisec != 0) {
											java.util.Date resultdate = new java.util.Date();
											SimpleDateFormat sdftimemilli = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
											Date startDtTm = sdftimemilli.parse(rsttrips.getString("StartDate") + " "
													+ rsttrips.getString("StartTime"));
											long start = startDtTm.getTime();
											long totdate = start + myMilisec;
											resultdate.setTime(totdate);
											DisDate = new SimpleDateFormat(dateformat + " HH:mm:ss").format(resultdate);
										} else {
											DisDate = "NA";
										}
									}
								} catch (Exception e11) {
									System.out.println("---I am in exception--kmrundist-");
									e11.printStackTrace();
								}

								sdate = rsttrips.getString("Startdate");

								String STime = rsttrips.getString("StartTime");
								try {
									fromdate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdate));
									fromdate = fromdate + " " + STime;
									fromdatetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdate)) + " " + STime;
								} catch (Exception e) {
									fromdate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd").parse(sdate));
									fromdate = fromdate + " " + STime;
								}

								try {

									java.util.Date sdt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(fromdate);
									ftime1 = "" + sdt.getHours();
									ftime2 = "" + sdt.getMinutes();
									ftime3 = "" + sdt.getSeconds();
									;
								}

								catch (Exception e) {
									ftime1 = "00";
									ftime2 = "00";
									ftime3 = "00";
								}
								edate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
								try {
									todate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(edate));
								} catch (Exception e) {
									todate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd").parse(edate));
								}
								
								if (updtetime.equalsIgnoreCase("NA") || DisDate.equalsIgnoreCase("NA")) {
									//System.out.println("\n\n in NA");
									bgcolor1 = "";
									bgcolor2 = "";
								} else {
									try {
										sttdate = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
												.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
														.parse(rsttrips.getString("StartDate")));
									} catch (Exception ee) {
										sttdate = new SimpleDateFormat("dd-MMM-yyyy").format(
												new SimpleDateFormat("yyyy-MM-dd").parse(rsttrips.getString("StartDate")))
												+ " " + rsttrips.getString("StartTime");
									}
									SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
									Date date1 = sdf1.parse(updtetime);
									Date date2 = sdf1.parse(sttdate);
									Date date3 = sdf1.parse(DisDate);
									float timdiff = 0, avg;
									long msec = date1.getTime() - date2.getTime();
									timdiff = (float) (msec / 1000 / 60 / 60);
									avg = (kmrundist / timdiff);
									if (date1.compareTo(date3) > 0) {
									} else {
									}
								}
			%>
			<%
				//System.out.println("\n\n color value-->>" + request.getParameter("colorvalue"));
								//System.out.println("\n\n bgcolor value-->>" + bgcolor2);
			%>
			<tr>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="src1col<%=k%>"><%=i%></td>
				<td WIDTH="6%" id="vehcol<%=k%>"
					style="background-color:<%=bgcolor1%>"><div align="right">
					
					
					
 <%=rsttrips.getString("VehRegNo")%></td>
 <td style="text-align: left; display: none"><%=rsttrips.getString("TripId")%></td>
 <td>
<div align="right"  >
<font size="10">
<a href="javascript:toggleDetails(<%=i%>,true);" title="Click To See the Reports"><font size="2"><%=rsttrips.getString("TripId")%></font></a> </font><br />

										<%
											String briefid = "", rid = "", plannedstatus = "No";
															boolean flag = false;
															sql1 = "select * from db_gps.t_briefing where tripid = '" + rsttrips.getString("TripId")
																	+ "'";
															rs1 = st1.executeQuery(sql1);
															if (rs1.next()) {
																briefid = rs1.getString("Briefid");
															}
															sql1 = "select * from db_gps.t_intermediatejrmroute where  Tripid = '"
																	+ rsttrips.getString("TripId") + "' and briefid = '" + briefid
																	+ "' and driverid = '" + rsttrips.getString("DriverCode")
																	+ "'  order by advancedtrackid asc ,row asc limit 1 ";
															rs1 = st1.executeQuery(sql1);
															//System.out.println("\n\n in t_intermediatejrmroute" + sql1);
															if (rs1.next()) {
																rid = rs1.getString("advancedrouteid");
																plannedstatus = "Yes";
																flag = true;
															}
															
									if (gpname1.equalsIgnoreCase("Castrol")) {
													} else {
														String tripflag = "true";
													//	System.out.println("\n\n in castrol");
														String strdate12 = rsttrips.getString("StartTime");
													//	System.out.println("\n\n in NA 1");

														if (strdate12 == null) {

														} else {

															strdate12 = new SimpleDateFormat("HH:mm:ss")
																	.format(new SimpleDateFormat("HH:MM:SS").parse(strdate12));
														}
														//System.out.println("\n\n in NA 2");
														String ETA = "";
														String NA = "NA";
														ETA = DisDate;
														//System.out.println("\n\nETA " + ETA);

														//System.out.println("\nNA " + NA);
														if (ETA.equalsIgnoreCase(NA)) {
															//System.out.println("\n\n in NA 3");
															ETA = null;
														} else {
															//System.out.println("\n\n in NA 4");
															ETA = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
																	.format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(DisDate));
															//System.out.println("\n\n in ETA" + ETA);

														}%>
<div class="popup" id="popup<%=i%>">
<table border="1" bgcolor="white">
<tr>
									<td>
								            <%           if(JStatus.equalsIgnoreCase("Completed"))   //Show Trip on Map for Completed Journeys
															{
																
																try {
																	java.util.Date edt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rsend.getString("EndDate"));
																	ttime1 = "" + edt.getHours();
																	ttime2 = "" + edt.getMinutes();
																	ttime3 = "" + edt.getSeconds();
																} catch (Exception ex) 
																{
																	ttime1 = "23";
																	ttime2 = "59";
																	ttime3 = "59";
																}
															%>
															<a href="ActAndPlanJrnyCompOnMap.jsp?tripid=<%=rsttrips.getString("TripId")%>&vehcode=<%=rsttrips.getString("VehId")%>&data=<%=fromdate%>&data1=<%=Enddate%>&ftime1=<%=ftime1%>&ftime2=<%=ftime2%>&ftime3=<%=ftime3%>&ttime1=<%=ttime1%>&ttime2=<%=ttime2%>&ttime3=<%=ttime3%>&pg=cm&pstatus=<%=plannedstatus%>&brifid=<%=briefid%>&rid=<%=rid%>&driverid=<%=rsttrips.getString("DriverCode")%>"
										onclick="javascript:toggleDetails(<%=j%>,false);">Show
											Trip On Map</a>
															 <%}
															else{
																try {
																	java.util.Date edt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETA);
																	ttime1 = "" + edt.getHours();
																	ttime2 = "" + edt.getMinutes();
																	ttime3 = "" + edt.getSeconds();
																} catch (Exception e) {
																	ttime1 = "23";
																	ttime2 = "59";
																	ttime3 = "59";
																}
											
															%>
															 
										<a href="ActAndPlanJrnyCompOnMap.jsp?tripid=<%=rsttrips.getString("TripId")%>&vehcode=<%=rsttrips.getString("VehId")%>&data=<%=fromdate%>&data1=<%=ETA%>&ftime1=<%=ftime1%>&ftime2=<%=ftime2%>&ftime3=<%=ftime3%>&ttime1=<%=ttime1%>&ttime2=<%=ttime2%>&ttime3=<%=ttime3%>&pg=cm&pstatus=<%=plannedstatus%>&brifid=<%=briefid%>&rid=<%=rid%>&driverid=<%=rsttrips.getString("DriverCode")%>"
										onclick="javascript:toggleDetails(<%=j%>,false);">Show Trip On Map</a><%} %>
									</td>
								</tr>
								<% if(!(JStatus.equalsIgnoreCase("Completed"))){  %>
								<tr>
									<td><a
										href="edittrip.jsp?vehno=<%=rsttrips.getString("VehRegNo")%>&ReportDateTime=<%=rsttrips.getString("ReportDateTime")%>&strloc=<%=rsttrips.getString("StartPlace")%>
		   							          &StartTime=<%=rsttrips.getString("StartTime")%>&ETA=<%=ETA%>&endp=<%=rsttrips.getString("EndPlace")%>&driverid=<%=rsttrips.getString("DriverCode")%>&drivern=<%=rsttrips.getString("DriverName")%>
						   							&tripid=<%=rsttrips.getString("Tripid")%>&tripflag=<%=tripflag%>">Edit Trip </a></td>
								</tr>
								<%}
								} %>
								<tr><td>
								 <a href="detailed_report1.jsp?vehcode=<%=rsttrips.getString("VehId")%>&fromdata=<%=rsttrips.getString("StartDate")%> <%=rsttrips.getString("StartTime") %>&tripid=<%=rsttrips.getString("Tripid")%>&todata=<%=dtt1%>&status=Open">Detail Report</a></td>
								
								</tr>
								<tr><td>
								 <a href="via_point_report.jsp?vehcode=<%=rsttrips.getString("VehId")%>&fromdata=<%=rsttrips.getString("StartDate")%> <%=rsttrips.getString("StartTime") %>&tripid=<%=rsttrips.getString("Tripid")%>&todata=<%=dtt1%>&status=Open">Via point Report</a></td>
								
								</tr>
								<tr>
									<td><a href="javascript:toggleDetails(<%=j%>,true);"
										onclick="javascript:window.open ('CancelTrip.jsp?vehno=<%=rsttrips.getString("VehRegNo")%>&tripid=<%=rsttrips.getString("Tripid")%>','win3','scrollbars=1,resizeable=0,width=300,height=300');";>Cancel
											Trip</a></td>
								</tr>
								<tr>
									<td><a href="javascript: false"
										onclick="javascript:window.open('endtrip.jsp?tripid=<%=rsttrips.getString("Tripid")%>&vehcode=<%=rsttrips.getString("VehId")%>&vehno=<%=rsttrips.getString("VehRegNo")%>&pageflag=<%=pageflag%>','','menubar=1,resizable=2,width=900,height=700,location=no');">End
											Trip</a></td>
								</tr>

<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
</table>
</div> </div></td>
<td id="ownercol<%=k%>"><%=rsttrips.getString("loadstatus")%></td>
<td id="ownercol<%=k%>"><%=rsttrips.getString("JStatus")%></td>

<td id="ownercol<%=k%>"><%=vehtype%></td>

				<%
				String tripcol=rsttrips.getString("tripcolor");
				if(bgcol=="Amber" || bgcol.equalsIgnoreCase("Amber"))
				{
					//System.out.println("bgcol::"+bgcol);

					bgcol="orange";
				}
				else if(bgcol=="" || bgcol.equalsIgnoreCase("-"))
				{
					bgcol="Gray";
					tripcol="No Data";
				}
				else
				{
					bgcol=bgcol;

				}
				%>
				<td style="color:<%=bgcol%>"
					id="ownercol<%=k%>"><%=tripcol%></td>
				<%
					try {
										sqlveh = "Select VehDesc,VehModel,VehType1 from t_vehicledetails where VehicleRegNumber='"
												+ rsttrips.getString("VehRegNo") + "' and status='-' order by VehicleRegNumber";
										ResultSet rstveh = stveh.executeQuery(sqlveh);
										//System.out.println("veh desc open" + sqlveh);
										if (rstveh.next()) {
											vehdesc1 = rstveh.getString("VehDesc");
											if (vehdesc1 == null || vehdesc1.equalsIgnoreCase("null")) {
												vehdesc1 = "-";
											}
											vehmodel1 = rstveh.getString("VehModel");
											if (vehmodel1 == null || vehmodel1.equalsIgnoreCase("null")) {
												vehmodel1 = "-";
											}
											vehtype1 = rstveh.getString("VehType1");
											if (vehtype1 == null || vehtype1.equalsIgnoreCase("null")) {
												vehtype1 = "-";
											}
										} else {
											vehdesc1 = "-";
											vehmodel1 = "-";
											vehtype1 = "-";
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
				%>
				<td style="background-color:<%=bgcolor1%>" id="desccol<%=k%>"><%=vehdesc1%></td>
				<td style="background-color:<%=bgcolor1%>" id="modcol<%=k%>"><%=vehmodel1%></td>
				<td style="background-color:<%=bgcolor1%>" id="typecol<%=k%>"><%=vehtype1%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="ownercol<%=k%>"><%=rsttrips.getString("OwnerName")%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="ownercol<%=k%>"><%=rsttrips.getString("GPName")%></td>

					


				<td style="background-color:<%=bgcolor1%>"
					id="updtetmecol<%=j%><%=k%>"><div align="right"><%=updtetime%>
					</div></td>
				<td WIDTH="8%" style="background-color:<%=bgcolor1%>"
					id="curposcol<%=j%><%=k%>"><div align="left">
						<a
							href="shownewmap.jsp?lat=<%=lat%>&long=<%=lon%>&discription=<%="<b>" + vehno + "</b><br>"%><%=curpos%>"
							onclick="popWin = open('shownewmap.jsp?lat=<%=lat%>&long=<%=lon%>&discription=<%="<b>" + vehno + "</b><br>"%><%=curpos%>','myWin','width=500,height=500');popWin.focus();return false">
							<%=curpos%>
						</a>
					</div></td>
					<td WIDTH="8%" style="display:none" id="curposcol<%=j%><%=k%>"><div align="left"><%=curpos%></div></td>
				<td style="background-color:<%=bgcolor1%>" id="drivcol<%=j%><%=k%>"><div
						align="left"><%=rsttrips.getString("DriverName") + "(" + rsttrips.getString("DriverCode") + ")"%></div></td>
				<td style="background-color:<%=bgcolor1%>"
					id="stplacecol<%=j%><%=k%>"><div align="left"><%=rsttrips.getString("StartPlace")%></div></td>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="stdatecol<%=j%><%=k%>">
					<%
						try {
											out.print(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
													.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
															.parse(rsttrips.getString("StartDate"))));
										} catch (Exception ee) {
											out.print(new SimpleDateFormat("dd-MMM-yyyy").format(
													new SimpleDateFormat("yyyy-MM-dd").parse(rsttrips.getString("StartDate")))
													+ "<br>" + rsttrips.getString("StartTime"));
										}

										//ETA Delay

										String FinalStart = "", FinalEnd = "";
										try {
											FinalStart = rsttrips.getString("StartDate") + " " + "00:00:00";

										} catch (Exception ee) {
											// FinalStart=rsttrips.getString("StartDate")+" "+STime;
										}

										try {
											FinalEnd = rsttrips.getString("ETA");
										} catch (Exception ee) {
											// FinalEnd=rsttrips.getString("EndDate")+" "+ETime;

										}

										//System.out.println("FinalStart: " + FinalStart);
										//System.out.println("FinalEnd: " + FinalEnd);

										String ETA123 = "", FinalStart123 = "";

										if (FinalStart == null) {
											FinalStart123 = "-";
										} else {

											FinalStart123 = new SimpleDateFormat("dd MM yyyy")
													.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(FinalStart));

										}

										if (FinalEnd == null) {
											ETA123 = "-";
										}

										else {
											ETA123 = new SimpleDateFormat("dd MM yyyy")
													.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(FinalEnd));

										}
										//System.out.println("FinalStart123: " + FinalStart123);

										SimpleDateFormat myFormat = new SimpleDateFormat("dd MM yyyy");
										String dateBeforeString = FinalStart123;
										String dateAfterString = ETA123;

										try {
											Date dateBefore = myFormat.parse(dateBeforeString);
											Date dateAfter = myFormat.parse(dateAfterString);
											long difference = dateAfter.getTime() - dateBefore.getTime();
											daysBetween = (difference / (1000 * 60 * 60 * 24));
											/* You can also convert the milliseconds to days using this method
											 * float daysBetween = 
											 *         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
											 */
											//System.out.println("Number of Days ETA ETA date Days: " + daysBetween);
										} catch (Exception e) {
											e.printStackTrace();
										}

										String Curdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());

										String ETAsysdate123="";
										
										
										if(JStatus.equals("Running"))
										{
										 ETAsysdate123 = new SimpleDateFormat("dd MM yyyy")
												.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Curdate));
										}else if(JStatus.equals("Cancelled")){
											ETAsysdate123=new SimpleDateFormat("dd MM yyyy")
													.format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrips.getString("StartDate")));	
										}else if(JStatus.equals("Completed")){
											ETAsysdate123=new SimpleDateFormat("dd MM yyyy")
													.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Enddate));	
										}

										try {
											Date dateBefore1 = myFormat.parse(FinalStart123);   //start
											Date dateAfter1 = myFormat.parse(ETAsysdate123);   //end date
											long difference1 = dateAfter1.getTime() - dateBefore1.getTime();
											daysBetween1 = (difference1 / (1000 * 60 * 60 * 24));
											/* You can also convert the milliseconds to days using this method
											 * float daysBetween = 
											 *         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
											 */
										//	System.out.println("Number of Days ETA With Current Days: " + daysBetween1);
										} catch (Exception e) {
											e.printStackTrace();
										}

										FinalETADelayDays = daysBetween1 - daysBetween;
										//System.out.println("FinalETADelayDays--------------------------: " + FinalETADelayDays);

										if (FinalETADelayDays > 0.0) {
											FinalETADelayDays = FinalETADelayDays;
										} else {
											FinalETADelayDays = 0;

										}

										int finaletadelay = Math.round(FinalETADelayDays); // 3
					%>
				</td>
				<td style="background-color:<%=bgcolor1%>"
					id="endplacecol<%=j%><%=k%>"><div align="left"><%=rsttrips.getString("EndPlace")%></div></td>
				<td style="background-color:<%=bgcolor1%>"
					id="endplacecol<%=j%><%=k%>"><div align="left"><%=End_date%></div></td>
				<td style="background-color:<%=bgcolor1%>" id="etacol<%=j%><%=k%>"><div
						align="right"><%=DisDate%>
					</div></td>
				<td style="background-color:<%=bgcolor1%>" id="etacol<%=j%><%=k%>"><div
						align="right"><%=finaletadelay%></div></td>

				<%
					if (tTime == 0 && totKm == 0) {
				%>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="FixedTimecol<%=k%>"><br>NA</td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="FixedKmcol<%=k%>"><br>NA</td>
				<%
					} else {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="FixedTimecol<%=k%>"><br> <%=tTime%></td>
				<%
					System.out.println("FixedTIme----->" + tTime);
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="FixedKmcol<%=k%>"><br> <%=twoDForm1.format(totKm)%></td>
				<%
					System.out.println("FixedKm----->" + totKm);
				%>
				<%
					}
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmsruncol<%=k%>"><%=kmrundist%></td>
				<%
					if (tTime == 0 && totKm == 0) {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmstoruncol<%=k%>"><div align="left">NA</div></td>
				<%
					} else {
										if (remKm >= 0) {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmstoruncol<%=k%>"><%=twoDForm1.format(remKm)%></td>
				<%
					} else {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmstoruncol<%=k%>">0</td>

				<%
					}
									}
				%>
				<%
					sqlopen = "Select EntryBy,EndedBy,Weight,Vendor,JStatus,ReportDateTime,Frieght,Advance,TripCategory from db_gps.t_startedjourney where tripid='"
											+ rsttrips.getString("Tripid") + "'";
									ResultSet rssopen = stopen.executeQuery(sqlopen);
									if (rssopen.next()) {
										endedby1 = rssopen.getString("EndedBy");
										enteredBy = rssopen.getString("EntryBy");
										if(endedby1.equals("-") && rssopen.getString("JStatus").equals("Completed"))
										{
											endedby1="Auto";
										}
										weight1 = rssopen.getString("Weight");
										if (weight1 == null || weight1.equalsIgnoreCase("null")) {
											weight1 = "-";
										}
										vendor11 = rssopen.getString("Vendor");

										if (vendor11.equalsIgnoreCase("select") || vendor11 == null
												|| vendor11.equalsIgnoreCase("null")) {
											vendor11 = "-";
										}
										tripcat1 = rssopen.getString("TripCategory");
										if (tripcat1.equalsIgnoreCase("select") || tripcat1 == null
												|| tripcat1.equalsIgnoreCase("null")) {
											tripcat1 = "-";
										}
										freight1 = rssopen.getString("Frieght");
										if (freight1 == null || freight1.equalsIgnoreCase("null")) {
											freight1 = "-";
										}
										adv1 = rssopen.getString("Advance");
										if (adv1 == null || adv1.equalsIgnoreCase("null")) {
											adv1 = "-";
										}
									} else {
										endedby1 = "-";
										weight1 = "-";
										vendor11 = "-";
										tripcat1 = "-";
										freight1 = "-";
										adv1 = "-";

									} //out.println("Mila");
								//	System.out.println(											"Sum Violations----------------------------------------- " + violationcount);
									//New Paramater Addeed For Posco
									try {
										todatetime = sysdate22;
										fromdatetime = rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime");
									} catch (Exception e) {
										todatetime = sysdate22;
										fromdatetime = rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime");

									}

									String sqlND = "select SUM(Distance) as distance,Sum(Time_to_Sec(Duration)) as duration from db_gpsExceptions.t_veh"
											+ rsttrips.getString("VehId") + "_nd where concat(FromDate,' ',FromTime) >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' and concat(FromDate,' ',FromTime)<='" + sysdate22 + "'";
									//System.out.println(k + "ND Distance>>>>>>  ++++++++   " + sqlND);

									ResultSet rsND = st38.executeQuery(sqlND);
									//System.out.println(k + "ND Distance>>>>>> -------    " + sqlND);

									if (rsND.next()) {
										nddist = rsND.getInt("distance");
										ndduration = rsND.getString("duration");
										//System.out.println(nddist + "ND Distance Raw ND Duration>>>>>>     " + ndduration);

										if (ndduration == null || ndduration.equalsIgnoreCase("null")) {
											//System.out.println("ND Distance>>>>>>     " + ndduration);

											ndduration = "00:00";

										} else {
											String rundur = "";
											int min = 0, hrs = 0, min1 = 0;

											min1 = rsND.getInt("duration") / 60;
											hrs = min1 / 60;
											min = min1 % 60;
											int sec = rsND.getInt("duration");
											Date d = new Date(sec * 1000L);
											SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss"); // HH for 0-23
											df.setTimeZone(TimeZone.getTimeZone("GMT"));
											String time = df.format(d);

											if (hrs > 9) {
												rundur = rundur + hrs;
											} else {
												rundur = "0" + hrs;
											}

											if (min > 9) {
												rundur = rundur + ":" + min;
											} else {
												rundur = rundur + ":0" + min;
											}
											ndduration = rundur;
											//System.out.println("ND Duration Min>>>>>>     " + min1);
											//System.out.println("ND Duration Final>>>>>>     " + time);

											//System.out.println(k + "ND Distance Duration>>>>>>     " + ndduration);
										}

									}

									//System.out.println(nddist + " Final ND Distance>>>>>>   " + ndduration);

									String sqlcount111 = "select sum(Duration) as osdur from db_gpsExceptions.t_vehall_overspeed where VehCode='"
											+ rsttrips.getString("VehId") + "' and FromDate >='" + rsttrips.getDate("StartDate")
											+ "' AND ToDate <='" + sysdate2233 + "'";
									ResultSet rstcounts11 = st39.executeQuery(sqlcount111);
									//System.out.println("sqlcount111==>" + sqlcount111);
									while (rstcounts11.next()) {
										osduration = rstcounts11.getInt("osdur");
									}

									//System.out.println("osdur" + osduration);

									String sqlcount12 = "select count(*) as StopCount from db_gpsExceptions.t_vehall_stsp where VehCode='"
											+ rsttrips.getString("VehId") + "' and FromDatetime >='"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' and FromDatetime <='" + sysdate22 + "'";
								//	System.out.println(											">>>>>>>>>>>@@@@@@@@@@<<<<<<<<<<<<<<<<<<  sqlcount---------- " + sqlcount12);

									ResultSet rstcounts12 = stmain1.executeQuery(sqlcount12);
									//System.out.println("sqlcount1==>" + sqlcount12);
									while (rstcounts12.next()) {

										int stsp = rstcounts12.getInt("StopCount");
										cntst = cntst + stsp;
									}

									// String sqlcount="select SUM(OSCount),SUM(RACount),SUM(RDCount),SUM(CRCount),SUM(Distance),SUM(StopCount), SUM(RDuration), SUM(FACount),SUM(FTCount),SUM(RDinSec),SUM(RDurationinHrs),sum(Osduration),sum(FTCount),sum(FACount),sum(FC),AVG(FAVG) as FAVG,sum(NDCount),Sec_To_Time(SUM(Time_To_Sec(NDDurationinHrs))),SUM(Time_To_Sec(NDDurationinHrs)),sum(NDKm),sum(NDIntimation),sum(NDReason),sum(DCCount) from db_gpsExceptions.t_vehall_ds where VehCode='"+rsttrips.getString("VehId")+"' and TheDate >='"+rsttrips.getDate("StartDate")+" "+rsttrips.getTime("StartTime")+"' AND TheDate <='"+sysdate22+"'";

									String sqlcount = "select * from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ "' AND TheDate <='" + sysdate2233 + "'";

									//17 18
									//System.out											.println(">>>>>>>>>>>@@@@@@@@@@<<<<<<<<<<<<<<<<<<  sqlcount---------- " + sqlcount);

									ResultSet rstcounts = stmain1.executeQuery(sqlcount);
									//System.out.println("sqlcount==>" + sqlcount);

									try {
										//String sqlos="SELECT sum(Duration)as duration FROM t_veh"+aa+"_overspeed  where concat(FromDate,' ',FromTime) >='"+data1+" 00:00:00' and ToDate <='"+data2+" 23:59:59' order by concat(FromDate,' ',FromTime)";
										//System.out.println("sqlos--->"+sqlos);
										//ResultSet rstos=st4.executeQuery(sqlos);
										//if(rstos.next())
										//{

										while (rstcounts.next()) {
											//osduration=rstcounts.getDouble("OSDuration");
											/* osduration1=rstcounts.getInt("Osduration");
											osduration=osduration+osduration1; */
											/* System.out.println("DCcount"+cntdisconn);
											System.out.println("OS Duration--->"+osduration); */

											cntdisconn1 = rstcounts.getInt("DCCount");
											cntdisconn = cntdisconn + cntdisconn1;
											//System.out.println("DCcount" + cntdisconn);

											//dt122=rstcounts.getDouble("Distance");
											dt = kmrundist;
											//System.out.println("Distance" + dt);

											cntnd122 = rstcounts.getInt("NDKm");
											cntnd12 = cntnd12 + cntnd122;
											//System.out.println("NDKm" + cntnd12);

											/* int stsp=rstcounts.getInt("StopCount");
											cntst=cntst+stsp; */

											if (cntnd12 > 0) {
												cntndk += cntnd12;

											}

										}
										/* System.out.println(" OS Duration Final--->" + osduration);
										System.out.println("DCcount" + cntdisconn);
										System.out.println("Distance" + dt);
										System.out.println("NDKm" + cntnd12);
										System.out.println("Stop Count" + cntst); */

										cntdt += dt;
										//System.out.println("CNTDT=====" + cntdt);
										//}
									} catch (Exception e) {
										e.printStackTrace();
										System.out.println("Exception>>>>>>>>>>>>>1111:");
									}
									//cntosdur= cntosdur + osduration1;
									//System.out.println("CNTOSDUR====="+cntosdur);

									String sqlcount11 = "select Sec_To_Time(SUM(Time_To_Sec(NDDurationinHrs))) as nddur from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " " + rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22 + "'";
									ResultSet rstcounts1 = st39.executeQuery(sqlcount11);
									//System.out.println("sqlcount==>" + sqlcount11);
									while (rstcounts1.next()) {
										Time = rstcounts1.getString("nddur");
									}

								///	System.out.println("NDDuration" + Time);

									String datadays = "select count(*) as count from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " " + rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22 + "'";
									ResultSet datadaysrs = st40.executeQuery(datadays);
									//System.out.println("datadays====>>>>>" + datadays);

									if (datadaysrs.next()) {
										datadayscount = datadaysrs.getInt("count");
										//System.out.println("DataDaysCount====>>>>>" + datadayscount);
										datadaystotal = datadaystotal + datadayscount;
										//System.out.println("DataDaysCount====>>>>>" + datadaystotal);

									}

									String sql5 = "Select SUM(RDurationinHrs) as runhrs from db_gpsExceptions.t_veh"
											+ rsttrips.getString("VehId") + "_ds where   TheDate >='"
											+ rsttrips.getDate("StartDate") + "' AND TheDate <='" + sysdate2233 + "'";
									if (i == 52) {
									}
									ResultSet rs = st41.executeQuery(sql5);
									if (rs.next()) {
										if (null == rs.getString("runhrs") || rs.getString("runhrs").equalsIgnoreCase("null")) {
											runhrs = 00.00;

										} else {
											runhrs = rs.getDouble("runhrs");
										}
									}
									datadayscount = datadayscount + 1;
									avgrunhrs = runhrs / datadayscount;

									int j1 = 0;
									sql5 = "Select RDurationinHrs  from db_gpsExceptions.t_veh" + rsttrips.getString("VehId")
											+ "_ds where  TheDate >='" + rsttrips.getDate("StartDate") + " "
											+ rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22 + "'";
									if (i == 52) {
									}
									rs = st42.executeQuery(sql5);
									while (rs.next()) {
										if (rs.getDouble("RDurationinHrs") > 10.00) {
											j1++;
										}
									}
									DecimalFormat twoDForm = new DecimalFormat("00.00");

									/* 
									try
									{
									 dt=rstcounts.getDouble(5);
									 dt11=rstcounts.getInt(5);
									}
									catch(Exception e)
									{
										e.printStackTrace();
										System.out.println("Exception= in distance=>"+e);	
										dt=0.00;
										dt11=0;
									} */

									//System.out.println("dt==>" + dt);
									//System.out.println("dt11==>" + dt11);
									/* cntdt+=dt;
									System.out.println("CNTDT====="+cntdt);
									  		 */

									NumberFormat nfrating = NumberFormat.getInstance();
									nfrating.setMaximumFractionDigits(2);
									nfrating.setMinimumFractionDigits(2);

									if (dt > 0.0) {
										try {
											try {
												RD = ((rdcount / dt) * 100);
											} catch (Exception e) {
												e.printStackTrace();
												RD = 0;
											}
											try {
												RA = ((racount / dt) * 100);
											} catch (Exception e) {
												e.printStackTrace();
												RA = 0;
											}
											try {
												OS = ((osduration / dt) * 10);
											} catch (Exception e) {
												e.printStackTrace();
												OS = 0;
											}
											if (dt > 0) {
												rating = RA + RD + OS;
											} else {
											}
										} catch (Exception e) {
											System.out.println("RA+RD+OS=====>");
											e.printStackTrace();
										}
									} else {
									}
									cntrating = rating + cntrating;
									//System.out.println("RA+RD+OS=====>" + RA + "----" + RD + "-----" + OS);

								//	System.out.println("IN OS Avg" + osduration + "" + dt);

									NumberFormat nfos = NumberFormat.getInstance();
									nfos.setMaximumFractionDigits(2);
									nfos.setMinimumFractionDigits(2);

									//int osduration=fleetview.getOSDurationforDateRange(aa,data1,data2);

									if (osduration > 0.0 && dt > 0.0) {
										try {

											//System.out.println("distance --->" + dt);
											try {
												osavg = (osduration * 10) / dt;
											} catch (Exception e) {
												e.printStackTrace();
												osavg = 0;
											}
											//System.out.println("OS avg--->" + osavg);
											//out.print(osavg);
											//out.print(osavg);

										} catch (Exception e) {
											System.out.println("Osduration=====>");
											e.printStackTrace();
										}
									} else {
										osavg = 0.0;
										//out.print(osavg);
									}
									cntavgos += osavg;

									NumberFormat nfra = NumberFormat.getInstance();
									nfra.setMaximumFractionDigits(2);
									nfra.setMinimumFractionDigits(2);
									double raavg = 0.0;

									if (racount > 0 && dt > 0.0) {
										try {

											//System.out.println("RA --->" + racount);
											//System.out.println("dccount---------" + Diccount);
											try {
												raavg = (racount / dt) * 100;
											} catch (Exception e) {
												e.printStackTrace();
												raavg = 0;
											}
											//System.out.println("RA avg--->" + raavg);
											//out.print(raavg);
										} catch (Exception e) {
											System.out.println("RAavg=====>");
											e.printStackTrace();

										}
									} else //if(dt==0.0 && ra>0 ||ra==0) 
									{
										raavg = 0.0;
									}
									cntavgra += raavg;

									NumberFormat nfrd = NumberFormat.getInstance();
									nfrd.setMaximumFractionDigits(2);
									nfrd.setMinimumFractionDigits(2);
									double rdavg = 0.0;

									if (rdcount > 0 && dt > 0.0) {

										try {
											//System.out.println("RD -->" + rdcount);
											try {
												rdavg = (rdcount / dt) * 100;
											} catch (Exception e) {
												e.printStackTrace();
												rdavg = 0;
											}
											System.out.println("RD avg--->" + rdavg);
											//out.print(rdavg);
										} catch (Exception e) {
											rdavg = 0;
											System.out.println("RDavg=====>");
											e.printStackTrace();
										}

									} else //if(dt==0.0 && rd>0 ||rd==0 )
									{
										rdavg = 0.00;
										//cntavgrd+=rdavg;
									}
									cntavgrd += rdavg;

									//System.out.println("DCcount" + cntdisconn);
									String sqldisconn = "Select SUM(Distance) as Distance  from db_gps.t_disconnectionData where vehicleCode='"
											+ rsttrips.getString("VehId") + "' and  OffTimeTo <='" + sysdate22
											+ "' and  OffTimeFrom >='" + rsttrips.getDate("StartDate")
											+ " 00:00:00' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";

									ResultSet rstdis = st43.executeQuery(sqldisconn);

									//System.out.println("Distance of disconnection query is " + sqldisconn);

									diskm = 0;
									while (rstdis.next()) {
										diskm = diskm + rstdis.getInt("Distance");
										//System.out.println("DISKM=====" + diskm);
									}

									String sqlstop = "select sum(DayStopDurationinHrs) as stopduration from db_gpsExceptions."
											+ tbname + " where VehCode='" + rsttrips.getString("VehId") + "' and TheDate <='"
											+ sysdate22 + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " 00:00:00' order by TheDate desc";
									ResultSet rststop = st44.executeQuery(sqlstop);
									if (rststop.next()) {
										stopdur = rststop.getDouble("stopduration");
										double d1 = stopdur;
										DecimalFormat f = new DecimalFormat("##.00");
										totstopdur = totstopdur + rststop.getDouble("stopduration");

									}

									/*  cntdisconn=cntdisconn+rstcounts.getInt(23);
									System.out.println("DCcount"+cntdisconn); */

									String avgspeed = "Select * from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " " + rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22
											+ "' and AvgSpeedConsidered='Yes' ";
								//	System.out.println("avgspeed==>" + avgspeed);
									ResultSet rstavg = st45.executeQuery(avgspeed);
									if (rstavg.next()) {
										avggspeed = "Yes";
									} else {
										avggspeed = "No";

										System.out.println("in NO");
									}

									//System.out.println("datadayscount::" + datadayscount);
				%>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="vendorcol<%=k%>"><%=vendor11%></td>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=datadayscount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>">
					<%
						try {
											String ETime = todatetime;
											long hrs, mins;
											double hrslong = 0.00;
											java.util.Date enddte11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(todatetime);
											java.util.Date strdte11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
													.parse(fromdatetime);
											long x = enddte11.getMinutes();
											long y = strdte11.getMinutes();
											long timediff = enddte11.getTime() - strdte11.getTime();//msec
											long mins11 = timediff / 1000 / 60;
											if (mins11 >= 60) {
												hrdiff = mins11 / 60;//2
												if ((y > x) && (x != 0)) {
													mins = y - x;
													mins = 60 - mins;
													out.print(hrdiff + ":" + mins);
												//	System.out.println("IF-----------------" + hrdiff + ":" + mins);
												} else if ((x > y) && (y != 0)) {
													mins = x - y;
													out.print(hrdiff + ":" + mins);
												//	System.out.println("ELSEIF-----------------" + hrdiff + ":" + mins);

												} else if (x == y) {
													mins = x - y;
													out.print(hrdiff + ":" + mins);
													//System.out.println("ELSEIF2-----------------" + hrdiff + ":" + mins);

												} else if ((x == 0) && (y > x)) {
													mins = 60 - y;
													out.print(hrdiff + ":" + mins);
													//System.out.println("ELSEIF3-----------------" + hrdiff + ":" + mins);

												} else if (y == 0) {
													mins = x + y;
													out.print(hrdiff + ":" + mins);
													//System.out.println("ELSEIF4-----------------" + hrdiff + ":" + mins);

												}

											}

											String enddte = enddte11 + " " + ETime;
											String strtdte = strdte11 + " " + STime;
											long tmeinmils = enddte11.getTime() - strdte11.getTime();
											long hours = tmeinmils / (1000 * 60 * 60);
											String extractstrtminutes = STime.substring(3, 5);
											String extractendminutes = ETime.substring(3, 5);
											int totmins = Integer.parseInt(extractstrtminutes)
													+ Integer.parseInt(extractendminutes);

											if (totmins >= 60) {

												hrdiff = hrdiff + 1;
												totmins = totmins - 60;
											}

										} catch (Exception e) {

										}
					%>
				</td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=twoDForm.format(runhrs)%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=twoDForm.format(avgrunhrs)%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=Runhrcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=oscount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=osduration%></td>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=racount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=rdcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=dv%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cdcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=ndcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cntnd12%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=ndduration%></td>
				<%-- <td style="text-align: left;background-color:<%=bgcolor1%>" id="cmtcol<%=k%>"><%=nddist%></td>
		     <td style="text-align: left;background-color:<%=bgcolor1%>" id="cmtcol<%=k%>"><%=ndduration%></td> --%>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cntdisconn%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=diskm%></td>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=avggspeed%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cntst%></td>
				<%--      <td style="text-align: left;background-color:<%=bgcolor1%>" id="cmtcol<%=k%>"><%=cntst%></td>
		 --%>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=violationcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=nfrating.format(cntrating)%></td>
<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=enteredBy%></td>
<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=endedby1%></td>

			</tr>
			<%
				osduration = 0;
								cntdisconn = 0;
								dt = 0.0;
								cntnd12 = 0;
								cntdt = 0;

								cntrating = 0.0;
								cntst = 0;
							}
							j++;

						
							
						}
						}
						
						else
						{
							//stst="Running";
							sql = "select * from db_gps.t_startedjourney where  TripID='"+tripp+"' order by concat(StartDate,' ',StartTime)";
									System.out.println("\n\n started journey query-->>" + sql);
							ResultSet rsttrips = st.executeQuery(sql);

							while (rsttrips.next()) {
								
								String sqql = "select vehtype from db_gps.t_vehicledetails where VehicleRegNumber='"+rsttrips.getString("VehRegNo")+"' and status='-' ";
								System.out.println(">>>>>>>sqql>>>>>>>>n " + sqql);

								ResultSet rstttrips = stt.executeQuery(sqql);

								if (rstttrips.next()) {
									 vehtype = rstttrips.getString("vehtype");

								}
								k++;
								i++;
								String trip = rsttrips.getString("Tripid");
bgcol=rsttrips.getString("tripcolor");
								DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

								Calendar now123 = Calendar.getInstance();
								String sysdate22 = "";
								String sysdate221 = dateFormat.format(now123.getTime());
								System.out.println(">>>>>>>>>>>>>>>n " + sysdate22);
								String tripstartdate = "";

								String sysdate = "";
								String systime = "";
								String sysdate2233 = new SimpleDateFormat("yyyy-MM-dd")
										.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sysdate221));
								System.out.println(">>>>>>>>>>>>>>>nsysdate2233 " + sysdate2233);

								/* String sql211="select Vehid,TripID,StartDate,StartTime from db_gps.t_startedjourney where Vehid='"+rsttrips.getString("VehId")+"'"; 
								ResultSet rs211=st23.executeQuery(sql211);
								//System.out.println(">>>>>>>rrrrrrrrr1" +sql2);
								if(rs211.next())
								{
									//racount=rs211.getInt("racount");
								}
								*/

								String sql222 = "select StartDate,StartTime,TripID,JStatus from db_gps.t_startedjourney where Vehid='"
										+ rsttrips.getString("VehId")
										+ "' and  (JStatus='Running' OR JStatus='tobeclosed' OR JStatus='completed') and concat(startdate,' ',starttime) > '"
										+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
										+ "' order by StartDate,StartTime  limit 1";

								// String sql222="select StartDate,StartTime,TripID from db_gps.t_startedjourney where Vehid='"+rsttrips.getString("VehId")+"' and  JStatus='Running' OR JStatus='tobeclosed' OR JStatus='completed' and   concat(startdate,' ',starttime)<='"+rsttrips.getDate("StartDate")+" "+rsttrips.getTime("StartTime")+"' order by rid desc limit 1"; 
								ResultSet rs222 = st57.executeQuery(sql222);
								System.out.println(">>>>>>>rrrrrrrrr222" + sql222);
								if (rs222.next()) {
									trip1 = rs222.getString("TripId");
									sysdate = rs222.getString("StartDate");
									systime = rs222.getString("StartTime");

									System.out.println("Trip---" + trip + " Trip1" + trip1);

									if (trip.equalsIgnoreCase(trip1)) {
										trip = rsttrips.getString("Tripid");
										sysdate22 = dateFormat.format(now123.getTime());

										System.out.println("In If Loop>>>trip" + trip + "sysdate22" + sysdate22);
										//sysdate223=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sysdate22));

									} else {
										trip = trip1;
										sysdate22 = sysdate + " " + systime;
										//System.out.println("In Else>>>trip"+sysdate+" "+systime);
										System.out.println("In Else>>>trip" + trip + "sysdate22" + sysdate22);

									}
									//racount=rs222.getInt("racount");
								}

								sysdate22 = dateFormat.format(now123.getTime());

								try {
									String sql22 = "select count( * ) as racount from db_gpsExceptions.t_vehall_ra where VehCode ='"
											+ rsttrips.getString("VehId") + "'  AND TheDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND TheDatetime <= '" + sysdate22 + "'";
									ResultSet rs22 = st25.executeQuery(sql22);
									System.out.println(">>>>>>>rrrrrrrrr1" + sql22);
									if (rs22.next()) {
										racount = rs22.getInt("racount");
									}

									String sql33 = "select count( * ) as rdcount from db_gpsExceptions.t_vehall_rd where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND TheDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND TheDatetime <= '" + sysdate22 + "'";
									ResultSet rs33 = st26.executeQuery(sql33);
									System.out.println(">>>>>>>rrrrrrrr2" + sql33);
									if (rs33.next()) {
										rdcount = rs33.getInt("rdcount");
									}

									String sql55 = "select count( * ) as cdcount from db_gpsExceptions.t_vehall_crcopy where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND FromDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND FromDatetime <= '" + sysdate22 + "'";
									ResultSet rs55 = st27.executeQuery(sql55);
									System.out.println(">>>>>>>rrrrrrr3" + sql55);
									if (rs55.next()) {
										cdcount = rs55.getInt("cdcount");
									}

									String sql66 = "select count( * ) as ndcount from db_gpsExceptions.t_vehall_nd where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND FromDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND FromDatetime <= '" + sysdate22 + "'";
									ResultSet rs66 = st28.executeQuery(sql66);
									System.out.println(">>>>>>>rrrrrrrrr4" + sql66);
									if (rs66.next()) {
										ndcount = rs66.getInt("ndcount");
									}

									String sql77 = "select count( * ) as oscount from db_gpsExceptions.t_vehall_overspeed where VehCode = '"
											+ rsttrips.getString("VehId") + "'  AND FromDatetime >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' AND FromDatetime <= '" + sysdate22 + "'";
									ResultSet rs77 = st29.executeQuery(sql77);
									System.out.println(">>>>>>>rrrrrrrrr5" + sql77);
									if (rs77.next()) {
										oscount = rs77.getInt("oscount");
									}

									String sqlDic = "select count( * ) as Diccount from db_gps.t_disconnectionData where vehicleCode='"
											+ rsttrips.getString("VehId")
											+ "' AND Duration>='0:30' and Reason ='Disconnection' and ignoredstamp='no'  and ((OffTimeFrom >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "'  and OffTimeFrom<='" + sysdate22 + "') or (OffTimeTo >='"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "'  and OffTimeTo<='" + sysdate22 + "') or (OffTimeFrom <='"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' and OffTimeTo >='" + sysdate22 + "')) ";
									ResultSet rsdic = st30.executeQuery(sqlDic);
									System.out.println(">>>>>>>rrrrrrrrr7" + sqlDic);
									if (rsdic.next()) {
										Diccount = rsdic.getInt("Diccount");
									}

									String sqlRunhr = "select count( * ) as Runhrcount from db_gpsExceptions.t_vehall_ds where vehcode ='"
											+ rsttrips.getString("VehId") + "' and RDuration > '10:00:00'  AND thedate >= '"
											+ rsttrips.getDate("StartDate") + "' AND thedate <= '" + sysdate22 + "'";
									ResultSet rsRun = st31.executeQuery(sqlRunhr);
									System.out.println(">>>>>>>rrrrrrrrr8" + sqlRunhr);
									if (rsRun.next()) {
										Runhrcount = rsRun.getInt("Runhrcount");
									}
									String sql11 = "select Tripid from db_gps.t_startedjourney where  Tripid = '" + trip
											+ "' and (OwnerName='" + session.getAttribute("usertypevalue").toString()
											+ "' OR GPName='" + session.getAttribute("usertypevalue").toString()
											+ "' OR Vendor='" + session.getAttribute("usertypevalue").toString() + "') ";
									ResultSet rs17 = st32.executeQuery(sql11);
									if (rs17.next()) {
										violationcount = racount + rdcount + cdcount + ndcount + oscount + Diccount
												+ Runhrcount;
										System.out.println(">>>>>>>sum++------------" + violationcount);
									} else {
										violationcount = 0;

									}

								} catch (Exception e) {
									violationcount = 0;
								}

								//sum=oscount+racount+rdcount+ndcount+Diccount;

								System.out.println(">>>>>>>sum------------" + violationcount);

								comments = rsttrips.getString("Loadcomments");
								totKm = rsttrips.getDouble("FIxedKM");
								tTime = rsttrips.getLong("FIxedTime");
								gpname1 = rsttrips.getString("GPName");
								ETA1 = rsttrips.getString("ETA");
								ETADate = ETA1;
								if (!(null == ETA1)) {
									ETA1 = new SimpleDateFormat("dd-MMM-yyyy HH:MM:SS")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETA1));
								}
								String curpos = "", lat = "", lon = "";
								kmrundist = 0;
								kmrun1 = 0;
								kmrun2 = 0;
								String vehno = rsttrips.getString("VehRegNo");
								sql = "select * from t_onlinedata where VehicleCode='" + rsttrips.getString("VehId") + "'";
								ResultSet rs1 = st1.executeQuery(sql);
								try {
									if (rs1.next()) {
										curpos = rs1.getString("Location");
										temptime = rs1.getString("TheTime");
										updtetime = new SimpleDateFormat(dateformat)
												.format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("TheDate")))
												+ " " + rs1.getString("TheTime");
										lat = rs1.getString("LatitudePosition");
										lon = rs1.getString("LongitudePosition");
									}
								} catch (Exception exc) {
									exc.printStackTrace();
								}

								try {
									sql = "select Distance from t_veh" + rsttrips.getString("VehId")
											+ " where TheFieldDataDateTime between '" + rsttrips.getString("StartDate")
											+ " " + rsttrips.getString("StartTime") + "' AND '" + today + " " + currenttime
											+ "' and TheFiledTextFileName='SI' order by TheFieldDataDateTime asc limit 1";
									ResultSet rstkmrun1 = st1.executeQuery(sql);
									if (rstkmrun1.next()) {
										kmrun1 = rstkmrun1.getInt("Distance");
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
								try {
									sql = "select Distance from t_veh" + rsttrips.getString("VehId")
											+ " where TheFieldDataDateTime between '" + rsttrips.getString("StartDate")
											+ " " + rsttrips.getString("StartTime") + "' AND '" + today + " " + currenttime
											+ "' and TheFiledTextFileName='SI' order by TheFieldDataDateTime desc limit 1";
									ResultSet rstkmrun2 = st1.executeQuery(sql);
									if (rstkmrun2.next()) {
										kmrun2 = rstkmrun2.getInt("Distance");
									}
								} catch (Exception e1) {
									e1.printStackTrace();
								}
								try {
									long myMilisec;
									sql = "select * from db_gps.t_startedjourney where StartDate='"
											+ rsttrips.getDate("StartDate") + "'and StartTime='"
											+ rsttrips.getTime("StartTime") + "' and StartCode='"
											+ rsttrips.getString("StartCode") + "' and EndCode='"
											+ rsttrips.getString("EndCode") + "' and Vehid=" + rsttrips.getString("VehId")
											+ "";
									ResultSet rstTotKm = st3.executeQuery(sql);
									if (rstTotKm.next()) {
										sql3 = "select * from db_gps.t_castrolroutes where StartPlace = '"
												+ rsttrips.getString("StartPlace") + "' and EndPlace = '"
												+ rsttrips.getString("EndPlace") + "' || EndPlace = '"
												+ rsttrips.getString("StartPlace") + "' and StartPlace = '"
												+ rsttrips.getString("EndPlace") + "' limit 1 ";
										ResultSet rst123 = st4.executeQuery(sql3);
										if (totKm == 0 && tTime == 0)
											if (rst123.next()) {
												totKm = rst123.getDouble("Km");
												tTime = rst123.getLong("TTime");
											}
									}
									
System.out.println("KM Run 1 "+kmrun2);
									
									System.out.println("KM Run 2 "+kmrun1);
									
									kmrundist = kmrun2 - kmrun1; //Finding tot run km by vehicle after trip started.

									remKm = totKm - kmrundist;
									// Adding todays km also
									if (kmrundist >= 0) {
										kmrundist = kmrundist;
									} else {
										kmrundist = 0;
									}
									myMilisec = (tTime * 60 * 60 * 1000);
									if (!(null == ETADate)) {
										ETADate = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
												.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETADate));
										DisDate = ETADate;
									} else {
										if (myMilisec != 0) {
											java.util.Date resultdate = new java.util.Date();
											SimpleDateFormat sdftimemilli = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
											Date startDtTm = sdftimemilli.parse(rsttrips.getString("StartDate") + " "
													+ rsttrips.getString("StartTime"));
											long start = startDtTm.getTime();
											long totdate = start + myMilisec;
											resultdate.setTime(totdate);
											DisDate = new SimpleDateFormat(dateformat + " HH:mm:ss").format(resultdate);
										} else {
											DisDate = "NA";
										}
									}
								} catch (Exception e11) {
									System.out.println("---I am in exception--kmrundist-");
									e11.printStackTrace();
								}

								sdate = rsttrips.getString("Startdate");

								String STime = rsttrips.getString("StartTime");
								try {
									fromdate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdate));
									fromdate = fromdate + " " + STime;
									fromdatetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdate)) + " " + STime;
								} catch (Exception e) {
									fromdate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd").parse(sdate));
									fromdate = fromdate + " " + STime;
								}

								try {

									java.util.Date sdt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(fromdate);
									ftime1 = "" + sdt.getHours();
									ftime2 = "" + sdt.getMinutes();
									ftime3 = "" + sdt.getSeconds();
									;
								}

								catch (Exception e) {
									ftime1 = "00";
									ftime2 = "00";
									ftime3 = "00";
								}
								edate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
								try {
									todate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(edate));
								} catch (Exception e) {
									todate = new SimpleDateFormat("yyyy-MM-dd")
											.format(new SimpleDateFormat("yyyy-MM-dd").parse(edate));
								}
								try {
									java.util.Date edt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(edate);
									ttime1 = "" + edt.getHours();
									ttime2 = "" + edt.getMinutes();
									ttime3 = "" + edt.getSeconds();
								} catch (Exception e) {
									ttime1 = "23";
									ttime2 = "59";
									ttime3 = "59";
								}
								if (updtetime.equalsIgnoreCase("NA") || DisDate.equalsIgnoreCase("NA")) {
									//System.out.println("\n\n in NA");
									bgcolor1 = "";
									bgcolor2 = "";
								} else {
									try {
										sttdate = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
												.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
														.parse(rsttrips.getString("StartDate")));
									} catch (Exception ee) {
										sttdate = new SimpleDateFormat("dd-MMM-yyyy").format(
												new SimpleDateFormat("yyyy-MM-dd").parse(rsttrips.getString("StartDate")))
												+ " " + rsttrips.getString("StartTime");
									}
									SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
									Date date1 = sdf1.parse(updtetime);
									Date date2 = sdf1.parse(sttdate);
									Date date3 = sdf1.parse(DisDate);
									float timdiff = 0, avg;
									long msec = date1.getTime() - date2.getTime();
									timdiff = (float) (msec / 1000 / 60 / 60);
									avg = (kmrundist / timdiff);
									if (date1.compareTo(date3) > 0) {
									} else {
									}
								}
			%>
			<%
				//System.out.println("\n\n color value-->>" + request.getParameter("colorvalue"));
								//System.out.println("\n\n bgcolor value-->>" + bgcolor2);
			%>
			<tr>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="src1col<%=k%>"><%=i%></td>
				<td WIDTH="6%" id="vehcol<%=k%>"
					style="background-color:<%=bgcolor1%>"><div align="right">
					
					
					
 <%=rsttrips.getString("VehRegNo")%></td>
 <td style="text-align: left; display: none"><%=rsttrips.getString("TripId")%></td>
<td>
<div align="right"  >
<font size="10">
<a href="javascript:toggleDetails(<%=i%>,true);" title="Click To See the Reports"><font size="2"><%=rsttrips.getString("TripId")%></font></a> </font><br />
<div class="popup" id="popup<%=i%>">
<table border="1" bgcolor="white">

<tr>
									<td>
										<%
											String briefid = "", rid = "", plannedstatus = "No";
															boolean flag = false;
															sql1 = "select * from db_gps.t_briefing where tripid = '" + rsttrips.getString("TripId")
																	+ "'";
															rs1 = st1.executeQuery(sql1);
															if (rs1.next()) {
																briefid = rs1.getString("Briefid");
															}
															sql1 = "select * from db_gps.t_intermediatejrmroute where  Tripid = '"
																	+ rsttrips.getString("TripId") + "' and briefid = '" + briefid
																	+ "' and driverid = '" + rsttrips.getString("DriverCode")
																	+ "'  order by advancedtrackid asc ,row asc limit 1 ";
															rs1 = st1.executeQuery(sql1);
															//System.out.println("\n\n in t_intermediatejrmroute" + sql1);
															if (rs1.next()) {
																rid = rs1.getString("advancedrouteid");
																plannedstatus = "Yes";
																flag = true;
															}
										%> <a
										href="ActAndPlanJrnyCompOnMap.jsp?tripid=<%=rsttrips.getString("TripId")%>&vehcode=<%=rsttrips.getString("VehId")%>&data=<%=rsttrips.getString("StartDate")%>&data1=<%=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>&ftime1=<%=ftime1%>&ftime2=<%=ftime2%>&ftime3=<%=ftime3%>&ttime1=<%=ttime1%>&ttime2=<%=ttime2%>&ttime3=<%=ttime3%>&pg=cm&pstatus=<%=plannedstatus%>&brifid=<%=briefid%>&rid=<%=rid%>&driverid=<%=rsttrips.getString("DriverCode")%>"
										onclick="javascript:toggleDetails(<%=j%>,false);">Show
											Trip On Map</a>
									</td>
								</tr>

<%
									if (gpname1.equalsIgnoreCase("Castrol")) {
													} else {
														String tripflag = "true";
													//	System.out.println("\n\n in castrol");
														String strdate12 = rsttrips.getString("StartTime");
													//	System.out.println("\n\n in NA 1");

														if (strdate12 == null) {

														} else {

															strdate12 = new SimpleDateFormat("HH:mm:ss")
																	.format(new SimpleDateFormat("HH:MM:SS").parse(strdate12));
														}
														//System.out.println("\n\n in NA 2");
														String ETA = "";
														String NA = "NA";
														ETA = DisDate;
														//System.out.println("\n\nETA " + ETA);

														//System.out.println("\nNA " + NA);
														if (ETA.equalsIgnoreCase(NA)) {
															//System.out.println("\n\n in NA 3");
															ETA = null;
														} else {
															//System.out.println("\n\n in NA 4");
															ETA = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
																	.format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(DisDate));
															//System.out.println("\n\n in ETA" + ETA);

														}
								%>
								<tr>
									<td><a
										href="edittrip.jsp?vehno=<%=rsttrips.getString("VehRegNo")%>&ReportDateTime=<%=rsttrips.getString("ReportDateTime")%>&strloc=<%=rsttrips.getString("StartPlace")%>&StartTime=<%=rsttrips.getString("StartTime")%>
						   					&ETA=<%=ETA%>&endp=<%=rsttrips.getString("EndPlace")%>&driverid=<%=rsttrips.getString("DriverCode")%>&drivern=<%=rsttrips.getString("DriverName")%>&tripid=<%=rsttrips.getString("Tripid")%>&tripflag=<%=tripflag%>">Edit Trip </a></td>
								</tr>
								
								
								<%} %>
								<tr><td>
								 <a href="detailed_report1.jsp?vehcode=<%=rsttrips.getString("VehId")%>&fromdata=<%=rsttrips.getString("StartDate")%> <%=rsttrips.getString("StartTime") %>&tripid=<%=rsttrips.getString("Tripid")%>&todata=<%=dtt1%>&status=Open">Detail Report</a></td>
								
								</tr>
								<tr>
									<td><a href="javascript:toggleDetails(<%=j%>,true);"
										onclick="javascript:window.open ('CancelTrip.jsp?vehno=<%=rsttrips.getString("VehRegNo")%>&tripid=<%=rsttrips.getString("Tripid")%>','win3','scrollbars=1,resizeable=0,width=300,height=300');";>Cancel
											Trip</a></td>
								</tr>
								<tr>
									<td><a href="javascript: false"
										onclick="javascript:window.open('endtrip.jsp?tripid=<%=rsttrips.getString("Tripid")%>&vehcode=<%=rsttrips.getString("VehId")%>&vehno=<%=rsttrips.getString("VehRegNo")%>&pageflag=<%=pageflag%>','','menubar=1,resizable=2,width=900,height=700,location=no');">End
											Trip</a></td>
								</tr>

<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
</table>
</div> </div></td>
<td id="ownercol<%=k%>"><%=rsttrips.getString("loadstatus")%></td>
<td id="ownercol<%=k%>"><%=rsttrips.getString("JStatus")%></td>

<td id="ownercol<%=k%>"><%=vehtype%></td>

				<%
				String tripcol=rsttrips.getString("tripcolor");
				if(bgcol=="Amber" || bgcol.equalsIgnoreCase("Amber"))
				{
					//System.out.println("bgcol::"+bgcol);

					bgcol="orange";
				}
				else if(bgcol=="" || bgcol.equalsIgnoreCase("-"))
				{
					bgcol="Gray";
					tripcol="No Data";
				}
				else
				{
					bgcol=bgcol;

				}
				%>
				<td style="color:<%=bgcol%>"
					id="ownercol<%=k%>"><%=tripcol%></td>
					<%-- 	<div class="popup" id="popup1<%=j%>">
							<table border="1" bgcolor="white">
								<tr>
									<td><a
										href="detailed_report1.jsp?vehcode=<%=rsttrips.getString("VehId")%>&fromdata=<%=rsttrips.getString("StartDate")%> <%=rsttrips.getString("StartTime") %>&todata=<%=dtt1%>"
										onclick="toggleDetails1(<%=j%>,false);">Custom Detail
											Report </a></td>

								</tr>
								<tr>
									<td><a href="javascript:toggleDetails1(<%=j%>,false);">Close</a></td>
								</tr>
							</table>
						</div>
					</div> --%>
				<%
					try {
										sqlveh = "Select VehDesc,VehModel,VehType1 from t_vehicledetails where VehicleRegNumber='"
												+ rsttrips.getString("VehRegNo") + "' and status='-' order by VehicleRegNumber";
										ResultSet rstveh = stveh.executeQuery(sqlveh);
										//System.out.println("veh desc open" + sqlveh);
										if (rstveh.next()) {
											vehdesc1 = rstveh.getString("VehDesc");
											if (vehdesc1 == null || vehdesc1.equalsIgnoreCase("null")) {
												vehdesc1 = "-";
											}
											vehmodel1 = rstveh.getString("VehModel");
											if (vehmodel1 == null || vehmodel1.equalsIgnoreCase("null")) {
												vehmodel1 = "-";
											}
											vehtype1 = rstveh.getString("VehType1");
											if (vehtype1 == null || vehtype1.equalsIgnoreCase("null")) {
												vehtype1 = "-";
											}
										} else {
											vehdesc1 = "-";
											vehmodel1 = "-";
											vehtype1 = "-";
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
				%>
				<td style="background-color:<%=bgcolor1%>" id="desccol<%=k%>"><%=vehdesc1%></td>
				<td style="background-color:<%=bgcolor1%>" id="modcol<%=k%>"><%=vehmodel1%></td>
				<td style="background-color:<%=bgcolor1%>" id="typecol<%=k%>"><%=vehtype1%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="ownercol<%=k%>"><%=rsttrips.getString("OwnerName")%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="ownercol<%=k%>"><%=rsttrips.getString("GPName")%></td>

				<td style="background-color:<%=bgcolor1%>"
					id="updtetmecol<%=j%><%=k%>"><div align="right"><%=updtetime%>
					</div></td>
				<td WIDTH="8%" style="background-color:<%=bgcolor1%>"
					id="curposcol<%=j%><%=k%>"><div align="left">
						<a
							href="shownewmap.jsp?lat=<%=lat%>&long=<%=lon%>&discription=<%="<b>" + vehno + "</b><br>"%><%=curpos%>"
							onclick="popWin = open('shownewmap.jsp?lat=<%=lat%>&long=<%=lon%>&discription=<%="<b>" + vehno + "</b><br>"%><%=curpos%>','myWin','width=500,height=500');popWin.focus();return false">
							<%=curpos%>
						</a>
					</div></td>
				<td style="background-color:<%=bgcolor1%>" id="drivcol<%=j%><%=k%>"><div
						align="left"><%=rsttrips.getString("DriverName") + "(" + rsttrips.getString("DriverCode") + ")"%></div></td>
				<td style="background-color:<%=bgcolor1%>"
					id="stplacecol<%=j%><%=k%>"><div align="left"><%=rsttrips.getString("StartPlace")%></div></td>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="stdatecol<%=j%><%=k%>">
					<%
						try {
											out.print(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
													.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
															.parse(rsttrips.getString("StartDate"))));
										} catch (Exception ee) {
											out.print(new SimpleDateFormat("dd-MMM-yyyy").format(
													new SimpleDateFormat("yyyy-MM-dd").parse(rsttrips.getString("StartDate")))
													+ "<br>" + rsttrips.getString("StartTime"));
										}

										//ETA Delay

										String FinalStart = "", FinalEnd = "";
										try {
											FinalStart = rsttrips.getString("StartDate") + " " + "00:00:00";

										} catch (Exception ee) {
											// FinalStart=rsttrips.getString("StartDate")+" "+STime;
										}

										try {
											FinalEnd = rsttrips.getString("ETA");
										} catch (Exception ee) {
											// FinalEnd=rsttrips.getString("EndDate")+" "+ETime;

										}

										//System.out.println("FinalStart: " + FinalStart);
										//System.out.println("FinalEnd: " + FinalEnd);

										String ETA123 = "", FinalStart123 = "";

										if (FinalStart == null) {
											FinalStart123 = "-";
										} else {

											FinalStart123 = new SimpleDateFormat("dd MM yyyy")
													.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(FinalStart));

										}

										if (FinalEnd == null) {
											ETA123 = "-";
										}

										else {
											ETA123 = new SimpleDateFormat("dd MM yyyy")
													.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(FinalEnd));

										}
										//System.out.println("FinalStart123: " + FinalStart123);

										SimpleDateFormat myFormat = new SimpleDateFormat("dd MM yyyy");
										String dateBeforeString = FinalStart123;
										String dateAfterString = ETA123;

										try {
											Date dateBefore = myFormat.parse(dateBeforeString);
											Date dateAfter = myFormat.parse(dateAfterString);
											long difference = dateAfter.getTime() - dateBefore.getTime();
											daysBetween = (difference / (1000 * 60 * 60 * 24));
											/* You can also convert the milliseconds to days using this method
											 * float daysBetween = 
											 *         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
											 */
											//System.out.println("Number of Days ETA ETA date Days: " + daysBetween);
										} catch (Exception e) {
											e.printStackTrace();
			  							}

										String Curdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());

										String ETAsysdate123 = new SimpleDateFormat("dd MM yyyy")
												.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Curdate));

										try {
											Date dateBefore1 = myFormat.parse(FinalStart123);
											Date dateAfter1 = myFormat.parse(ETAsysdate123);
											long difference1 = dateAfter1.getTime() - dateBefore1.getTime();
											daysBetween1 = (difference1 / (1000 * 60 * 60 * 24));
											/* You can also convert the milliseconds to days using this method
											 * float daysBetween = 
											 *         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
											 */
										//	System.out.println("Number of Days ETA With Current Days: " + daysBetween1);
										} catch (Exception e) {
											e.printStackTrace();
										}

										FinalETADelayDays = daysBetween1 - daysBetween;
										//System.out.println("FinalETADelayDays--------------------------: " + FinalETADelayDays);

										if (FinalETADelayDays > 0.0) {
											FinalETADelayDays = FinalETADelayDays;
										} else {
											FinalETADelayDays = 0;

										}

										int finaletadelay = Math.round(FinalETADelayDays); // 3
					%>
				</td>
				<td style="background-color:<%=bgcolor1%>"
					id="endplacecol<%=j%><%=k%>"><div align="left"><%=rsttrips.getString("EndPlace")%></div></td>
				<td style="background-color:<%=bgcolor1%>" id="etacol<%=j%><%=k%>"><div
						align="right"><%=DisDate%>
					</div></td>
				<td style="background-color:<%=bgcolor1%>" id="etacol<%=j%><%=k%>"><div
						align="right"><%=finaletadelay%></div></td>

				<%
					if (tTime == 0 && totKm == 0) {
				%>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="FixedTimecol<%=k%>"><br>NA</td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="FixedKmcol<%=k%>"><br>NA</td>
				<%
					} else {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="FixedTimecol<%=k%>"><br> <%=tTime%></td>
				<%
					System.out.println("FixedTIme----->" + tTime);
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="FixedKmcol<%=k%>"><br> <%=twoDForm1.format(totKm)%></td>
				<%
					System.out.println("FixedKm----->" + totKm);
				%>
				<%
					}
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmsruncol<%=k%>"><%=kmrundist%></td>
				<%
					if (tTime == 0 && totKm == 0) {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmstoruncol<%=k%>"><div align="left">NA</div></td>
				<%
					} else {
										if (remKm >= 0) {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmstoruncol<%=k%>"><%=twoDForm1.format(remKm)%></td>
				<%
					} else {
				%>
				<td style="text-align: right;background-color:<%=bgcolor1%>"
					id="kmstoruncol<%=k%>">0</td>

				<%
					}
									}
				%>
				<%
					sqlopen = "Select EndedBy,Weight,Vendor,JStatus,ReportDateTime,Frieght,Advance,TripCategory from db_gps.t_startedjourney where tripid='"
											+ rsttrips.getString("Tripid") + "'";
									ResultSet rssopen = stopen.executeQuery(sqlopen);
									if (rssopen.next()) {
										
										endedby1 = rssopen.getString("EndedBy");
										if(endedby1.equals("-") && rssopen.getString("JStatus").equals("Completed"))
										{
											endedby1="Auto";
										}
										
										weight1 = rssopen.getString("Weight");
										if (weight1 == null || weight1.equalsIgnoreCase("null")) {
											weight1 = "-";
										}
										vendor11 = rssopen.getString("Vendor");

										if (vendor11.equalsIgnoreCase("select") || vendor11 == null
												|| vendor11.equalsIgnoreCase("null")) {
											vendor11 = "-";
										}
										tripcat1 = rssopen.getString("TripCategory");
										if (tripcat1.equalsIgnoreCase("select") || tripcat1 == null
												|| tripcat1.equalsIgnoreCase("null")) {
											tripcat1 = "-";
										}
										freight1 = rssopen.getString("Frieght");
										if (freight1 == null || freight1.equalsIgnoreCase("null")) {
											freight1 = "-";
										}
										adv1 = rssopen.getString("Advance");
										if (adv1 == null || adv1.equalsIgnoreCase("null")) {
											adv1 = "-";
										}
									} else {
										endedby1 = "-";
										weight1 = "-";
										vendor11 = "-";
										tripcat1 = "-";
										freight1 = "-";
										adv1 = "-";

									} //out.println("Mila");
								//	System.out.println(											"Sum Violations----------------------------------------- " + violationcount);
									//New Paramater Addeed For Posco
									try {
										todatetime = sysdate22;
										fromdatetime = rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime");
									} catch (Exception e) {
										todatetime = sysdate22;
										fromdatetime = rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime");

									}

									String sqlND = "select SUM(Distance) as distance,Sum(Time_to_Sec(Duration)) as duration from db_gpsExceptions.t_veh"
											+ rsttrips.getString("VehId") + "_nd where concat(FromDate,' ',FromTime) >= '"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' and concat(FromDate,' ',FromTime)<='" + sysdate22 + "'";
									//System.out.println(k + "ND Distance>>>>>>  ++++++++   " + sqlND);

									ResultSet rsND = st38.executeQuery(sqlND);
									//System.out.println(k + "ND Distance>>>>>> -------    " + sqlND);

									if (rsND.next()) {
										nddist = rsND.getInt("distance");
										ndduration = rsND.getString("duration");
										//System.out.println(nddist + "ND Distance Raw ND Duration>>>>>>     " + ndduration);

										if (ndduration == null || ndduration.equalsIgnoreCase("null")) {
											//System.out.println("ND Distance>>>>>>     " + ndduration);

											ndduration = "00:00";

										} else {
											String rundur = "";
											int min = 0, hrs = 0, min1 = 0;

											min1 = rsND.getInt("duration") / 60;
											hrs = min1 / 60;
											min = min1 % 60;
											int sec = rsND.getInt("duration");
											Date d = new Date(sec * 1000L);
											SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss"); // HH for 0-23
											df.setTimeZone(TimeZone.getTimeZone("GMT"));
											String time = df.format(d);

											if (hrs > 9) {
												rundur = rundur + hrs;
											} else {
												rundur = "0" + hrs;
											}

											if (min > 9) {
												rundur = rundur + ":" + min;
											} else {
												rundur = rundur + ":0" + min;
											}
											ndduration = rundur;
											//System.out.println("ND Duration Min>>>>>>     " + min1);
											//System.out.println("ND Duration Final>>>>>>     " + time);

											//System.out.println(k + "ND Distance Duration>>>>>>     " + ndduration);
										}

									}

									//System.out.println(nddist + " Final ND Distance>>>>>>   " + ndduration);

									String sqlcount111 = "select sum(Duration) as osdur from db_gpsExceptions.t_vehall_overspeed where VehCode='"
											+ rsttrips.getString("VehId") + "' and FromDate >='" + rsttrips.getDate("StartDate")
											+ "' AND ToDate <='" + sysdate2233 + "'";
									ResultSet rstcounts11 = st39.executeQuery(sqlcount111);
									//System.out.println("sqlcount111==>" + sqlcount111);
									while (rstcounts11.next()) {
										osduration = rstcounts11.getInt("osdur");
									}

									//System.out.println("osdur" + osduration);

									String sqlcount12 = "select count(*) as StopCount from db_gpsExceptions.t_vehall_stsp where VehCode='"
											+ rsttrips.getString("VehId") + "' and FromDatetime >='"
											+ rsttrips.getDate("StartDate") + " " + rsttrips.getTime("StartTime")
											+ "' and FromDatetime <='" + sysdate22 + "'";
								//	System.out.println(											">>>>>>>>>>>@@@@@@@@@@<<<<<<<<<<<<<<<<<<  sqlcount---------- " + sqlcount12);

									ResultSet rstcounts12 = stmain1.executeQuery(sqlcount12);
									//System.out.println("sqlcount1==>" + sqlcount12);
									while (rstcounts12.next()) {

										int stsp = rstcounts12.getInt("StopCount");
										cntst = cntst + stsp;
									}

									// String sqlcount="select SUM(OSCount),SUM(RACount),SUM(RDCount),SUM(CRCount),SUM(Distance),SUM(StopCount), SUM(RDuration), SUM(FACount),SUM(FTCount),SUM(RDinSec),SUM(RDurationinHrs),sum(Osduration),sum(FTCount),sum(FACount),sum(FC),AVG(FAVG) as FAVG,sum(NDCount),Sec_To_Time(SUM(Time_To_Sec(NDDurationinHrs))),SUM(Time_To_Sec(NDDurationinHrs)),sum(NDKm),sum(NDIntimation),sum(NDReason),sum(DCCount) from db_gpsExceptions.t_vehall_ds where VehCode='"+rsttrips.getString("VehId")+"' and TheDate >='"+rsttrips.getDate("StartDate")+" "+rsttrips.getTime("StartTime")+"' AND TheDate <='"+sysdate22+"'";

									String sqlcount = "select * from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ "' AND TheDate <='" + sysdate2233 + "'";

									//17 18
									//System.out											.println(">>>>>>>>>>>@@@@@@@@@@<<<<<<<<<<<<<<<<<<  sqlcount---------- " + sqlcount);

									ResultSet rstcounts = stmain1.executeQuery(sqlcount);
									//System.out.println("sqlcount==>" + sqlcount);

									try {
										//String sqlos="SELECT sum(Duration)as duration FROM t_veh"+aa+"_overspeed  where concat(FromDate,' ',FromTime) >='"+data1+" 00:00:00' and ToDate <='"+data2+" 23:59:59' order by concat(FromDate,' ',FromTime)";
										//System.out.println("sqlos--->"+sqlos);
										//ResultSet rstos=st4.executeQuery(sqlos);
										//if(rstos.next())
										//{

										while (rstcounts.next()) {
											//osduration=rstcounts.getDouble("OSDuration");
											/* osduration1=rstcounts.getInt("Osduration");
											osduration=osduration+osduration1; */
											/* System.out.println("DCcount"+cntdisconn);
											System.out.println("OS Duration--->"+osduration); */

											cntdisconn1 = rstcounts.getInt("DCCount");
											cntdisconn = cntdisconn + cntdisconn1;
											//System.out.println("DCcount" + cntdisconn);

											//dt122=rstcounts.getDouble("Distance");
											dt = kmrundist;
											//System.out.println("Distance" + dt);

											cntnd122 = rstcounts.getInt("NDKm");
											cntnd12 = cntnd12 + cntnd122;
											//System.out.println("NDKm" + cntnd12);

											/* int stsp=rstcounts.getInt("StopCount");
											cntst=cntst+stsp; */

											if (cntnd12 > 0) {
												cntndk += cntnd12;

											}

										}
										/* System.out.println(" OS Duration Final--->" + osduration);
										System.out.println("DCcount" + cntdisconn);
										System.out.println("Distance" + dt);
										System.out.println("NDKm" + cntnd12);
										System.out.println("Stop Count" + cntst); */

										cntdt += dt;
										//System.out.println("CNTDT=====" + cntdt);
										//}
									} catch (Exception e) {
										e.printStackTrace();
										System.out.println("Exception>>>>>>>>>>>>>1111:");
									}
									//cntosdur= cntosdur + osduration1;
									//System.out.println("CNTOSDUR====="+cntosdur);

									String sqlcount11 = "select Sec_To_Time(SUM(Time_To_Sec(NDDurationinHrs))) as nddur from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " " + rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22 + "'";
									ResultSet rstcounts1 = st39.executeQuery(sqlcount11);
									//System.out.println("sqlcount==>" + sqlcount11);
									while (rstcounts1.next()) {
										Time = rstcounts1.getString("nddur");
									}

								///	System.out.println("NDDuration" + Time);

									String datadays = "select count(*) as count from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " " + rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22 + "'";
									ResultSet datadaysrs = st40.executeQuery(datadays);
									//System.out.println("datadays====>>>>>" + datadays);

									if (datadaysrs.next()) {
										datadayscount = datadaysrs.getInt("count");
										//System.out.println("DataDaysCount====>>>>>" + datadayscount);
										datadaystotal = datadaystotal + datadayscount;
										//System.out.println("DataDaysCount====>>>>>" + datadaystotal);

									}

									String sql5 = "Select SUM(RDurationinHrs) as runhrs from db_gpsExceptions.t_veh"
											+ rsttrips.getString("VehId") + "_ds where   TheDate >='"
											+ rsttrips.getDate("StartDate") + "' AND TheDate <='" + sysdate2233 + "'";
									if (i == 52) {
									}
									ResultSet rs = st41.executeQuery(sql5);
									if (rs.next()) {
										if (null == rs.getString("runhrs") || rs.getString("runhrs").equalsIgnoreCase("null")) {
											runhrs = 00.00;

										} else {
											runhrs = rs.getDouble("runhrs");
										}
									}
									datadayscount = datadayscount + 1;
									avgrunhrs = runhrs / datadayscount;

									int j1 = 0;
									sql5 = "Select RDurationinHrs  from db_gpsExceptions.t_veh" + rsttrips.getString("VehId")
											+ "_ds where  TheDate >='" + rsttrips.getDate("StartDate") + " "
											+ rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22 + "'";
									if (i == 52) {
									}
									rs = st42.executeQuery(sql5);
									while (rs.next()) {
										if (rs.getDouble("RDurationinHrs") > 10.00) {
											j1++;
										}
									}
									DecimalFormat twoDForm = new DecimalFormat("00.00");

									/* 
									try
									{
									 dt=rstcounts.getDouble(5);
									 dt11=rstcounts.getInt(5);
									}
									catch(Exception e)
									{
										e.printStackTrace();
										System.out.println("Exception= in distance=>"+e);	
										dt=0.00;
										dt11=0;
									} */

									//System.out.println("dt==>" + dt);
									//System.out.println("dt11==>" + dt11);
									/* cntdt+=dt;
									System.out.println("CNTDT====="+cntdt);
									  		 */

									NumberFormat nfrating = NumberFormat.getInstance();
									nfrating.setMaximumFractionDigits(2);
									nfrating.setMinimumFractionDigits(2);

									if (dt > 0.0) {
										try {
											try {
												RD = ((rdcount / dt) * 100);
											} catch (Exception e) {
												e.printStackTrace();
												RD = 0;
											}
											try {
												RA = ((racount / dt) * 100);
											} catch (Exception e) {
												e.printStackTrace();
												RA = 0;
											}
											try {
												OS = ((osduration / dt) * 10);
											} catch (Exception e) {
												e.printStackTrace();
												OS = 0;
											}
											if (dt > 0) {
												rating = RA + RD + OS;
											} else {
											}
										} catch (Exception e) {
											System.out.println("RA+RD+OS=====>");
											e.printStackTrace();
										}
									} else {
									}
									cntrating = rating + cntrating;
									//System.out.println("RA+RD+OS=====>" + RA + "----" + RD + "-----" + OS);

								//	System.out.println("IN OS Avg" + osduration + "" + dt);

									NumberFormat nfos = NumberFormat.getInstance();
									nfos.setMaximumFractionDigits(2);
									nfos.setMinimumFractionDigits(2);

									//int osduration=fleetview.getOSDurationforDateRange(aa,data1,data2);

									if (osduration > 0.0 && dt > 0.0) {
										try {

											//System.out.println("distance --->" + dt);
											try {
												osavg = (osduration * 10) / dt;
											} catch (Exception e) {
												e.printStackTrace();
												osavg = 0;
											}
											//System.out.println("OS avg--->" + osavg);
											//out.print(osavg);
											//out.print(osavg);

										} catch (Exception e) {
											System.out.println("Osduration=====>");
											e.printStackTrace();
										}
									} else {
										osavg = 0.0;
										//out.print(osavg);
									}
									cntavgos += osavg;

									NumberFormat nfra = NumberFormat.getInstance();
									nfra.setMaximumFractionDigits(2);
									nfra.setMinimumFractionDigits(2);
									double raavg = 0.0;

									if (racount > 0 && dt > 0.0) {
										try {

											//System.out.println("RA --->" + racount);
											//System.out.println("dccount---------" + Diccount);
											try {
												raavg = (racount / dt) * 100;
											} catch (Exception e) {
												e.printStackTrace();
												raavg = 0;
											}
											//System.out.println("RA avg--->" + raavg);
											//out.print(raavg);
										} catch (Exception e) {
											System.out.println("RAavg=====>");
											e.printStackTrace();

										}
									} else //if(dt==0.0 && ra>0 ||ra==0) 
									{
										raavg = 0.0;
									}
									cntavgra += raavg;

									NumberFormat nfrd = NumberFormat.getInstance();
									nfrd.setMaximumFractionDigits(2);
									nfrd.setMinimumFractionDigits(2);
									double rdavg = 0.0;

									if (rdcount > 0 && dt > 0.0) {

										try {
											//System.out.println("RD -->" + rdcount);
											try {
												rdavg = (rdcount / dt) * 100;
											} catch (Exception e) {
												e.printStackTrace();
												rdavg = 0;
											}
											System.out.println("RD avg--->" + rdavg);
											//out.print(rdavg);
										} catch (Exception e) {
											rdavg = 0;
											System.out.println("RDavg=====>");
											e.printStackTrace();
										}

									} else //if(dt==0.0 && rd>0 ||rd==0 )
									{
										rdavg = 0.00;
										//cntavgrd+=rdavg;
									}
									cntavgrd += rdavg;

									//System.out.println("DCcount" + cntdisconn);
									String sqldisconn = "Select SUM(Distance) as Distance  from db_gps.t_disconnectionData where vehicleCode='"
											+ rsttrips.getString("VehId") + "' and  OffTimeTo <='" + sysdate22
											+ "' and  OffTimeFrom >='" + rsttrips.getDate("StartDate")
											+ " 00:00:00' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";

									ResultSet rstdis = st43.executeQuery(sqldisconn);

									//System.out.println("Distance of disconnection query is " + sqldisconn);

									diskm = 0;
									while (rstdis.next()) {
										diskm = diskm + rstdis.getInt("Distance");
										//System.out.println("DISKM=====" + diskm);
									}

									String sqlstop = "select sum(DayStopDurationinHrs) as stopduration from db_gpsExceptions."
											+ tbname + " where VehCode='" + rsttrips.getString("VehId") + "' and TheDate <='"
											+ sysdate22 + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " 00:00:00' order by TheDate desc";
									ResultSet rststop = st44.executeQuery(sqlstop);
									if (rststop.next()) {
										stopdur = rststop.getDouble("stopduration");
										double d1 = stopdur;
										DecimalFormat f = new DecimalFormat("##.00");
										totstopdur = totstopdur + rststop.getDouble("stopduration");

									}

									/*  cntdisconn=cntdisconn+rstcounts.getInt(23);
									System.out.println("DCcount"+cntdisconn); */

									String avgspeed = "Select * from db_gpsExceptions.t_vehall_ds where VehCode='"
											+ rsttrips.getString("VehId") + "' and TheDate >='" + rsttrips.getDate("StartDate")
											+ " " + rsttrips.getTime("StartTime") + "' AND TheDate <='" + sysdate22
											+ "' and AvgSpeedConsidered='Yes' ";
								//	System.out.println("avgspeed==>" + avgspeed);
									ResultSet rstavg = st45.executeQuery(avgspeed);
									if (rstavg.next()) {
										avggspeed = "Yes";
									} else {
										avggspeed = "No";

										System.out.println("in NO");
									}

									//System.out.println("datadayscount::" + datadayscount);
				%>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="vendorcol<%=k%>"><%=vendor11%></td>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=datadayscount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>">
					<%
						try {
											String ETime = todatetime;
											long hrs, mins;
											double hrslong = 0.00;
											java.util.Date enddte11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(todatetime);
											java.util.Date strdte11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
													.parse(fromdatetime);
											long x = enddte11.getMinutes();
											long y = strdte11.getMinutes();
											long timediff = enddte11.getTime() - strdte11.getTime();//msec
											long mins11 = timediff / 1000 / 60;
											if (mins11 >= 60) {
												hrdiff = mins11 / 60;//2
												if ((y > x) && (x != 0)) {
													mins = y - x;
													mins = 60 - mins;
													out.print(hrdiff + ":" + mins);
												//	System.out.println("IF-----------------" + hrdiff + ":" + mins);
												} else if ((x > y) && (y != 0)) {
													mins = x - y;
													out.print(hrdiff + ":" + mins);
												//	System.out.println("ELSEIF-----------------" + hrdiff + ":" + mins);

												} else if (x == y) {
													mins = x - y;
													out.print(hrdiff + ":" + mins);
													//System.out.println("ELSEIF2-----------------" + hrdiff + ":" + mins);

												} else if ((x == 0) && (y > x)) {
													mins = 60 - y;
													out.print(hrdiff + ":" + mins);
													//System.out.println("ELSEIF3-----------------" + hrdiff + ":" + mins);

												} else if (y == 0) {
													mins = x + y;
													out.print(hrdiff + ":" + mins);
													//System.out.println("ELSEIF4-----------------" + hrdiff + ":" + mins);

												}

											}

											String enddte = enddte11 + " " + ETime;
											String strtdte = strdte11 + " " + STime;
											long tmeinmils = enddte11.getTime() - strdte11.getTime();
											long hours = tmeinmils / (1000 * 60 * 60);
											String extractstrtminutes = STime.substring(3, 5);
											String extractendminutes = ETime.substring(3, 5);
											int totmins = Integer.parseInt(extractstrtminutes)
													+ Integer.parseInt(extractendminutes);

											if (totmins >= 60) {

												hrdiff = hrdiff + 1;
												totmins = totmins - 60;
											}

										} catch (Exception e) {

										}
					%>
				</td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=twoDForm.format(runhrs)%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=twoDForm.format(avgrunhrs)%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=Runhrcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=oscount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=osduration%></td>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=racount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=rdcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=dv%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cdcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=ndcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cntnd12%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=ndduration%></td>
				<%-- <td style="text-align: left;background-color:<%=bgcolor1%>" id="cmtcol<%=k%>"><%=nddist%></td>
		     <td style="text-align: left;background-color:<%=bgcolor1%>" id="cmtcol<%=k%>"><%=ndduration%></td> --%>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cntdisconn%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=diskm%></td>

				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=avggspeed%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=cntst%></td>
				<%--      <td style="text-align: left;background-color:<%=bgcolor1%>" id="cmtcol<%=k%>"><%=cntst%></td>
		 --%>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=violationcount%></td>
				<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=nfrating.format(cntrating)%></td>
					
					<td style="text-align: left;background-color:<%=bgcolor1%>"
					id="cmtcol<%=k%>"><%=endedby1%></td>



			</tr>
			<%
				osduration = 0;
								cntdisconn = 0;
								dt = 0.0;
								cntnd12 = 0;
								cntdt = 0;

								cntrating = 0.0;
								cntst = 0;
							}
							j++;

					
						
						}
			%>
		</tbody>

		<tfoot>
			<tr>
				<%
				if (statusname.equalsIgnoreCase("Open") || statusname.equalsIgnoreCase("Cancelled"))        
				{						%>

						<th class="hed" id="src1col" valign="top">Sr No</th>
				<th class="hed" id="vehcol" valign="top">Asset ID</th>
				<th align="center" style="display: none">TripID</th>
												<th class="hed" id="tripcol" valign="top">TripID</th>
																		<th class="hed" id="desccol" valign="top">Status</th>
						<th class="hed" id="ownercol" valign="top">JStatus</th>
												<th class="hed" id="ownercol" valign="top">vehtype</th>
										<th class="hed" id="tripcol" valign="top">Trip Color</th>
						
						<th class="hed" id="desccol" valign="top">Desc</th>
						<th class="hed" id="modcol" valign="top">Model</th>
						<th class="hed" id="typecol" valign="top">Type</th>
						<th class="hed" id="ownercol" valign="top">Owner</th>
						<th class="hed" id="ownercol" valign="top">Group</th>

						<th class="hed" id="updtetmecol" valign="top">Updated Dat-Time</th>
						<th class="hed" id="curposcol" valign="top">Current Position</th>
						<th class="hed" id="drivcol" valign="top">Driver</th>
						<th class="hed" id="stplacecol" valign="top">Start Place</th>
						<th class="hed" id="stdatecol" valign="top">Start Date-Time</th>
						<th class="hed" id="endplacecol" valign="top">End Place</th>
						<th class="hed" id="etacol" valign="top">ETA</th>
						<th class="hed" id="etacol" valign="top">ETA Delay</th>

						<th class="hed" id="FixedTimecol" valign="top">FixedTime</th>
						<th class="hed" id="FixedKmcol" valign="top">FixedKm</th>
						<th class="hed" id="kmsruncol" valign="top">Kms run</th>
						<th class="hed" id="kmstoruncol" valign="top">Kms to run</th>

						<th class="hed" id="vendorcol" valign="top">Customer</th>

						<th class="hed" id="cmtcol" valign="top">Trip Days</th>
						<th class="hed" id="cmtcol" valign="top">Trip Time</th>

						<th class="hed" id="cmtcol" valign="top">Run Hrs</th>
						<th class="hed" id="cmtcol" valign="top">Avg hrs/day</th>
						<th class="hed" id="cmtcol" valign="top">Run Hr Violation</th>
						<th class="hed" id="cmtcol" valign="top">OS</th>
						<th class="hed" id="cmtcol" valign="top">OS(sec)</th>

						<th class="hed" id="cmtcol" valign="top">RA</th>
						<th class="hed" id="cmtcol" valign="top">RD</th>
						<th class="hed" id="cmtcol" valign="top">DV</th>
						<th class="hed" id="cmtcol" valign="top">CD</th>
						<th class="hed" id="cmtcol" valign="top">ND</th>
						<th class="hed" id="cmtcol" valign="top">ND Distance</th>
						<th class="hed" id="cmtcol" valign="top">ND Duration</th>
						<th class="hed" id="cmtcol" valign="top">DC</th>
						<th class="hed" id="cmtcol" valign="top">DC Km</th>

						<th class="hed" id="cmtcol" valign="top">AVG Speed</th>
						<th class="hed" id="cmtcol" valign="top">Stops</th>
						<th class="hed" id="cmtcol" valign="top">Violations</th>
						<th class="hed" id="cmtcol" valign="top">Rating</th>
						<th class="hed" id="cmtcol" valign="top">EntryBy</th>
						<th class="hed" id="cmtcol" valign="top">CloseBy</th>
						<%
							}else if(statusname.equalsIgnoreCase("All"))
							{%>
							<th class="hed" id="src1col" valign="top">Sr No</th>
								<th class="hed" id="vehcol" valign="top">Asset ID</th>
								<th align="center" style="display: none">TripID</th>
								<th class="hed" id="tripcol" valign="top">TripID</th>
								<th class="hed" id="desccol" valign="top">Status</th>
								<th class="hed" id="ownercol" valign="top">JStatus</th>
								<th class="hed" id="ownercol" valign="top">VehType</th>		
								<th class="hed" id="tripcol" valign="top">Trip Color</th>		
								<th class="hed" id="desccol" valign="top">Desc</th>
								<th class="hed" id="modcol" valign="top">Model</th>
								<th class="hed" id="typecol" valign="top">Type</th>
								<th class="hed" id="ownercol" valign="top">Owner</th>
								<th class="hed" id="ownercol" valign="top">Group</th>
								<th class="hed" id="updtetmecol" valign="top">Updated Dat-Time</th>
								<th class="hed" id="curposcol" valign="top">Current Position</th>
								<th class="hed" id="curposcol" valign="top" style="display:none">Current Position</th>
								<th class="hed" id="drivcol" valign="top">Driver</th>
								<th class="hed" id="stplacecol" valign="top">Start Place</th>
								<th class="hed" id="stdatecol" valign="top">Start Date-Time</th>
								<th class="hed" id="endplacecol" valign="top">End Place</th>
								<th class="hed" id="enddttime" valign="top">End Date-Time</th>
								<th class="hed" id="etacol" valign="top">ETA</th>
								<th class="hed" id="etacol" valign="top">ETA Delay</th>
								<th class="hed" id="FixedTimecol" valign="top">FixedTime</th>
								<th class="hed" id="FixedKmcol" valign="top">FixedKm</th>
								<th class="hed" id="kmsruncol" valign="top">Kms run</th>
								<th class="hed" id="kmstoruncol" valign="top">Kms to run</th>
								<th class="hed" id="vendorcol" valign="top">Customer</th>
								<th class="hed" id="cmtcol" valign="top">Trip Days</th>
								<th class="hed" id="cmtcol" valign="top">Trip Time</th>
								<th class="hed" id="cmtcol" valign="top">Run Hrs</th>
								<th class="hed" id="cmtcol" valign="top">Avg hrs/day</th>
								<th class="hed" id="cmtcol" valign="top">Run Hr Violation</th>
								<th class="hed" id="cmtcol" valign="top">OS</th>
								<th class="hed" id="cmtcol" valign="top">OS(sec)</th>
								<th class="hed" id="cmtcol" valign="top">RA</th>
								<th class="hed" id="cmtcol" valign="top">RD</th>
								<th class="hed" id="cmtcol" valign="top">DV</th>
								<th class="hed" id="cmtcol" valign="top">CD</th>
								<th class="hed" id="cmtcol" valign="top">ND</th>
								<th class="hed" id="cmtcol" valign="top">ND Distance</th>
								<th class="hed" id="cmtcol" valign="top">ND Duration</th>
								<th class="hed" id="cmtcol" valign="top">DC</th>
								<th class="hed" id="cmtcol" valign="top">DC Km</th>
								<th class="hed" id="cmtcol" valign="top">AVG Speed</th>
								<th class="hed" id="cmtcol" valign="top">Stops</th>
								<th class="hed" id="cmtcol" valign="top">Violations</th>
								<th class="hed" id="cmtcol" valign="top">Rating</th>
								<th class="hed" id="cmtcol" valign="top">EntryBy</th>
								<th class="hed" id="cmtcol" valign="top">CloseBy</th>
					<% 	} else {
				%>
				<th class="hed" id="src1col" valign="top">Sr No</th>
				<th class="hed" id="vehcol" valign="top">Asset ID</th>
				<th align="center" style="display: none">TripID</th>
				<th class="hed" id="desccol" valign="top">TripID</th>
				<th class="hed" id="desccol" valign="top">Status</th>
				<th class="hed" id="ownercol" valign="top">JStatus</th>
				<th class="hed" id="ownercol" valign="top">vehtype</th>
				<th class="hed" id="tripcol" valign="top">Trip Color</th>
				<th class="hed" id="modcol" valign="top">Owner</th>
				<th class="hed" id="typecol" valign="top">StartPlace</th>
				<th class="hed" id="ownercol" valign="top">StartDate-Time</th>
				<th class="hed" id="updtetmecol" valign="top">EndPlace</th>
				<th class="hed" id="curposcol" valign="top">EndDate-Time</th>
				<th class="hed" id="curposcol" valign="top">ETA</th>
				<th class="hed" id="etadelayclosed" valign="top">ETA Delay</th>
				<th class="hed" id="stplacecol" valign="top">StartKm</th>
				<th class="hed" id="stdatecol" valign="top">EndKm</th>
				<th class="hed" id="endplacecol" valign="top">KmTravelled</th>
				<th class="hed" id="etacol" valign="top">UnloadDateTime</th>
				<th class="hed" id="etacol" valign="top">DriverName</th>
				<th class="hed" id="FixedTimecol" valign="top">Vendor</th>
				<th class="hed" id="FixedKmcol" valign="top">OSCount</th>
				<th class="hed" id="kmsruncol" valign="top">RACount</th>
				<th class="hed" id="kmstoruncol" valign="top">RDCount</th>
				<th class="hed" id="cmtcol" valign="top">OSDuration</th>
				<th class="hed" id="cmtcol" valign="top">NDCount</th>
				<th class="hed" id="cmtcol" valign="top">DisconnectionCount</th>
				<th class="hed" id="cmtcol" valign="top">EntryBy</th>
				<th class="hed" id="cmtcol" valign="top">CloseBy</th>
				<%
	}%>
			</tr>
		</tfoot>
		<input type="hidden" name="countt" value="<%=k%>"></input>
		<%


	System.out.println("In Try last");
}

catch(Exception e)
{e.printStackTrace();}
%>



	</table>
	</div>
	</form>
</body>
	</html>
</jsp:useBean>