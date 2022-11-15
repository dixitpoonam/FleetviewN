<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ include file="headernew1.jsp"%>
    
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
	//	alert("in method...")
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
		// alert("flag is false..");
		
		ajaxRequest = new XMLHttpRequest();
		
		
		var ajaxRequest;
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				
			} 
		};
		//alert("in ajax call.."+(nodes.length/2));
		//below statement for template functioning only
		ajaxRequest.open("GET", "ReSetDemo.jsp?call=SetDefault&reportno=000&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true);
		
		//for report conversion uncomment the line below and erase the line above
		<%-- ajaxRequest.open("GET", "ReSet.jsp?call=SetDefault&reportno="+<%=reportno%>+"&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true); --%>
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
Connection conn=null, conn1=null;

String user,sql,sql1,sql2;
String data1, data2,showdate1,showdate,DriverName,Owner;
int OScount, RAcount, RDcount,Distance;
double Rating;
int OS1,RA1,RD1,CD1,DT1,ST1,RU1,ND1;
 %>
<%
	
	Statement st=null, st1=null,st2=null,st3=null,st4=null,st8=null,st20=null,st21=null;
%>
<%
	try
	{
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
	    st20=conn.createStatement();
	    st21=conn.createStatement();
	    st=conn.createStatement();
		st1=conn.createStatement();
		st2=conn.createStatement();
		st3=conn.createStatement();
		st4=conn.createStatement();
		st8=conn.createStatement();
		
	}
	catch(Exception e)
	{
		
	}
	
%>
<%
int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;

String setdefault="select * from db_gps.ColumnDisplayMaster where userid='"+session.getAttribute("UserID").toString()+"' and reportno='"+reportno+"'";
System.out.println("set custom query:"+setdefault);
ResultSet rssetdefault=st20.executeQuery(setdefault);
if(rssetdefault.next())
{
	//setDefFlag=true;    uncomment this line for report conversion
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
		//setDefFlag=true;   uncomment this line for report conversion
		
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
		System.out.println("on load");
		
		datex1 =  session.getAttribute("today").toString();  //dd-MMM-yyyy
		datex2 = session.getAttribute("today").toString();
		
	} else {
		
		System.out.println("Inside ELSSSSSSSSS ");
		
		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");
		
	}

System.out.println(" datex1 "+datex1+" datex2 "+datex2);

String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

String dttime=""+dt+" 00:00:00";


String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

String dt1time=""+dt1+" 23:59:59";


System.out.println("Query pass date params:  from:"+dt+" to: "+dt1);

	
System.out.println("Query pass date time  params:  from:"+dttime+" to: "+dt1time);

OS1=0;
RA1=0;
RD1=0;
CD1=0;
DT1=0;
ST1=0;
RU1=0;
ND1=0;
Rating = 0.0;
data1=datex1;
data2=datex2;
System.out.println("data1   "+data1);
System.out.println("data2   "+data2);
Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
String data3 = "",data4 = "";
data3 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data1));
data4 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data2));

