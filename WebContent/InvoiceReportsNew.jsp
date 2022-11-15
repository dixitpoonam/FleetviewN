<%--  <%@ include file="conn.jsp"%>
<jsp:useBean id="erp" class="com.erp.beans.ERP" scope="page">  --%>
<%@ include file="headernew.jsp"%> 

<%@ page import="java.sql.*" %>
 <%@
page import=  
    
      "java.io.BufferedReader,
 java.io.File,
 java.io.FileNotFoundException,
 java.io.IOException,
 java.io.InputStreamReader,
 java.io.PrintStream,
 java.io.PrintWriter,
 java.net.URL,
 java.net.URLConnection,
 java.sql.Connection,
 java.sql.DriverManager,
 java.sql.ResultSet,
 java.sql.SQLException,
 java.sql.Statement,
 java.text.DateFormat,
 java.text.Format,
 java.text.SimpleDateFormat,
 java.util.Map,
 java.util.Properties,
 java.util.StringTokenizer,
 java.util.regex.Matcher,
 java.util.regex.Pattern,

 org.json.JSONObject,
  org.json.JSONObject,
  com.mysql.jdbc.PreparedStatement"%>

<jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="https://checkout.razorpay.com/v1/checkout.js"></script> 

<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="css/view.css" media="all">

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="css/styleMakePlan.css">
<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script> 

 <script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	/* "pagingType": "full_numbers",
	        dom: 'Bfrtip',
	         */

	            "pagingType": "full_numbers",
	            dom: 'Blfrtip',
	            responsive: true,
	            scrollY:        "400px",
	            scrollX:        true,
	            scrollCollapse: true,
	            fixedColumns: true,

	            "columnDefs": [
	                { type: 'date-dd-mmm-yyyy', targets: 3 },
	              ], 
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Invoice Report-'+$("#data3").val()+"From"+$("#data").val()+"To"+$("#data1").val(),
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'Invoice Report-'+$("#data3").val()+"From"+$("#data").val()+"To"+$("#data1").val(),
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Invoice Report-'+$("#data3").val()+"From"+$("#data").val()+"To"+$("#data1").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Invoice Report-'+$("#data3").val()+"From"+$("#data").val()+"To"+$("#data1").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Invoice Report-'+$("#data3").val()+"From"+$("#data").val()+"To"+$("#data1").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ]
	    	
	    } );
	} );

</script>


<script type="text/javascript">

(function () {

var customDateDDMMMYYYYToOrd = function (date) {
    "use strict"; //let's avoid tom-foolery in this function
    // Convert to a number YYYYMMDD which we can use to order
    var dateParts = date.split(/-/);
    return (dateParts[2] * 10000) + ($.inArray(dateParts[1].toUpperCase(), ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]) * 100) + (dateParts[0]*1);
};

// This will help DataTables magic detect the "dd-MMM-yyyy" format; Unshift
// so that it's the first data type (so it takes priority over existing)
jQuery.fn.dataTableExt.aTypes.unshift(
    function (sData) {
        "use strict"; //let's avoid tom-foolery in this function
        if (/^([0-2]?\d|3[0-1])-(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)-\d{4} /i.test(sData)) {
            return 'date-dd-mmm-yyyy';
        }
        return null;
    }
);

// define the sorts
jQuery.fn.dataTableExt.oSort['date-dd-mmm-yyyy-asc'] = function (a, b) {
    "use strict"; //let's avoid tom-foolery in this function
    var ordA = customDateDDMMMYYYYToOrd(a),
        ordB = customDateDDMMMYYYYToOrd(b);
    return (ordA < ordB) ? -1 : ((ordA > ordB) ? 1 : 0);
};

jQuery.fn.dataTableExt.oSort['date-dd-mmm-yyyy-desc'] = function (a, b) {
    "use strict"; //let's avoid tom-foolery in this function
    var ordA = customDateDDMMMYYYYToOrd(a),
        ordB = customDateDDMMMYYYYToOrd(b);
    return (ordA < ordB) ? 1 : ((ordA > ordB) ? -1 : 0);
};

})();

