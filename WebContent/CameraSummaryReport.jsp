
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.Date"%>
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
 
        <link rel="stylesheet" type="text/css" href="css/table/jquery.datetimepicker.css">
        <script src="js/datatable/jquery.datetimepicker.js"></script>
        <link rel="stylesheet" href="css/table/TemplateCSS.css">
        

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
function dateformat(days)
{
	if(days=='Jan')
		return(1);
	else if(days=='Feb')
		return(2);
	else if(days=='Mar')
		return(3);
	else if(days=='Apr')
		return(4);
	else if(days=='May')
		return(5);
	else if(days=='Jun')
		return(6);
	else if(days=='Jul')
		return(7);
	else if(days=='Aug')
		return(8);
	else if(days=='Sep')
		return(9);
	else if(days=='Oct')
		return(10);
	else if(days=='Nov')
		return(11);
	else if(days=='Dec')
		return(12);
 }

function datevalidate()
{
	var date1 = document.getElementById("date1").value;
	var hr1="";
	var min1="";
	var dm1,dd1,dy1,dm2,dd2,dy2;
	var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;
	dd11=date1.substring(0,2);
	mm1=date1.substring(3,6);
	mm11=dateformat(mm1);
	yy11=date1.substring(7,11);
	hr1 = date1.substring(12,14)
	min1 = date1.substring(15,17)
	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var hr=date.getHours();
	var min=date.getMinutes();
	//alert(hr);
	//alert(min);
	var year=date.getFullYear();
	//alert("year1   "+yy11+"   year  "+year);
	if(yy11<year) 
	{
		
		alert("selected date should not be Less than todays date");
		document.getElementById("date1").value="";
		document.getElementById("date1").focus;
		return false;
	}
	else if(year==yy11)
	{
		//alert("month1   "+mm11+"   month  "+month);
			if(mm11<month)
		{
			alert("selected date should not be Less than todays date");
			document.getElementById("date1").value="";
			document.getElementById("date1").focus;
			return false;
		}
			else
				if(mm11==month)
				{
					//alert("day1   "+dd11+"   day  "+day);
					if(dd11<day)
					{
						alert("selected date should not be Less than todays date");
						document.getElementById("date1").value="";
						document.getElementById("date1").focus;
						return false;
					}
					else
						if(dd11==day)
						{
							//alert("hr1   "+hr1+"   hr  "+hr);
							if(hr1<hr)
							{
								alert("selected date should not be Less than todays date");
								document.getElementById("date1").value="";
								document.getElementById("date1").focus;
								return false;
							}
							else
								if(hr1==hr)
								{
									//alert("min1   "+min1+"   min  "+min);
									if(min1<min)
									{
										alert("selected date should not be Less than todays date");
										document.getElementById("date1").value="";
										document.getElementById("date1").focus;
										return false;
									}
								}
					    }
		        }
	}
	return true;
}

function dateformat(days)
{
	 if(days=='Jan')
		return(1);
	 else
		if(days=='Feb')
			return(2);
		else
			if(days=='Mar')
				return(3);
			else
				if(days=='Apr')
					return(4);
				else
					if(days=='May') //timeformat: "%M:%S"
						
						return(5);
					else
						if(days=='Jun')
							return(6);
						else
							if(days=='Jul')
								return(7);
							else
								if(days=='Aug')
									return(8);
								else
									if(days=='Sep')
										return(9);
									else
										if(days=='Oct')
											return(10);
										else
											if(days=='Nov')
												return(11);
											else
												if(days=='Dec')
													return(12);
 }

</script>

</head>


<%! 
	Connection conn = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	Statement st4 = null;
	Statement st5= null;
	Statement st6= null;
	Statement st7= null;
	Statement st20= null;
	Statement st21= null;

	String date1 = "";
	String date2 = "";
	String time1 = "";
	String time2 = "";
	
	String vehno="";
%>
<%!
	String from="",to="";
	int colcount=0;   //special code for detailed view
	String setSequence ="";
	String detailViewSequence = "",ColumnList="";
	boolean setDefFlag=false;