%>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Report Head From <%=datex1 %>
							To <%=datex2 %> Of <%=username %></h3>
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
		    <div class="col-md-3"></div>
			<div class="col-md-2">
				

				<label for="from">From:</label>
				<div class="input-group input-group-merge" >
				
					<input type="text" name="data" id="data"  class="form-control" value="<%=datex1%>"> 
					<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
				</div>
				
				   <script>

						$(document).ready(function() {
							$( function() {
   				 $( "#data" ).datepicker({
		    dateFormat: 'dd-M-yy',
			changeMonth: true,
            changeYear: true
	});
  } );
				
});

				   </script>
				  
			</div>
			<div class="col-md-2">
				<label for="to">To:</label>
				<div class="input-group input-group-merge" >
				
					<input type="text" id="data1" name="data1"  class="form-control" value="<%=datex2%>"/> 
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
			maxDate:7  */
});
} );
			
});

			   </script>
		</div>

			<div class="col-md-2">
				<input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="button" onclick="return chk()"  value="Submit">
			</div>
		</div><br>
			</form>
			
			<%
			String usertypevalue=session.getAttribute("usertypevalue").toString();
			System.out.println(" User ");
			String typeofuser=session.getAttribute("TypeofUser").toString();
			String SrchTrans="";
			System.out.println(usertypevalue+" User "+typeofuser);
			if(typeofuser.equalsIgnoreCase("Group"))
			{System.out.println("IN Group ");
				sql="SELECT VehRegno FROM db_gps.t_group WHERE GPName='"+usertypevalue+"' group by VehRegno";
				System.out.println("*****8     "+sql);
				ResultSet rstGrp=st3.executeQuery(sql);
				

				SrchTrans="(";
				int k = 0;
				while(rstGrp.next())
				{
					SrchTrans=SrchTrans+"'"+rstGrp.getString("VehRegno")+"',";
					k++;
				}
				SrchTrans=SrchTrans.substring(0,SrchTrans.length()-1)+")";

			}
			else
			{
				System.out.println("IN Else ");
				SrchTrans="('"+usertypevalue+"')";	
			}
				

			System.out.println(" SrchTrans : "+SrchTrans);



			sql="select dcode from db_gpsExceptions.t_driver_ds where TheDate >='"+data3+"' and TheDate <='"+data4+"' and Transporter in "+SrchTrans+" group by dcode";
			ResultSet rstdcode=st.executeQuery(sql);
			System.out.println("*****8     "+sql);

			String dcodes="(";
			int k = 0;
			while(rstdcode.next())
			{
				dcodes=dcodes+"'"+rstdcode.getString("dcode")+"',";
				k++;
			}
			
			if(k>0)
			{
			dcodes=dcodes.substring(0,dcodes.length()-1)+")";
			}
			else
			{
				dcodes="No Data";
			}
			System.out.println("dcodes   "+dcodes);
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
											<th>Sr.</th>
											<th>Driver Name</th>
											<th>Driver Code</th>
											<th>OS</th>
											<th>RA</th>
											<th>RD</th>
											<th>CD</th>
											<th>DT</th>
											<th>Stops</th>
											<th>Run Hrs.</th>
											<th>ND</th>
											<th>Rating</th>
										</tr>
									</thead>
									<tbody>
									
<% 										System.out.println("dcodes   "+dcodes);
if(dcodes.equalsIgnoreCase("No Data")){
	sql="select Distinct(DriverID),DriverName from db_gps.t_drivers where owner in "+SrchTrans+"  and  DriverName <>'-'  order by DriverName";
	
}else
{
sql="select Distinct(DriverID),DriverName from db_gps.t_drivers where owner in "+SrchTrans+"  and  DriverName <>'-'  and DriverID in "+dcodes+" order by DriverName";
}
System.out.println("*****8Choose Driver "+sql);
ResultSet rst=st.executeQuery(sql);
int i=1;
while(rst.next())
{
%>
<tr>
<td align="right" style="width: 10px;"><div align="right"><%=i%></div></td>
<%
String owner1="";
try{
String sqlowner="select * from db_gps.t_drivers where DriverID='"+rst.getString("DriverID")+"' and DriverName='"+rst.getString("DriverName")+"' limit 1";
System.out.println("Owner query is " +sqlowner);
ResultSet rsowner=st8.executeQuery(sqlowner);
if(rsowner.next())
{
	owner1=rsowner.getString("Owner");
}
System.out.println("Owner Name is " +owner1);
}catch(Exception e){e.printStackTrace();}
%>
<td align="left" style="width: 150px;"><div align="left" ><a href="driver_exceptions.jsp?data1=<%=data3%>&data2=<%=data4%>&dcode=<%=rst.getString("DriverID")%>&dname=<%=rst.getString("DriverName")%>&transporter=<%=owner1%>"><%=rst.getString("DriverName")%></a></div></td>
<td align="right" style="width: 70px;"><div  align="right" ><%=rst.getString("DriverID")%></div></td>

<%
sql = "select sum(OSCount) as os,sum(RACount) as ra,sum(RDCount) as rd,sum(CRCount) as cd,sum(StopCount) as st,sum(Distance) as dt,sum(Time_To_sec(RDuration)) as HR,sum(Rating) as rating from db_gpsExceptions.t_driver_ds where TheDate>= '"+data3+"' and TheDate <=  '"+data4+"' and Dcode='"+rst.getString("DriverID")+"'  and Transporter in "+SrchTrans+" ";
ResultSet rssum = st2.executeQuery(sql);
if(rssum.next())
{
	%>
	<td align="right" style="width: 25px;"><div align="right" ><% out.print(rssum.getInt("os")); OS1=OS1+rssum.getInt("os"); %></div></td>
	<td align="right"  style="width: 25px;"><div align="right"><% out.print(rssum.getInt("ra")); RA1=RA1+rssum.getInt("ra"); %></div></td>
	<td align="right"  style="width: 25px;"><div align="right"><% out.print(rssum.getInt("rd")); RD1=RD1+rssum.getInt("rd"); %></div></td>
	<td align="right"  style="width: 25px;"><div align="right"><% out.print(rssum.getInt("cd")); CD1=CD1+rssum.getInt("cd"); %></div></td>
	<td align="right"  style="width: 25px;"><div align="right"><% out.print(rssum.getInt("dt")); DT1=DT1+rssum.getInt("dt"); %></div></td>
	<td align="right"  style="width: 25px;"><div align="right"><% out.print(rssum.getInt("st")); ST1=ST1+rssum.getInt("st"); %></div></td>
	<td align="right"  style="width: 25px;"><div align="right"><% String rundur = "";
	int min = 0,hrs = 0,min1 = 0;
	
	min1 = rssum.getInt("HR")/60;
	hrs = min1/60;
	min = min1%60;
	
	if(hrs>9)
	{
		rundur = rundur+hrs;
	}
	else
	{
		rundur = "0"+hrs;
	}
	
	if(min>9)
	{
		rundur = rundur+":"+min;
	}
	else
	{
		rundur = rundur+":0"+min;
	}
	
	out.print(rundur);
	RU1=RU1+rssum.getInt("HR");%></div></td>
	<td align="right"  style="width: 25px;"><div align="right">
	<%
	String sql1="select count(*) ND from db_gpsExceptions.t_driver_ds where Dcode='"+rst.getString("DriverID")+"' and TheDate >='"+data3+"' and TheDate <='"+data4+"' and ND='Yes'  and  Transporter in "+SrchTrans+" ";
	ResultSet rstnd=st1.executeQuery(sql1);
	if(rstnd.next())
	{
		if(rstnd.getInt("ND") > 0) 
		{
			out.print("Yes");
			ND1++;
		}
		else
		{
			out.print("No");
		}
	}
	%>
	</div>
	</td>
	<td align="right"  style="width: 25px;"><div align="right">
	<% 
	String rt=rssum.getString("rating");
	
	System.out.println("rttttttttt"+rt);
	if(rt==null)
	{
		rt="0.0";
	
		out.print(rt);
	}else{
	if(rt.length() > 5)
	{
		out.print(rt.substring(0,rt.indexOf(".")+3));
	}	
	}
	
	Rating=Rating+rssum.getDouble("rating");
	
	%>
	</div>
	</td>
	<%
}
else
{
	
	System.out.println("eslsssssssssss ");
}


%>

<%

%>

<%
i++;
}

