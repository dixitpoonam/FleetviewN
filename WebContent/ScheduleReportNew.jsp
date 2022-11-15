<%@ include file="headernew.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/styleMakePlan.css">
<link rel="stylesheet" type="text/css" href="css/view.css" media="all">

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>

 <script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	"pagingType": "full_numbers",
	        dom: 'Bfrtip',
	        responsive:true,
	        scrollY:"500px",
	        scrollX:true,
	        scrollCollapse:true,
	        
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Schedule Report'
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'Schedule Report'
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Schedule Report'
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Schedule Report'
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Schedule Report'
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1,10, 25, 50, 100], ["All",10, 25, 50, 100 ]],
	        
	    	
	    } );
	} );

</script>
 <script type="text/javascript">
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
//          else if(date1 > currentDate)
//          {
//              alert("From Date should be less than current date");
//              return false; 
//          }
//          else if(date2 > currentDate) 
//          {
//              alert("To Date should be less than current date");
//              return false; 
//          }

         return true;
 	
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
    
<style type="text/css">
td.details-control {
    background: url('images/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('images/details_close.png') no-repeat center center;
}
</style>
<style>
#example {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#example td {
    border: 1px solid #ddd;
    padding: 8px;
}

#example tr:nth-child(even){background-color: #f2f2f2;}

#example tr:hover {background-color: #ddd;}

#example th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>


<style>


.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden; . popupnew { background-color : #98AFC7;
	position: absolute;
	visibility: visible; . popupx { background-color : #98AFC7;
	position: absolute;
	visibility: hidden;
}
</style> 
</head>
<%! 
Connection conn,conn1;
String sql,sql1,jcode,origin,destination,startdate;
Statement st,st1,st2;

String datex1, datex2, data1, data2;
String vehiclecode="";
String VehRegNo="";
String vehiclecode1="";
String VehRegNo1="";
String type="",status="";

%>

<%
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st1=conn1.createStatement();
st2=conn1.createStatement();
st=conn.createStatement();
PreparedStatement ps = null;
ResultSet rs4 = null;ResultSet rs6 = null;ResultSet rs8 = null;

String 	username="";String ETA="";
username=(String)session.getAttribute("usertypevalue");
System.out.println("username is :-" + username);

	
/* String plansql = "select PickUpDateTime,PickUpLocation,DropDateTime,DropLocation,Status,EntryBy,count(*) as Count"
				+"from db_gps.t_RequestData where Status='Pending' group by PickUpDateTime,PickUpLocation,"
				+"DropLocation order by PickUpDateTime"; */
		
//String PlanQuery = "select * from db_gps.RequestData where RequesterId";

%>


<%
String ddx = request.getQueryString();
	
	if (ddx == null) {
		
		System.out.println(" In First If  " );
		
		datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy")
				.format(new java.util.Date());
		data1 = data2 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new java.util.Date());
	
		Calendar c = Calendar.getInstance();   // this takes current date
	    c.set(Calendar.DAY_OF_MONTH, 1);
	    System.out.println(" current date "+new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime())); 
	    datex1=new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
	
	
	} else {
		
		System.out.println(" In First Else  " );
		
		data1 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(request.getParameter("data")));
		data2 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(request.getParameter("data1")));
		
		
		

		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");
		
	}
	
	String Bt=request.getParameter("button");
	System.out.println(" Button :- " +Bt);
	
	if(Bt==null || Bt==" " || Bt=="")
	{
		datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy")
		.format(new java.util.Date());
data1 = data2 = new SimpleDateFormat("yyyy-MM-dd")
		.format(new java.util.Date());

Calendar c = Calendar.getInstance();   // this takes current date
c.set(Calendar.DAY_OF_MONTH, 1);
System.out.println(" current date "+new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime())); 
datex1=new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
		
	}
	else
	{
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

String dt1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
	.parse(datex2));
	
System.out.println(" dt :-  "+dt+" dt1 :-  "+dt1);

String requesttype1=request.getParameter("RequestType");

String Status21=request.getParameter("Status");




