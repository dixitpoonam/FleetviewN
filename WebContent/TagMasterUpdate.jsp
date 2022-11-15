<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp"%>

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

	<!-- BEGIN: Content-->
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-6">
							<h3 class="content-header-title  mb-0" style="color: #060637">Update User Details </h3>
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
			<div class="content-body">
				<!--  start content body -->
				<!-- Basic Vertical form layout section start -->

				<section class="sectionNew" id="basic--layouts">
					<div class="row">
						<div class="col-md-12 col-12">
							<div class="card">

								<div class="card-body card">
									<!-- Start card body -->
									<!-- <form  action="insertEmpName.jsp" onsubmit="return chk()"> -->
                                        <form  action=" " onsubmit="return chk()">
                                         <div>
                                            <input type="hidden" name="id" id="id" value="<%=Id%>"/>
											<input type="hidden" name="role" id="role" value="<%=Role%>"/>
											<input type="hidden" name="page" id="page" value="<%=pagename%>"/>
											<input type="hidden" name="vehcode" id="vehcode" value="<%=VehId%>"/>
											<font face="san-serif"  size="3"><b>Update <%=Role %> Details   </b></font><br></br>
                                         </div>
                                         
                                     <%if(Role.equals("User")) 
                                        {  %>
										<div class="row mb-2">
											<div class="col-6">
													<label class="tcolor"><font color="red">*</font><b>EmpCode:
															</b></label><br>
													<div class="input-container">
														<input class="form-control" type="text" id="empcode" name="empcode" value=<%=Id %> required="required">
													</div>
												
											</div>
										</div>
										<%} 
                                          %>    
                                                    
										<div class="row mb-2">
											<div class="col-6">
												<div class="md-2">
													<label  class="tcolor"><font color="red">*</font><b>
															First Name:</b></label><br>
														<input class="form-control" type="text" id="firstname"  name="firstname" value=<%=FirstName %>>
												</div>
											</div>
										
											<div class="col-6">
												<label class="tcolor"><font color="red">*</font><b> Last
														Name</b></label><br>
													<input class="form-control" type="text" id="lastname" name="lastname" value=<%=LastName %>>
											</div>
										</div>
										
										<div class="row mb-2">
											<div class="col-4">
												<label  class="tcolor"><font color="red">*</font><b>
														Email</b></label><br>
													<input class="form-control" type="text" id="email" name="email" value=<%=Email %> onblur="return chk2();">
											</div>
										
										
											<div class="col-4">
												<label  class="tcolor"><font color="red">*</font><b>
														Mobile NO:</b></label><br>
													<input class="form-control" type="text" id="mobno" name="mobno" value=<%=MobNo %> required="required" >
											</div>
											
											<%if(Role.equals("User")) 
                                             { %>
											<div class="col-4">
												<label  class="tcolor"><font color="red">*</font><b>
														Location </b></label><br>
													<input class="form-control" type="text" id="location" name="location" value=<%=Location %>>
											</div>
											<%} %>
										</div>

										<div class="d-grid gap-2 col-6 mx-auto mt-2">
											<input class="btn btn-primary btn2" type="submit" value="Submit"></input>
										</div>

									</form>
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

	<br>
	<%@ include file="footernew1.jsp"%>
</body>
</html>
