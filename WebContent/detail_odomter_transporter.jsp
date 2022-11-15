<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page"></jsp:useBean>
	<%
//classes fleetview=new classes();
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>
<%@page import="com.fleetview.beans.classes"%>
	<%@page import="javax.swing.text.NumberFormatter"%>	
<%@ include file="headernew1.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	 		/* ajaxRequest.open("GET", "ReSet.jsp?call=SetDefault&reportno=000&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true); */
	 		ajaxRequest.send(); 
	 		}
	 	}
 </script>

</head>
<body onload="ondemand()">


<%! 
Connection conn,conn1,con1;
Statement st21,st20;
Statement st,st1,st2,st3,stveh1,stveh2;
String date1, date2,datenew1,datenew2, vehcode, vehregno,tbname,sql,owner,km,rating,from,to,ndcount;
String dateformat;
%>
<% 
int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;

//data1=datenew1&data2=datenew2&Oname=ownerNm&odometer=odometerdiff&vehregno=vehregno&vehicleCode=vehicleCode&employeeName=employeeName		
datenew1=request.getParameter("data1");
//datenew1=request.getParameter("data1");
datenew2=request.getParameter("data2");
//datenew2=request.getParameter("todate");
String vehno=request.getParameter("vehs");
String vehregno=request.getParameter("vehregno");
dateformat=session.getAttribute("dateformat").toString();
//String owner=session.getAttribute("usertypevalue").toString();
String ownerNm =request.getParameter("Oname");
String odometerdiff=request.getParameter("odometer");
String employeeName=request.getParameter("employeeName");
String vehicleCode=request.getParameter("vehicleCode");
String user=session.getAttribute("usertypevalue").toString();
String status ;
int srno_for_del ;
String status1 = request.getParameter("status");
%>
<div class="app-content content">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Detail Report for Fuel & odometer from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(datenew1)) %> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(datenew2)) %></h3>
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
	 
		<%@ include file="RegisterCompScript.jsp" %>
		
			<button id="kt_engage_demos_toggle" class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0" >
				<span id="kt_engage_demos_label">Help</span>
			</button>
		
					  </div>
				</div>
			</div>
			
		</div>
