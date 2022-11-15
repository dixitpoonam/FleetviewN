<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ include file="headernew1.jsp"%>
    
<%
classes fleetview=new classes();
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
fleetview.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>	


<%@page import="java.util.Date"%>
<%@page import="com.fleetview.beans.classes"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">


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

function toggleDetails1(id, show)
{
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
		
	} else {
		popupx.style.visibility = "hidden";
	}
}
</script>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
function article(programName,width,height)
{

	var temp = "menubar=yes,toolbar=no,location=no,status=yes,scrollbars=yes,resizable=yes,width="+width+",height="+height; displayWindow=window.open(programName,"displayWindow",temp) ;
}
function fun(aa)
{
	//alert(aa.value);
	document.searchform.h.value=aa.value;
}


</script>

<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;

.popupnew {
background-color: #98AFC7;
position: absolute;
visibility: visible;

.popupx {
background-color: #98AFC7;
position: absolute;
visibility: hidden;
}
</style>
</head>

<%!
		Connection conn,conn1;
		Statement st,st1,stx,st2,st20,st21,stcommt, stComment;
		String aa,regno,sq,searchveh;
		
		
%>
<%
String username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 


String datex1, datex2, data1, data2;
%>
<%
int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;
%>

<%
		try
		{
			conn=fleetview.ReturnConnection();
			conn1=fleetview.ReturnConnection1();
			
			st=conn.createStatement();
			stx=conn.createStatement();
			st1=conn.createStatement();
			st2=conn1.createStatement();
			stcommt=conn.createStatement();
			stComment=conn.createStatement();
			
			st20=conn.createStatement();
		    st21=conn.createStatement();
			
			System.out.println("Page Name :- "+PageName);
			
			//out.print(session.getAttribute("usertypevalue").toString());
%>
		
<body onload="ondemand()">
 		
<%


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


<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>" />
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Current Position Of Vehicles</h3>
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


<%
		if(session.getAttribute("TypeofUser").toString().equals("SUBUSER"))
		{
			out.print("<br><font size='2'>You are viewing vehicles which are in 10 km. range from your location and vehicles which are going from your location and coming to your location.</font>");
			/* code to search and add vehicle which is not in the list */
		%>
		
			
				<form name="searchform" action="" method="get">
				<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>"/>  
					Search and add the vehicle in the list.
					<div align="right">Vehicle is not in the list, please enter the Vehicle registration number to search.</div><div align="right"><input type="hidden" name="h" id="h" class="formElement"><input type="text" name="searchveh" class="formElement" onChange="fun(this);">&nbsp;&nbsp;&nbsp; <input type="submit" name="Search!" value="Search!" class="formElement"></div></td></tr>
				</form>
 
			<%
			searchveh=request.getParameter("searchveh");
			if(!(null==searchveh))
			{
				String sql="select * from t_group where transporter like '%"+searchveh+"%' and GPName='"+session.getAttribute("usertypevalue").toString()+"' and vehCode not in "+session.getAttribute("VehList").toString();
				//out.print(sql);
				ResultSet rstnew=st.executeQuery(sql);
			%><table>
				<form name="addveh" method="get" action="addveh.jsp">	
					<tr><td class="bodyText" colspan="5">Please check Vehicle to add in the list</td></tr>
					<tr>
						<td class="hed">Check<input type="hidden" name="hh" value="<%=searchveh%>"></td>
						<td class="hed">Vehicle Reg. No</td>
						<td class="hed">Employee Name</td>
						<td class="hed">Employee Code</td>
						
						<td class="hed">Transporter</td>
						<td class="hed">Updated</td>
						<td class="hed">Location</td>
					</tr>	
			
<%
					int j=1;
					while(rstnew.next())
					{
						sql="select * from t_onlinedata where VehicleCode='"+rstnew.getString("VehCode")+"'";
						ResultSet rstnew1=st1.executeQuery(sql);
						if(rstnew1.next())
						{
							
							String empname1="",empcode="";
							String vehregno=rstnew1.getString("VehicleRegNo");
							String sql3="select * from t_vehicledetails where VehicleRegNumber='"+vehregno+"'";
							ResultSet rst3=st1.executeQuery(sql3);
							if(rst3.next())
							{
								 empname1=rst3.getString("Empname");
								 empcode=rst3.getString("Empcode");
							}	
						
			%>
			
					<tr>
						<td><INPUT TYPE=CHECKBOX NAME="ch<%=j%>" value="<%=rstnew1.getString("VehicleCode")%>"></td>
						<td align="left"><%=rstnew1.getString("VehicleRegNo")%></td>
						<td align="left"><%=empname1%></td>
						<td align="left"><%=empcode%></td>
						<td align="left"><%=rstnew1.getString("Transporter")%></td>
						<td align="left"><%= new SimpleDateFormat("dd-MMM-yyyy").format(rstnew1.getDate("TheDate"))%><%=rstnew1.getString("TheTime")%></td>
						<td align="left"><div align="left"><%=rstnew1.getString("Location")%> </div></td>
					</tr>			
			<%
						j++;
						}
					}
			%>
					<input type="hidden" name="count" value="<%=j%>">
					<tr><td colspan="5" align="center"><input type="submit" value="Add Vehicle" Name="Add_Vehicle" class="formElement"></td></tr>
				</form>
			<%
			}
			%>
		</table>
		<%
		/* code end added by Atul Kalaskar on Date 11-11-09 */

		}
		%>
			
			
			<!-- <table border="0" width="100%">
						<tr>
							<td ><b class="bodyText">Color Code Indications :<a href="castrolempmain.jsp"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Full Fleet</b></a></td>
							<td bgcolor="#CCFFCC" class="sorttable_nosort"><b><a href="empmoving.jsp">Moving</a></b></td>
							<td bgcolor="#FFFFCC" class="sorttable_nosort" ><b><a href="empstopped.jsp">Stop</a></b></td>
							<td bgcolor="#DCDCDC" class="sorttable_nosort"><b><a href="empdisconnected.jsp">Disconnected</a></b></td>
							<td bgcolor="#BDEDFF" class="sorttable_nosort"><b><a href="removed.jsp">Removed</a></b></td>
							<td bgcolor="#FFFFFF" class="sorttable_nosort"><b><a href="notactive.jsp">Not Active</a></b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table> -->
					<div class="row col-12">
                    <div class="col-md-3">
                        <span style="background-color:#F0E68C">Color Code Indications :</span>
                    </div>
                    <div class="col-md-1 link">
                        <a href="empmoving.jsp"><span style="background-color:#CCFFCC; margin-left: -75px;">Moving</span></a> 
                    </div>
                    <div class="col-md-1">
                        <a href="empstopped.jsp"><span style="background-color:#FFFFCC; margin-left: -95px;">Stop</span></a>
                    </div>
                    <div class="col-md-2">
                        <a href="empdisconnected.jsp"><span style="background-color:#DCDCDC; margin-left: -223px;">Disconnected</span></a>
                    </div>
                    <div class="col-md-2">
                        <a href="removed.jsp"><span style="background-color:#FFC475; margin-left: -283px;">Removed</span></a>
                    </div>
                    <div class="col-md-1">
                        <a href="notactive.jsp"><span style="background-color:#FFFFFF; margin-left: -303px;">Not Active</span></a>
                    </div>
                </div>
					
						<!-- Table Starts here -->
	<br>
	<div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">
								
					<thead>
						<tr>
							<th> Sr.</th>
							<th>Veh.</th>
							<th>Veh. Type</th>
							<th>Employee Name</th>
							<th>Employee Code</th>
							<th>Mobile No</th>
							<th>Region</th>
							<th>Updated</th>
							<th>Location</th>
							<th>Distance Today</th>
							<th>Distance This Month</th>
						</tr>	
						</thead>
						<tbody>
			<%
			String empname="",empcode="",region="",mobno="",vehtype="";
							
						final String  VehList1=session.getAttribute("VehList").toString();
						String specialcomment="-";
//out.print("vehicle list"+VehList1);
						String sql="select * from t_onlinedata where vehiclecode in "+ VehList1 +" order by concat(TheDate,TheTime) desc";
									
						ResultSet rst=st.executeQuery(sql);
						int i=0;
						while(rst.next())
						{
							i++;
							System.out.println("*****   "+i);
							specialcomment="-";
							
							String sqlspcommt="SELECT spc.entdatetime,spc.vehregno,spc.spcomment as specialcomment		" +
							"       FROM db_CustomerComplaints.t_techspecialrep spc " +
							" 		INNER JOIN " +
							" 		( " +
							" 			SELECT Max(entdatetime) as entdatetime, spcomment,visibleInFleetview,cmmt_type,Closed, vehregno " + 
							" 			FROM db_CustomerComplaints.t_techspecialrep " +
							" 			WHERE visibleInFleetview='Yes'  " +
							" 			AND cmmt_type = 'vehicle' " +
							" 			AND Closed = 'No' " +
							" 			GROUP BY vehregno " +
							" 	) spcd ON (spc.VehRegNo= spcd.VehRegNo AND spc.entdatetime=spcd.entdatetime)" +
							"	where spc.VehRegNo='"+rst.getString("VehicleRegNo")+"'";
							ResultSet rscommt = stcommt.executeQuery(sqlspcommt);
							if(rscommt.next())
							{
								specialcomment = rscommt.getString("specialcomment");
							}
							
							
							
							
							
							String vehregno=rst.getString("VehicleRegNo");
							String sql3="select * from t_vehicledetails where VehicleRegNumber='"+vehregno+"'";
							ResultSet rst3=st1.executeQuery(sql3);
							if(rst3.next())
							{
								empname=rst3.getString("Empname");
								empcode=rst3.getString("Empcode");
								mobno = rst3.getString("MobilePhNo");
							    vehtype = rst3.getString("vehtype");
							}
							region=rst.getString("Transporter");
							long ax=0, bx=12, cx=24, dx=36, ex=48, fx=60, gx=72, hx=84, ix=96, jx=108, kx=120, lx=132, mx=144, nx=156, ox=168, px=180, qx=192, rx=204, sx=216, tx=228, ux=240;
							int col=(int)rst.getDouble("TheSpeed");
							int kmtoday=0,kmlastday=0,kmthismonth=0,thedistance=0,ostoday;
							String fuelvalue="0";
							if(session.getAttribute("fuelformat").toString().equalsIgnoreCase("Gal") && !(rst.getString("FuelLevel").equalsIgnoreCase("NA")))
							{
								fuelvalue=""+fleetview.Liter_To_Gallan((int)rst.getDouble("FuelLevel"));
							}
							else
							{
								fuelvalue=rst.getString("FuelLevel");
							}
							String vcode=rst.getString("VehicleCode");
							ostoday=(int)rst.getDouble("OSCount");
							if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
							{
								thedistance=(int)fleetview.KM_TO_MILES1(rst.getDouble("TheDistance"));
								kmlastday=(int)fleetview.KM_TO_MILES1(rst.getDouble("LastDayKm"));
								kmtoday=thedistance-kmlastday;
								if(kmtoday <0 || kmtoday >800)
								{
									kmtoday=0;
								}
								kmthismonth=(int)fleetview.KM_TO_MILES1((int)rst.getDouble("KMMonth"))+kmtoday;
							}
							else
							{
								thedistance=(int)rst.getDouble("TheDistance");
								kmlastday=(int)rst.getDouble("LastDayKm");
								kmtoday=thedistance-kmlastday;
								if(kmtoday <0 || kmtoday >800)
								{
									kmtoday=0;
								}
								kmthismonth=(int)rst.getDouble("KMMonth")+kmtoday;
							}
							//out.print(kmtoday+"  "+kmthismonth+" ");
							if(fleetview.checkUserBlocked(rst.getString("Transporter")).equals("Yes"))
							{
					%>
						<tr bgcolor="white">
							<td style="text-align: right"><%=i%></td>
							<td style="text-align: left"><%=rst.getString("VehicleRegNo")%></td>
							<td style="text-align: left"><%=vehtype%></td>
							<td style="text-align: left"><%=empname%></td>
							<td style="text-align: right"><%=empcode%></td>
							<td style="text-align: right"><%=mobno %></td>
							<td style="text-align: left"><%=region%></td>
							<td style="text-align: left"><%="Blocked"%></td>
							
							<td style="text-align: left"><%="Access denied for "+rst.getString("Transporter")%></td>
							
							<td style="text-align: right">-</td>
							<td style="text-align: right">-</td>
							
						</tr>	
					<%
							}
						else
						{
							java.util.Date todaysDate =new java.util.Date();
							
							Format NewFormatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							Format NewFormatter2 = new SimpleDateFormat("yyyy-MM-dd");
							String currentDateTime = NewFormatter1.format(todaysDate);
							
							String d2=NewFormatter2.format(todaysDate);
							
							long todaysDateMillis = todaysDate.getTime(); // todays date in millisecs
							long dayInMillis = 1000 * 60 * 60 *24; // 1 day in millisecs
							
							todaysDateMillis = todaysDateMillis - dayInMillis; // 24 hrs previous datetime from currentdatetime (in millisecs)
							todaysDate.setTime(todaysDateMillis);
							
							String twentyFourHoursPrevDatetime = NewFormatter1.format(todaysDate);
							
							String d1=NewFormatter2.format(todaysDate);
							
							
							String twentyFourHoursPrevDate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(twentyFourHoursPrevDatetime));
							String currentDate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(twentyFourHoursPrevDatetime));
							String ftime1= new SimpleDateFormat("HH").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(twentyFourHoursPrevDatetime));
							String ftime2= new SimpleDateFormat("mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(twentyFourHoursPrevDatetime));
							String ttime1= new SimpleDateFormat("HH").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(currentDateTime));
							String ttime2= new SimpleDateFormat("mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(currentDateTime));
							
							String VehicleCode=rst.getString("VehicleCode");
							
							session.setAttribute("hvid",rst.getString("VehicleCode"));
							session.setAttribute("fff",twentyFourHoursPrevDatetime);
							session.setAttribute("ttt",currentDateTime);
							session.setAttribute("hdate1",d1);
							session.setAttribute("hdate2",d2);	
							
							
						
							java.util.Date ShowDate1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString("TheDate")+" "+rst.getString("TheTime"));
							Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
							String showdate1 = formatter1.format(ShowDate1);
							java.util.Date ddd= new java.util.Date();
							long dt1=ShowDate1.getTime();
							long dt2=ddd.getTime();
							long days=((dt2-dt1)/(60 * 60 * 1000L* 24));
							long mins=((dt2-dt1)/60000);
							long mins2=Integer.parseInt(session.getAttribute("desconnected").toString());
							String bgcolor="";
							String igni="NA";
							igni=rst.getString("ignition");
							if(col > 0 && igni.equals("OFF"))
							{
								bgcolor="background-color:#FF6600";
							}
							else if(col >0) 
							{ 
								if(mins >mins2 )
							 	{
						 			bgcolor="background-color:#DCDCDC";
						 		}
						 		else 
							 	{
							 		bgcolor="background-color:#CCFFCC";
							 	}
					 		} 	
					 		else 
							{ 
								if(mins >mins2 )
								{
									bgcolor="background-color:#DCDCDC";
								}
								else
								{ 
									bgcolor="background-color:#FFFFCC";
								} 
							}	  					 
					%>
						<tr>
							<td style="<%=bgcolor %>; text-align: right"><%=i %></td>
							<td style="<%=bgcolor %>; text-align: left">
								<a href="javascript:toggleDetails(<%=i%>,true);" title="Click To See the Reports"><%=rst.getString("VehicleRegNo")%> </a>  <br />
        						<div class="popup" id="popup<%=i%>" style="visibility:hidden;position:absolute;background-color:white; opacity:1">
								<table border="1" bgcolor="#9db5e5" cellpadding="1px" cellspacing="1px">
		   							<tr>  
										<td> <a href="veh_report_24h.jsp?vid=<%=rst.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Report For Last 24 Hours </a>
										</td>
		   							</tr>
		   							<tr>
		   								<td> <a href="veh_report_48h.jsp?vid=<%=rst.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Report For Last 48 Hours </a>
										</td>
								   	</tr>
		   							<tr>
										<td> <a href="veh_report_7d.jsp?vid=<%=rst.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Report For Last 7 Days </a>
										</td>
		   							</tr>
		   							<tr>
										<td> <a href="veh_report_15d.jsp?vid=<%=rst.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Report For Last 15 Days </a>
										</td>
		   							</tr>
		   							<tr>
		   								<td> <a href="ShowCustomReportonTWMap.jsp?tripid=''&vehcode=<%=rst.getString("VehicleCode")%>&data=<%=twentyFourHoursPrevDate%>&data1=<%=currentDate%>&ftime1=<%=ftime1%>&ftime2=<%=ftime2%>&ttime1=<%=ttime2%>&ttime2=<%=ttime2%>" onclick="toggleDetails(<%=i%>,false);">Last 24 Hours Journey On Map </a> 
		  								</td>
										<!--<td> <a href="veh_showhistory.jsp?vehcode=< %=rst.getString("VehicleCode")%>" onclick="toggleDetails(< %=i%>,false);">Last 24 Hours Journey On Map </a> 
		  								</td>-->
		  						 	</tr>
		   							<tr>
										<td> <a href="hourly_detail_report.jsp?vehcode=<%=rst.getString("VehicleCode")%>&h1=no" onclick="toggleDetails(<%=i%>,false);">Detail Report </a>
										</td>
								   	</tr>
		   							
		   							<tr>
										<td> <a href="detail_custom_report.jsp?vehcode=<%=rst.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Custom Detail Report </a>
										</td>
								   	</tr>
									
									<tr>
										<td> <a href="EmpNameEditNew.jsp?vehcode=<%=rst.getString("VehicleCode")%>&pagename=<%=PageName %>" onclick="toggleDetails(<%=i%>,false);">Edit User Details </a>
										</td>
								   	</tr>
									
									<!--<tr>
										<td> <a href="VehicleIdleEntry.jsp?vehcode=<%=rst.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Enter Vehicle Idle Status </a>
										</td>
								   	</tr>
									
									--><tr>
										<td> <a href="javascript:toggleDetails(<%=i%>,false);">Close </a>
										</td>
								   	</tr>
	   							</table>
								</div>
							</td>
							<td style="<%=bgcolor %>; text-align: left"><%=vehtype%></td>
							<td style="<%=bgcolor%>; text-align: left"><%=empname %></td>
							<td style="<%=bgcolor%>; text-align: right"><%=empcode%></td>
							<td style="<%=bgcolor %>; text-align: right"><div align="right"><%=mobno %></div></td>
							<td style="<%=bgcolor%>; text-align: left"><%=region%></td>
							<td style="<%=bgcolor%>; text-align: left">
								<%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TheDate"))+" "+rst.getString("TheTime") %>
							</td>
					
							<td style="<%=bgcolor %>; text-align: left">
								<div align="left">
								<a href="shownewmap.jsp?lat=lat=<%=rst.getString("LatitudePosition") %>&long=<%=rst.getString("LongitudePosition")%>&discription=<%=empname+"<br>"+rst.getString("Location")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=rst.getString("LatitudePosition") %>&long=<%=rst.getString("LongitudePosition")%>&discription=<%=empname+"<br>"+rst.getString("Location")%>', 'myWin','width=500, height=500'); popWin.focus(); return false"><%=rst.getString("Location") %></a>
				
								<!-- <%=fleetview.showNewMap(rst.getString("LatitudePosition"),rst.getString("LongitudePosition"),rst.getString("Location")) %> --> 
					<%
							if(fleetview.isUnitRemoved(rst.getString("VehicleCode")).equals("Yes"))
							{
								out.print("<font color='blue' size='2'> Device Removed</font>");
							}
							else
							{
								if(mins >mins2) 
								{
									out.print("<font color='red' size='2'> Device Disconnected</font>"); 
								}
							}
					if(!("-".equalsIgnoreCase(specialcomment) || "Other".equalsIgnoreCase(specialcomment)) && !((null == specialcomment) || "NULL".equalsIgnoreCase(specialcomment)))
							out.print("<br><font size='2' color='#000000'>"+specialcomment+"</font>");
					
						
						// Added here veh specail comment
						String sqlCommet, VehComment, otherComment, currentDate2;
						Date date = new Date();
						currentDate2=new SimpleDateFormat("yyyy-MM-dd").format(date);
						sqlCommet="select VehComment, otherComment from  db_gps.t_VehicleIdleEntry   where ActiveStatus='-' and  VehCode='"+VehicleCode+"' and toDate>='"+currentDate2+"'  and  fromDate<='"+currentDate2+"'";
						System.out.println(" comment sql "+sqlCommet);
						ResultSet rstComment=stComment.executeQuery(sqlCommet);
						while(rstComment.next())
						{
							VehComment=rstComment.getString("VehComment");
							otherComment=rstComment.getString("otherComment"); 
							if(!VehComment.equals("Other"))
							{
							out.print("<br><font size='2' color='red'><b>"+VehComment+"</b></font>");
							}
							else
							{
								out.print("<br><font size='2' color='red'><b>"+otherComment+"</b></font>");
							}
						}
						
					%>
						
					
								</div> 
							</td>
							
							
							
							<td style="<%=bgcolor %>; text-align: right"><div align="right"><%=kmtoday %></div></td>
							<td style="<%=bgcolor %>; text-align: right"><div align="right"><%=kmthismonth %></div></td>
							
					
			</tr>	
		<%
	}
}
sql="select * from t_vehicledetails where vehiclecode in "+VehList1+" and vehiclecode not in (select vehiclecode from t_onlinedata where vehiclecode in " + VehList1 +") and Status <> 'Removed'";  
ResultSet rstremoved1=stx.executeQuery(sql);
System.out.println("********  "+sql);
while(rstremoved1.next())
{
	String vcode=rstremoved1.getString("VehicleCode");
	i++;
	specialcomment="-";
	String sqlspcommt="SELECT spc.entdatetime,spc.vehregno,spc.spcomment as specialcomment		" +
	"       FROM db_CustomerComplaints.t_techspecialrep spc " +
	" 		INNER JOIN " +
	" 		( " +
	" 			SELECT Max(entdatetime) as entdatetime, spcomment,visibleInFleetview,cmmt_type,Closed, vehregno " + 
	" 			FROM db_CustomerComplaints.t_techspecialrep " +
	" 			WHERE visibleInFleetview='Yes'  " +
	" 			AND cmmt_type = 'vehicle' " +
	" 			AND Closed = 'No' " +
	" 			GROUP BY vehregno " +
	" 	) spcd ON (spc.VehRegNo= spcd.VehRegNo AND spc.entdatetime=spcd.entdatetime)" +
	"where	spc.VehRegNo='"+rstremoved1.getString("VehicleRegNumber")+"'";
	ResultSet rscommt = stcommt.executeQuery(sqlspcommt);
	if(rscommt.next())
	{
		specialcomment = rstremoved1.getString("specialcomment");
	}
%>
<tr>
	<td style="text-align: right"><%=i%></td>
	<td style="text-align: left"><%=rstremoved1.getString("VehicleRegNumber") %></td>
	<td style="text-align: left"><%=rstremoved1.getString("vehtype") %></td>
	<td style="text-align: left">-</td>
	<td style="text-align: right">-</td>
	<td style="text-align: left">-</td>
	<td style="text-align: left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstremoved1.getDate("InstalledDate")) %></td>
	
	<td style="text-align: left"><div align="left">Device Installed But Not Active
<%
	if(fleetview.isUnitRemoved(rstremoved1.getString("VehicleCode")).equals("Yes"))
	{
		out.print("<font color='blue' size='2'> Device Removed</font>");
	}
	if(!("-".equalsIgnoreCase(specialcomment) || "Other".equalsIgnoreCase(specialcomment)) && !((null == specialcomment) || "NULL".equalsIgnoreCase(specialcomment)))
		out.print("<br><font size='2' color='blue'>"+specialcomment+"</font>");
%>
	</div></td>
	
	<td style="text-align: right">-</td>
	<td style="text-align: right">-</td>
	<td style="text-align: right"><%=rstremoved1.getString("MobilePhNo") %></td>
	</tr>		
<%
}
%>
</tbody>
<tfoot>
						<tr>
							<th> Sr.</th>
							<th>Veh.</th>
							<th>Veh. Type</th>
							<th>Employee Name</th>
							<th>Employee Code</th>
							<th>Mobile No</th>
							<th>Region</th>
							<th>Updated</th>
							<th>Location</th>
							<th>Distance Today</th>
							<th>Distance This Month</th>
						</tr>
</tfoot>
	<%-- <input type="hidden" name="cnt" id="cnt" value="<%=i%>"> --%>
</table>
							
							</div>
							</div>
							</div>
							</section>
							</div>
							</div>
							</div>
							
							
	<%
	}catch(Exception e)
	{
		System.out.print("Exception -->"+e);
	}
	%>						
	<% fleetview.closeConnection();
	fleetview.closeConnection1();%>

<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Current Status </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int j=0; 
			 
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
							<div align="left"><input type="text" id="net_id1<%=j %>" name="net_id1<%=j %>" style="width:70px;padding: 4px 5px 2px 5px;
							border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif; " value="<%=j %>" readonly/>                  
						</div>
						<input type="checkbox" name="check<%=j %>"   id="check<%=j %>"  /></td>
						<td><input type="text" name="clname<%=j %>"   id="clname<%=j %>"  value="<%=stcol.nextToken()%>" readonly="readonly" style="border:none" /></td>
							</tr>
							<%j++;
							}%></tbody>
						</table>
						
						<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=j %>"/>
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
								title: 'Current Status',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Current Status',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Current Status',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Current Status',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Current Status',
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


