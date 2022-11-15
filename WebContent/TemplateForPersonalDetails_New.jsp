<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp" %>

<html>
  <head>  
    <title>Entry Form Template</title>  
    
<script src="js/datatable/feather.min.js"></script>
<script src="js/datatable/moment.js"></script>
<link rel="stylesheet" href="css/table/jquery-ui.css">
<script src="js/datatable/jquery-ui.js"></script>
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <script>
 function ValidateName(){
	 alert("Onblur Name");
	 var nameval = document.entryform.contactperson.value;
	 var text = /^[a-zA-Z  .]+$/
	 alert(nameval);
	 /* 
	 if(nameval==""||nameval==null){
		 alert("cannot leave name empty");
	 }
	 
	 if(!text.test(nameval))
		{
		alert("Please Enter valid EmailID"); 
		return false;
		} */
	 
	 
	}
 function ValidateEmail(){
	    //alert("onblur email...");
		var text= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/;
		//alert(text);
		var txtEmail=document.entryform.email;
	    //alert("email id:"+txtEmail.value);
		if(txtEmail.value=="")
			{
			alert("Please Enter EmailID");
			return false;
			}

		if(!text.test(txtEmail.value))
			{
			alert("Please Enter valid EmailID"); 
			return false;
			}
 }
 
 
 function ValidatePhone(){
	 //alert("on blur")
	 var mob=document.entryform.phoneno.value;
	 //alert("mob no:"+mob);
	 var text=/^[0-9]+$/; 
	 
	 if(mob==""){
		 alert("please enter Phone Number");
			return false;
	 }
	   if(!(mob ==0))
			{
				 if(isNaN(mob))
					{
						alert("please enter numeric value");
						return false;
					}	
				 if(!text.test(mob)){
                     alert("please enter numeric value");
                             return false;
                         }
					return true;
			    }
 }
 
 function validateAll(){
	 alert("in Validate All");
	 var nameval = document.entryform.contactperson.value;
	 var mob=document.entryform.phoneno.value;
	 var txtEmail=document.entryform.email;
	 
	 var text_email= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/;
	 
 }
 </script>
 
 <style type="text/css">
 
 /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
    .tcolor{
        color:#0F2A64;
        font-weight:bold;
        font-size: 12px;
        font-family:Verdana,arial, sans-serif;
      }
 .btn1{
        padding: 10px 30px;
	    text-align: center;
	    float:;
	    font-size: 20px;
	    border-radius:00%;
       /*  background-color:#000080; */
        background-color:#0F2A64;
        color:white;
      }   
    .button{
 /*  background-color:light gray; */
		  border: none;
		  color: white;
		  padding: 10px 30px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 20px;
		  border-radius:00%;
		  float:center;
  }   
  .card {
        margin: 5 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 60px; /* Added */
}
 </style>
 <style>
/* body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}
 */