<%
try{
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st21=conn.createStatement();
st20=conn.createStatement();
st=conn.createStatement();
st1=conn.createStatement();
st3=con1.createStatement();
stveh1 =conn.createStatement();
stveh2=conn.createStatement();

String 	username="";

username=(String)session.getAttribute("usertypevalue");


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
<input type="hidden" id="setSequence" name="setSequence" value="<%=setSequence%>">
<input type="hidden" id="setDefFlag" name="setDefFlag" value="<%=setDefFlag%>">
<%
if(status1 == null)
{
	status1="show report";
}
//System.out.println("vehicleCode=="+vehicleCode);
System.out.println("AAAAA~~~~~~");
if(status1.equalsIgnoreCase("delete"))
{
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	//System.out.println("AAAAAAAAA");
	String srno = request.getParameter("srno");
	String Transporter1="",VehNo="",TheDateTime="",Driver="",Litres="",PetrolPump="",EntBy="",vehcode="",FullTank="",Odometer="",Remark="",updatedDtTime="",gpsdistance="";
	//System.out.println("BBBB arno:- "+srno);
	String del_query = "delete from t_fuelinfo where SrNo = '"+srno+"'";
	String data5="select * from db_gps.t_fuelinfo where SrNo='"+srno+"'";
	System.out.println("data5"+data5);
	ResultSet dt5=st.executeQuery(data5);
	while(dt5.next())
	{
		Transporter1=dt5.getString("Transporter");
		VehNo=dt5.getString("VehNo");
		TheDateTime=dt5.getString("TheDateTime");
		Driver=dt5.getString("Driver");
		Litres=dt5.getString("Litres");
		PetrolPump=dt5.getString("PetrolPump");
		EntBy=dt5.getString("EntBy");
		vehcode=dt5.getString("vehcode");
		FullTank=dt5.getString("FullTank");
		Odometer=dt5.getString("Odometer");
		Remark=dt5.getString("Remark");
		gpsdistance=dt5.getString("gpsdistance");
		
	}
	
	
	
	String insert_query = "insert into t_fuelinfo_history (SrNo, Transporter, VehNo,TheDateTime , Driver, Litres, PetrolPump, EntBy, vehcode, FullTank,Odometer,Remark,gpsdistance) values('"+srno+"','"+Transporter1+"','"+VehNo+"','"+TheDateTime+"','"+Driver+"','"+Litres+"','"+PetrolPump+"','"+EntBy+"','"+vehcode+"','"+FullTank+"','"+Odometer+"','"+Remark+"','"+gpsdistance+"')" ;
	System.out.println("CCCC insert_query:- "+insert_query);
	int flag1 = st.executeUpdate(insert_query);
	//System.out.println("DDDD flag1:- "+flag1);
	if(flag1>0)
	{	
		
		System.out.println("tumhi aata ya block madhe aahat karan insert query successfully ececute zali aahe please database madhala table check kara thank you ");
		
		String update_action_query = "update t_fuelinfo_history set Action='Deleted' ";
		
		int flag2 =  st.executeUpdate(update_action_query);
		
		if(flag2>0)
		{
			System.out.println("tumchya table madhla action coloumn update zala aahe krupaya check kara table madhe ");
		}
		else
		{
			System.out.println("Arrrey re re re  update kartana sql madhe kahitari chuk zali aahe krupaya query check kara ");
		}
		
		
		int flag  =  st.executeUpdate(del_query);
		
		if(flag>0)
		{
			System.out.println("deleted successfully ");
			%> <script type="text/javascript">alert("Deleted Successfully!!!")</script><% 
		//response.sendRedirect("detail_odomter_transporter.jsp?data1="+datenew1+"&data2="+datenew2+"&Oname="+ownerNm+"&odometer="+odometerdiff+"&vehregno="+vehregno+"&vehicleCode="+vehicleCode+"&employeeName="+employeeName+"&status=show report");
		}
		else 
		{
			System.out.println("couldn't delete check the operation");
		}
	
		System.out.println("SSSSSSS   @@@@"+response);
		%> <script type="text/javascript">
	
		window.location="detail_odomter_transporter.jsp?data1="+"<%=datenew1%>"+"&data2="+"<%=datenew2%>"+"&Oname="+"<%=ownerNm%>"+"&odometer="+"<%=odometerdiff%>"+"&vehregno="+"<%=vehregno%>"+"&vehicleCode="+"<%=vehicleCode%>"+"&employeeName="+"<%=employeeName%>";
		</script>
		<% 
		//detail_odomter_transporter.jsp?data1=2012-11-02&data2=2013-11-19&Oname=Castrol EMP VEH&odometer=1954&vehregno=RJ 14 CP 4293&vehicleCode=3323&employeeName=Dhruv Lakhotia
	 }
	 else
	 {
		 %><script type="text/javascript">alert("sorry couldn't delete please try again this may have occured due to unsuccessful insertion of row to be deleted in the fuelinfo_history table");</script><% 
	 }
}
else if(status1.equalsIgnoreCase("edit"))
{
	
}
else
{


%>



<div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered table-striped">

								<thead>
									<tr>
										<th>Edit/Delete</th>
										<th> Sr. </th>
										<th>VehID</th>
										<th>User</th>
										<th>Driver</th>
										<th>Date-Time</th>
										<th>Odometer reading</th>
										<th>OdoDistance</th>
										<th>GpsDistance</th>
										<th>Odo-Gps</th>
										<th>
										<%
								     
								      			if(session.getAttribute("fuelformat").toString().equalsIgnoreCase("Gal"))
												{
								    	  	%>  Gallans  <%	}
											else
											{%>  Liters  <%
											}%>
										</th>
										<th>Ent By</th>
										<th>Ent Date Time</th>
							           <th>Remark and 
										
										<%
								      if(session.getAttribute("fuelformat").toString().equalsIgnoreCase("Gal"))
											{
								    	  
								    	  %>  Gas Station <%	}
											else
											{%>  Petrol Pump <%
											}%>
										</th>
		                             </tr>
								</thead>
								<tbody>
									<%
										String trans="",remark="";
										int c=1;
										int i=1;
										DecimalFormat df = new DecimalFormat("0.00");
										double fueladded=0,totfuel=0,totalGpsDiff=0,totalOdoDiff=0,finalDiff=0 ,totalfinalDiff=0;
										double Avg=0.00;
										//owner ="Penzoil1";
										Double odolast=0.00,odofirst=0.00,Odometer1=0.00;
										int cnt=0,temp=0;
										String vehicle="",datetime="",driver="",odometer="",petrolpump="",entby="";
										double lits=0.0,prvOdo=0,currOdo=0;
										String sql21="select * from t_fuelinfo where VehNo='"+vehregno+"' and TheDateTime between '"+datenew1+" 00:00:00' and '"+datenew2+" 23:59:59' order by TheDateTime";
										System.out.println("ikde bagh  detail====>"+sql21);
										ResultSet rsgps=st1.executeQuery(sql21);
										ResultSet rs21=st.executeQuery(sql21);
										while(rs21.next())
										{
											double odo=0.0;
											double gpsveh=0;
											
											double odo1=0.0;
											double gpsveh1=0;
											
											currOdo=0;
											prvOdo=0;
											double odoDiff=0;
											double gpsDiff=0;
											String updatedate = "";
											String fuelDateTime="";
											String fieldDate="";
											String fieldTime="";
											
											String fuelDateTime1="";
											String fieldDate1="";
											String fieldTime1="";
											String tankfull="-";
											String first="";
											String last="";
											prvOdo=0;
										//	System.out.println("\n\n tank 1-->>"+tankfull);
											tankfull=rs21.getString("FullTank");
											System.out.println("\n\n tank full-->>"+tankfull);
											vehicle=rs21.getString("VehNo");
											datetime=rs21.getString("TheDateTime");
											driver=rs21.getString("Driver");
											updatedate = rs21.getString("updatedDtTime");
											/*String sql4 = "select * from t_drivers where Owner='"
							 					+ user + "' order by DriverName asc";
										System.out.println(sql4);
										ResultSet rs5 = st3.executeQuery(sql4);
										if (rs5.next()) {
											//lastdriverid = rs5.getString("DriverId");
											driver = rs5.getString("DriverName");
											System.out.println("\n\n driver name-->>"+driver);
										}*/
											
											if("Select".equalsIgnoreCase(driver)){
												driver="-";
											}
										if(cnt>0)
										{
											prvOdo=Double.parseDouble(odometer);
											
										}	
										odometer=rs21.getString("Odometer");
										if(odometer.equals("-"))
										{
											currOdo=0;
										}
										else
										{
										currOdo=Double.parseDouble(odometer);
										}
										System.out.println("\n\n preveous odo->>"+prvOdo);		
										System.out.println("\n\n current odo->>"+currOdo);	
											
											lits=rs21.getDouble("Litres");
											petrolpump=rs21.getString("PetrolPump");
											System.out.println("\n\n PetrolPump name-->>"+petrolpump);
											if(petrolpump.equals("-") || petrolpump.equals(""))
											{
												petrolpump="PetrolPump Not Entered";
											}
											entby=rs21.getString("EntBy");
											String eny="select FirstName,LastName from db_gps.t_userdetails where UserName='"+entby+"'";
											System.out.println("\n\n username query-->>"+eny);
											ResultSet rste=st3.executeQuery(eny);
											if(rste.next())
											{
												first=rste.getString("FirstName");
												last=rste.getString("LastName");
												entby=first+" "+last;
												
											}
										
											remark=rs21.getString("Remark");
											System.out.println("\n\n Remark name-->>"+remark);
											if(remark.equals("-") || remark.equals("") || remark.equals(" ") || (remark==null))
											{
												remark="No Remark";
											}
											fueladded=fueladded+lits;
											if(cnt==0)
											{
												gpsDiff=0;
												odoDiff=0;
											}
											else{
												//calculate Odometer difference
												if(currOdo!=0)
												odoDiff=currOdo-prvOdo;
													
												
												if(rsgps.next())
												{
											
												
												
												fuelDateTime=rsgps.getString("TheDateTime");
												
												try{
												if(rsgps.next())
												{
												
												fuelDateTime1=rsgps.getString("TheDateTime");
											//	out.println("\n"+fuelDateTime1);
												try{
													if(cnt>1)
													{
														String sqlgpsFirst="SELECT Distance, TheFieldDataDate, TheFieldDataTime,TheFieldDataDateTime " +
														"FROM t_veh"+vehicleCode+" " +
														"WHERE  TheFieldDataDateTime <= '"+fuelDateTime+"' " +
														"AND TheFiledTextFileName in ('SI','ON','OF') " +
														"ORDER BY TheFieldDataDateTime " +
														"DESC LIMIT 1";
													//	System.out.println("datechange <===>"+sqlgpsFirst);
														ResultSet rsveh1=stveh1.executeQuery(sqlgpsFirst);
														if(rsveh1.next()){
															fuelDateTime=rsveh1.getString("TheFieldDataDateTime");
															//System.out.println("new date <===>"+sqlgpsFirst);
														}
													}
													String sqlgpsFirst="SELECT Distance, TheFieldDataDate, TheFieldDataTime " +
													"FROM t_veh"+vehicleCode+" " +
													"WHERE  TheFieldDataDateTime BETWEEN '"+fuelDateTime+"' AND '"+fuelDateTime1+"' " +
													"AND TheFiledTextFileName in ('SI','ON','OF') " +
													"ORDER BY TheFieldDataDateTime " +
													"LIMIT 1";
												//	System.out.println("1st=="+sqlgpsFirst);
													ResultSet rsveh1=stveh1.executeQuery(sqlgpsFirst);
													if(rsveh1.next()){
													fieldDate=rsveh1.getString("TheFieldDataDate");
													fieldTime=rsveh1.getString("TheFieldDataTime");
													gpsveh=Double.parseDouble(rsveh1.getString("Distance"));
													System.out.println("gpsveh="+gpsveh);
												}
											}
											catch(Exception e)
											{
												e.printStackTrace();//printd the whole error trace 
											}
												try{
														String sqlgpsSecond="SELECT Distance, TheFieldDataDate, TheFieldDataTime " +
														"FROM t_veh"+vehicleCode+" " +
														"WHERE TheFieldDataDateTime BETWEEN '"+fuelDateTime+"' AND '"+fuelDateTime1+"'" +
														"AND TheFiledTextFileName in ('SI','ON','OF') " +
														"ORDER BY TheFieldDataDateTime DESC " +
														"LIMIT 1";
													//	System.out.println("2nd=="+sqlgpsSecond);
														ResultSet rsveh2=stveh2.executeQuery(sqlgpsSecond);
														if(rsveh2.next()){
														fieldDate1=rsveh2.getString("TheFieldDataDate");
														fieldTime1=rsveh2.getString("TheFieldDataTime");
														gpsveh1=Double.parseDouble(rsveh2.getString("Distance"));
														System.out.println("\ngpsveh1="+gpsveh1);
														gpsDiff=gpsveh1-gpsveh;
														System.out.println("\ngpsDiff="+gpsDiff);
												}
												}
												catch(Exception e){
													e.printStackTrace();
												}
												
												}
												
											}catch(Exception e){
												e.printStackTrace();
											}
												
												totalGpsDiff=totalGpsDiff+gpsDiff;
												totalOdoDiff=totalOdoDiff+odoDiff;
												
													finalDiff=odoDiff-gpsDiff;
												
												totalfinalDiff=totalfinalDiff+finalDiff;
												//System.out.println("\ngpdiff="+gpsDiff);
												rsgps.previous();
											}
											
											}				
											datetime=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime));
											System.out.println("\n\n date -->>"+datetime);
											%>
											<!-- data1=datenew1&data2=datenew2&Oname=ownerNm&odometer=odometerdiff&vehregno=vehregno&vehicleCode=vehicleCode&employeeName=employeeName -->			
													<tr>
														<td style="text-align: right">
															<a href="#" onclick="window.open('editpage_for_detail_odometer_report.jsp?data1=<%=datenew1%>&data2=<%=datenew2%>&Oname=<%=ownerNm%>&odometer=<%=odometerdiff%>&vehregno=<%=vehregno%>&vehicleCode=<%=vehicleCode%>&employeeName=<%=employeeName%>&status=edit&srno=<%=rs21.getString("SrNo")%>','Edit_PopUp_Window','width=890,height=800,toolbar=true,location=false,status=no,menubar=no,resizable=yes,scrollbars=no,left=50,top=50');"> <img src="images/edittt1.jpeg" width="15px" height="15px" style="border-style: none"></img>  </a> /  
															
															<a href="detail_odomter_transporter.jsp?data1=<%=datenew1%>&data2=<%=datenew2%>&Oname=<%=ownerNm%>&odometer=<%=odometerdiff%>&vehregno=<%=vehregno%>&vehicleCode=<%=vehicleCode%>&employeeName=<%=employeeName%>&status=delete&srno=<%=rs21.getString("SrNo")%>" onClick="return confirmDelete();"> <img src="images/delete.jpeg" width="15px" height="15px" style="border-style: none" ></img>   
															
															</a>
														</td>
														
														
														<td style="text-align: right"><%=i++ %></td>
														<td style="text-align: left"><%=vehicle %></td>
														<td style="text-align: left"><%=employeeName%></td>
														<td style="text-align: left"><%=driver %></td>
														<td style="text-align: right"><%=datetime %></td>
														
														<td style="text-align: right"><%=df.format(currOdo)%></td>
														<td style="text-align: right"><%=df.format(odoDiff)%></td>
														<td style="text-align: right"><%=df.format(gpsDiff)%></td>
														<td style="text-align: right"><%=df.format(finalDiff)%></td>
														<td style="text-align: right"><%=df.format(lits)%></td>
														
														<td style="text-align: left"><%=entby %></td>
														<td style="text-align: right;"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(updatedate)) %></td>
														<%
															//if(null==remark || "null".equalsIgnoreCase(remark) || "-".equalsIgnoreCase(remark)){
																if(tankfull.equals("No"))
																{
											%>
														<td style="text-align: left"><%=remark%> :<%=petrolpump%></td>

														<%
															}
															else{
																
															
											%>
											             <td style="text-align: left"><%=remark%> :<%=petrolpump%> :Full tank</td>
													
													
														<!--<td style="text-align: left"><input type="hidden" id="i+< %=c %>" name="i+< %=c %>" value="< %=remark%>< %=c %>">
															< %=remark %>...
														<div id="sh< %=c %>" name="sh< %=c %>">
															<a href="#" ONMOUSEOVER="show(document.getElementById('i+< %=c %>'))" ; ONMOUSEOUT="kill()">Show Remark </a></div>
														</td>-->
														<%
															//	c=c+1;
														}
											%>
													</tr>
													<%
													cnt++;
															}if(i>1){
																 %>
																	<tr>
																		<!-- <td  colspan="5"></td> -->
																		<td>Total</td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td>
																		<div align="right"><b>Total</b></div>
																		</td>
																		<td class="bodyText">
																		<div align="right"><b><%=odometerdiff%></b></div>
																		</td>
																		<td class="bodyText">
																		<div align="right"><b><%=df.format(totalOdoDiff)%></b></div>
																		</td>
																		<td class="bodyText">
																		<div align="right"><b><%=df.format(totalGpsDiff)%></b></div>
																		</td>
																		<td class="bodyText">
																		<div align="right"><b><%=df.format(totalfinalDiff)%></b></div>
																		</td>
																		<td class="bodyText">
																		<div align="right"><b><%=df.format(fueladded)%></b></div>
																		</td>
																		
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		
																		
																		
																	</tr>
																	<%} %>
										
								
									
								</tbody>
								<tfoot>
									<tr>
										<th>Edit/Delete</th>
										<th> Sr. </th>
										<th>VehID</th>
										<th>User</th>
										<th>Driver</th>
										<th>Date-Time</th>
										<th>Odometer reading</th>
										<th>OdoDistance</th>
										<th>GpsDistance</th>
										<th>Odo-Gps</th>
										
									
										<th>
										<%
								     
								      			if(session.getAttribute("fuelformat").toString().equalsIgnoreCase("Gal"))
												{
								    	  	%>  Gallans  <%	}
											else
											{%>  Liters  <%
											}%>
										</th>
										<th>Ent By</th>
										<th>Ent Date Time</th>
							           <th>Remark and 
										
										<%
								      if(session.getAttribute("fuelformat").toString().equalsIgnoreCase("Gal"))
											{
								    	  
								    	  %>  Gas Station <%	}
											else
											{%>  Petrol Pump <%
											}%>
										</th>
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
<%
										}

}catch(Exception ex){
	ex.printStackTrace();
}finally{
	conn.close();
}
%>

<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Drill Down Report</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int kk=0; 
			//String showList="Sr No,Vehicle,Transporter,Alert Status,Alert Date,User,User Mobile,User Location,User EMail,Manager,Manager MobNo,RSM,RSM MobNo"; 
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
						<input type="hidden" name="paramflag" id="paramflag" value="true">
						<input type="hidden" name="parameters" id="parameters" value="<%=request.getQueryString()%>">
				
				
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
								title: 'Odometer Detail Report from <%=datenew1%> to <%=datenew2%>',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Odometer Detail Report from <%=datenew1%> to <%=datenew2%>',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Odometer Detail Report from <%=datenew1%> to <%=datenew2%>',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Odometer Detail Report from <%=datenew1%> to <%=datenew2%>',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Odometer Detail Report from <%=datenew1%> to <%=datenew2%>',
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