if(requesttype1==null || requesttype1==" " || requesttype1=="")
{
	type="Material Movement";
}
else
{
	type=request.getParameter("RequestType");
	  
}

System.out.println("Type :- "+type);

if(Status21==null || Status21==" " || Status21=="")
{
	  status="Scheduled";
}
else
{
	  
	 status=request.getParameter("Status");
}


System.out.println("Status :- "+status);

%>




<body>
<form name="custreport" id="custreport" method="post">
<div class="form" align="center" style="font-size: 16px;">
<font face="san-serif" color="#036" size="3"><b>Schedule Report</b></font>
</div>
<div class="form" align="left">
<br>

<div class="form"  style="margin-left: 10%;" >
	<table border="0" width=900 align="left">
		
		<tr align="left">
			<td align="left"><font face="san-serif" color="#036" size="2"><b>From: </b></font><input type="text" id="data" name="data" value="<%=datex1%>" size="13px" readonly  class="element text medium" style="width: 125px; height: 16px; color:black"  /> <script
				type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "data",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "data"       // ID of the button
			    }
			  );
			</script></td>
			<td></td>
			<td></td>
			<td></td>


			<td></td>
			<td></td>
			<td></td>
						
			<td align="left"><font face="san-serif" color="#036" size="2"><b>To: </b></font><input type="text" id="data1" name="data1" value="<%=datex2%>" size="13px" readonly   class="element text medium" style="width: 125px; height: 16px; color:black"  /> 
			<script	type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "data1",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",    // the date format
			      button      : "data1"       // ID of the button
			    }
			  );
			</script></td>
			
			
			<td align="left"><font face="san-serif" color="#036" size="2"><b>Plan Type: </b></font>
           <select name="RequestType" id="RequestType" style="width: 135px; height:20px; size:13px ;border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: black; border-color: activeborder;">
           
				<option style="font-size: 13px; face:san-serif; color:black" value="<%=type%>"><%=type%></option>
<%
           
            
       	String sqlregno = "select distinct(PlanType) as vehiclecode from db_gps.t_PlanData where PlanType!='-' order by PlanType";
		System.out.println("*******"+sqlregno);
        ResultSet rsregno = st.executeQuery(sqlregno);
		while(rsregno.next())
		{
			 vehiclecode= rsregno.getString("vehiclecode");
			
			
	         
			
			
		//	System.out.println("*******");
			//System.out.println("*vehicles******"+vehicles);
			//System.out.println("*VehRegNo******"+VehRegNo);
			//System.out.println("-anil veh-------"+vehicles.equalsIgnoreCase(rsregno.getString("VehicleRegNumber")));
			%>	
	<option style="font-size: 13px; face:san-serif; color:black" value="<%=vehiclecode%>"><%=vehiclecode%></option>
	<%
	
			
}%>
	
			
      
		
           </select>
           </td>
           
           
        
			<td></td>
			
			
           
            <td align="left"><font face="san-serif" color="#036" size="2"><b>Status: </b></font>
           <select name="Status" id="Status" style="width: 125px; height:20px; size:13px ; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: black; border-color: activeborder;">
          <%  
           
			%>
				<option style="font-size: 13px; face:san-serif; color:black" value="<%=status%>"><%=status%></option>

            <%
            
       	String sqlregno1 = "select distinct(Status) as vehiclecode from db_gps.t_VehicleScheduleData order by Status";
		System.out.println("*******"+sqlregno1);
        ResultSet rsregno1 = st.executeQuery(sqlregno1);
		while(rsregno1.next())
		{
			 vehiclecode1= rsregno1.getString("vehiclecode");
			
			
	         
			%>	
	<option style="font-size: 13px; face:san-serif; color:black" value="<%=vehiclecode1%>"><%=vehiclecode1%></option>
	<%
	 
			
}%>
           </select>
           </td>
            
          
			
			<td style="font-size: 13px; face:san-serif; color:black" >&nbsp;&nbsp;<input type="submit" name="button" value="Submit" style="text-align: center; width: 100px; height: 26px; "  onclick="return chk()"></td>
			
			
			
				
		</tr>
		<!-- </form> -->
	</table>
	</div>

