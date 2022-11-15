<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headernew1.jsp"%>
    
    <%@page import="com.transworld.fleetview.framework.VehicleDao"
		import="com.transworld.fleetview.framework.DriverDebriefingData"
		import="com.transworld.fleetview.framework.DriversLastTrip"%>
		
	
<jsp:useBean id="vehicleDao" 
			 type="com.transworld.fleetview.framework.VehicleDao"
			 scope="application"></jsp:useBean>
			 
			
<SCRIPT LANGUAGE="JavaScript1.2" SRC="js/graph.js"></SCRIPT>
<script language="javascript">

</script>
    
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
<%
	Connection conn=null;
	Statement st=null, st1=null,st2=null,st20=null,st21=null;
%>

<%
String vehfit="";

 
try
{
		
		
	
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
	    st20=conn.createStatement();
	    st21=conn.createStatement();
	    Statement stmt1=conn.createStatement();  
	    Statement stmt2=conn.createStatement(); 
		
	}
	catch(Exception e)
	{
		
	}
	
%>
<%

final String msg = (String) request.getParameter("msg");
final String briefid = (String) request.getParameter("briefId");
final String driver = (String) request
		.getParameter("drivername");

final String srchval = request.getParameter("srchbx");
 
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

<%
			final String inserted = request.getParameter("inserted");
				if (inserted == null) {
				} else {
		%>
		<table border="0" width="100%" class="stats">
			<tr>
				<td align="center"><font color="green"><b><blink>
				Successfully Saved</blink></b> And the brief Id is : <%=briefid%> for <%=driver%>
				!!!!</font></td>
			</tr>
		</table>
		<%
			}
		%> 
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h2 class="content-header-title  mb-0">Driver Briefing</h2>
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
			
			<form name="formreport" id="formreport" method="post">
		    <div class="row col-12">
		    
		    <div class="col-md-4"></div>
		    
		    <div class="col-md-2">
		    <label for="search">Search:</label>
		    	<div class="input-group input-group-merge">
                     <input type="text" id="srchbx" class="form-control" name="srchbx" />
                </div>
		    </div>
			<div class="col-md-2">
				<button type="submit" value="Submit" name="btnSearch" class="btn btn-primary" style="margin-top: 20px;"  onclick="return chk()"  value="Submit">Submit</button>
				
			</div>
		</div>
		<div class="row">
		   <div class="col-2"></div>
		   <div class="col-10">
		   <p style="color:blue;">Please enter Driver Name or Driver Id. Matching values would come below in the table automatically .
		    </p>
		   </div>
		</div>
			</form>
			
			<%
	String searchValue = request.getParameter("srchbx");
		if (null != searchValue) {
			int i = 1;
			searchValue = searchValue.replace(" ", "");

			List<DriverDebriefingData> data = null;
			int numRecords = 0;
			try {
				data = vehicleDao.getDebriefingData(session
						.getAttribute("usertypevaluemain").toString(),
						searchValue, session.getId());
				numRecords = data.size();
				//System.out.println("numrecs=="+numRecords);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			List<DriversLastTrip> tripData=null;
			int numOfTripRecords=0;
%>
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
											<th>Driver Name</th>
											<th>Driver Id</th>
											<th>Transporter</th>
											<th>Last Trip DateTime</th>
											<th>Briefing/De-briefing Status</th>
											<th>Vehicle Fit Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <%
	int Msgid = 0;
		for (int counter = 0; counter < numRecords; counter++) {
					final DriverDebriefingData currentRecord = data
							.get(counter);

	
		String sql3 = "select * from db_gps.t_usermessage where UserTypeValue  = '"+currentRecord.getDriverOwner()+"' ";
		ResultSet rs3 = stmt2.executeQuery(sql3);
		if(rs3.next())
		{
			Msgid = rs3.getInt("MessageID");
		}
		
		 if(Msgid == 4)
		 {
			 
			 %>
			 <tr>
			 <td style='text-align: right'><%=i%></td>
			 <td style='text-align: left'><%=currentRecord.getDriverName()%></td>
			 <td style='text-align: right'><%=currentRecord.getDriverID()%></td>
			  <td style='text-align: left'><%=currentRecord.getDriverOwner()%></td>
			<td style='text-align: left' colspan="3">Blocked</td>
			 <%
		 }
		 else
		 {
			
			%>
	<tr>
		<td style='text-align: right'><input type='hidden'
			name='drivid"+i+"' id='drivid"+i+"'
			value='<%=currentRecord.getDriverID()%>'> <input
			type='hidden' name='drvrname"+i+"' id='drvrname"+i+"'
			value='<%=currentRecord.getDriverName()%>'> <%=i%></td>
<%
		try{
			tripData=vehicleDao.getDriversLastTrip(currentRecord.getDriverID(),session.getAttribute("usertypevaluemain").toString());
			numOfTripRecords=tripData.size();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		
				if(null==currentRecord.getBriefStatus() || "null".equalsIgnoreCase(currentRecord.getBriefStatus()) || null==currentRecord.getDebriefStatus() ||"null".equalsIgnoreCase(currentRecord.getDebriefStatus()))
				{
%>
		<td style='text-align: left'><a href='brifsbmt.jsp?driverid=<%=currentRecord.getDriverID()%>&drivername=<%=currentRecord.getDriverName()%>&trans=<%=currentRecord.getDriverOwner()%>'>
		<%=currentRecord.getDriverName()%></a></td>
			
<%
		}
		else if(("briefed".equals(currentRecord.getBriefStatus())) && ("not debriefed".equalsIgnoreCase(currentRecord.getDebriefStatus())))
		{
			
%>
		<td style='text-align: left'><a href="debrifsbmt.jsp?driverid=<%=currentRecord.getDriverID()%>&drivername=<%=currentRecord.getDriverName()%>&trans=<%=currentRecord.getDriverOwner()%>&briefid=<%="Briefid"%>">
			<%=currentRecord.getDriverName()%></a></td>
<%
		
		}
		else if(("debriefed".equalsIgnoreCase(currentRecord.getDebriefStatus()) || ("debrifed".equalsIgnoreCase(currentRecord.getDebriefStatus())) ))
		{
%>
			
<%			
		}
%>

		<td style='text-align: right'><%=currentRecord.getDriverID()%></td>
		<td style='text-align: left'><%=currentRecord.getDriverOwner()%></td>
<%
			if(numOfTripRecords>0)
			{
				for(int c=0;c<numOfTripRecords;c++){
					DriversLastTrip tripRecord = tripData.get(c);
				if(null==tripRecord.getStartDate()||"null".equalsIgnoreCase(tripRecord.getStartDate()))
				{
%>
					<td style='text-align: left'><%="-"%></td>
<%			
				}
				else{
%>
					<td style='text-align: left'><%=tripRecord.getStartDate()%></td>	
<%			
					}
			}
		}
		else{
			%>
			<td style='text-align: left'><%="-"%></td>	
<%			
		}
%>
<%//System.out.println("STATUS : : :"+currentRecord.getBriefStatus()+"---"+currentRecord.getDebriefStatus());
		if(null==currentRecord.getBriefStatus() || "null".equalsIgnoreCase(currentRecord.getBriefStatus()) || null==currentRecord.getDebriefStatus() ||"null".equalsIgnoreCase(currentRecord.getDebriefStatus()))
		{
			%>
				<td style='text-align: left'><%="De-briefed"%></td>
			<%
		}
		else if(("briefed".equals(currentRecord.getBriefStatus())) && ("not debriefed".equalsIgnoreCase(currentRecord.getDebriefStatus())))
		{
			
%>
			<td style='text-align: left'><%="Briefed"%></td>
<%			
		}
		else if(("debriefed".equalsIgnoreCase(currentRecord.getDebriefStatus()) || ("debrifed".equalsIgnoreCase(currentRecord.getDebriefStatus())) ))
		{
%>
			
<%			
		}
		if(null==currentRecord.getBriefStatus() || "null".equalsIgnoreCase(currentRecord.getBriefStatus()) || null==currentRecord.getDebriefStatus() ||"null".equalsIgnoreCase(currentRecord.getDebriefStatus()))
		{
			String sql = "SELECT * from db_gps.t_debriefing where Briefid='"+currentRecord.getBriefId()+"' and driverid='"+currentRecord.getDriverID()+"'";
			ResultSet rs= stmt1.executeQuery(sql);
			
			if(rs.next()){
				if(null==rs.getString("vehfitnext")|| "null".equalsIgnoreCase(rs.getString("vehfitnext"))|| "No".equalsIgnoreCase(rs.getString("vehfitnext")) || "-".equalsIgnoreCase(rs.getString("vehfitnext"))|| "".equalsIgnoreCase(rs.getString("vehfitnext")))
				{
					vehfit = "No";
				}
				else if("Yes".equalsIgnoreCase(rs.getString("vehfitnext"))){
					vehfit = "Yes";
				}
			}
			else{
				vehfit = "No";
			}
			
		}
		else if(("briefed".equals(currentRecord.getBriefStatus())) && ("not debriefed".equalsIgnoreCase(currentRecord.getDebriefStatus())))
		{
			String sql = "SELECT * from db_gps.t_briefing where Briefid='"+currentRecord.getBriefId()+"' and driverid='"+currentRecord.getDriverID()+"'";
			ResultSet rs= stmt1.executeQuery(sql);
			if(rs.next()){
				if(null==rs.getString("vehfit")|| "null".equalsIgnoreCase(rs.getString("vehfit"))|| "No".equalsIgnoreCase(rs.getString("vehfit")) || "-".equalsIgnoreCase(rs.getString("vehfit"))|| "".equalsIgnoreCase(rs.getString("vehfit")))
				{
					vehfit = "No";
				}
				else if("Yes".equalsIgnoreCase(rs.getString("vehfit"))){
					vehfit = "Yes";
				}
			}
			else{
				vehfit = "No";
			}
		}
		%>
		<td style='text-align: left'><%=vehfit%></td>
	<%
%>
	</tr>

<%
	i++;
		 }
		 }
		 
		 
		 if (i <= 1) {
				 if(Msgid == 4)
				 {
				 %>
				 
				 <%
				 }
				 else
				 {
%>
<center> 
	<table border='1' width='50%'>
		<tr> <th> Driver does not exist. </th> </tr>
	</table>
</center><%
				 }
%>
                                       </tbody>
                                    <tfoot>
                                    <tr>
                                           <th>Sr.No.</th>
											<th>Driver Name</th>
											<th>Driver Id</th>
											<th>Transporter</th>
											<th>Last Trip DateTime</th>
											<th>Briefing/De-briefing Status</th>
											<th>Vehicle Fit Status</th>
                                        </tr>
                                    </tfoot> 
							</table>
							</div>
							</div>
							</div>
							</section>
							</div>
							</div>
					<%} %>		</div>
							   
		<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Driver Briefing </h4>
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
</script>

<!--New Script code added for table Start end-->
			
			

<!--New Script code added for table Start end-->
			
</body>
</html>