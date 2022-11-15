<%@ include file="headernew.jsp"%>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page">

	<%
		
	%>
	<html>
<head>
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




<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#example')
								.DataTable(
										{
											//	"pagingType": "full_numbers",

											dom : 'Blfrtip',
											"bLengthChange" : false,
											buttons : [

													{
														extend : 'collection',

														text : 'Export',
														buttons : [
																{
																	extend : 'excel',
																	title : 'Sensor Detail Report '
																			+ $(
																					"#data")
																					.val()
																			+ '-'
																			+ $(
																					"#data1")
																					.val(),
																},
																{
																	extend : 'pdf',
																	orientation : 'landscape',
																	pageSize : 'LEGAL',
																	title : 'Sensor Detail Report '
																			+ $(
																					"#data")
																					.val()
																			+ '-'
																			+ $(
																					"#data1")
																					.val(),
																},
																{
																	extend : 'csv',
																	title : 'Sensor Detail Report '
																			+ $(
																					"#data")
																					.val()
																			+ '-'
																			+ $(
																					"#data1")
																					.val(),
																},
																{
																	extend : 'print',
																	title : 'Sensor Detail Report '
																			+ $(
																					"#data")
																					.val()
																			+ '-'
																			+ $(
																					"#data1")
																					.val(),
																},
																{
																	extend : 'copy',
																	title : 'Sensor Detail Report '
																			+ $(
																					"#data")
																					.val()
																			+ '-'
																			+ $(
																					"#data1")
																					.val(),
																},

														/* 'copy', 'csv', 'excel', 'pdf', 'print' */

														]
													},

													'colvis', 'pageLength' ],

											"oLanguage" : {
												"sSearch" : "Search"
											},

											lengthMenu : [
													[ -1,10, 25, 50],
													[ 'Show all','10 Rows', '25 Rows',
															'50 Rows'
															 ],

											],

											"aoColumns" : [ null, null, 
													null, null, null, null
													

											]

										});
				
					});
	jQuery.extend(jQuery.fn.dataTableExt.oSort, {
		"date-uk-pre" : function(a) {
			var ukDatea = a.split('/');
			return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
		},

		"date-uk-asc" : function(a, b) {
			return ((a < b) ? -1 : ((a > b) ? 1 : 0));
		},

		"date-uk-desc" : function(a, b) {
			return ((a < b) ? 1 : ((a > b) ? -1 : 0));
		}
	});
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