<div>
<table id="example" class="display" style="width: 100%" cellspacing="0" >
        <thead>
            <tr>
            	<th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">SrNo</th>
            	<th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">Requester</th>
                <th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">ScheduleId</th>
                <th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">Type</th>
                <th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">RequestID</th>
                <th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">PickUp DateTime</th>
                <th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">Origin</th>
                <th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">Destination</th>
                <th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">Status</th>
                <th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">EntryDate</th>
                <th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">Trip ID</th>
                <th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">VehicleRegNo</th>
               <th style="font-size: 10px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #180a74; color: white;">Vehicle Code</th>
               
            </tr>
        </thead>
        <tbody>
<%  

String requesttype=request.getParameter("RequestType");

String Status1=request.getParameter("Status");
String briefid = "",rid = "",plannedstatus = "No";
	String tridriver="",triorigin="",tridest="",tristart="";
String  DriverCode="";
String DriverName="";

String TripId="";
if(requesttype==null || requesttype==" " || requesttype=="")
{
	  requesttype="Material Movement";
}
else
{
	  requesttype=request.getParameter("RequestType");
	  
}

System.out.println("Type :- "+requesttype);

if(Status1==null || Status1==" " || Status1=="")
{
	  Status1="Scheduled";
}
else
{
	  
	  Status1=request.getParameter("Status");
}


System.out.println("Status :- "+Status1);

String sql = "select * from db_gps.t_VehicleScheduleData as a INNER JOIN db_gps.t_startedjourney as b  ON a.TripID= b.TripID where  a.Category ='"+requesttype+"' and a.Status='"+Status1+"' and a.EntryDate >='"+dt+" 00:00:00'  and a.EntryDate <='"+dt1+" 23:59:59'and (b.JStatus='Running' or b.JStatus='tobeclosed') and b.OwnerName like '"+username+"'  order by a.ScheduleNo";
System.out.println("Query is : "+sql);
ps = conn.prepareStatement(sql);
rs4 = ps.executeQuery();
int i=1;String todate="";

while(rs4.next()){	
    	  String PlanId = rs4.getString("PlanId");
    	  String ScheduleNo = rs4.getString("ScheduleNo");
    	  String PickUpDateTime = rs4.getString("DateTime");
    	  System.out.println("PickUpDateTime is-->>"+ PickUpDateTime);
    	  
    	  String PickUpDate[]=PickUpDateTime.split("\\s+");
    	  String x=PickUpDate[0];
    	  System.out.println("x is-->>"+ PickUpDate[0]);
    	  String y=PickUpDate[1];
    	  System.out.println("y is-->>"+ PickUpDate[1]);
    	  String yfinal=y.substring(0,8);
    	  System.out.println("yfinal is-->>"+ yfinal);
     	 
    	  String ytime[]=y.split(":");
    	  String yh=ytime[0];
    	  System.out.println("yh is-->>"+ yh);
    	  String ym=ytime[1];
    	  System.out.println("ym is-->>"+ ym);
    	  
    	  String ys=ytime[2].substring(0,2);
    	  System.out.println("ys is-->>"+ ys);
    	  
    	  String RequesterName=rs4.getString("OwnerName");
    	  String Type = rs4.getString("Category");
    	  String RequestId = rs4.getString("RequestId");
    	  String ScheduleEntryDateTime=rs4.getString("EntryDate");
    	  String dateformated1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(ScheduleEntryDateTime));
    	  String dateformated2=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(PickUpDateTime));
     	 
    	  String Origin=rs4.getString("StartPlace");
    	  String Destination=rs4.getString("EndPlace");
    	  System.out.println("Destination is:-->>"+ Destination);
    	  String Status=rs4.getString("Status");
    	 TripId=rs4.getString("TripID");
    	  String VehicleRegNo=rs4.getString("VehicleRegNo");
    	  String VehicleCode=rs4.getString("VehicleCode");
    	  
    	  