%>
<%
//String statusname="";
	String  default_date_1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  hh=new SimpleDateFormat("HH").format(new Date());
	
	int hh1=Integer.parseInt(hh);
	int hh2=hh1-2;
	
	String default_date_3 = new SimpleDateFormat("dd-MMM-yyyy ").format(new Date());
	
	
	String  default_date_5 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  mm=new SimpleDateFormat("mm").format(new Date());
	
	int mm1=Integer.parseInt(mm);
	int mm2=mm1;
	
	default_date_3=default_date_3+""+hh2+":"+mm2;
	
	
	String defaultDate2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	
	System.out.println("The default date is ==>"+default_date_3);
	
	System.out.println("The default_date_1  is ==>"+default_date_1);
	
	date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 
	
	date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1));
	
	
	
%>	

<%
String vehlist = "";
try{
	
	String frompage = request.getParameter("frompage");
	vehlist = session.getAttribute("VehList").toString();
	//System.out.println("The vehicle list>>>>"+vehlist);

	if(frompage!=null && frompage.equalsIgnoreCase("OS"))
	{  
		System.out.println("frompage:OS");
		String thedate = request.getParameter("data");
		String thedate1 = request.getParameter("data1"	);
		date1 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate));
		from=date1;
		time1 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate));
		date2 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1));
		to=date2;
		time2 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1));
	}
	else
	{   //onload,onsubmit normal case
		System.out.println("on load/onsubmit normal case");
		 date1 = request.getParameter("data");
		 from=date1;
		 System.out.println("date1 "+date1);
		 time1 =":00";
		 date2 = request.getParameter("data1");
		 to=date2;
		 System.out.println("date2 "+date2);
		 time2 = ":59";
	}
	
	 Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 st = conn.createStatement();
	 st1 = conn.createStatement();
	 st2 = conn.createStatement();
	 st3 = conn.createStatement();
	 st4 = conn.createStatement();
	 st5 = conn.createStatement();
	 st6 = conn.createStatement();
	 st7 = conn.createStatement();
	 st20=conn.createStatement();
	 st21=conn.createStatement();
	 //statusname=request.getParameter("status");
	 //System.out.println("statusname "+statusname);
// 	 if(statusname==null)
// 	 {
// 	 	statusname="All";
// 	 }
// 	 System.out.println("statusname "+statusname);
	 System.out.println("  Date1 ==>"+date1+ "Date2 ==>"+date2);

}catch(Exception e){
	System.out.println("Exception "+e);
}
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

<%
		String username="";
		username=(String)session.getAttribute("usertypevalue");
		
		System.out.println("Session name----------------->:"+username); 
