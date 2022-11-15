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
	        
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Request Report'
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'Request Report'
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Request Report'
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Request Report'
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Request Report'
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ]
	    	
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
    </head>
<style type="text/css">
td.details-control {
    background: url('images/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('images/details_close.png') no-repeat center center;
}
</style>
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
ResultSet rs4 = null;

String 	username="";
username=(String)session.getAttribute("usertypevalue");

	
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
	  status="Pending";
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
<font face="san-serif" color="#036" size="3"><b>Pending Requests</b></font>
</div>
<div class="form">
<br>
<!-- <div >
<button id="show_all_records">show all records</button>
</div> -->

<div class="form" style="margin-left: 20%;">
	<table border="0" width=600 align="center">
		<!-- <form action="" method="get" onsubmit="return validate();"> -->
		
		<br></br>
		<tr align="left">
			<td align="left"><font face="san-serif" color="#036" size="2"><b>From
			 </b></font>&nbsp;&nbsp;
			 <input type="text" id="data" name="data" value="<%=datex1%>" size="13px" readonly  class="element text medium" style="width: 125px; height: 16px; color:black"  /> <script
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
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
						
			<td align="left"><font face="san-serif" color="#036" size="2"><b>To
			 </b></font>&nbsp;&nbsp; <input type="text" id="data1" name="data1" value="<%=datex2%>" size="13px" readonly   class="element text medium" style="width: 125px; height: 16px; color:black"  /> 
			<script	type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "data1",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",    // the date format
			      button      : "data1"       // ID of the button
			    }
			  );
			</script></td>
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
			<td align="left"><font face="san-serif" color="#036" size="2">
         <b>Request Type</b></font>
           <select name="RequestType" id="RequestType" style="width: 135px; height:20px; size:13px ;border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: black; border-color: activeborder;">
           
				<option style="font-size: 13px; face:san-serif; color:black" value="<%=type%>"><%=type%></option>
<%
           
            
       	String sqlregno = "select distinct(RequestType) as vehiclecode from db_gps.t_RequestData order by RequestType";
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
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
			
           
           <%-- <td align="left"><font face="san-serif" color="#036" size="2">
         <b>Status</b></font>
           <select name="Status" id="Status" style="width: 125px; height:20px; size:13px ; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: black; border-color: activeborder;">
          <%  
           
			%>
				<option style="font-size: 13px; face:san-serif; color:black" value="<%=status%>"><%=status%></option>

            <%
            
       	String sqlregno1 = "select distinct(Status) as vehiclecode from db_gps.t_RequestData order by Status";
		System.out.println("*******"+sqlregno1);
        ResultSet rsregno1 = st.executeQuery(sqlregno1);
		while(rsregno1.next())
		{
			 vehiclecode1= rsregno1.getString("vehiclecode");
			
			
	         
			
			
		//	System.out.println("*******");
			//System.out.println("*vehicles******"+vehicles);
			//System.out.println("*VehRegNo******"+VehRegNo);
			//System.out.println("-anil veh-------"+vehicles.equalsIgnoreCase(rsregno.getString("VehicleRegNumber")));
			
			%>	
	<option style="font-size: 13px; face:san-serif; color:black" value="<%=vehiclecode1%>"><%=vehiclecode1%></option>
	<%
	 
			
}%>
           </select>
           </td>
 --%>           
           <td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
           
           
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
			
			<td></td>
			<td></td>
			<td></td>

			<td></td>
			<td></td>
			<td></td>
			
			<td style="font-size: 13px; face:san-serif; color:black" >&nbsp;&nbsp;<input type="submit" name="button" value="Submit" onclick="return chk()"></td>
			
			
			
				
		</tr>
		<!-- </form> -->
	</table>
	</div>

<div>
<table id="example" class="display" style="width: 100%" cellspacing="0" >
        <thead>
            <tr>
            	<th style="font-size: 14px ; face:san-serif;">SrNo</th>
                <th style="font-size: 14px ; face:san-serif;">Date</th>
                <th style="font-size: 14px ; face:san-serif;">Origin</th>
                <th style="font-size: 14px ; face:san-serif;">Destination</th>
                <th style="font-size: 14px ; face:san-serif;">Count</th>
                
            </tr>
        </thead>
        <tbody>
<%  

String requesttype=request.getParameter("RequestType");

String Status1=request.getParameter("Status");




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
	  Status1="Pending";
}
else
{
	  
	  Status1=request.getParameter("Status");
}


System.out.println("Status :- "+Status1);

String sql = "select PickUpDateTime,PickUpLocation,DropLocation,count(*) as Count from db_gps.t_RequestData where RequestType ='"+requesttype+"' and Status='Pending' and PickupDateTime >='"+dt+" 00:00' and PickupDateTime <='"+dt1+" 23:59' group by PickUpDateTime,PickUpLocation,DropLocation order by PickUpDateTime";

System.out.println("Query is : "+sql);
ps = conn.prepareStatement(sql);
rs4 = ps.executeQuery();
int i=1;

while(rs4.next()){	
    	  String PickUpDateTime = rs4.getString("PickUpDateTime");
    	  String PickUpLocation = rs4.getString("PickUpLocation");
    	  String DropLocation = rs4.getString("DropLocation");
    	  String dateformated1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(PickUpDateTime));
 %>  		

 <tr>			
 				<td style="font-size: 13px; face:san-serif; color:black" ><%=i %></td>		
                <td style="font-size: 13px;face:san-serif; color:black" ><%=dateformated1 %></td>
                <td style="font-size: 13px;face:san-serif; color:black" ><%=PickUpLocation %></td>
                <td style="font-size: 13px;face:san-serif; color:black" ><%=DropLocation %></td>
                <td style="font-size: 13px;face:san-serif; color:black" ><a href="SubmitPlanNew.jsp?PickupDate=<%=PickUpDateTime %>&PickUpLocation=<%=PickUpLocation %>&DropLocation=<%=DropLocation%>&RequestType=<%=requesttype%>"><%=rs4.getString("Count") %></a></td>
               
            </tr>     
            <%
i++;            
} %>
        </tbody>
      
    </table>
    </div>
    <br>
    
 <!--    <form class="makeplan" action="makeplan" method="post" >
   <div align="right">
          <button type="submit" class="button button-block" onclick="move()">Create Plan</button>
          </div> 
          </form> -->
</div>
</form>
</body>
<br><br>
<%
rs4.close(); 
ps.close();
conn.close();

%>
<%@ include file ="footernew.jsp" %>



</html>