String sql2="select * from db_gps.t_RequestData where RequestType ='People Movement' and Status='Scheduled' and EntryDateTime >='"+dt+" 00:00:00' and EntryDateTime <='"+dt1+" 23:59:59'  and ScheduleNo='"+ScheduleNo+"'";   	  
System.out.println("Query2 is : "+sql2);
ps = conn.prepareStatement(sql2);
rs6 = ps.executeQuery();


while(rs6.next()){	 	  
    	  
    	  String DropDateTime=rs6.getString("DropDateTime");
System.out.println("DropDateTime is-->>"+ DropDateTime);
    	  
    	  String DropDate[]=DropDateTime.split("\\s+");
    	  String x1=DropDate[0];
    	  System.out.println("x1 is-->>"+ DropDate[0]);
    	  String y1=DropDate[1];
    	  System.out.println("y1 is-->>"+ DropDate[1]);
    	  
    	  
    	  String y1time[]=y1.split(":");
    	  String y1h=y1time[0];
    	  System.out.println("y1h is-->>"+ y1h);
    	  String y1m=y1time[1];
    	  System.out.println("y1m is-->>"+ y1m);
    	  
    	  String y1s="00";
    	     	  
    
    	  String sql4="select * from db_gps.t_startedjourney where TripID='"+TripId+"'";   	  
    	  System.out.println("Query4 is : "+sql4);
    	  ps = conn.prepareStatement(sql4);
    	  rs8 = ps.executeQuery();


    	  while(rs8.next()){	
    		   DriverCode=rs8.getString("DriverCode");
    		  System.out.println("DriverCode is-->>"+ DriverCode);
    		  
    		  DriverName=rs8.getString("DriverName");
    		  System.out.println("DriverName is-->>"+ DriverName);
    		  ETA=rs8.getString("ETA");
    		  
    		  System.out.println("ETA is-->>"+ ETA);
    		  
    		  
  			boolean flag = false;
  			try
  			{
  			String sql9 = "select * from db_gps.t_briefing where tripid = '"+TripId+"'";
  			System.out.println("sql 9 is:->>"+sql9);
  			ResultSet rs1 = st1.executeQuery(sql9);
  			if(rs1.next())
  			{
  				briefid = rs1.getString("Briefid");
  			}

  			String sql10 = "select * from db_gps.t_intermediatejrmroute where  Tripid = '"+TripId+"' and briefid = '"+briefid+"' and driverid = '"+DriverCode+"'  order by advancedtrackid asc ,row asc limit 1 ";
  			System.out.println("sql 10 is:->>"+sql10);
  			rs1 = st1.executeQuery(sql10);
  			if(rs1.next())
  			{
  				rid = rs1.getString("advancedrouteid");
  				plannedstatus = "Yes";
  				flag = true;
  			}
  			
  			
  			}
  			catch(Exception e)
  			{
  				briefid = "";
  				rid = "";
  				plannedstatus = "No";
  			} 
  			
  				
  					todate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
  				
  				
  			
    		  
    		  
 %>  		

 <tr>			
 				<td style="font-size: 11px; face:san-serif; color:black" ><%=i %></td>	
 				<td style="font-size: 11px; face:san-serif; color:black" ><%=RequesterName %></td>	
 					
 				<%-- <td style="font-size: 13px; face:san-serif; color:black" ><%=PlanId %></td> --%>
 				<td style="font-size: 11px;face:san-serif; text-align: right;color:black" ><a href="PlanDetails.jsp?RequestId=<%=RequestId %>&PlanId=<%=PlanId %>"><%=rs4.getString("ScheduleNo") %></a></td>
 				<td style="font-size: 11px; face:san-serif; color:black" ><%=Type %></td>
 				<td style="font-size: 11px;text-align: right; face:san-serif; color:black" ><%=RequestId %></td>
                <td style="font-size: 11px; text-align: right;face:san-serif; color:black" ><%=dateformated2 %></td>
                <td style="font-size: 11px;face:san-serif;text-align: left; color:black" ><%=Origin %></td>
                <td style="font-size: 11px;face:san-serif;text-align: left; color:black" ><%=Destination %></td>
                <td style="font-size: 11px;face:san-serif;text-align: left; color:black" ><%=Status %></td>
                <td style="font-size: 11px;face:san-serif; text-align: right;color:black" ><%=dateformated1 %></td>
                 <td style="font-size: 11px;text-align: center;face:san-serif; color:black" >
                 <% if(TripId.equals("-")){%>
			<font size="2"><%=TripId%></font>
			<% } else {%>
                             
                 
                 <a href="javascript:toggleDetails1(<%=i%>,true);" title="Click To See the Reports"><font size="2">
				<%=TripId %></font></a><% }%>
				
				<div class="popup" id="popupx<%=i%>">
					<table border="1" bgcolor="white">
		   				<tr>  
						<td> 
							<a href="ActAndPlanJrnyCompOnMap.jsp?tripid=<%=TripId %>&vehcode=<%=VehicleCode%>&data=<%=x%>&data1=<%=todate%>&ftime1=<%=yh%>&ftime2=<%=ym%>&ftime3=<%=ys%>&ttime1=<%=y1h%>&ttime2=<%=y1m%>&ttime3=<%=y1s%>&pg=st&pstatus=No&brifid=<%=briefid %>&rid=<%=rid %>&driverid=<%=DriverCode %>" onclick="toggleDetails1(<%=i%>,false);">Show Trip on Map </a>
						</td>
		   				</tr>
		   			
				<tr>
				   			<td>				   									 
				   			<a href="edittrip.jsp?vehno=<%=VehicleRegNo%>
				   							&ReportDateTime=<%=PickUpDateTime%>
				   							&strloc=<%=Origin%>
				   							&strdate=<%=x%>
				   							&StartTime=<%=yfinal %>
				   							&ETA=<%=ETA%>
				   							&endp=<%=Destination%>
				   							&driverid=<%=DriverCode%>
				   							&drivern=<%=DriverName%>
				   							&tripid=<%=TripId%>" onclick="toggleDetails1(<%=i%>,false);">Edit Trip </a>
							</td>
						</tr>
						<tr>
						<td> 
						<a href="javascript:toggleDetails1(<%=i%>,true);" onclick="javascript:window.open ('CancelTrip.jsp?vehno=<%=VehicleRegNo%>&tripid=<%=TripId%>','win3','scrollbars=1,resizeable=0,width=500,height=500');";>Cancel Trip</a>
		  				</td>
		   				</tr>
		   				
<%
				//}
String pageflag="currentposition";
%>
						<tr>
						<td>
						<a href="javascript: flase;" onClick="window.open ('endtrip.jsp?tripid=<%=TripId%>&vehcode=<%=VehicleCode%>&vehno=<%=VehicleRegNo%>&pageflag=<%=pageflag%>', 'win1', 'width=850, height=550, location=0, menubar=0, scrollbars=yes, status=0, toolbar=0, resizable=0'); javascript:toggleDetails1(<%=i%>,false);">End Trip </a>
						
						</td>
		   				</tr>
			  			
			  			
			  			<tr>
						<td> 
							<a href="javascript:toggleDetails1(<%=i%>,false);">Close </a>
						</td>
		   				</tr>
		   			</table>
		   		</div>			
				
				</td>
                  <td style="font-size: 11px;face:san-serif; color:black" ><%=VehicleRegNo %></td>
                   <td style="font-size: 11px;text-align: right;face:san-serif; color:black" ><%=VehicleCode %></td>
                <%-- <td style="font-size: 13px;face:san-serif; color:black" ><a href="SubmitPlanNew.jsp?PickupDate=<%=PickUpDateTime %>&PickUpLocation=<%=PickUpLocation %>&DropLocation=<%=DropLocation%>"><%=rs4.getString("Count") %></a></td> --%>
               
            </tr>     
            <%
i++; 
}
} }%>
        </tbody>
      
    </table>
    </div>
    <br>
    

</div>
</form>
</body>
<br><br>
<%
rs4.close(); 
ps.close();
conn.close();

%>
<%-- <%@ include file ="footernew.jsp" %>

 --%>

</html>