</script> 
 <script>

  var minimum_donation_amount = 5; // â¹100

  document.getElementById('rzp-button1').onclick = function(e){
      var rupeeAmount = parseInt(document.getElementById('amount-field').value);
      if (!rupeeAmount || rupeeAmount < minimum_donation_amount) {
        return alert('Please enter valid amount. minimum_donation_amount is â¹ 100')
      }
      var options = {
          "key": "rzp_test_Aff9xUmQO5IYHE",	//test
        // "key": "rzp_live_ZNON4JJYMt3ccE", //live

          "amount": 100*rupeeAmount, // wke amount in paise
          "name": "",
          "description": "Purchase Description",
          "image": "transworld.jpg",
          "handler": function (response){
              alert(response.razorpay_payment_id);
              alert(response.razorpay_amount);
              alert(response.razorpay_amount_paid);


          },
          "prefill": {
              "name": "Vijay Bharkade",
              "email": "vijaybharkade123@gmail.com"
          },
          "notes": {
              "invoice_id": document.getElementById('invoice-field').value
          },
          "theme": {
              "color": "#168afa"
          }
      };
      new Razorpay(options).open();
  }
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

<%
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
fleetview.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>

<body style="background: #E9F0FB;">

 <%!
Connection conn=null,conn1=null;
Statement st,st1,stcom,strch,st2,st3,st11,stt1,stt2,st12,st13,st14,st15,st16,st4,sto,st20,st21,st22,strep,stdev;
String fromdate,search="",todate,sql,sql1,sql2,sql3,transporter,pageflag,datenew1,datenew2,fromdatetime,todatetime, vendor1,category1,startp,endp,ven,startp1,endp1,vendername,
categoryname,startplacename,endplacename,statusname,vehino,vehicleno,vehiclecode,Sqlv="",distributorname="";
 String sqlname=null,briefing="",sqlbrif=null,Dbriefing="",etaclose="",reportclose="",tripsrch="",vehsrch="",spsrch="",driv="";
 String	epsrch="",ownsrch="",statuasrch="",statuarsrun="",etaclose1="",sdtime1="",sddate1="",etdate="",repdate="",reportclose1="",drivername="";
 
 int i=0;
 String sum="";
 
%><%
//Class.forName(MM_dbConn_DRIVER); 
conn = fleetview.ReturnConnection();
conn1 = fleetview.ReturnConnection1();	
st=conn.createStatement();st1=conn.createStatement();
st2=conn.createStatement();st3=conn1.createStatement();st11=conn.createStatement();
stt1=conn.createStatement();      //  *********************************
stt2=conn.createStatement();st12=conn.createStatement();st13=conn.createStatement();st14=conn.createStatement();
st15=conn.createStatement();st16=conn.createStatement();sto=conn.createStatement();st4=conn.createStatement();
stdev=conn.createStatement();
st20=conn.createStatement();st21=conn.createStatement();st22=conn.createStatement();strep=conn.createStatement();
strch=conn.createStatement();stcom=conn.createStatement();
%>

<%-- <%! 
Connection conn,conn1;
String data1,sql,sql1,data2,jcode,origin,destination,startdate;
Statement st,st1,st2;
%>
<%
		erp.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
	%>
<%
/* Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
*/
Connection conn = null;

st1=conn.createStatement();
st2=conn.createStatement();
st=conn.createStatement();
PreparedStatement ps = null;
ResultSet rs4 = null;

String 	username="";

username=(String)session.getAttribute("usertypevalue");


/* String plansql = "select PickUpDateTime,PickUpLocation,DropDateTime,DropLocation,Status,EntryBy,count(*) as Count"
				+"from db_gps.t_RequestData where Status='Pending' group by PickUpDateTime,PickUpLocation,"
				+"DropLocation order by PickUpDateTime"; */
		
//String PlanQuery = "select * from db_gps.RequestData where RequesterId";
//String sql = "select * from db_gps.t_RequestData";

String RequestId=null;


String datex1, datex2, data1, data2;
String vehiclecode="";
String VehRegNo="";
String vehiclecode1="";
String VehRegNo1="";
String type="",status="";

%> --%>
<%
String datex1, datex2, data1, data2;
String vehiclecode="";
String VehRegNo="";
String vehiclecode1="";
String VehRegNo1="";
String type="",status="";
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
dt=dt+"%20"+"00:00:00";
dt1=dt1+"%20"+"23:59:59";

System.out.println(" dt :-"+dt+" dt1 :-"+dt1);
String TypeValue1=session.getAttribute("usertypevalue").toString();

String heading=""+TypeValue1;

