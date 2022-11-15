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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

 



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
 
 function getcheckedrow()
 {
 	//alert("hiiiii");
 	var cnt1=0,cnt2=0,k=1,flag="t",flag1="t",l=1;
 	var id="";
 	var chklength=document.getElementsByName("chkbx");
 	//var chklength = document.getElementById("checkedNumber").value;
 	//alert("hiiiii"+chklength);
 	for(cnt1=0;cnt1<chklength.length;cnt1++)
 	{
 		if( document.getElementById("chkbx"+k).checked == true )
 		{
 			flag="success";
 		//	alert("flag"+flag);
 		}
 	k++;	
 	}


 	
 	//alert("flg"+flag+"flg1"+flag1);
 	if(flag == "success")
 	{
 		//alert("Inside Success");
 		var i=1,j,cnt=0;
 		id="";
 		var approvalComment="";
 		//alert("hiiiii1");
 		
 		
 	//	var chklengthnew = document.getElementById("checkedNumber").value;
 		for(cnt=0;cnt<chklength.length;cnt++)
 		{
 			//alert("for Length of for==>"+chklengthnew.length);
 			
 			if(document.getElementById("chkbx"+i).checked)
 			{
 				//alert("if");
 				id=id+","+document.getElementById("net_id1"+i).innerHTML;
 			//	approvalComment=approvalComment+"/"+document.getElementById("approvalcomment"+i).value;
 			}
 			i++;
 		}
 	//	alert("check"+id);
 	//	DeleteRow(id,approvalComment);
 		DeleteRow(id);
 	}
 	else
 	{
 		alert("Please Select Request Id ");
 		//swal("Please Check Request!", "", "warning");
 		return false;
 	}
 	
 }

 function DeleteRow(id)
 {
 	//alert("Control inside deldte function"+id);

 	var agree=confirm("Do You Want To Create Plan ?");
 	var PlanDate=document.getElementById("PlanDate").value;
 	var Origin=document.getElementById("Origin").value;
 	var Destination=document.getElementById("Destination").value;
 	var RequestType=document.getElementById("RequestType").value;
 	var Mode=document.getElementById("Mode").value;
 	    //alert(agree);
 	    if(agree)
 	    {
 	    	 
 	    	//window.location="ApprovedTask.jsp?action=approve&id="+id+"";
 	    	//window.location="ActionApprovedTask.jsp?action=approve&id="+id+"";
 	    	window.location="PlanAction.jsp?action=approve&id="+id+"&PlanDate="+PlanDate+"&Origin="+Origin+"&Destination="+Destination+"&RequestType="+RequestType+"&Mode="+Mode+" ";
 			
 	    }
 	    else
 	    {
 	    	return false;
 	    }
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
String data1,sql,sql1,data2,jcode,origin,destination,startdate;
Statement st,st1,st2;
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
String Mode="";
username=(String)session.getAttribute("usertypevalue");

String PickupDate = request.getParameter("PickupDate");
String PickUpLocation = request.getParameter("PickUpLocation");
String DropLocation = request.getParameter("DropLocation");
String requesttype=request.getParameter("RequestType");
/* String plansql = "select PickUpDateTime,PickUpLocation,DropDateTime,DropLocation,Status,EntryBy,count(*) as Count"
				+"from db_gps.t_RequestData where Status='Pending' group by PickUpDateTime,PickUpLocation,"
				+"DropLocation order by PickUpDateTime"; */
		
//String PlanQuery = "select * from db_gps.RequestData where RequesterId";
String sql = "select * from db_gps.t_RequestData where Status='Pending' and PickUpDateTime ='"+PickupDate+"'  and PickUpLocation='"+PickUpLocation+"' and DropLocation='"+DropLocation+"' ";

System.out.println("Query is : "+sql);
ps = conn.prepareStatement(sql);
rs4 = ps.executeQuery();
String RequestId=null;



%>

<body>
<div class="form">

<br>

<div>
<div class="form" align="center" style="font-size: 16px;">
<font face="san-serif" color="#036" size="3"><b>Create Plan For <%=PickUpLocation %>  To <%=DropLocation %>   <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(PickupDate)) %> </b></font>
</div>
<table id="example" class="display" style="width: 100%" cellspacing="0" >
        <thead>
        
            <tr>
            	
            	<th style="font-size: 14px ; face:san-serif;">Check</th>
            	<th style="font-size: 14px ; face:san-serif;">SrNo</th>
            	<th style="font-size: 14px ; face:san-serif;">Requester</th>
            	<th style="font-size: 14px ; face:san-serif;">Company</th> 
            	<th style="font-size: 14px ; face:san-serif;">RequestID</th>
                <th style="font-size: 14px ; face:san-serif;">Date</th>    
                <th style="font-size: 14px ; face:san-serif;">Origin</th>
                <th style="font-size: 14px ; face:san-serif;">Destination</th>
                <th style="font-size: 14px ; face:san-serif;">PickupDateTime</th>
                <th style="font-size: 14px ; face:san-serif;">PickUpAddress</th>
                <th style="font-size: 14px ; face:san-serif;">DropAddress</th>
                <th style="font-size: 14px ; face:san-serif;">Type</th>
                
                    
            </tr>
        </thead>
        <tbody>
      <%  
      String id = "";
      String PlanDate = "";
      String PlanDate1="";
      String Origin = "";
      String Destination = "";
      
	  int i=0;
	  
      while(rs4.next()){
    	  
    	  RequestId = rs4.getString("RequestId");
    	  
    	  System.out.println("ID :"+RequestId);
    	  id=id+","+RequestId;
    	  session.setAttribute("RequestId", RequestId);
    	  PlanDate=rs4.getString("PickupDateTime");
    	  Origin = rs4.getString("PickUpLocation");
    	  Destination = rs4.getString("DropLocation");
    	  PlanDate1=rs4.getString("PickupDateTime");
    	  Mode=rs4.getString("Mode");
    	  PlanDate=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(PlanDate));
    	  String EntryDateTime=rs4.getString("EntryDateTime");
    	  EntryDateTime=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(EntryDateTime));
    	 i++; 
