<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp"%>
<%@page import="com.fleetview.beans.classes"%>

<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader ("Expires", 0);
%>
<%!
Connection conn;
Statement st;
String email="",phno="";
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

<script type="text/javascript">
onload=function()
{
	document.changepass.oldpass.value="";
	document.changepass.newpass.value="";
	document.changepass.renewpass.value="";
}

function validateEmail(email)
{
     var splitted = email.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;
}

	function validate()
		{
		try{
			var pass;
			var pass1;
			var pass2;
			var email;
			var phno;
			pass=document.changepass.oldpass1.value;
			alert("Old Password=="+pass);
			pass1=document.changepass.newpass.value;
			pass2=document.changepass.renewpass.value;
			email=document.changepass.email.value;
			phno=document.changepass.phno.value;
			alert("new Password=="+pass1);
			alert("reEnterd Pssdword=="+pass2);
			alert("email=="+email);
			alert("Phone number=="+phno);
			if(pass=="")
			{
				alert("Please Enter Old Password");
				return false;
			}
		/*	if(pass1=="")
			{
				alert("Please Enter New Password");
				return false;
			}
			if(pass2=="")
			{
				alert("Please Re-Enter New Password");
				return false;
			}*/
			if(!(pass1==pass2))
			{
				alert("New Password and Re-entered password not maching");
				return false;
			}
			if((pass==pass1))
			{
				alert("Please change your password");
				return false;
			}
			if(email==""||email==null)
			{
				alert("Please enter the email Id!!");
				return false;
			}

			var sss=validateEmail(email);
			if(!sss)
				{
					alert("Please enter valid Email Id");
					return false;
				} 

			//alert(phno);
			if(!(phno ==0))
			{
				
				 if(isNaN(phno))
		    		{
		    			alert("Please enter Numeric Value");
		    			return false;
		    		}
		    	//	alert("$$$$$$$$$$$$$"+phno.length);
					 if((phno.length < 10)  || (phno.length >15))
			    	{
		            alert("Please enter valid Mobile Number between range 10 to 13"); 
		            return false;
		        }
			}
			else
			{
				phno=" ";
			}
	
			
          /*  if(!(email.contains("@"))) 
            {
                alert("Please enter correct email id..!!");
                return false;
            }*/
          /*   return false; */
			document.changepass.action="changepassdb.jsp?oldpass="+pass+"&newpass="+pass1+"&email="+email+"&phno="+phno;
			document.changepass.submit();
		}catch(e)
		{alert(e);}
		check();
		}
</script>
</head>
<body>
	<%
