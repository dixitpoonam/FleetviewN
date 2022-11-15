<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="headernew1.jsp"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="javax.activation.*"%>

<!DOCTYPE html>
<html>
<jsp:useBean id="centconn" class="FormToolConnection.FormToolConn"
	scope="page">

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

<style type="text/css">
.dcolor {
	color: #060637;
	font-weight: bold;
	font-size: 12px;
	font-family: Verdana, arial, sans-serif;
}


</style>


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
	
	 var setSequence=document.getElementById("setSequence").value;
 	//alert(setSequence);
 	
 	var columns=setSequence.split(",");
 	for(i=0;i<columns.length;i++){
 		//alert("check"+columns[i]);
 		document.getElementById("check"+columns[i]).checked = true
 	} 
	
	
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
 function Displayer(n)
 {var check = document.getElementById('Section' + n);
 if(check.style.display == 'none')
 {check.style.display='inline';}
 else{check.style.display='none';}
 }
 
 function showtablegeo(routeid)
 {
	 var location=document.getElementById("element_3_1").value;
	 var km=document.getElementById("element_3_2").value;
	 try
		{
	//alert("ajax 222");
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
			if(ajaxRequest.readyState == 4)
			{
				try
				{
				var reslt=ajaxRequest.responseText;
				//alert(reslt);
				reslt=reslt.replace(/^\s+|\s+$/g,'');
				//alert(reslt);
				document.getElementById("thisdiv").innerHTML = reslt;
				window.location.reload();
				document.getElementById("element_3_2").value='';
				document.getElementById("element_3_1").value='';
				
				}
				catch(e)
				{
					alert(e);
				}
			}
		};
		
		var queryString ="?routeid="+routeid+"&element_3_1="+location+"&element_3_2="+km;
		//alert(queryString);
		ajaxRequest.open("POST", "Geofencewisesetinsert.jsp" + queryString, true);
		ajaxRequest.send(null); 
		}
		catch(e)
		{
			alert(e);
		}
	 
 }
 
 function open1(Rid,TripID,Geofence,FuelIssueCategory,FuelQuantity,Rate)
 {
   testwindow = window.open("Ad-hocUpdate.jsp?Rid="+Rid+"&TripID="+TripID+"&Geofence="+Geofence+"&FuelIssueCategory="+FuelIssueCategory+"&FuelQuantity="+FuelQuantity+"&Rate="+Rate,"FuelPlanning","width=700,height=500,scrollbars=yes");
 		testwindow.moveTo(250,250);
 }
 
 
 function usrval()
 {
 	var username=document.userform.fuelserch.value;
 	document.getElementById("usrn").style.display = "none";

 	if(username==null || username=="" || username.length==0){
 		document.getElementById("usrn").style.display = "";
 		return false;
 	}
 	
 	
 	}
 
 
 
 function timer(){
		//to display the please wait ..
		//document.getElementById("plzwait").style.display="";
		setTimeout("mysearch()",2000);
		}

 
 function mysearch(){

	  document.getElementById("searchuser").style.display='block';
	 	var fuelserch=document.userform.fuelserch.value;
	 	var fuelserch=document.getElementById("fuelserch").value;

	  document.getElementById("searchuser").style.display='block';
	 	var fuelserch=document.userform.fuelserch.value;
	 	var fuelserch=document.getElementById("fuelserch").value;
	 	//alert("fuelserch:-"+fuelserch);
	 	
	 	//var vehiclesearch=document.getElementById("vehicleserch").checked
	 	//alert("vehsearch:-"+vehiclesearch);
	 	
	 	//var vehidserch=document.getElementById("vehidserch").checked
	 	//alert("vehidserch:-"+vehidserch);
	 	
	 	if(fuelserch.length=="")
	 		{
	 		 document.getElementById("searchuser").style.visibility='hidden';
	 		//document.getElementById("searchuser").style.display="none";
	 		}
	 	else{
	 		
	 		document.getElementById("searchuser").style.visibility="visible";
	 		
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
	 		if(ajaxRequest.readyState == 4)
	 		{
	 			var reslt=ajaxRequest.responseText;
	 			//alert("reslt:-"+reslt);
	 			
	 			document.getElementById("searchuser").innerHTML=reslt;
	 			
	 			//document.getElementById("plzwait").style.display="none";
	 		} 
	 	}
	 	var queryString = "?fuelserch=" +fuelserch;
	 	//alert("queryString:-"+queryString);
	 	ajaxRequest.open("GET", "Ad-hocAjaxRequest.jsp" + queryString, true);
	 	ajaxRequest.send(null); 
	 	}

	 }
 
 function setname(newuser){
		alert("in set"+newuser);
		newuser=newuser.replaceAll("#", " ");
		alert("in set after"+newuser);
		//document.getElementById("searchuser").style.display='none';
		document.getElementById("searchuser").style.visibility="hidden";
		document.getElementById("fuelserch").value=newuser;
		//document.userform.fuelserch.value=newuser;
		
		//alert("in set last");
	}
 
 /* function open1(StartDate,TripID,StartCode,EndCode,roundOfftotfuel)
 {
   testwindow = window.open("locationwise.jsp?StartDate="+StartDate+"&TripID="+TripID+"&StartCode="+StartCode+"&EndCode="+EndCode+"&totfuel="+roundOfftotfuel,"FuelPlanning","width=1000,height=700,scrollbars=yes");
 		testwindow.moveTo(250,250);
 } */
 
 
 
