<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="java.io.*" %>
   <%@ page import = "java.io.FileNotFoundException"%>
  	<%@ page import = "java.io.FileOutputStream"%>
  	<%@ page import = " java.io.IOException"%>
  	<%@ page import="javax.activation.*" %>
<%@ page buffer="16kb" %>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
<%!
private static boolean intersects(long r1start, long r1end, long r2start, long r2end) 
{
	return (r1start == r2start) || (r1start > r2start ? r1start <=r2end : r2start <= r1end);

}
%>
<%
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
fleetview.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>
<html>
<head>
<title>Entry Form Template</title>

<script src="js/datatable/feather.min.js"></script>
<script src="js/datatable/moment.js"></script>
<link rel="stylesheet" href="css/table/jquery-ui.css">

<script src="js/datatable/jquery-ui.js"></script>
<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="css/table/TemplateCSS.css">

<script language="javascript">
function dateformat(days)
{
if(days=='Jan')
return(01);
else
if(days=='Feb')
	return(02);
else
	if(days=='Mar')
		return(03);
	else
		if(days=='Apr')
			return(04);
		else
			if(days=='May')
				return(05);
			else
				if(days=='Jun')
					return(06);
				else
					if(days=='Jul')
						return(07);
					else
						if(days=='Aug')
							return(08);
						else
							if(days=='Sep')
								return(09);
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
function validate()
{
	
	//alert("------------------------------------>");
	// loc=document.getElementById("locat").value;
	//alert(loc);
	var stdate=document.tripend.stdate1.value;
	//alert(stdate);
	var sttime=document.tripend.sttime1.value;
	// alert(sttime);
	var enddate=document.tripend.calender1.value;
	//alert("arr date----> "+enddate);
	var enddate1=document.tripend.calender11.value;
//	alert("unloddat---> "+enddate1);
    var endtime11=document.tripend.endtime11.value;
   // alert(endtime11);
    var endtime12=document.tripend.endtime12.value;
   // alert(endtime12);
	
	var endtime1=document.tripend.endtime1.value;
	var time=document.tripend.endtime1.value;
	var endtime2=document.tripend.endtime2.value;

	var dm1,dd1,dy1,dm2,dd2,dy2;
	var stm1, stm2;

	dy1=stdate.substring(0,4);
	
	dm1=stdate.substring(5,7);
	
	dd1=stdate.substring(8,10);

	dd2=enddate.substring(0,2);
	//alert("dd2---> " +dd2);
	dd3=enddate1.substring(0,2);
	//alert("dd3--->"+dd3);
	dm2=enddate.substring(3,6);
	//alert("dm2--->"+dm2);
	dm3=enddate1.substring(3,6);
	//alert("dm3--->"+dm3);
dy2=enddate.substring(7,11);
//alert("dy2--->"+dy2);
dy3=enddate1.substring(7,11);
//alert("dy3--->"+dy3);
//alert(stdate);
//alert(enddate);
//alert(dm2);
if(dm2=="Jan")
{
	dm2="01";
}
else if(dm2=="Feb")
{//alert("in feb");
dm2="02";
}else if(dm2=="Mar")
{
	dm2="03";
}
else if(dm2=="Apr")
{
	dm2="04";
}

else if(dm2=="May")
{
	dm2="05";
}
else if(dm2=="Jun")
{
	dm2="06";
}
else if(dm2=="Jul")
{
	dm2="07";
}
else if(dm2=="Aug")
{
	dm2="08";
}
else if(dm2=="Sep")
{
	dm2="09";
}
else if(dm2=="Oct")
{
	dm2="10";
}else if(dm2=="Nov")
{
	dm2="11";
}
else if(dm2=="Dec")
{
	dm2="12";
}

dm3=dateformat(dm3);

//alert("after all if");
//alert("dm3"+dm3);
//alert("dm2"+dm2);
//alert(dy2);

	stm1=sttime.substring(0,2);
	
	stm2=sttime.substring(3,5);
	
//alert("arrival-->>"+enddate);
//alert("upload-->>"+enddate1);

if(enddate=="")
{
	alert("Please select Arrival Date");
	return false;
}else if(enddate1=="")
{
	alert("Please select Unload Date");
	return false;
}
if(time=="Select" || time=="")
{
	alert("Please enter Arrival Time");
	return false;
}	

if(dy3<dy2)
{
	alert("Unload date should not be less than arrival date");
	
	return false;
	
}
else if(dy3==dy2)
{
		if(dm3<dm2)
	{
			alert("Unload date should not be less than arrival date");
		
		return false;
	}
		else if(dm3==dm2 && dy3==dy2)
		{
			if(dd3<dd2)
			{
				alert("Unload date should not be less than arrival date");
				
				return false;
			}
			else if(dd3==dd2)
			{
				if(endtime11<endtime1)
				{
					alert("Unload time should not be less than arrival time");
					return false;
					}	

				else if(endtime11==endtime1)
				{
						if(endtime12<=endtime2)
					{
							alert("Unload time should not be less than or equal to arrival time");
						
						return false;
					}
				}

				}
		}
}

if(dy2<dy1)
{
	alert("Arrival date should not be less than start date");
	
	return false;
}
else if(dy2==dy1)
{
	
		
	 if(dm2<dm1)
	{
			alert("Arrival date should not be less than start date");
		
		return false;
	}
		else if(dm1==dm2)
		{
			 if(dd2<dd1)
			{
				alert("Arrival date should not be less than start date");
				
				return false;
			}
			else if(dd1==dd2)
			{
				 if(endtime1<stm1)
				{
					alert("Arrival time should not be less than starttime");
					return false;
					}	

				else if(endtime1==stm1)
				{
					
					 if(endtime2<=stm2)
					{
							alert("Arrival time should not be less than or equal to start time");
						
						return false;
					}
				}
				}
		}
}

//alert("dy3--->"+dy3);
//alert("dy2--->"+dy2);
var resn=document.tripend.Reason.value;
//alert("Reason--->" +resn);
if(resn=="select")
{
	alert("Please enter a valid reason for closing");
	return false;
}


	return true;

	
}



function showlocation(dropdown, vehcode, vehno)
{
	var vv=dropdown.selectedIndex;
        var SelValue = dropdown.options[vv].value;
	
	var hrs=document.tripend.endtime1.value;
	var mins=document.tripend.endtime2.value;
	var seldte=document.tripend.calender1.value;
	
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

             // Create a function that will receive data sent from the server
           	  ajaxRequest.onreadystatechange = function()
                   {
    	 	  if(ajaxRequest.readyState == 4)
                      {
                         var reslt=ajaxRequest.responseText;
                         //alert(reslt);
                         document.getElementById("loc").innerHTML=reslt;
                         
		     } 
         	  };
             var queryString = "?hrs="+hrs+"&mins="+mins+"&vehcode="+vehcode+"&seldte="+seldte+"&vehno="+vehno;
	     ajaxRequest.open("GET", "Ajaxgetlocation.jsp" + queryString, true);
	     ajaxRequest.send(null); 
}
</script>
<script>
function showme(udr)
{
	//alert("hi"+udr);
	if(udr=="other")
	{
	//	alert("welcome");
		document.getElementById('udr').style.visibility="visible";
	}
	else
	{
		document.getElementById('udr').style.visibility="hidden";
		//alert("select");
	}
}
function upload()
{
	var name1= document.getElementById("Filename1").value;
	 //alert(name1);
	 	var valid_extensions = /(.jpg|.jpeg|.png|.bmp)$/i;
	  if(valid_extensions.test(name1))
	  {
	  document.getElementById("Filename1").style.display="none";
	  document.getElementById("f1").innerHTML=name1;
	  document.getElementById("f1").style.display="";
	  document.getElementById("f6").value=name1;
	  document.getElementById("remove1").style.display="";
	  }
	  else{
		  alert("Please upload only jpg,png,jpeg and bmp formatted file");
			document.getElementById("Filename1").value="";
			  
	  }
}
function remove()
{
		document.getElementById("f1").innerHTML="";
		document.getElementById("f1").style.display="none";
		document.getElementById("remove1").style.display="none";
		document.getElementById("Filename1").value="";
		document.getElementById("f6").value="";
		document.getElementById("Filename1").style.display="";
	}
</script>

</head>
<body onload="focusChild();">
 <form name="tripend" id="tripend"  action=" " method="post" enctype="multipart/form-data" onSubmit="return validate();">

<%! 
Connection con1, con2;
%>
<%
try {
	
	Class.forName(MM_dbConn_DRIVER);
	con2 = fleetview.ReturnConnection1();
	con1 = fleetview.ReturnConnection();
	Statement st1R=con1.createStatement(), st2R=con1.createStatement(), st4R=con1.createStatement(), st3R=con1.createStatement();
Statement stmt1=con1.createStatement(), stmt2=con2.createStatement(), stmt3=con1.createStatement(),stmt4=con1.createStatement(),stdetail=con1.createStatement();
Statement stquery=con1.createStatement();

ResultSet rs1=null, rs4=null, rs5=null, rs7=null, rs8=null, rs10=null, rs11=null, rs13=null, rs14=null, rs15=null, rs16=null, rs17=null,rs18=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="", sql10="", sql11="", sql13="", sql14="", sql15="", sql16="", sql17="",sql18="",sql34="";

String stdate="", sttime="";
String unloadtime="",endtime="",vehno="",tripid="",enddate="",endhrs="",endmin="",unloaddate="",unloadendhrs="",unloadendmin="",Unloadingcomment="",delayrsn="",pageflag="";


String vehcode="",loc1="", vehreg="", stplace="", endplace="",vehiclecode="",udr="",tripcat="",rptdatetme="",loadingdelay="",Unloadingdelay="", driverid="", drivername="", stcode="", endcode="", gpname="",ownername="";
double stlat=0, stlong=0, endlat=0, endlong=0,osdur=0;
int oscount=0,account=0,dccount=0,distance=0,stopcount=0, stkm=0, endkm=0, totkm=0;
int  filecount = 0,count1 = 0,i=0;
File savedFile;
int flag2=0;
String itemName="";

Boolean flag=false,flag1=true;
String savefilestring="";
String location="", latitu="", longi="",weight="",vendor="",fromdate="",fromtime="",fromdatetime="",today="",podnumber="";
java.util.Date d=new java.util.Date();
String rfname="",rlname="";
String dte=new SimpleDateFormat("yyyy-MM-dd").format(d);
int hours=(d.getHours());
int minutes=(d.getMinutes());
String InsertDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
String InsertDateTimenew=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date());

vehno=request.getParameter("vehno");
System.out.println("vehno--------------> " +vehno);

vehiclecode=request.getParameter("vehcode");
System.out.println("vehiclecode--------------> " +vehiclecode);

tripid=request.getParameter("tripid");
System.out.println("tripid--------------> " +tripid);

pageflag=request.getParameter("pageflag");
System.out.println("pageflag" +pageflag);
String pageflag1=request.getParameter("pageflag");
System.out.println("pageflag1" +pageflag1);

String Parameter4=request.getParameter("Parameter4");
System.out.println("Parameter4" +Parameter4);
loc1=request.getParameter("locat11");
System.out.println("loc1" +loc1);
String Parameternew=request.getParameter("Parameternew");
System.out.println("Parameternew" +Parameternew);

String newstartdate=request.getParameter("newstartdate");
System.out.println("newstartdate" +newstartdate);

if(Parameternew!=null)
{
	%>
	<script>
	var newstartdate= document.getElementById("newstartdate").value;
	alert("newstartadte---> "+newstartdate);
	alert("Enddate cannot be greater than Newtrip startdate.NewTripStartdate is " <%=newstartdate%>);
	</script>
	<%
}
if(Parameter4!=null)
{
	
	if(pageflag1.equalsIgnoreCase("Currentposition"))
	{
	%>
	
	
		<div>
		<div><div align="center"><font size="3" face="Arial"><b>Trip ended sucessfully at <%=loc1 %> on <%=InsertDateTimenew%></b></font></div></div></div>
		<div>
			
		<div><div align="center"><font size="3" face="Arial"><b>Thank You........</b></font></div></div></div>
		<div>
			
		<div><div align="center">
		<font size="3" face="Arial"><b>The window will get automatically closed within 5 seconds</b></font></div>
		</div>
		</div>
		
		
		
		
	<script type="text/javascript">
	
	try{
	    setTimeout("self.close()", 5000 );
	//	alert("Trip ended Successfully");
		//window.close();
		window.opener.location.reload("currentposition2.jsp");
		}
		catch(e)
		{
			alert(e);
		}
	</script>
	<%
	}
	else if(pageflag1.equalsIgnoreCase("MyTrip"))
	
	{
		
		
		%>
		
		<div>
		<div><div align="center"><font size="3" face="Arial"><b>Trip ended sucessfully at <%=loc1 %> on <%=InsertDateTimenew%></b></font></div></div></div>
		<div>
			
		<div><div align="center"><font size="3" face="Arial"><b>Thank You........</b></font></div></div></div>
		<div>
			
		<div><div align="center">
		<font size="3" face="Arial"><b>The window will get automatically closed within 5 seconds</b></font></div>
		</div>
		</div>
		
		<script type="text/javascript">
		try{
	    setTimeout("self.close()", 5000 );
	//	alert("Trip ended Successfully");
		//window.close();
		window.opener.location.reload("my_trips.jsp");
		}
		catch(e)
		{
			alert(e);
		}
		</script>
		<%
	}
}
		String loginuser=session.getValue("user").toString();
		String user=session.getValue("usertypevalue").toString();
		rfname=session.getAttribute("rfname").toString(); //.setAttribute("rfname",fnamelist);
		rlname=session.getAttribute("rlname").toString();
		
			java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
			Format formatter=new SimpleDateFormat("yyyy-MM-dd");
			String nwfrmtdte=formatter.format(datefrmdb);
		
		java.util.Date datefrmdb1=new java.util.Date();
		Format formatter1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String nwfrmtdte1=formatter1.format(datefrmdb1);
			today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
			String today1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		today=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(today));  
		
		
		String sql12="select * from t_completedjourney where TripId='"+tripid+"' ";
		ResultSet rs12=stmt1.executeQuery(sql12);
		
		if(rs12.next())
		{ %>
			
				<div align="center">
				<div>
					<div align="center">  <B>Trip End information for this Trip has already been entered. </B>  </div>
				</div>
				<div>
					<div align="center">  <B> Note: </B> Please refresh 'Current Position' page to reflect the changes. </div>
				</div>	
				</div>
				
	<%	}else
	{ 
		sql1="select * from t_startedjourney where TripId='"+tripid+"' ";
		rs1=stmt1.executeQuery(sql1);
		
		if(rs1.next())
		{
			
			stdate=rs1.getString("StartDate");
			sttime=rs1.getString("StartTime");
		}
		String title="";
		if(tripid.equalsIgnoreCase("null") ||tripid=="")
		{
			
		}
		else
		{
			title="Trip End Information for TripId "+tripid+" and Vehicle no."+vehno;
        }
     %>	
			    
	<!-- BEGIN: Content-->
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-10">
							<h3 class="content-header-title  mb-0" style="color: #060637"><%=title%></h3>
						</div>
					</div>
				</div>
	 	
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">
							<button
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0 btn2"
								data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
								Register Complaint</button>

							<button id="kt_engage_demos_toggle"
								class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0 btn2">
								<span id="kt_engage_demos_label">Help</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<% 
			     String Sqldetail="select vehid,Startdate,Starttime from t_startedjourney where Tripid='"+tripid+"' limit 1 ";
			    // System.out.println(Sqldetail);
			       ResultSet rstdetail= stdetail.executeQuery(Sqldetail);
			       if(rstdetail.next())
			       {
			    	   fromdate=rstdetail.getString("Startdate");
			    	//   System.out.println(fromdate);
			    	   fromdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));
			    	   fromtime=rstdetail.getString("Starttime");
			    	   fromdatetime =fromdate+fromtime;
			    	   vehcode =rstdetail.getString("VehId");
			       }
			       %>
    	          <%
					sql10="select * from t_onlinedata where VehicleCode='"+vehiclecode+"' ";
					rs10=stmt1.executeQuery(sql10);
					if(rs10.next())
					{
						location=rs10.getString("Location");
						latitu=rs10.getString("LatitudePosition");
						longi=rs10.getString("LongitudePosition");
					}
					if((sttime==null) || (sttime.equals("")))
					{
						sttime="00:00:00";	
					}
					
					%>
			<div class="content-body">
				<!--  start content body -->
				<!-- Basic Vertical form layout section start -->

				<section class="sectionNew" id="basic--layouts">
					<div class="row">
						<div class="col-md-12 col-12">
							<div class="card">

								<div class="card-body card">
									<!-- Start card body -->
