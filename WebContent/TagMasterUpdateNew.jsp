<%@ include file="headernew.jsp"%>               

	
<html>
<head>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<link href="css/Fleetview.css" rel="stylesheet" type="text/css"></link>
<link rel="stylesheet" href="css/styleMakePlan.css">
<link rel="stylesheet" type="text/css" href="css/view.css" media="all">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 



<script>

function chk()
{
//alert("HI");

	var role=document.getElementById("role").value;
	//alert(role);
	if(role=="User")
		{
	var empcode=document.getElementById("empcode").value;
	var re=/^[A-Za-z0-9]+/;
	//var re=/^[0-9]*$/;
	if(empcode==""){
		alert("Enter Value For Contractor Id");
		return false;
	}else{
		if(!re.test(empcode))
		{
		alert("Enter Proper Value For Contractor Id");
		return false;
		}
	}
		}
	var firstname=document.getElementById("firstname").value;

	var re=/^[A-Za-z]+[\s\-]*[\s\- .,&A-Za-z]*[A-Za-z]+$/;
	if(firstname==""){
		alert("Enter the First Name");
		return false;
	}else{
		if(!re.test(firstname))
		{
		alert("Enter Characters Only");
		return false;
		}
	}
	
	var lastname=document.getElementById("lastname").value;
	if(lastname==""){
		alert("Enter the Last Name");
		return false;
	}else{
	if(!re.test(lastname))
	{
	alert("Enter Characters Only");
	return false;
	}}
	
	var email=document.getElementById("email").value;
	var re=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/; 
    
    if(email==""){
	alert("Enter The Email Id");
    }else{
		if(!re.test(email))
		{
		alert("Enter Valid  Email Id");
		return false;
		}
	}
	
	var mobno=document.getElementById("mobno").value;
	//alert("Mobno "+mobno);
	var rs=/^[+]{0,1}[0-9]{10,15}$/;
	 //var rs=/^\d{3}\d{3}\d{4}$/;
	 if(mobno==""){
		 alert("Enter The Mobile No");
		 return false;
	 }else{
    if(!rs.test(mobno)){
   	 
   	 alert("Please Enter Mobile Number Properly");
   	 return false;
    }}		

	 
	 if(role=="User")
		{
	var location=document.getElementById("location").value;
	
	var re=/^[A-Za-z0-9]+/;
	//var re=/^[0-9]*$/;
	if(location==""){
		alert("Enter Value For Contractor Id");
		return false;
	}else{
	if(!re.test(location))
	{
	alert("Enter Proper Value For Contractor Id");
	return false;
	}
	}
		}
}

	
</script>

</head>



<%! 
Connection conn,conn1;
ResultSet rs1,rs2;
Statement st,st1,st3,st4,st5;
%>

<%
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st1=conn1.createStatement();
st=conn1.createStatement();
st3=conn1.createStatement();
st4=conn1.createStatement();
st5=conn1.createStatement();



%>
<%
String username=(String)session.getAttribute("usertypevalue");

String Id=request.getParameter("Id");

String VehId=request.getParameter("vehcode");


String Role=request.getParameter("Role");
String pagename=request.getParameter("pagename");

String EntryDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());





String ware="";
String query1="";
String mailid="";
String tocc="";
String innerlimit="";
String outerlimit="";
String latitude="";
String longitude="";
String alertStatus="";
String status="";
String branch="";
String ownername="";








System.out.println("--->"+Id);
System.out.println("----->"+VehId);
String query="";
if(Role.equals("User"))
{
	 query="Select * from db_gps.t_userdetails where vehid='"+VehId+"' and SrNo='"+Id+"'";
}
else
{
	query="Select * from db_gps.t_userdetails where SrNo='"+Id+"'";
}
rs1=st1.executeQuery(query);

String MobNo="";
String Email="";
String FirstName="";
String LastName="";
String Location="";

if(rs1.next())
{
	 MobNo=rs1.getString("MobNo");
	 if(MobNo==null)
	 {
		 MobNo="0000000000";
	 }
	 
	 Email=rs1.getString("Email");
	 if(Email==null)
	 {
		 Email="-";
	 }
	 FirstName=rs1.getString("FirstName");
	 if(FirstName==null || FirstName.equals(" ") || FirstName.equals(""))
	 {
		 FirstName="-";
	 }
	 LastName=rs1.getString("LastName");
	 if(LastName==null)
	 {
		 LastName="-";
	 }
	 Location=rs1.getString("Location");
	 if(Location==null)
	 {
		 Location="-";
	 }
}
%>
<body>

<form  action="insertEmpName.jsp" onsubmit="return chk()">


<div align="center" class="headerlay">
<%-- <textarea id="war" name="war" rows="5" cols="10" style="visibility: hidden;"><%=wareHouse %></textarea> --%>