.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.icon {
  padding: 10px;
  background: #0F2A64;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 5px;
  outline: none;
}
.btncol{background-color:#0F2A64;}
.input-field:focus {
  border: 2px solid #4682B4;
}

/* Set a style for the submit button */
.btnPersonal {
  background-color:#0F2A64;  /*  dodgerblue */
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 48%;
  opacity: 0.9;
  float: center;
}

.btn:hover {
  opacity: 1;
}
</style>
  </head>
  <body>

 <!-- BEGIN: Content-->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0" style="color:#000080">Entry Form Template</h3>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
					   <button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0 btncol" data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
						Register Complaint</button>
					
						<button id="kt_engage_demos_toggle" class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0 btncol" >
							<span id="kt_engage_demos_label">Help</span>
						</button>
					  </div>
				</div>
			</div>
		</div>
        <div class="content-body"> <!--  start content body -->
           <!-- Basic Vertical form layout section start -->
           
            <section id="basic--layouts" >
                <div class="row">
                    <div class="col-md-12 col-12">
                        <div class="card">
                            <div class="card-body card"> <!-- Start card body -->
                                <form name="entryform" class="form form-vertical" method="POST">
                                    <div class="row col-12">
                                       <div class="col-12">		    
                                            <p class="tcolor">Please fill in this form to create an Personal account.</p>
										    <hr>
										</div>
								    </div>
								    <div class="row col-12">
                                       <div class="col-6">	
										     <label for=" User Name:-" class="tcolor"><b>User Name:-</b></label><br>
										      <div class="input-container">
											    <i class="fa fa-user icon"></i>
											    <input class="input-field" type="text" placeholder="Enter User name" name="usrnm">
											  </div>
									    </div>
									     <div class="col-6">			  
											  <label for=" First Name:-" class="tcolor"><b> First Name:-</b></label><br>
											  <div class="input-container">
											    <i class="fa fa-envelope icon"></i>
											    <input class="input-field" type="text" placeholder=" Enter your First Name:-" name="email">
											  </div>
										</div>
									 </div> 
									 
									   <div class="row col-12">
                                       <div class="col-6">		  
											  <label for="Last Name" class="tcolor"><b> Last Name:-</b></label><br>
											  <div class="input-container">
											    <i class="fa fa-key icon"></i>
											    <input class="input-field" type="password" placeholder="Enter your Last Name" name="psw">
											  </div>
										</div>
										<div class="col-6">		  
											  <label for=" Designation:-" class="tcolor"><b>  Designation:-:-</b></label><br>
											  <div class="input-container">
											    <i class="fa fa-key icon"></i>
											    <input class="input-field" type="password" placeholder="Enter your  Designation:-" name="psw">
											  </div>
										</div>
										</div>
										
										<div class="row col-12">
                                       <div class="col-6">		  
											  <label for="Old Password:-" class="tcolor"><b>Old Password:-</b></label><br>
											  <div class="input-container">
											    <i class="fa fa-key icon"></i>
											    <input class="input-field" type="password" placeholder="Enter your Old Password" name="psw">
											  </div>
										</div>
										<div class="col-6">		  
											  <label for="  New Password:-" class="tcolor"><b>   New Password:-</b></label><br>
											  <div class="input-container">
											    <i class="fa fa-key icon"></i>
											    <input class="input-field" type="password" placeholder="Enter your   New Password" name="psw">
											  </div>
										</div>
										</div>
										
										<div class="row col-12">
                                       <div class="col-6">		  
											  <label for=" Re-enter New Password" class="tcolor"><b> Re-enter New Password</b></label><br>
											  <div class="input-container">
											    <i class="fa fa-key icon"></i>
											    <input class="input-field" type="password" placeholder="Enter Re-enter New Password" name="psw">
											  </div>
										</div>
										 <div class="col-6">		  
											  <label for=" Phone Number" class="tcolor"><b> Phone Number:-</b></label><br>
											  <div class="input-container">
											    <i class="fa fa-key icon"></i>
											    <input class="input-field" type="password" placeholder="Enter your Phone Number" name="psw">
											  </div>
										</div>
										</div>
										
										<div class="row col-12">
                                        <div class="col-6">		  
											  <label for="Email ID" class="tcolor"><b>Email ID:-</b></label><br>
											  <div class="input-container">
											    <i class="fa fa-key icon"></i>
											    <input class="input-field" type="password" placeholder="Enter your Email ID" name="psw">
											  </div>
										</div>
										</div>
										
										<div class="row col-12">
										  <div class="col-4"></div>
											<div class="col-4">
											   <button type="submit" class="btn btn-primary btn-lg btnPersonal">Register</button>
											</div>
										   <div class="col-4"></div>	 
											
										</div>							
								
<!-- 										 <button type="submit" class="btn btnPersonal ">Register</button>										
 -->										    
									
									
                              </form>
                             </div>
                            </div>  <!--  end of card body -->
                        </div>
                    </div>
                
            </section>
            <!-- Basic Vertical form layout section end -->
           </div>
        </div> <!--  end content body -->
    </div>   <!-- end content wrapper-->
</div> <!-- end app-content -->
<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>
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

      <br>
      <%@ include file="footernew1.jsp"%> 
  </body>
</html>