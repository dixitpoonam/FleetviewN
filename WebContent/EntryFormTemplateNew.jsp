<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp" %>


<%--  <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"></jsp:useBean>
 --%><%
	/* fleetview.getConnection(MM_dbConn_DRIVER, MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD); */
%>
<html>
  <head>  
    <title>Entry Form Template</title>  
    
     
<!--  <link href="uiform/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
<script src="uiform/moment-with-locales.js"></script>
<script src="uiform/bootstrap-datetimepicker.js"></script> -->


<script src="js/datatable/feather.min.js"></script>
<script src="js/datatable/moment.js"></script>
<link rel="stylesheet" href="css/table/jquery-ui.css">
<script src="js/datatable/jquery-ui.js"></script>
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
  </head>
  <body>

 <!-- BEGIN: Content-->
 <div class="app-content content ">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper container-xxl p-0">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-start mb-0">Entry Form Header</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-body">
            

            <!-- Basic Vertical form layout section start -->
            <section id="basic-vertical-layouts">
                <div class="row">
                    
                    <div class="col-md-12 col-12">
                        <div class="card">
                            <div class="card-header">
                                <h6>( <span style="color:red;">*</span> indicates mandatory fields)</h6>
                            </div>
                            <div class="card-body">
                                <form name="entryform" class="form form-vertical" method="POST">
                                    <div class="row col-12">
                                        <div class="col-md-6">
                                            <div class="mb-1">
                                                <label class="form-label" for="first-name-icon">Name<span style="color:red;">*</span></label>
                                                <div class="input-group input-group-merge">
                                                    <span class="input-group-text"><i data-feather="user"></i></span>
                                                    <input type="text" id="first-name-icon" id="contactperson" class="form-control" name="contactname" placeholder="First Name Last Name" onblur="ValidateName()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-1">
                                                <label class="form-label" for="first-name-icon">Mobile No<span style="color:red;">*</span></label>
                                                <div class="input-group input-group-merge">
                                                    <span class="input-group-text"><i data-feather="hash"></i></span>
                                                    <input type="text" id="first-name-icon" class="form-control" name="phoneno" id="phoneno" placeholder="XXXXXXXXXX" onblur="ValidatePhone()" />
                                                </div>
                                            </div>
                                        </div>
                                       
                                        <!-- New Row  -->
                                        <div class="col-md-6">
                                            <div class="mb-1">
                                                <label class="form-label" for="first-name-icon">Date of Birth<span style="color:red;">*</span></label>
                                                <div class="input-group input-group-merge">
                                                    <span class="input-group-text"><i data-feather="calendar"></i></span>
                                                    <input type="text" id="datepicker" class="form-control" name="fname-icon" value="<%=session.getAttribute("today").toString()%>"/>
                                                    </div>
                                                    <script>
													$(document).ready(function() {
        												$( function() {
														$( "#datepicker" ).datepicker({
														dateFormat: 'dd-M-yy',
														changeMonth: true,
														changeYear: true
																	});
																});
														  });
														</script>      
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-1">
                                                <label class="form-label" for="first-name-icon">Number of Vehicles</label>
                                                <div class="input-group input-group-merge">
                                                    <span class="input-group-text"><i data-feather="calendar"></i></span>
                                                    <input type="number" id="number" class="form-control" name="fname-icon" value=""/>
                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <!-- New Row  -->
                                        <div class="col-md-6">
                                            <div class="mb-1">
                                                <label class="form-label" for="first-name-icon">Qualifications<span style="color:red;">*</span></label>
                                                <div class="input-group input-group-merge">
                                                    <span class="input-group-text"><i data-feather="user"></i></span>
                                                    <input type="text" id="first-name-icon" class="form-control" name="fname-icon" placeholder="Qualification" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6"></div>
                                        <!-- <div class="col-md-6 mt-2">
                                            <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#myModal">Add New Driver</button>
                                        </div> -->
									<!-- New Row  -->
                                        <div class="col-md-6">
                                            <div class="mb-1">
                                            <label class="form-label" for="first-name-icon">Gender<span style="color:red;">*</span></label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" >
                                                    <label class="form-check-label" for="inlineRadio1">Male</label>
                                                 </div>    
                                                 <div class="form-check form-check-inline">               
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option2" >
                                                    <label class="form-check-label" for="inlineRadio1">Female</label>
                                                  </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                        <label class="form-label" for="first-name-icon">Languages Known<span style="color:red;">*</span></label>
                                                <div class="form-check form-check-inline mt-2">
                                                <label class="form-check-label" for="inlineCheckbox1">English</label>
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="English">
                                                 </div>
                                                     <div class="form-check form-check-inline mt-2">
                                                <label class="form-check-label" for="inlineCheckbox1">Hindi</label>
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="Hindi">
                                                 </div>
                                                     <div class="form-check form-check-inline mt-2">
                                                <label class="form-check-label" for="inlineCheckbox1">Marathi</label>
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="Marathi">
                                                 </div>
                                        </div>
									<!-- New Row -->
                                        <div class="col-md-6">
                                            <div class="mb-1">
                                                <label class="form-label" for="exampleFormControlTextarea1">Address</label>
                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="House No , Lane , Locality , City"></textarea>
                                              </div>
                                        </div>
                                        <div class="col-md-6"></div>
                                      
                                      <!-- New Row --> 
                                       <div class="col-md-6">
                                            <div class="mb-1">
                                                <label class="form-label" for="basicSelect">State of Residence</label>
                                                <div class="input-group input-group-merge">
                                                    <!-- <span class="input-group-text"><i data-feather="hash"></i></span> -->
                                                    <select class="form-select" id="basicSelect">
                                                        <option value="Gujarat">Gujarat</option>
                                                        <option value="Maharashtra">Maharashtra</option>
                                                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                                                        <option value="Karnataka">Karnataka</option>
                                                        <option value="Tamil Nadu">Tamil Nadu</option>
                                                        <option value="Kerala">Kerala</option>
                                                      </select>                                                   
                                                     </div>
                                                
                                              </div>
                                              </div>
                                        <div class="col-md-6">
                                            <div class="mb-1">
                                                <label for="formFile" class="form-label">Attach Image File</label>
                                                <input class="form-control" type="file" id="formFile">
                                            </div>
                                        </div>
                                        
                                       <!-- New Row --> 
                                       <div class="col-md-6">
                                            <label class="form-label" for="first-name-icon">Email<span style="color:red;">*</span></label>

                                            <div class="input-group input-group-merge">
                                                <span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg></span>
                                                <input type="email" id="email-icon" class="form-control" name="email" id="email" placeholder="Email" onblur="ValidateEmail()">
                                              </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="mb-1">
                                                <label class="form-label" for="email-id-icon">Password</label>
                                                <div class="input-group input-group-merge form-password-toggle mb-2">
                                                    <input type="password" class="form-control" id="basic-default-password1" placeholder="Your Password" aria-describedby="basic-default-password1">
                                                    <span class="input-group-text cursor-pointer"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye font-small-4"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg></span>
                                                  </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <button type="Submit" class="btn btn-primary me-1" onclick="return validateAll();">Submit</button>
                                           
                                        </div>
                                        
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Basic Vertical form layout section end -->

        </div>
    </div>
</div>
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