%>
<input type="hidden" id="data3" name="data3" value="<%=heading%>"/>
<body>
<form name="custreport" id="custreport" method="post">
<div id="head" name="head" class="form" align="center" style="font-size: 16px;">
<font id="head1" name="head1" face="san-serif" color="#036" size="3"><b>Invoice Report - <%=TypeValue1%></b></font>
</div>

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

			<!-- <td></td>
			<td></td>
			<td></td> -->
						
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

			<!-- <td></td>
			<td></td>
			<td></td> -->
			
						
			<td style="font-size: 13px; face:san-serif; color:black" >&nbsp;&nbsp;<input type="submit" name="button" value="Submit" onclick="return chk()"></td>
			
			
				
		</tr>
		<!-- </form> -->
	</table>
	</div>
<br>
<div class="form">

<table id="example" class="display" style="width:100%" cellspacing="0">
        <thead>
            <tr>
            	 <th style="font-size: 14px;">SrNo</th> 
            	<th style="font-size: 14px ; face:san-serif;"><b>Invoice No</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Invoice Date</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Amount</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Company Name</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Pay Now</b></th>
            	
            	  <!--<th style="font-size: 14px ; face:san-serif;"><b>CurrType</b></th>
                <th style="font-size: 14px ; face:san-serif;"><b>Group</b></th>
                <th style="font-size: 14px ; face:san-serif;"><b>Sign</b></th>
               <th style="font-size: 14px ; face:san-serif;"><b>ClosedBY</b></th>
                <th style="font-size: 14px ; face:san-serif;"><b>ClosureReason</b></th> 
                <th style="font-size: 14px ; face:san-serif;"><b>Credit</b></th>
                <th style="font-size: 14px ; face:san-serif;"><b>Sum Credit</b></th>
                <th style="font-size: 14px ; face:san-serif;"><b>Sign</b></th>  -->
                
                    
            </tr>
        </thead>
        <tbody>
      <%  
      int RequesterID =0;
      int RequestID =0;
      String RequesterName = "";
      String RequesterCompanyName = "";
      String RequesterAddress = "";
      String RequesterMobileNo = "";
      String EmailId = "";
      String RequesterGender = "";
      String RequesterAge="";
      String PickupDateTime="";
      String PickupLocation="";
      String DropDateTime="";
      String DropLocation="";
      String Status = "";
      String EntryBy = "";
      String EntryDateTime = "";
      
     /*  String requesttype=request.getParameter("RequestType");
	  
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
	  
	  String sql="select * from db_gps.t_RequesterData where TypeValue='"+username+"' and EntryDateTime >='"+dt+"' and EntryDateTime <='"+dt1+"' and Status='Yes' ";

	  System.out.println("Query is : "+sql);
	  ps = conn.prepareStatement(sql);
	  rs4 = ps.executeQuery();

      int i=1;
      while(rs4.next()){ 
    	  RequesterID= rs4.getInt("RequesterID");
    	  
    	  
    	  EntryDateTime=rs4.getString("EntryDateTime"); 
    	  
    	  
    	  */
    	  //String dateformated1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(PickupDateTime));
    	  int i=1;
    	  
    	  
    	  
	String customercode="";
	String TypeValue=session.getAttribute("usertypevalue").toString();
	String sqlapp="select * from db_gps.t_transporter where typevalue='"+TypeValue+"' ";
	System.out.println("Find Role Query" +sqlapp);
	ResultSet rsapp=st.executeQuery(sqlapp);
	if(rsapp.next())
	{
		customercode=rsapp.getString("ERPCode");
	}
	System.out.println(" customercode " +customercode);
    	  
    	//  String dateformated2=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(EntryDateTime));
    	  

  		
		  URL url = null;
          BufferedReader in = null;
		
		Connection con1 = null;
        Connection con = null;

          Statement stat = null;
         Statement stat1 = null;
          Statement stat2 = null;
          Statement stat3 = null;
          Statement stat4 = null;
          Statement stat5 = null;
       // private Map<String, Details> cars;
         
          Object req;

    Thread t;
     String tablename1="";
     String tablename2="";
   
     boolean flag = false;
     int interval = 0;
     String updatesecondaryserver = "";
     String host = "";
    // String username = "";
     String password = "";
     String body = "";
     String msgname = "";
     java.sql.Date msgdate;
     int msgno = 0;
     int totalmsgno = 0;
     int msgsize = 0;
    
     Format frt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     Format frt1 = new SimpleDateFormat("yyyy-MM-dd");
     Format frt2 = new SimpleDateFormat("HH:mm:ss");
     String maildate = "";
     String mailtime = "";
     String dbdriver;
     String connstring;
     String dbuser;
     String dbpass;
     String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
     Properties props = new Properties();
    //static Session session = Session.getDefaultInstance(props, null);
       long serialVersionUID = 1L;
    // Connection conn;
     Connection conn1;
     Statement st;
     Statement st2;
     Statement stsecond;
    Object theUrl;
    //static Store store;
    String urlContent;
    Statement st1;
    Statement st3;
    Statement st4;
   // String  CustomerCode2="556";

       try {
		url = new URL("http://103.241.181.36:8080/InvoiceDetWeb/rest/invoicedetailsinfo?CustomerCode="+customercode+"&fromdate="+dt+"&todate="+dt1+"&format=json");
        System.out.println("After Replace url : "+url);

		//url = new URL("http://192.168.2.124:9090/RestFulws/rest/invoicedetailsinfo?CustomerCode="+customercode+"&fromdate="+dt+"&todate="+dt1+"&format=json");
       } catch (Exception e1) {
		e1.printStackTrace();
	}

       try {
		in = new BufferedReader(
		        new InputStreamReader(
		   url.openStream(),"UTF-8"));
	} catch (IOException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}//in most cases there is utf 8
       String inputLine;
       StringBuilder builder = new StringBuilder();
       while ((inputLine = in.readLine()) != null)
           builder.append(inputLine);
        urlContent = builder.toString();
       System.out.println("urlContent"+urlContent);
     urlContent=urlContent .replace("[", "");
       urlContent=urlContent .replace("]", "");
       System.out.println("urlContent11"+urlContent);
       System.out.println("before body1..."+urlContent);
       String body1=urlContent.replace("{", "@{");
      
       System.out.println("body1..."+body1);
      
       System.out.println("body1..."+body1);
       Pattern p = Pattern.compile("@");//Regex Concept
      
         String s[]=p.split(body1);
         int count =0;
        
         for(String s1:s)
         {
        	 count++;
        
          System.out.println("After Replace : "+s1);
         String x=s1;
         x= x.replace("\n", "");
         PrintWriter pout = null;
         try {
             File file=new File("Log.txt");
             pout = new PrintWriter(file);
         } catch (FileNotFoundException e3) {
             // TODO Auto-generated catch block
             e3.printStackTrace();
         }
          
         x.trim();
         String jsonStatus="";
            JSONObject obj=null;
             System.out.println("HAAAAAAAAAAAAAA : "+x);
             if(x!=" ")
             {
             try
             {
                                 obj = new JSONObject(x);
             }
             catch(Exception e)
             {
                 pout.println("JSON Exception in this string : "+x+":");
                
                // System.out.println("JSON Exception in this string : "+x+":");
                 // updateSgImagesStatus(body1,mailtime, "Exception");
                  jsonStatus="Exception";
                 e.printStackTrace();
                 continue;
             }
             }
             else
             {
                 System.out.println("ERROR ");
             }
           System.out.println("--------------------------------- BELOW JSON OBJECT --------------------");
         
           /*for(int i=0;i<obj.length();i++)
			{
         */
           
         String     invoiceRefNo=obj.getString("invoiceRefNo");
         String    InvoiceNo =obj.getString("InvoiceNo");
         String    CustomerCode=obj.getString("CustomerCode");
         String    InvRaisedCompName=obj.getString("InvRaisedCompName");
         String      InvoiceDate1=obj.getString("InvoiceDate");
         String      CompanyName=obj.getString("CompanyName");
         String     TotBal=obj.getString("Total");
         String     GrandTotal=obj.getString("GrandTotal");
 	 		/* Double     Debit=obj.getDouble("Debit");
 	 		Double     SumDebit=obj.getDouble("SumDebit");
 	 		Double     Credit=obj.getDouble("Credit");
 	 		Double     SumCredit=obj.getDouble("SumCredit");
  		String      Sign=obj.getString("Sign"); */
  		//dd-MMM-yyyy

  		String InvoiceDate = new SimpleDateFormat("dd-MMM-yyyy")
		.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.parse(InvoiceDate1)); 
    
        
           System.out.println("invoiceRefNo----- : "+invoiceRefNo);
           System.out.println("InvoiceNo----- : "+InvoiceNo);
           System.out.println("CustomerCode---- : "+CustomerCode);
           System.out.println("InvRaisedCompName---- : "+InvRaisedCompName);
           System.out.println("InvoiceDate---- : "+InvoiceDate);
           System.out.println("CompanyName---- : "+CompanyName);
         //  System.out.println("InvoiceDate : "+InvoiceDate1);
         //  System.out.println("invoiceRefNo : "+invoiceRefNo1);
          // System.out.println("invoiceRefNo : "+Imgcategory);
          // System.out.println("snapdatetime : "+snapdatetime);
		
          /*  String vehiclelist="";String speed1=null;String lat=null;String lon=null;String time=null;String date="";String filename="";int Duration=0;
           String output = null;
           String output1 = null;
           boolean a=false; */
         //  req=req.replaceAll("_", " ");
          /* System.out.println(Partno);
           System.out.println(STPercent);
           System.out.println(Model);
           System.out.println(Quantity);
           System.out.println(DiscountPercent);
           System.out.println(SellingPrice);*/
           /*System.out.println(InvoiceDate1);
           System.out.println(invoiceRefNo1);*/
		
	/*}*/
	
    	 
    	  
    	  
	  