%>   	

	<tr>		
	
	<td><input type="checkbox"  name="chkbx"   id="chkbx<%=i %>"/></td>
				<td style="font-size: 13px; face:san-serif; color:black"><%=i %></td>
				<td style="font-size: 13px; face:san-serif; color:black" ><%=rs4.getString("RequesterName") %></td>
                <td style="font-size: 13px; face:san-serif; color:black" ><%=rs4.getString("RequesterCompanyName") %></td>
                <td><div align="right" id="net_id1<%=i %>"><%=RequestId %></div></td>
                <td style="font-size: 13px; face:san-serif; color:black" ><%=rs4.getString("EntryDateTime") %></td>
                <td style="font-size: 13px; face:san-serif; color:black" ><%=rs4.getString("PickUpLocation") %></td>
                <td style="font-size: 13px; face:san-serif; color:black" ><%=rs4.getString("DropLocation") %></td>
                
                <td style="font-size: 13px; face:san-serif; color:black" ><%=rs4.getString("PickupDateTime") %></td>
                <td style="font-size: 13px; face:san-serif; color:black" ><%=rs4.getString("PickUpAddress") %></td>
                <td style="font-size: 13px; face:san-serif; color:black" ><%=rs4.getString("DropAddress") %></td>
                <td style="font-size: 13px; face:san-serif; color:black" ><%=rs4.getString("RequestType") %></td>
                
                </tr>
               
                  <%} 
                  id=id.substring(1);
                  System.out.println("All Id :"+id);
                  %>     
            
        </tbody>
      
    </table>
   <%-- <input type="hidden"  name="RequestId" id="RequestId" value="<%RequestId;%>"> --%>
   
  
    </div>
    <br>
    
   <!-- <form class="makeplan" action="makeplan" method="post" > -->
   
   <div align="right">
   <input type="hidden" name="entryby" id="entryby" value="<%=session.getAttribute("fname") %>" readonly="readonly"/>
   <input type="hidden"  name="RequestId" id="RequestId" value="<%=RequestId%>">
   <input type="hidden"  name="PlanDate" id="PlanDate" value="<%=PlanDate1%>">
   <input type="hidden"  name="Origin" id="Origin" value="<%=Origin%>">
   <input type="hidden"  name="Destination" id="Destination" value="<%=Destination%>">
   <input type="hidden"  name="RequestType" id="RequestType" value="<%=requesttype%>">
   <input type="hidden"  name="Mode" id="Mode" value="<%=Mode%>">
   
          <button type="submit" id="planbtn" class="button button-block" onclick="return getcheckedrow()">Create Plan</button>
          </div> 
          
</div>
</body>
<br><br>
<%
rs4.close(); 
ps.close();
conn.close();

%>
<%@ include file ="footernew.jsp" %>



</html>
<%-- <%@ include file="footernew.jsp"%> --%>