function formValidation()
{
var displaylabel="";
var displaycount="";
var count3="";
// Mandatorytransworld
// alphatransworld
// charactertransworld
// numbertransworld
// emailtransworld

if(displaylabel == ""){
return true;
}

else{
var displaylabelres = displaylabel.split(",");
var res1=displaycount.split(",");
var res2=count3.split(",");
var i;
var j;

for(j=0; j < res2.length-1; j++){
 document.getElementById("element_error_"+ res2[j]).style.display='none';
 }
 
for (i = 0; i < displaylabelres.length-1; i++) {
    var element_error_="element_error_"+i;
    var number=i;
    document.getElementById("element_error_"+ res1[i]).style.display="";
    document.getElementById("element_error_"+ res1[i]).innerHTML=displaylabelres[i];
} 

 return false;
}
}
</script>
	</head>
	<body onload="ondemand()">
		<%!String StartDate = "", DriverCode = "", DriverName = "";
	int i = 1;
	String VehRegNo = "", TripID = "", origin = "", destination = "", FIxedKM = "", GPName = "", StartCode = "",
			EndCode = "", EndDate = "";%>

		<%
			Connection con1 = null, conn = null;
				Statement stdynamicdrop = null, stmt2 = null;
				String datenew1 = "", datenew2 = "", datenew3 = "";
				datenew1 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
				datenew3 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date());
				datenew2 = datenew1;
				centconn.getConnection();
				con1 = centconn.ReturnConnection();
				stdynamicdrop = con1.createStatement();
				stmt2 = con1.createStatement();
				String RouteCode = request.getParameter("RouteCode");
				Statement st = null, st1 = null, st2 = null, st20 = null, st21 = null;
		%>
		<%
			String owner = session.getAttribute("usertypevalue").toString();
				String Customer = "";
				//String Customer=session.getAttribute("typevalue").toString();
				String EndPlace = "", JRMRouteID = "", StartPlace = "", startend = "", Owner = "", vehregno = "";
				String Tripid = "", drivername = "", driver_id = "", Vendor = "", FuelIssueCategory = "", Distance = "",
						Day = "", Geofence = "", FuelQuantity = "", Rate = "", Amount = "", Status = "";
				double Km = 0.0;
				PreparedStatement preparedStatement = null;
		%>
		<%
			try {

					Class.forName(MM_dbConn_DRIVER);
					conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

					st20 = conn.createStatement();
					st21 = conn.createStatement();

				} catch (Exception e) {

				}
		%>
		<%
			int colcount = 0; //special code for detailed view
				String setSequence = "";
				String detailViewSequence = "", ColumnList = "";
				boolean setDefFlag = false;

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
		<input type="hidden" id="setSequence" name="setSequence"
			value="<%=setSequence%>">

		<div class="app-content content ">
			<div class="content-overlay"></div>
			<div class="header-navbar-shadow"></div>
			<div class="content-wrapper container-xxl p-0">
				<div class="content-header row">
					<div class="content-header-left mb-1 col-md-3 col-12">
						<div class="row breadcrumbs-top">
							<div class="col-12">
								<h3 class="content-header-title  mb-0">Ad-hoc Request</h3>
							</div>
						</div>
					</div>
					<div
						class="content-header-right text-md-end col-md-9 col-12 d-md-block d-none">
						<div class="mb-1 breadcrumb-right">
							<div class="demo-inline-spacing mb-1">

								<button id="detailedView"
									class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0">
									Detailed View</button>

								<button
									class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0"
									data-bs-toggle="modal" data-bs-target="#SetCustomModal">Set
									Custom</button>

								<%@include file="RegisterCompScript.jsp"%>

								<button id="kt_engage_demos_toggle"
									class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0">
									<span id="kt_engage_demos_label">Help</span>
								</button>

							</div>
						</div>
					</div>


				</div>
				<form name="formreport" id="formreport" method="post">
					<div class="row col-12">
						<div class="col-md-4"></div>
						<div class="col-md-2">
							<label for="basicSelect" class="dcolor">Enter Vehicle Number :</label>
							<div class="input-group input-group-merge">

								<select class="form-select" name="vehicle" id="vehicle">
									<option value="Select">Select</option>
									<%
										String vehiclecode = "", Rid = "";
											String sqlregno = "select VehicleRegNumber,vehiclecode from db_gps.t_vehicledetails where vehiclecode in "
													+ session.getAttribute("VehList").toString() + " order by VehicleRegNumber";
											System.out.println("*******" + sqlregno);
											PreparedStatement ps = con1.prepareStatement(sqlregno);
											ResultSet rsregno = ps.executeQuery();
											while (rsregno.next()) {
												vehiclecode = rsregno.getString("vehiclecode");
												VehRegNo = rsregno.getString("VehicleRegNumber");

												System.out.println("VehicleRegNo-->" + VehRegNo);
									%>
									<option value="<%=rsregno.getString("VehicleRegNumber")%>"><%=rsregno.getString("VehicleRegNumber")%></option>
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
							<input type="submit" class="btn btn-primary"
								style="margin-top: 10px;" name="submit" value="Search">
						</div>

					</div>
					<div class="d-grid gap-2 col-4 mx-auto mt-2">

						<font face="Arial" size="3"><B>Ad-hoc Request For
								Vehicle <%=request.getParameter("vehicle")%></B></font>
					</div>

					<br>
				</form>
				<%
					System.out.println("button:" + request.getParameter("button"));
						if (request.getParameter("button") != null) {
							String Selection = request.getParameter("basicSelect");
							System.out.println("selection:" + Selection);
						}
				%>
				<div class="content-body">
					<!-- Basic table -->
					<section id="">
						<div class="row">
							<div class="col-12">
								<div class="card">
									<table id="example1" class="table table-bordered">
										<thead>
											<tr>
												<th>Sr.No</th>
												<th>TripId</th>
												<th>VehicleRegNo</th>
												<th>Owner</th>
												<th>Vendor</th>
												<th>FuelIssueCategory</th>
												<th>Distance</th>
												<th>Day</th>
												<th>Geofence</th>
												<th>FuelQuantity</th>
												<th>Rate</th>
												<th>Amount</th>
												<th>Status</th>
												<th>DriverId</th>
												<th>DriverName</th>
											</tr>
										</thead>
										<tbody>
											<%
												String record = "select * from db_gps.t_fuelissuemaster where vehregno='"
															+ request.getParameter("vehicle") + "' and Status='Unprocessed' order by rid asc limit 1";
													PreparedStatement ps1 = con1.prepareStatement(record);
													ResultSet rsrecord = ps1.executeQuery();
													String record1 = "select * from db_gps.t_fuelissuemaster where vehregno='"
															+ request.getParameter("vehicle") + "' and Status='Unprocessed' order by rid asc limit 1";
													PreparedStatement ps2 = con1.prepareStatement(record);
													ResultSet rsrecord1 = ps2.executeQuery();

													if (!(rsrecord1.next())) {
											%>
											<div align="center">
												<font size="2" color="red"><b>No Fuel Request for
														vehicle :-<%=request.getParameter("vehicle")%></b></font>
											</div>
											<%
												} else {
														while (rsrecord.next()) {

															Rid = rsrecord.getString("Rid");
															Tripid = rsrecord.getString("Tripid");
															vehregno = rsrecord.getString("vehregno");
															Owner = rsrecord.getString("Owner");
															Vendor = rsrecord.getString("Vendor");
															FuelIssueCategory = rsrecord.getString("FuelIssueCategory");
															Distance = rsrecord.getString("Distance");
															Day = rsrecord.getString("Day");
															Geofence = rsrecord.getString("Geofence");
															FuelQuantity = rsrecord.getString("FuelQuantity");
															Rate = rsrecord.getString("Rate");
															Amount = rsrecord.getString("Amount");
															Status = rsrecord.getString("Status");
															driver_id = rsrecord.getString("driver_id");
															drivername = rsrecord.getString("drivername");
											%>
											<tr>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif;"><%=i%></td>

												<%-- <td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;"><%=Tripid%></td> --%>
												<td><div align="right">
														<a href="#"
															onclick="open1('<%=Rid%>','<%=Tripid%>','<%=Geofence%>','<%=FuelIssueCategory%>','<%=FuelQuantity%>','<%=Rate%>')"><%=Tripid%></a>
													</div></td>
												<td
													style="text-align: left; font: normal 13px Arial, Helvtica, sans-serif;"><%=vehregno%></td>

												<td
													style="text-align: left; font: normal 13px Arial, Helvtica, sans-serif;"><%=Owner%></td>
												<%-- <td style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif;">
											<a href="javascript: flase;" onClick="window.open ('shownewmap.jsp?lat=<%=lat%>&long=<%=lon%>', 'win1', 'width=600, height=550, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0'); javascript:toggleDetails1(<%=i%>,false);"><%=location%> </a></td> --%>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif;"><%=Vendor%></td>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif;"><%=FuelIssueCategory%></td>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif;"><%=Distance%></td>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif; width: 190px;"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
								.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Day))%></td>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif;"><%=Geofence%></td>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif;"><%=FuelQuantity%></td>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif;"><%=Rate%></td>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif;"><%=Amount%></td>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif;"><%=Status%></td>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif;"><%=driver_id%></td>
												<td
													style="text-align: right; font: normal 13px Arial, Helvtica, sans-serif;"><%=drivername%></td>



											</tr>
											<%
												i++;

														}

													}
											%>


										</tbody>
										<tfoot>
											<tr>
												<th>Sr.No</th>
												<th>TripId</th>
												<th>VehicleRegNo</th>
												<th>Owner</th>
												<th>Vendor</th>
												<th>FuelIssueCategory</th>
												<th>Distance</th>
												<th>Day</th>
												<th>Geofence</th>
												<th>FuelQuantity</th>
												<th>Rate</th>
												<th>Amount</th>
												<th>Status</th>
												<th>DriverId</th>
												<th>DriverName</th>
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
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Ad-hoc
							Request Report</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<%
						int kk = 0;
							//String showList="Sr.No.,VehRegNo,Transporter,VehicleType,Total Distance,Total RunHrs"; 
							String showList = "" + ColumnList;
					%>
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
								id="reportno" value="<%=reportno%>"> <input
								type="hidden" id="tableheaders" name="tableheaders" value="">
							<input type="hidden" id="tableheaderslength"
								name="tableheaderslength"> <input type="hidden"
								id="call" name="call" value="SetCustom"> <input
								type="hidden" name="pagename" id="pagename"
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

             dt_basic.columns([<%=detailViewSequence%>]).visible(false),

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
</jsp:useBean>
</html>