%>   	
			<tr>		          
				<td style="font-size: 13px; face:san-serif; color:black" align="right"><%=i%></td>
				<td style="font-size: 13px; face:san-serif; color:black" align="left"><a href="InvoiceDetailReport.jsp?id=<%=obj.getString("invoiceRefNo")%>&id1=<%=customercode%>"> <%=obj.getString("invoiceRefNo") %></a></td>
                <td style="font-size: 13px; face:san-serif; color:black" align="right"><%=InvoiceDate%></td>
                <td style="font-size: 13px; face:san-serif; color:black" align="right"><%=obj.getString("GrandTotal")%></td>
                <td style="font-size: 13px; face:san-serif; color:black" align="left"><%=obj.getString("CompanyName") %></td>
                <td style="font-size: 13px; face:san-serif; color:black" id="rzp-button1">
                 <a href="payment.jsp?id=<%=obj.getString("invoiceRefNo")%>&id1=<%=obj.getString("GrandTotal")%>&id2=<%=obj.getString("CompanyName")%>"">Pay Now</a>
                
                
                
                  <!-- <button id="rzp-button1">Pay Now</button>  -->
                
                </td>
         </tr>        
                 
               <%--   <td style="font-size: 13px; face:san-serif; color:black"><%=obj.getString("InvoiceNo") %></td>
                <td style="font-size: 13px; face:san-serif; color:black"><%=obj.getString("CustomerCode") %></td>
                <td style="font-size: 13px; face:san-serif; color:black"><%=obj.getString("InvRaisedCompName") %></td>
               
                <td style="font-size: 13px; face:san-serif; color:black"><%=obj.getDouble("Debit") %></td>
                <td style="font-size: 13px; face:san-serif; color:black"><%=obj.getDouble("SumDebit") %></td>
                <td style="font-size: 13px; face:san-serif; color:black"><%=obj.getDouble("Credit")%></td>
                 <td style="font-size: 13px; face:san-serif; color:black"><%=obj.getDouble("SumCredit") %></td>
                <td style="font-size: 13px; face:san-serif; color:black"><%=obj.getString("Sign") %></td> --%>
                
               <%--  <td style="font-size: 15px;"><%=RequesterMobileNo %></td> --%>    
               <%--  <td style="font-size: 15px;"><%=EmailId %></td> --%>
<%--                 <td style="font-size: 13px; face:san-serif; color:black"><%=obj.getString("SellingPrice") %></td>
 --%>                
                <%-- <td style="font-size: 13px; face:san-serif; color:black; align:right "><%=rs4.getString("RequesterAge") %></td>
                <td style="font-size: 13px; face:san-serif; color:black; align:right "><%=dateformated2 %></td>
                <td style="font-size: 13px; face:san-serif; color:black"><%=rs4.getString("Status") %></td> --%>
                
                <%-- <td style="font-size: 15px;"><%=EntryDateTime %></td> --%> 
               
                
          
               
               
                  <%
                  i++;            
      } 
                  
                 
                  %>  
            
        </tbody>
      
    </table>
   <%-- <input type="hidden"  name="RequestId" id="RequestId" value="<%RequestId;%>"> --%>
   
  
    </div>
    
    
    <br>
 

</form>
</body>

<br><br>
<%-- <%
/* rs4.close(); 
ps.close();
conn.close(); */

%> --%>
<%-- <%@ include file ="footernew.jsp" %> --%>

</body>
</html>
<%@ include file="footernew.jsp" %>

</jsp:useBean>