function chk()
{
	alert("hhh");
	document.getElementById("phone4").style.display="none";
	document.getElementById("phone10").style.display="none";
	
	  var invalid=/^[-]?([0-9]*[.])?[0-9]+$/; 
	 var mob=document.getElementById("minval").value.trim();
     // alert(mob);
	  if(!(mob==""))
			{
		   if((!invalid.test(mob)) && (!(mob=="null")))
					{
						document.getElementById("phone4").style.display="";
						return false;
					}	
					 
			}
	  
	  else if(mob="")
		{
			
			document.getElementById("phone10").style.display="";
		    return false;	
		}
	  
	  
	  /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /*  */ 
	  document.getElementById("phone6").style.display="none";
	  document.getElementById("phone8").style.display="none";
	  var invalid=/^[-]?([0-9]*[.])?[0-9]+$/; 
	 var mob1=document.getElementById("maxval").value.trim();
      //alert(mob1);
	  if(!(mob1==""))
			{
		   if((!invalid.test(mob1)) && (!(mob1=="null")))
					{
						document.getElementById("phone6").style.display="";
						return false;
					}	
					 
			}
	  else if(mob1="")
		{
			
			document.getElementById("phone8").style.display="";
		    return false;	
		}
	  
	  
	  
	  
	  
	var eID = document.getElementById("sens_val");
	var dayVal = eID.options[eID.selectedIndex].value;
	var daytxt = eID.options[eID.selectedIndex].text;	
	
if (parseFloat(document.getElementById("minval").value.trim()) > parseFloat(document.getElementById("maxval").value.trim())) {
    //alert($("#minval").val());
   // alert($("#maxval").val());
    alert("Max Sensor.should be Greater than Min Sensor.");
    return false;
	var interval=document.getElementById("interval").value;
	

	 	
	 	
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
//	          else if(date1 > currentDate)
//	          {
//	              alert("From Date should be less than current date");
//	              return false; 
//	          }
//	          else if(date2 > currentDate) 
//	          {
//	              alert("To Date should be less than current date");
//	              return false; 
//	          }
	         
	         
	         var ftime=document.getElementById("ftime1").value;
	         /* alert(ftime); */
	         
	         
	         var ttime1=document.getElementById("ttime1").value;
/* 	         alert(ttime1); */
	         
	         if(ftime>ttime1)
	        	 {
	        	 alert("Please select valid time");
	        	 return false;
	        	 }
	     
	         return true;
	 
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
<body>
	<%
		Connection conn = null;

			Statement st = null, st1 = null, st2 = null;
			Statement stmt1 = null, stmt2 = null, stmt3 = null, stmt4 = null;
	%>
	<%
		try {
				/* String MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
				String MM_dbConn_USERNAME="fleetview";
				String MM_dbConn_PASSWORD="1@flv";
				String MM_dbConn_STRING="jdbc:mysql://192.168.2.26/db_gps"; */
				Class.forName(MM_dbConn_DRIVER);
				conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

				st = conn.createStatement();
				st1 = conn.createStatement();
				st2 = conn.createStatement();

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
			trans = session.getValue("usertypevalue").toString();

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

			Calendar cal = Calendar.getInstance();
			String datenew1 = new SimpleDateFormat("dd-MMM-yyyy").format(cal.getTime());

			String Bt = request.getParameter("button");

			System.out.print("Button Value:: " + Bt);

			if (Bt == null) {
				VehicleCode = request.getParameter("vehcode");
				////System.out.println("Inside Button not Clicked");

				ResultSet rst = st2.executeQuery(ssql);
				if (rst.next()) {
					Minhum = rst.getString("Mintemp1");
					Maxhum = rst.getString("Maxtemp1");
				}

			} else {
				VehicleCode = request.getParameter("Vehicle");

			}

			sql = "select * from t_vehicledetails where VehicleCode='" + VehicleCode + "'";
			ResultSet rst23 = st.executeQuery(sql);
			if (rst23.next()) {
				vehregno = rst23.getString("VehicleRegNumber");

			}
			String username = "";
			username = (String) session.getAttribute("usertypevalue");
	%>
	<form name="formreport" id="formreport" method="post">
		<input type="hidden" id="username" name="username" value=<%=username%>>

		<div align="center" style="font-size: 13px;">
			<font><b> Sensor Detail Report From <%=datenew1%> To <%=datenew1%>
					Of <%=username%></b></font> <br> </br>
			<div class="form" style="margin-right: 25%;">


				<table border="0" style="width: 100%" align="center">

					<tr>
					   <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vehicle

							<select name="Vehicle" id="Vehicle" name="Vehicle" id="vehicle"
							style="text-align: center; color: gray; font-size: 12px;">
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
						</td>
						<td>
						<td align="right"><div
								style="display: flex; flex-direction: row; justify-content: center; align-items: center">
								<label>From</label> <input type="text" id="data" name="data"
									style="text-align: center; color: gray; font-size: 12px;"
									value="<%=datenew1%>" size="10" readonly
									class="element text medium"/ >
								<script type="text/javascript">
										  Calendar.setup(
										    {
										      inputField  : "data",         // ID of the input field
										      ifFormat    : "%d-%b-%Y",     // the date format
										      button      : "data"       // ID of the button
										    }
										  );
	                         	</script>

								<select name="ftime1" id="ftime1"
									style="text-align: center; color: gray; font-size: 12px;">
									<%
										if (Bt == null) {
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
										if (Bt == null) {
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




						<td align="left"><div
								style="display: flex; flex-direction: row; justify-content: center; align-items: center">
								<label>To</label> <input type="text" id="data1" name="data1"
									style="text-align: center; color: gray; font-size: 12px;"
									value="<%=datenew1%>" size="10" readonly
									class="element text medium"/ >
								<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "data1",         // ID of the input field
      ifFormat    : "%d-%b-%Y",    // the date format
      button      : "trigger1"       // ID of the button
    }
  );
		</script>


								<select name="ttime1" id="ttime1"
									style="text-align: center; color: gray; font-size: 12px;">
									<%
										if (Bt == null) {
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
										if (Bt == null) {
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


						<td align="left"><label for="to" style="height: 30px;">&nbsp;Sensor</label>

							<select name="sens_val" id="sens_val" name="sens_val"
							onchange="onchn();"
							style="text-align: center; color: gray; font-size: 12px;">
								<option value="<%=SensorValue%>"><%=SensorValue%></option>

								<option value="Sensor1">Sensor 1</option>
								<option value="Sensor2">Sensor 2</option>
								<option value="Sensor3">Sensor 3</option>
								<option value="Sensor4">Sensor 4</option>

								<option value="Sensor6">Sensor 6</option>
								<option value="Sensor7">Sensor 7</option>
								<option value="Sensor8">Sensor 8</option>
								<option value="Sensor9">Sensor 9</option>


						</select></td>


						<td align="left"><label for="to"
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
						</label></td>

						<td align="left">
							<div
								style="display: flex; flex-direction: row; justify-content: center; align-items: center">
								&nbsp;&nbsp;&nbsp; <input type="submit" name="button"
									onclick="return chk()"
									style="text-align: center; color: gray; font-size: 12px;"
									value="Submit">
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>

	</form>



	<div align="right">
		<a href="#" onclick="graphlink()">Sensor Graph</a>
	</div>


	<div>
		<table id="example" class="display" style="width: 100%">

			<thead align="center">
				<tr>
					<th width="4%" align="center">Sr No</th>


					<th align="center">Date-Time</th>
					<th align="center">Speed</th>
					<th align="center">Distance</th>
					<th align="center">Location</th>

					<th align="center"><%=SensorValue%></th>


				</tr>
			</thead>
			<tbody>


				<%
					DecimalFormat df = new DecimalFormat("0.00");

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

						String data1 = new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));
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
								|| minh.equalsIgnoreCase("-") || minh == "-") {

							minh = "0.00";
							maxh = "0.00";

						}

						ResultSet rs12 = stmt3.executeQuery(mininterval);

						while (rs12.next()) {
							String dt = rs12.getString("Thefielddatadatetime").substring(0, 19);

							String dt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
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
					<th width="4%" align="center">Sr No</th>


					<th align="center">Date-Time</th>
					<th align="center">Speed</th>
					<th align="center">Distance</th>
					<th align="center">Location</th>
					<th align="center"><%=SensorValue%></th>


				</tr>


			</tfoot>
		</table>
	</div>

	<br>
	<input type="hidden" name="graphveh" id="graphveh"
		value=<%=VehicleCode%>>


	<input type="hidden" name="fromdate" id="fromdate" value=<%=data123%>>
	<input type="hidden" name="todate" id="todate" value=<%=data1234%>>


</body>

<%
	
%>
<%@ include file="footernew.jsp"%>
</jsp:useBean>

</html>
<%-- <%@ include file="footernew.jsp"%> --%>