<input type="hidden" name="id" id="id" value="<%=Id%>"/>
<input type="hidden" name="role" id="role" value="<%=Role%>"/>
<input type="hidden" name="page" id="page" value="<%=pagename%>"/>
<input type="hidden" name="vehcode" id="vehcode" value="<%=VehId%>"/>
<font face="san-serif"  size="3"><b>Update <%=Role %> Details   </b></font><br></br>

</div>

<div id="show" class="headerlay">  
<div class="container-fluid">
 

 
 <!-- <font color="red" size="2">*</font> -->
 <!-- <b><font size="2">Note Please Enter comma separated Email id.</font></b> -->
 <%if(Role.equals("User")) 
      {  %>
   <div class="row">
   
   <div class="col-sm-2">
    </div>
   <div class="col-sm-2">
    </div>
    
     <div class="col-sm-2"> <font color="red" size="2">*</font><font size="2">
     EmpCode:</font>
    </div>

     <div class="col-sm-3" >
     
    <input type="text"  id="empcode"  class="element text medium" name="empcode" style="width: 88%;"  value=<%=Id %> required="required" >
    
    </div>
    
     <div class="col-sm-1">
    </div>
    <div class="col-sm-2">
    </div>
   
    
 </div>
 <%} 
     %>
 <br>
 
 
   <div class="row">
    <div class="col-sm-2">
    </div>
   
   <div class="col-sm-2">
    </div>
    
     <div class="col-sm-2"> <font color="red" size="2">*</font><font size="2">
     FirstName:</font>
    </div>

     <div class="col-sm-3">
    <input type="text" id="firstname" class="element text medium" name="firstname" style="width: 140%;" value=<%=FirstName %> >
    </div>
    
     <div class="col-sm-1">
    </div>
    <div class="col-sm-2">
    </div>
    
 </div>
 
  <br>
 
   <div class="row">
    <div class="col-sm-2">
    </div>
   <div class="col-sm-2">
    </div>
    
     <div class="col-sm-2"> <font color="red" size="2">*</font><font size="2">
     LastName:</font>
    </div>

     <div class="col-sm-3">
    <input type="text" id="lastname" class="element text medium" name="lastname" style="width: 140%;" value=<%=LastName %> >
    </div>
    
     <div class="col-sm-1">
    </div>
    <div class="col-sm-2">
    </div>
    
 </div>
 
  <br>
 
 
 
   <div class="row">
    <div class="col-sm-2">
    </div>
   <div class="col-sm-2">
    </div>
    
     <div class="col-sm-2"> <font color="red" size="2">*</font><font size="2">
     Email:</font>
    </div>

     <div class="col-sm-3">
    <input type="text" id="email" class="element text medium" name="email" style="width: 140%;" value=<%=Email %> onblur="return chk2();">
    </div>
    
     <div class="col-sm-1">
    </div>
    <div class="col-sm-2">
    </div>
    
 </div>
 
 <br>
 
    <div class="row">
   <div class="col-sm-2">
    </div>
   <div class="col-sm-2">
    </div>
    
     <div class="col-sm-2"> <font color="red" size="2">*</font><font size="2">
     MobNo:</font>
    </div>

     <div class="col-sm-3">
    <input type="text" id="mobno" class="element text medium" name="mobno" style="width: 88%;" value=<%=MobNo %> required="required"   >
    </div>
    
     <div class="col-sm-1">
    </div>
   <div class="col-sm-2">
    </div>
    
 </div>
 

 
 
 
 
 
 <br>
 
 
 <%if(Role.equals("User")) 
     { %>
   <div class="row">
    <div class="col-sm-2">
    </div>
   <div class="col-sm-2">
    </div>
    
     <div class="col-sm-2"> <font color="red" size="2">*</font><font size="2">
     Location:</font>
    </div>

     <div class="col-sm-3">
    <input type="text" id="location" class="element text medium" name="location" style="width: 88%;" value=<%=Location %> >
    </div>
    
     <div class="col-sm-1">
    </div>
    <div class="col-sm-2">
    </div>
    
 </div>
 <%} %>
 
     <div class="row">
    <div class="col-sm-2">
    </div>
   <div class="col-sm-2">
    </div>
    
     
    
     <div class="col-sm-1">
    </div>
    <div class="col-sm-2">
    </div>
    
 </div>
 
 <br>
  
  
  <div class="row">
    <div class="col-sm-4">
    </div>
    

    <div class="col-sm-4" align="center">
   <input type="submit" value="Submit" >
    </div>
    <div class="col-sm-4">
    
    </div>
    
    
   
  </div>
  
</div>

</div>
</form>



</body>
<br>
<%@ include file ="footernew.jsp" %>



</html>
<%-- <%@ include file="footernew.jsp"%> --%>