try
{
	classes fleetview= new classes();
	fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn = fleetview.ReturnConnection();
	st=conn.createStatement();
	String username=(String)session.getAttribute("mainuser");
	String fname=(String)session.getAttribute("fname");
	String lname=(String)session.getAttribute("lname");
	//fname=request.getParameter("fname");
	//lname=request.getParameter("lname");
	//String Designation=(String)session.getAttribute("Designation");
	String MobNo=(String)session.getAttribute("MobNo");
	String Designation="",passret="";
	
	String sql="Select * from db_gps.t_userdetails where UserName='"+username+"' and FirstName='"+fname+"' and LastName='"+lname+"'"; 
	ResultSet rs=st.executeQuery(sql);
	if(rs.next())
	{
		fname=rs.getString("FirstName");
		lname=rs.getString("LastName");
		Designation=rs.getString("Designation");
		///System.out.println("Track : "+Desig);
		email=rs.getString("Email");
		MobNo=rs.getString("MobNo");
	}
	String sql1="Select * from db_gps.t_security where UserName='"+username+"' and ActiveStatus='Yes'"; 
	ResultSet rs1=st.executeQuery(sql1);
	System.out.println("Pass---------------------> : "+sql1);
	if(rs1.next())
	{
	   passret=rs1.getString("Password");	
	   System.out.println("Passpasspass---------------------> : "+passret);
	}
	String flag=request.getParameter("flag");
	if(flag!=null && flag.equalsIgnoreCase("true"))
	{
		%>
	<script>
		alert("Information saved Successfully..!!");
		window.location="changepass.jsp";
		</script>
	<%
	}
	else
		if(flag!=null && flag.equalsIgnoreCase("false"))
	{
			%>
	<script>
			alert("Please enter correct old Password..!!");
			window.location="changepass.jsp";
			</script>
	<%
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
						<div class="col-6">
							<h3 class="content-header-title  mb-0" style="color: #060637">Personal
								Details</h3>
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
									<form name="changepass" method="post" action="changepassdb.jsp"
										onSubmit="return validate();">
										<input type="hidden" name="passret1" id="passret1"
											value="<%=passret %>"></input>
										<div class="row col-12">
											<div class="col-6">
												<div class="md-2">
													<label for=" User Name:-" class="tcolor"><b>User
															Name:-</b></label><br>
													<div class="input-container">
														<input class="form-control" type="text"
															placeholder="Enter User name" name="user" id="user"
															value="<%=username %>" readonly="readonly">
													</div>
												</div>
											</div>
											<div class="col-6">
												<div class="md-2">
													<label for=" First Name:-" class="tcolor"><b>
															First Name:-</b></label><br>
													<div class="input-container">
														<input class="form-control" type="text"
															placeholder=" Enter First Name:-" name="fname" id="fname"
															value="<%=fname %>">
													</div>
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label for="Last Name" class="tcolor"><b> Last
														Name:-</b></label><br>
												<div class="input-container">
													<input class="form-control" type="text"
														placeholder="Enter Last Name" name="lname"
														value="<%=lname %>">
												</div>
											</div>
											<div class="col-6">
												<label for=" Designation:-" class="tcolor"><b>
														Designation:-</b></label><br>
												<div class="input-container">
													<input class="form-control" type="text"
														placeholder="Enter Designation:-" name="Designation"
														value="<%=Designation %>" readonly="readonly">
												</div>
											</div>
										</div>
										<%
	                                            System.out.println("Passpasspass---------------------> : "+passret);
	                                         %>
										<div class="row col-12">
											<div class="col-6">
												<label for="Old Password:-" class="tcolor"><b>Old
														Password:-</b></label><br>
												<div class="input-container">
													<input class="form-control" type="password"
														placeholder="Enter Old Password" name="oldpass1"
														value="<%=passret%>" readonly="readonly">
												</div>
											</div>
											<div class="col-6">
												<label for="  New Password:-" class="tcolor"><b>
														New Password:-</b></label><br>
												<div class="input-container">
													<input class="form-control" type="password"
														placeholder="Enter your New Password" name="newpass">
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label for="Old Password:-" class="tcolor"><b>
														Re-enter New Password:-</b></label><br>
												<div class="input-container">
													<input class="form-control" type="password"
														placeholder="Re-Enter new Password" name="renewpass">
												</div>
											</div>
											<div class="col-6">
												<label for="Old Password:-" class="tcolor"><b>Phone
														Number:-</b></label><br>
												<div class="input-container">


													<%
													if(null==session.getAttribute("phno").toString())
													{
													%>
													<input class="form-control" type="text"
														placeholder="Enter Phone number" name="phno">
													<%
													}
													else
													{
														%>
													<input class="form-control" type="text"
														placeholder="Enter Phone number" name="phno"
														value="<%=MobNo %>">
													<%
													}
														%>
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label for="Old Password:-" class="tcolor"><b>Email
														ID:-</b></label><br>
												<div class="input-container">

													<%
															if(null==session.getAttribute("email").toString())
															{
															%>

													<input class="form-control" type="email"
														placeholder="Enter Email ID" name="email">&nbsp;
													<%
															}
															else
															{
																%>

													<input class="form-control" type="email"
														placeholder="Enter Email ID" name="email"
														value="<%=email %>">&nbsp;

													<%
															}
																%>
												</div>
											</div>
										</div>
										<div class="d-grid gap-2 col-6 mx-auto">
											<input class="btn btn-primary btn2" type="button" name="btn"
												value="Submit" onclick="return validate();">

											<!-- 											<button class="btn btn-primary btn2" type="submit">Register</button>
 -->
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
	<%
}
catch(Exception e)
{
	System.out.println("Exception--------->"+e);
	e.printStackTrace();
}

%>
	<br>
	<%@ include file="footernew1.jsp"%>
</body>
</html>
