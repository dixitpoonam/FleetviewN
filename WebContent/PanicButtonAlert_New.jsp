<%@ include file="headernew.jsp"%>

<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" import="moreservlets.listeners.*" errorPage=""%>
<link href="css/ERP.css" rel="stylesheet" type="text/css"></link>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
@import url(jscalendar-1.0/calendar-blue.css);
</style>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="javax.activation.*"%>


<html>
<head>


<title></title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script	src="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"></script>





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



<style>td.highlight {
    background-color: whitesmoke !important;
}</style>

<script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    //	"pagingType": "full_numbers",
	    	
	        dom: 'Blfrtip',
	        "bLengthChange" : false,
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Panic Button Alert Report '+$("#data").val()+'-'+$("#data1").val(), 
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Panic Button Alert Report '+$("#data").val()+'-'+$("#data1").val(), 
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Panic Button Alert Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Panic Button Alert Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Panic Button Alert Report '+$("#data").val()+'-'+$("#data1").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            				
	                    
	            			]
	        	},
	        	
	            'colvis',
	            'pageLength'
	        ],
	        
	        
	        "oLanguage": {
	        	   "sSearch": "Search"
	        	 },
	        
	        lengthMenu: [
	            [ 10, 25, 50, -1 ],
	            [ '10 Rows' , '25 Rows', '50 Rows', 'Show all' ],
	            
	        ]
	    	
	    } );
		var table = $('#example').DataTable();
	     
	    $('#example tbody')
	        .on( 'mouseenter', 'td', function () {
	            var colIdx = table.cell(this).index().column;
	 
	            $( table.cells().nodes() ).removeClass( 'highlight' );
	            $( table.column( colIdx ).nodes() ).addClass( 'highlight' );
	        } );
	});
 jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	 "date-uk-pre": function ( a ) {
	    var ukDatea = a.split('/');
	    return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
	 },

	 "date-uk-asc": function ( a, b ) {
	    return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	 },

	 "date-uk-desc": function ( a, b ) {
	    return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	 }
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

         return true;
 	
 }
 
</script>


</head>
<body>

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
		
		datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy")
				.format(new java.util.Date());
		data1 = data2 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new java.util.Date());
	
		Calendar c = Calendar.getInstance();   // this takes current date
	    c.set(Calendar.DAY_OF_MONTH, 1);
	    System.out.println(" current date "+new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime())); 
	    datex1=new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
	
	
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

String dt1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
	.parse(datex2));
	
%>




<input type="hidden" id="PageName" name="PageName"
				value="<%=PageName%>" />

<form name="formreport" id="formreport" method="post">
	<input type="hidden" id="username" name="username" value=<%=username %>>

	<div align="center" style="font-size: 13px;">
		<font><b> Panic Button Alert Report From <%=datex1 %>
				To <%=datex2 %> Of <%=username %></b></font>


		<table border="0" width=600 align="center">
			
			<br></br>
			<tr>
				<td><div style="display:flex; flex-direction: row; justify-content: center; align-items: center">
				<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From</label>
					&nbsp;&nbsp; <input type="text" id="data" name="data"
					style="text-align: center; color: gray; font-size: 12px;" value="<%=datex1%>" size="10" readonly
					class="element text medium"/ > <script
						type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "data",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "data"       // ID of the button
			    }
			  );
			</script></div></td>
				<td><div style="display:flex; flex-direction: row; justify-content: center; align-items: center">
				<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To</label>
					&nbsp;&nbsp; <input type="text" id="data1" name="data1"
					style="text-align: center; color: gray; font-size: 12px;" value="<%=datex2%>" size="10" readonly
					class="element text medium" /> <script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "data1",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",    // the date format
			      button      : "data1"       // ID of the button
			    }
			  );
			</script></div></td>
				<td><div style="display:flex; flex-direction: row; justify-content: center; align-items: center">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="submit" name="button" onclick="return chk()"  style="text-align: center; color: gray; font-size: 12px;" value="Submit"></div></td>

			</tr>
		</table>
	</div>
</form>







<%
Connection conn=null;
Statement st=null, st1=null,st2=null;
%>
<%
try
{
	/* String MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
	String MM_dbConn_USERNAME="fleetview";
	String MM_dbConn_PASSWORD="1@flv";
	String MM_dbConn_STRING="jdbc:mysql://192.168.2.26/db_gps"; */
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	

    st=conn.createStatement();
    st1=conn.createStatement();
    st2=conn.createStatement();
	
}
catch(Exception e)
{
	
}
	
%>









<table id="example" class="display" style="width: 100%">
	<thead>
		<tr>

			<th width="4%" align="center">Sr No</th>
			<th  align="center">Vehicle</th>
			<th align="center">Date</th>
                 <th align="center">Location</th>
 
			<th align="center">Mail-Status</th>
			
		</tr>
	</thead>
	<tbody>

		<%
 

	
String ven;
String vehlist = session.getAttribute("VehList").toString();

//String veh="select * from db_CustomerComplaints.t_techspecialrep where VehId in  "+vehlist+"  and visibleInFleetview='Yes' and Closed='No' order by VehRegNo";

String veh="select * from  db_gps.t_allpendingmailtable where MailName='PanicButtonAlert' and TableBody like '%"+username+"%' and EntryDateTime>='"+dt+" 00:00:00' and EntryDateTime<='"+dt1+" 23:59:59'";
String MailBody="";
System.out.println("Vehicle "+veh);

ResultSet rs=st1.executeQuery(veh);

int i=1;
while(rs.next())
{
	
	MailBody = rs.getString("MailBody");

String ss[]=MailBody.split(",");

for(int j=0;j<ss.length;j++)
{
	System.out.println(ss[j]);

}

%>
<tr>
<td align="center"><%=i%></td>
<td align="center"><%=ss[0] %></td>
						<td align="center"><%=ss[2] %></td>
<td align="center"><%=ss[3] %></td>
						<td align="center"><%= rs.getString("MailStatus") %></td>
						</tr>
<%i++;}
       %>
      
	</tbody>
	<!-- <tbody>
	 <tr>
                  			<td style="font-size: 13px; face:san-serif; color:black">Summation</td>
                  			                  			<td style="font-size: 13px; face:san-serif; color:black">  11</td>
                  			
                  			                  			                  			<td style="font-size: 13px; face:san-serif; color:black">  </td>
                  			                  			                  			<td style="font-size: 13px; face:san-serif; color:black">  </td>
                  			                  			                  			<td style="font-size: 13px; face:san-serif; color:black">  </td>
                  			                  			                  			<td style="font-size: 13px; face:san-serif; color:black">  </td>
                  			                  			                  			<td style="font-size: 13px; face:san-serif; color:black">  </td>
                  			                  			                  			<td style="font-size: 13px; face:san-serif; color:black">  </td>
                  			                  			                  			<td style="font-size: 13px; face:san-serif; color:black">  </td>
                  			
                  
                     </tr> 
       
	
	</tbody>
	 -->
	
	<tfoot>
		<tr>
		
			<th width="4%" align="center">Sr No</th>
			<th  align="center">Vehicle</th>
			<th align="center">Date</th>
                 <th align="center">Location</th>
 
			<th align="center">Mail-Status</th>
		</tr>


	</tfoot>
</table>
</body>
</html>