<!--                                    <form name="tripend" id="tripend"  action="endtripanilinsert.jsp" method="post" enctype="multipart/form-data" onSubmit="return validate();">
 -->
										<div class="d-grid gap-2 col-3 mx-auto mb-2">
										 	 <a href="javascript:toggleDetails1(<%=i%>,true);" onclick="javascript:window.open ('custom_details.jsp?vehcode=<%=rstdetail.getString("VehId")%>&data=<%=fromdate%>&data1=<%=today%>','win2','scrollbars=1,resizeable=0,width=500,height=500');";>
											<font size="3" color="maroon"><b><u>Click to View Detail Report</u></b></font></a>
										</div>
										
										 <div class="row col-12 mb-1">
											<div class="col-4">
													<label class="tcolor"><font color="red">*</font> Arrival Date Time :</label>
													<div class="input-group input-group-merge">
														<input type="text" id="calender1" name="calender1"
															class="form-control" value="<%=today%>" readonly="readonly"/> <span
															class="input-group-text"><svg
																xmlns="http://www.w3.org/2000/svg" width="14"
																height="14" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-calendar">
																<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
																<line x1="16" y1="2" x2="16" y2="6"></line>
																<line x1="8" y1="2" x2="8" y2="6"></line>
																<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
													</div>
													<script>
																$(document).ready(function() {
																$( function() {
															$( "#calender1" ).datepicker({
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
												<select name="endtime1" id="endtime1" class="form-select" value="Select" onChange="showlocation(this, <%=vehiclecode%>, '<%=vehno%>');">
							                           <option value="Select">Select</option>
									                   <option value="00" <% if(00==hours) { %> Selected <% } %> >00</option>
									                   <option value="01" <% if(01==hours) { %> Selected <% } %>>01</option>
									                   <option value="02" <% if(02==hours) { %> Selected <% } %>>02</option>
									                   <option value="03" <% if(03==hours) { %> Selected <% } %>>03</option>
									                   <option value="04" <% if(04==hours) { %> Selected <% } %>>04</option>
									                   <option value="05" <% if(05==hours) { %> Selected <% } %>>05</option>
									                   <option value="06" <% if(06==hours) { %> Selected <% } %>>06</option>
									                   <option value="07" <% if(07==hours) { %> Selected <% } %>>07</option>
									                   <option value="08" <% if(8==hours) { %> Selected <% } %>>08</option>
									                   <option value="09" <% if(9==hours) { %> Selected <% } %>>09</option>
									                   <option value="10" <% if(10==hours) { %> Selected <% } %>>10</option>
									                   <option value="11" <% if(11==hours) { %> Selected <% } %>>11</option> 
									                   <option value="12" <% if(12==hours) { %> Selected <% } %>>12</option>
									                   <option value="13" <% if(13==hours) { %> Selected <% } %>>13</option>
									                   <option value="14" <% if(14==hours) { %> Selected <% } %>>14</option>
									                   <option value="15" <% if(15==hours) { %> Selected <% } %>>15</option>
									                   <option value="16" <% if(16==hours) { %> Selected <% } %>>16</option>
									                   <option value="17" <% if(17==hours) { %> Selected <% } %>>17</option>
									                   <option value="18" <% if(18==hours) { %> Selected <% } %>>18</option>
									                   <option value="19" <% if(19==hours) { %> Selected <% } %>>19</option>
									                   <option value="20" <% if(20==hours) { %> Selected <% } %>>20</option>
									                   <option value="21" <% if(21==hours) { %> Selected <% } %>>21</option> 
									                   <option value="22" <% if(22==hours) { %> Selected <% } %>>22</option>
									                   <option value="23" <% if(23==hours) { %> Selected <% } %>>23</option>
												</select>
												</div>
												</div>
												<div class="col-md-1">
												    <label for="basicSelect">MM</label>
													<div class="input-group input-group-merge">
												     <select name="endtime2" id="endtime2" class="form-select" value="Select" onChange="showlocation(this, <%=vehiclecode%>, <%=vehno%>);">
															  <option value="00" <% if(minutes > 00 & minutes < 05) { %> Selected <% } %>>00</option>
										        	          <option value="10" <% if(minutes > 05 & minutes < 15) { %> Selected <% } %>>10</option>
										        	          <option value="20" <% if(minutes > 15 & minutes < 25) { %> Selected <% } %>>20</option>
										        	          <option value="30" <% if(minutes > 25 & minutes < 35) { %> Selected <% } %>>30</option>
										        	          <option value="40" <% if(minutes > 35 & minutes < 45) { %> Selected <% } %>>40</option> 
										        	          <option value="50" <% if(minutes > 45) { %> Selected <% } %>>50</option>										
													 </select>
												</div>
												</div>
											<div class="col-4">
													<label class="tcolor"><font color="red">*</font>Unload Date Time :</label>
													<div class="input-group input-group-merge">
														<input type="text" id="calender11" name="calender11"
															class="form-control" name="calender11" size="15" value="<%=today%>" readonly="readonly"/> <span
															class="input-group-text"><svg
																xmlns="http://www.w3.org/2000/svg" width="14"
																height="14" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-calendar">
																<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
																<line x1="16" y1="2" x2="16" y2="6"></line>
																<line x1="8" y1="2" x2="8" y2="6"></line>
																<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
													</div>
													<script>
																$(document).ready(function() {
																$( function() {
															$( "#calender11" ).datepicker({
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
													<select name="endtime11" id="endtime11" class="form-select" value="Select" onChange="showlocation(this, <%=vehiclecode%>, '<%=vehno%>');">
								                           <option value="Select">Select</option>
										                   <option value="00" <% if(00==hours) { %> Selected <% } %> >00</option>
										                   <option value="01" <% if(01==hours) { %> Selected <% } %>>01</option>
										                   <option value="02" <% if(02==hours) { %> Selected <% } %>>02</option>
										                   <option value="03" <% if(03==hours) { %> Selected <% } %>>03</option>
										                   <option value="04" <% if(04==hours) { %> Selected <% } %>>04</option>
										                   <option value="05" <% if(05==hours) { %> Selected <% } %>>05</option>
										                   <option value="06" <% if(06==hours) { %> Selected <% } %>>06</option>
										                   <option value="07" <% if(07==hours) { %> Selected <% } %>>07</option>
										                   <option value="08" <% if(8==hours) { %> Selected <% } %>>08</option>
										                   <option value="09" <% if(9==hours) { %> Selected <% } %>>09</option>
										                   <option value="10" <% if(10==hours) { %> Selected <% } %>>10</option>
										                   <option value="11" <% if(11==hours) { %> Selected <% } %>>11</option> 
										                   <option value="12" <% if(12==hours) { %> Selected <% } %>>12</option>
										                   <option value="13" <% if(13==hours) { %> Selected <% } %>>13</option>
										                   <option value="14" <% if(14==hours) { %> Selected <% } %>>14</option>
										                   <option value="15" <% if(15==hours) { %> Selected <% } %>>15</option>
										                   <option value="16" <% if(16==hours) { %> Selected <% } %>>16</option>
										                   <option value="17" <% if(17==hours) { %> Selected <% } %>>17</option>
										                   <option value="18" <% if(18==hours) { %> Selected <% } %>>18</option>
										                   <option value="19" <% if(19==hours) { %> Selected <% } %>>19</option>
										                   <option value="20" <% if(20==hours) { %> Selected <% } %>>20</option>
										                   <option value="21" <% if(21==hours) { %> Selected <% } %>>21</option> 
										                   <option value="22" <% if(22==hours) { %> Selected <% } %>>22</option>
										                   <option value="23" <% if(23==hours) { %> Selected <% } %>>23</option>
													</select>
													</div>
													</div>
													<div class="col-md-1">
													    <label for="basicSelect">MM</label>
														<div class="input-group input-group-merge">
													     <select name="endtime12" id="endtime12" class="form-select" value="Select" onChange="showlocation(this, <%=vehiclecode%>, <%=vehno%>);">
															  <option value="00" <% if(minutes > 00 & minutes < 05) { %> Selected <% } %>>00</option>
										        	          <option value="10" <% if(minutes > 05 & minutes < 15) { %> Selected <% } %>>10</option>
										        	          <option value="20" <% if(minutes > 15 & minutes < 25) { %> Selected <% } %>>20</option>
										        	          <option value="30" <% if(minutes > 25 & minutes < 35) { %> Selected <% } %>>30</option>
										        	          <option value="40" <% if(minutes > 35 & minutes < 45) { %> Selected <% } %>>40</option> 
										        	          <option value="50" <% if(minutes > 45) { %> Selected <% } %>>50</option>									
														 </select>
													</div>
													</div>
								        </div>
								         <%   sql34="select Distinct(DelayReason) from t_completedjourney where OwnerName='"+user+"' order By DelayReason Asc";
                                                 // out.print(sql3); 
                                              ResultSet rs34=stmt1.executeQuery(sql34);
                                         %>
										<div class="row col-12 mb-1">
											<div class="col-3">
												<label for="Old Password:-" class="tcolor"><b>Unload
														Delay Reason :</b></label><br>
												<div class="input-container">
													<select class="form-select" name="udr1" id="udr1"
														aria-label="Default select example"
														onchange="showme(this.value)">
														<option value="select">Select</option>
														<%
															while (rs34.next()) {
														%>
														<option value="<%=rs34.getString("DelayReason")%>">
															<%=rs34.getString("DelayReason")%>
														</option>


														<%
															}
														%>
														<option value="other">Other</option>
													</select>

												</div>
												<div class="mt-1">
														<input type="text"  class="form-control" name="udr"
															value="" id="udr" style="visibility: hidden;"
															placeholder="Enter your  Reason" />
												</div>
											</div>

											<div class="col-4">
												<label for=" Designation:-" class="tcolor"> POD :</label>
												<div class="input-container">
													<input class="form-control" type="text" name="podnumber"
														value="" id="podnumber"
														placeholder="Enter your Designation">
												</div>
											</div>
										</div>

										<div class="row col-12 mb-1">
											<div class="col-4">
												<label for="Old Password:-" class="tcolor">POD File Upload :</label>
												<div class="input-container">
													<input class="form-control" type="file"
														placeholder="Enter your Old Password" name="Filename1" id="Filename1" value="" onchange="upload();">
														<font id="f1" style="display:none;" name = "f1"></font>
														<a href="#" onclick="remove();" id="remove1" style="display: none;">Remove</a>
													  <input type="text" id="f6" name=f6 class=" form-control" value="" style="width: 150px; height: 20px;display: none;"/> 
														
												</div>
											</div>
											<div class="col-4">
												<label for="" class="tcolor"><b>Comments</b></label>
												<div class="input-container">
													<textarea class="form-control" name="unloadcmnt"
														placeholder="Leave a comment here" id="unloadcmnt"></textarea>
												</div>
											</div>
											<div class="col-4">
												<label for="Old Password:-" class="tcolor">Reason for Closing :</label>
												<div class="input-container">
													<select class="form-select" name="Reason" id="Reason"
														aria-label="Default select example">
														<option value="select">Select</option>
													      <% 
													         String res1="select Options from t_JourneyGoals where gpname='Transworld'";
													         ResultSet res=st1R.executeQuery(res1);
													         System.out.println("options querry---->  " +res1);
													            while(res.next())  
													       		 { %>
													           		  <option value="<%=res.getString("Options") %>" > <%=res.getString("Options") %> </option>
													   	    
													   	   
													   	     <%  }
													     %>
													</select>
												</div>
											</div>
										</div>

										<div class="d-grid gap-2 col-6 mx-auto mt-2">
											<button class="btn btn-primary btn2" type="submit" name="submit" value="Submit">Register</button>
										</div>
										
										<div class="d-grid gap-2 col-6 mx-auto mt-2">
										  <label class="tcolor"> Location at selected time is: 
	                                       <u><%=fleetview.showNewMap(latitu,longi,location) %></u></label>
										
										</div>
									
								</div>
								<!--  end of card body -->
							</div>
						</div>
					</div>
				</section>
				<!-- Basic Vertical form layout section end -->
			</div>
		</div>
		<!--  end content body -->
	</div>
	<!-- end content wrapper-->
	</div>
	<!-- end app-content -->
	<!-- END: Content-->
<%
	}
} catch(Exception e) { /*out.println("Exception----->" +e); */}
finally
{
	try
	{
		con1.close();
	}catch(Exception e)
	{}
	try
	{
		con2.close();	
	}catch(Exception e)
	{}
	try
	{
		fleetview.closeConnection1();
	}catch(Exception e)
	{}
	try
	{
		fleetview.closeConnection();
	}catch(Exception e)
	{}
	
} 
  
%>
	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>
	<script>
		$(window).on('load', function() {
			if (feather) {
				feather.replace({
					width : 14,
					height : 14
				});
			}
		})
	</script>
</form>
	<br>
	<%@ include file="footernew1.jsp"%>
</body>
</html>
</jsp:useBean>