String totdur = "";
int totmin1 = 0,tothrs = 0,totmin = 0;
totmin1 = RU1/60;
tothrs = totmin1/60;
totmin = totmin1%60;
if(tothrs>9)
{
	totdur = totdur+tothrs;
}
else
{
	totdur = "0"+tothrs;
}

if(totmin>9)
{
	totdur = totdur+":"+totmin;
}
else
{
	totdur = totdur+":0"+totmin;
}

String rat = "";
String rt=Rating+"";
if(rt.length() > 5)
{
	rat = rt.substring(0,rt.indexOf(".")+3);
}	
else
{
  rat = rt;
}

%>
<tr >
<td colspan="3" class="hed">Total </td>
<td class="hed" align="right"><div align="right"><%=OS1%></div></td>
<td class="hed" align="right"><div align="right"><%=RA1%></div></td>
<td class="hed" align="right"><div align="right"><%=RD1%></div></td>
<td class="hed" align="right"><div align="right"><%=CD1%></div></td>
<td class="hed" align="right"><div align="right"><%=DT1%></div></td>
<td class="hed" align="right"><div align="right"><%=ST1%></div></td>
<td class="hed" align="right"><div align="right"><%=totdur%></div></td>
<td class="hed" align="right"><div align="right"><%=ND1%></div></td>
<td class="hed" align="right"><div align="right"><%=rat%></div></td>
</tr>
									<tfoot>
										<tr>
											<th>Sr.</th>
											<th>Driver Name</th>
											<th>Driver Code</th>
											<th>OS</th>
											<th>RA</th>
											<th>RD</th>
											<th>CD</th>
											<th>DT</th>
											<th>Stops</th>
											<th>Run Hrs.</th>
											<th>ND</th>
											<th>Rating</th>
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
						<h4 class="modal-title">Custom Column Selection for ReportTemplateSession </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int kk=0; 
			String showList= "Sr.No.,VehRegNo,Transporter,VehicleType,Total Distance,Total RunHrs";   //for Template Only 
			//String showList=""+ColumnList;    uncomment this line for report conversion 
			%>		
			<form id="customselect" name="customselect" method="get" action="ReSetDemo.jsp">  <!-- change this to ReSet.jsp for conversion  -->
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
							<%i++;}%></tbody>
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
                                exportOptions: { columns: [<%=setSequence%> ] }
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