%>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Camera Images Summary Report</h3>
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
			
        <form id="camera_jpg_report" name="camera_jpg_report" action="" method="post" onsubmit="return datevalidate(); ">
		    <div class="row col-12">
		    <div class="col-md-3"></div>
			<div class="col-md-2">
				

				<label for="from">From:</label>
				<div class="input-group input-group-merge" >
				
					<input type="text" id="MdateF" name="data"  class="form-control" value="<%if(date1==null){ %><%=default_date_3%><%}else{%><%=date1%><%}%>"> 
					<span class="input-group-text">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar">
					<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
					<line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line>
					<line x1="3" y1="10" x2="21" y2="10"></line>
					</svg>
					</span>
				</div>
				  <script>
							$(document).ready(function() {
								$(function() {
									$("#MdateF").datetimepicker({
										dateFormat : 'dd-M-yy',
										controlType : 'select',
										oneLine : true,
										timeFormat : 'HH:mm:ss',
										changeMonth : true,
										changeYear : true
									});
								});

							});
						</script>
				   
				  
			</div>
			<div class="col-md-2">
				<label for="to">To:</label>
				<div class="input-group input-group-merge" >
				
					<input type="text" id="MdateT" name="data1"  class="form-control" value="<%if(date2==null){ %><%=defaultDate2%><%}else{%><%=date2%><%}%>"/> 
				<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
				</div>
				<script>
							$(document).ready(function() {
								$(function() {
									$("#MdateT").datetimepicker({
										dateFormat : 'dd-M-yy',
										controlType : 'select',
										oneLine : true,
										timeFormat : 'HH:mm:ss',
										changeMonth : true,
										changeYear : true
									});
								});

							});
						</script>
		   </div>

			<div class="col-md-2">
				<input type="submit" class="btn btn-primary" style="margin-top: 10px;" name="Submit" onclick="return datevalidate()"  value="Submit">
			</div>
		</div><br>
			</form>
			<%
			if(date1!=null || date2!=null){
				System.out.println("condition===>date1!=null || date2!=null");
				System.out.print("date1:"+date1);
			    System.out.print("date2:"+date2);
				date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date1));
				date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date2));
				time1=":00";
				time2=":59";
			}
		 	else
		 	{
		 		System.out.println("in else 2....");  //onload

		 		date1=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 
		 		date2= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1)); 
			
		 	}
			%>
			
			<div class="d-grid gap-2 col-6 mx-auto mt-2">
				<h2 class="tcolor">Camera Images Summary Report From <%if(from==null){ %><%=default_date_3%><%}else{%><%=from%><%}%> To <%if(to==null){ %><%=default_date_1%><%}else{%><%=to%><%}%> </h2>
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
										<th>Sr No</th>
										<th>Vehicle</th>
										<th>Total Images</th>
										<th>Cabin Incident</th>
										<th>Road Incident</th>
										<th>Cabin Exception</th>
										<th>Road Exception</th>
										<th>Cabin Others</th>
										<th>Road Others</th>
			
								</tr>
							</thead>
								<tbody>
						<%
								int count=0;
								String vehno="",vehcode="";
								String type="",type1="",type2="",type3="",type4="",type5="",type6="";
								String category="",category1="",category2="",category3="",category4="",category5="",category6="",category7="";
							 	int cnt1=0,cnt2=0,cnt3=0,cnt4=0,cnt5=0,cnt6=0,cnt7=0;
								String sql = "Select a.VehicleRegNumber as vehno,a.vehiclecode as vehcode from db_gps.t_vehicledetails a,db_gps.t_jpgsnap b  where  a.vehiclecode = b.vehid and  a.VehicleCode in "+session.getAttribute("VehList").toString()+" and a.status='-' group by a.VehicleRegNumber order by VehicleRegNumber ";
								System.out.println("Sql "+sql);
								ResultSet rs=st.executeQuery(sql);
								while(rs.next())
								{
									vehno=rs.getString("vehno");
									vehcode=rs.getString("vehcode");
									System.out.println("vehno"+vehno);
									
									String sql1="select count(*) as cnt1 from db_gps.t_jpgsnap where vehid='"+vehcode+"' and snapdatetime between '"+date1+"' and '"+date2+"'";
									System.out.println("Sql1"+sql1);
									ResultSet rs1=st1.executeQuery(sql1);
									if(rs1.next())
									{
										cnt1=rs1.getInt("cnt1");
										category="Cabin,Road";
										type="Incident','Exception','-";
									}
									String sql2="select count(*) as cnt2 from db_gps.t_jpgsnap where vehid='"+vehcode+"' and snapdatetime between '"+date1+"' and '"+date2+"' and category='Cabin' and type='Incident' ";
									System.out.println("Sql2"+sql2);
									ResultSet rs2=st2.executeQuery(sql2);
									if(rs2.next())
									{
										cnt2=rs2.getInt("cnt2");
										category1="Cabin";
										type1="Incident";
									}
									String sql3="select count(*) as cnt3 from db_gps.t_jpgsnap where vehid='"+vehcode+"' and snapdatetime between '"+date1+"' and '"+date2+"' and category='Road' and type='Incident' ";
									System.out.println("Sql3"+sql3);
									ResultSet rs3=st3.executeQuery(sql3);
									if(rs3.next())
									{
										cnt3=rs3.getInt("cnt3");
										category2="Road";
										type2="Incident";
									}
									String sql4="select count(*) as cnt4 from db_gps.t_jpgsnap where vehid='"+vehcode+"' and snapdatetime between '"+date1+"' and '"+date2+"' and category='Cabin' and type='Exception' ";
									System.out.println("Sql4"+sql4);
									ResultSet rs4=st4.executeQuery(sql4);
									if(rs4.next())
									{
										cnt4=rs4.getInt("cnt4");
										category3="Cabin";
										type3="Exception";
									}
									String sql5="select count(*) as cnt5 from db_gps.t_jpgsnap where vehid='"+vehcode+"' and snapdatetime between '"+date1+"' and '"+date2+"' and category='Road' and type='Exception' ";
									System.out.println("Sql5"+sql5);
									ResultSet rs5=st5.executeQuery(sql5);
									if(rs5.next())
									{
										cnt5=rs5.getInt("cnt5");
										category4="Road";
										type4="Exception";
									}
									String sql6="select count(*) as cnt6 from db_gps.t_jpgsnap where vehid='"+vehcode+"' and snapdatetime between '"+date1+"' and '"+date2+"' and category='Cabin' and type='-' "  ;
									System.out.println("Sql6"+sql6);
									ResultSet rs6=st6.executeQuery(sql6);
									if(rs6.next())
									{
										cnt6=rs6.getInt("cnt6");
										category5="Cabin";
										type5="-";
									}
									String sql7="select count(*) as cnt7 from db_gps.t_jpgsnap where vehid='"+vehcode+"' and snapdatetime between '"+date1+"' and '"+date2+"' and category='Road' and type='-'";
									System.out.println("Sql7"+sql7);
									ResultSet rs7=st7.executeQuery(sql7);
									if(rs7.next())
									{
										cnt7=rs7.getInt("cnt7");
										category6="Road";
										type6="-";
									}
									
									
							
							
							%>
               <tr>
				
					<td align="right"><%= ++count %></td>
					<td align="left"><%= vehno %></td>
					<td align="right"><a href="CameraSlideReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&Vehicle1=<%= vehno%>&cat=<%=category %>&type=<%=type %> " target="_blank"><%= cnt1%></a></td>
					<td align="right"><a href="CameraSlideReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&Vehicle1=<%= vehno%>&cat=<%=category1 %>&type=<%=type1 %> " target="_blank"><%= cnt2%></a></td>
					<td align="right"><a href="CameraSlideReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&Vehicle1=<%= vehno%>&cat=<%=category2 %>&type=<%=type2 %>" target="_blank"><%= cnt3%></a></td>
					<td align="right"><a href="CameraSlideReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&Vehicle1=<%= vehno%>&cat=<%=category3 %>&type=<%=type3 %> " target="_blank"><%= cnt4%></a></td>
					<td align="right"><a href="CameraSlideReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&Vehicle1=<%= vehno%>&cat=<%=category4 %>&type=<%=type4 %> " target="_blank"><%= cnt5%></a></td>
					<td align="right"><a href="CameraSlideReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&Vehicle1=<%= vehno%>&cat=<%=category5 %>&type=<%=type5 %> " target="_blank"><%= cnt6%></a></td>
					<td align="right"><a href="CameraSlideReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&Vehicle1=<%= vehno%>&cat=<%=category6 %>&type=<%=type6 %> " target="_blank"><%= cnt7%></a></td>
		<% 	}%>
			</tr>
	</tbody>
	<tfoot>
								<tr>
										<th>Sr No</th>
										<th>Vehicle</th>
										<th>Total Images</th>
										<th>Cabin Incident</th>
										<th>Road Incident</th>
										<th>Cabin Exception</th>
										<th>Road Exception</th>
										<th>Cabin Others</th>
										<th>Road Others</th>
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
						<h4 class="modal-title">Custom Column Selection for Camera Images Report </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
				int i=0; 
				 
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
							<div align="left"><input type="text" id="net_id1<%=i %>" name="net_id1<%=i %>" style="width:70px;padding: 4px 5px 2px 5px;
							border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif; " value="<%=i %>" readonly/>                  
						</div>
						<input type="checkbox" name="check<%=i %>"   id="check<%=i %>"  /></td>
						<td><input type="text" name="clname<%=i %>"   id="clname<%=i %>"  value="<%=stcol.nextToken()%>" readonly="readonly" style="border:none" /></td>
							</tr>
							<%i++;}%></tbody>
						</table>
						
						<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=i %>"/>
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
								title: 'Camera Images Summary Report From <%if(from==null){ %><%=default_date_3%><%}else{%><%=from%><%}%> To <%if(to==null){ %><%=default_date_1%><%}else{%><%=to%><%}%>',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Camera Images Summary Report From <%if(from==null){ %><%=default_date_3%><%}else{%><%=from%><%}%> To <%if(to==null){ %><%=default_date_1%><%}else{%><%=to%><%}%>',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Camera Images Summary Report From <%if(from==null){ %><%=default_date_3%><%}else{%><%=from%><%}%> To <%if(to==null){ %><%=default_date_1%><%}else{%><%=to%><%}%>',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Camera Images Summary Report From <%if(from==null){ %><%=default_date_3%><%}else{%><%=from%><%}%> To <%if(to==null){ %><%=default_date_1%><%}else{%><%=to%><%}%>',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Camera Images Summary Report From <%if(from==null){ %><%=default_date_3%><%}else{%><%=from%><%}%> To <%if(to==null){ %><%=default_date_1%><%}else{%><%=to%><%}%>',
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
                        dt_basic.columns(element).visible(true); VehicleMentananceReport.jsp
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






