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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
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
@charset "ISO-8859-1";

*,
*:before,
*:after {
  box-sizing: border-box;
}
body {
  padding: 1em;
  font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 15px;
  color: #b9b9b9;
  background-color: #e3e3e3;
}
h4 {
  color: #f0a500;
}
input,
input[type="radio"] + label,
input[type="checkbox"] + label:before,
select option,
select {
  width: 100%;
  padding: 1em;
  line-height: 1.4;
  background-color: #f9f9f9;
  border: 1px solid #e5e5e5;
  border-radius: 3px;
  -webkit-transition: 0.35s ease-in-out;
  -moz-transition: 0.35s ease-in-out;
  -o-transition: 0.35s ease-in-out;
  transition: 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
}
input:focus {
  outline: 0;
  border-color: #bd8200;
}
input:focus + .input-icon i {
  color: #f0a500;
}
input:focus + .input-icon:after {
  border-right-color: #f0a500;
}
input[type="radio"] {
  display: none;
}
input[type="radio"] + label,
select {
  display: inline-block;
  width: 50%;
  text-align: center;
  float: left;
  border-radius: 0;
}
input[type="radio"] + label:first-of-type {
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px;
}
input[type="radio"] + label:last-of-type {
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
}
input[type="radio"] + label i {
  padding-right: 0.4em;
}
input[type="radio"]:checked + label,
input:checked + label:before,
select:focus,
select:active {
  background-color: #f0a500;
  color: #fff;
  border-color: #bd8200;
}
input[type="checkbox"] {
  display: none;
}
input[type="checkbox"] + label {
  position: relative;
  display: block;
  padding-left: 1.6em;
}
input[type="checkbox"] + label:before {
  position: absolute;
  top: 0.2em;
  left: 0;
  display: block;
  width: 1em;
  height: 1em;
  padding: 0;
  content: "";
}
input[type="checkbox"] + label:after {
  position: absolute;
  top: 0.45em;
  left: 0.2em;
  font-size: 0.8em;
  color: #fff;
  opacity: 0;
  /* font-family: FontAwesome; */
  content: "\f00c";
}
input:checked + label:after {
  opacity: 1;
}
select {
  height: 3.4em;
  line-height: 2;
}
select:first-of-type {
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px;
}
select:last-of-type {
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
}
select:focus,
select:active {
  outline: 0;
}
select option {
  background-color: #f0a500;
  color: #fff;
}
/* .input-group {
  margin-bottom: 1em;
  zoom: 1;
} */
/* .input-group:before,
.input-group:after {
  content: "";
  display: table;
}
.input-group:after {
  clear: both;
}
.input-group-icon {
  position: relative;
}
.input-group-icon input {
  padding-left: 4.4em;
}
.input-group-icon .input-icon {
  position: absolute;
  top: 0;
  left: 0;
  width: 3.4em;
  height: 3.4em;
  line-height: 3.4em;
  text-align: center;
  pointer-events: none;
}
.input-group-icon .input-icon:after {
  position: absolute;
  top: 0.6em;
  bottom: 0.6em;
  left: 3.4em;
  display: block;
  border-right: 1px solid #e5e5e5;
  content: "";
  -webkit-transition: 0.35s ease-in-out;
  -moz-transition: 0.35s ease-in-out;
  -o-transition: 0.35s ease-in-out;
  transition: 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
}
.input-group-icon .input-icon i {
  -webkit-transition: 0.35s ease-in-out;
  -moz-transition: 0.35s ease-in-out;
  -o-transition: 0.35s ease-in-out;
  transition: 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
} */
.tcolor{color:black;}
.sectionNew {
  max-width:100em;
  padding: 3em 3em 3em 3em;
  margin: 0em auto;
  background-color: #fff;
  border-radius: 4.2px;
  box-shadow: 0px 3px 10px -2px rgba(0, 0, 0, 0.2);
}
 
 </style>
 <script type="text/javascript">
 $(function() {
	  $('[data-toggle="tooltip"]').tooltip()
	})
 
 </script>

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
					<div class="col-6">
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
           
            <section class="sectionNew" id="basic--layouts" >
                <div class="row">
                    <div class="col-md-12 col-12">
                        <div class="card">
                            <div class="card-body card"> <!-- Start card body -->
                                <form name="entryform" class="form form-vertical" method="POST">
                                <!-- ************************************************************************************ -->
					               
						
								    <div class="row">
								      <h4>Vehicle Details</h4>
								     </div> 
								     
								     <div class="row col-12">
								      <div class="col-4"> <!-- COlumn st -->
								      <label class="tcolor">Vehicle Registration No</label>
								       <div class="col-half">
								        <div class="form-floating">
								        <select class="form-select" aria-label="Default select example">
											  <option selected>menu</option>
											  <option value="1">One</option>
											  <option value="2">Two</option>
											  <option value="3">Three</option>
										</select>
								        
								       </div>
								        </div>
								      </div> <!-- COlumn end -->
								       <div class="col-4"> <!-- COlumn st -->
								      <label class="tcolor">Vehicle type</label>
								       <div class="col-half">
								        <div class="form-floating">
								        <select class="form-select" aria-label="Default select example">
											  <option selected>menu</option>
											  <option value="1">One</option>
											  <option value="2">Two</option>
											  <option value="3">Three</option>
										</select>
								       </div>
								        </div>
								      </div> <!-- COlumn end -->
								      <div class="col-4"> <!-- COlumn st -->
								      <label class="tcolor">Usage</label>
								       <div class="col-half">
								        <div class="form-floating">
								        <select class="form-select" aria-label="Default select example">
											  <option selected>menu</option>
											  <option value="1">One</option>
											  <option value="2">Two</option>
											  <option value="3">Three</option>
										</select>
								       </div>
								        </div>
								      </div> <!-- COlumn end -->
								      </div>
								      
								      <div class="row col-12">
								        <label class="tcolor">Registered Owner</label>
								         <div class="col-md-1">
										    <div class="form-floating">
										      <select class="form-select" id="floatingSelectGrid" aria-label="Floating label select example">
										        <option selected>Mr.</option>
											  <option value="1">Mrs.</option>
											  <option value="2">Ms.</option>
											  <option value="3">Doc.</option>
											  <option value="3">M/s.</option>
										      </select>
										    </div>
										  </div>
										   <div class="col-md-6">
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt register owner name" value=" ">
										    </div>
										  </div>
								      </div>
								      
								       <div class="row col-12">
								          <div class="col-6">
								             <label class="tcolor">Owner Sr.No</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
										  </div>
										  <div class="col-6">
										      <label class="tcolor">Company/Group</label>
										  
										  <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										   </div>
										  </div> 
								       </div>
								      
								        <div class="row col-12">
								          <div class="col-4">
								          <label class="tcolor">Address 1</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								          <div class="col-4">
								          <label class="tcolor">Address 2</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								          <div class="col-4">
								          <label class="tcolor">Address 3</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      </div>   
								      
								       <div class="row col-12">
								          <div class="col-2">
								             <label class="tcolor">Vehicle Category</label>
								              <div class="col-half">
								              <div class="form-floating">
									          <select class="form-select" aria-label="Default select example">
												  <option selected>New</option>
												  <option value="1">Old</option>
											  </select>
								             </div>
								            </div>
								          </div>
								          
								          <div class="col-4">
									          <label class="tcolor">Lease Contract Start Date</label>
												<div class="input-group input-group-merge" >
													<input type="text" id="data1" name="data1"  class="form-control" value=" "/> 
												<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
												</div>
															<script>
																$(document).ready(function() {
																$( function() {
															$( "#data1" ).datepicker({
																dateFormat: 'dd-M-yy',
																changeMonth: true,
																     changeYear: true
																 /* minDate: 0,
																			maxDate:7  */
																});
																} );
																			
																});
										
													   </script>
		                                 </div>
			                             
								          <div class="col-md-4">
				                           <label class="tcolor">Lease Contract End Date</label>
				                            <div class="input-group input-group-merge" >
 					                         <input type="text" name="data" id="data"  class="form-control" value=" "> 
					                         <span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
			                              	</div>
				                            <script>					  	                     
				                            $(document).ready(function() {
															$( function() {
								   				 $( "#data" ).datepicker({
										    dateFormat: 'dd-M-yy',
											changeMonth: true,
								            changeYear: true
								         	});
								           } );
												
								           });

				                         </script>
		                          	    </div>
								      </div>
								      
								     <div class="row col-12">
								          <div class="col-4">
								            <label class="tcolor">State</label>
								              <div class="col-half">
										        <div class="form-floating">
										        <select class="form-select" aria-label="Default select example">
													  <option selected>Maharastra</option>
													  <option value="1">Gujarat</option>
													  <option value="2">Keral</option>
													  <option value="3">Aasam</option>
												</select>
										       </div>
								            </div>
								          </div>
								           <div class="col-4">
								            <label class="tcolor">City</label>
								              <div class="col-half">
										        <div class="form-floating">
										        <select class="form-select" aria-label="Default select example">
													  <option selected>Pune</option>
													  <option value="1">-----</option>
													  <option value="2">----</option>
													  <option value="3">-----</option>
												</select>
										       </div>
								            </div>
								          </div>
								          <div class="col-4">
								          <label class="tcolor">Pincode</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      </div>
								      <br>
								      <!-- **** New section ********** -->
								    <div class="row">
								      <div class="col-half">
								        <h4>Manufacturing Details</h4>
								       </div>
								    </div>
								       
								    <div class="row col-12">
								        <div class="col-3">
								              <label class="tcolor">Manufacturer Name/Make</label>
								              <div class="col-half">
										        <div class="form-floating">
										        <select class="form-select" aria-label="Default select example">
													  <option selected>Ashok LayLand</option>
													  <option value="1">-----</option>
													  <option value="2">----</option>
													  <option value="3">-----</option>
												</select>
											  </div>											  
											  </div>
											</div>  
								            <div class="col-3">
								               <label class="tcolor">Add here</label>
								              <button type="button" class="btn btn-warning">Add Manufacture Name</button>
<!-- 								                <button type="button" class="btn"><a href="#">Add Manufacture Name</a></button>
 --><!-- 												<button style="background-color:#f0a500"><a href="#">Add Manufacture Name</a></button>
 -->								    	 </div>
								     

								           <div class="col-3">
								          <label class="tcolor">Model</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								          
								          <div class="col-md-3">
				                           <label class="tcolor">Date Of Manufacture</label>
											<div class="input-group input-group-merge" >
												<input type="text" id="data11" name="data11"  class="form-control" value=""/> 
											<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
											</div>
												<script>
																$(document).ready(function() {
																	$( function() {
															$( "#data11" ).datepicker({
													dateFormat: 'dd-M-yy',
													changeMonth: true,
											            changeYear: true
														 /* minDate: 0,
														maxDate:7  */
											             });
											          } );
											         });
	
				                              </script>
		                                 </div>
								    </div> 
								    <br>
								     <div class="row col-12">
								       <div class="col-3">
								              <label class="tcolor">RTO Name</label>
								              <div class="col-half">
										        <div class="form-floating">
										        <select class="form-select" aria-label="Default select example">
													  <option selected>ACBGH</option>
													  <option value="1">-----</option>
													  <option value="2">----</option>
													  <option value="3">-----</option>
												</select>
												<a style="color: #f0a500">ADD Name</a>
											  </div>											  
											  </div>
											</div>  
											<div class="col-3">
								              <label class="tcolor">RTO state</label>
								              <div class="col-half">
										        <div class="form-floating">
										        <select class="form-select" aria-label="Default select example">
													  <option selected>Pune</option>
													  <option value="1">-----</option>
													  <option value="2">----</option>
													  <option value="3">-----</option>
												</select>
													<a style="color: #f0a500">ADD State</a>
											  </div>											  
											  </div>
											</div>  
								     </div>
								      <!-- **** New section ********** -->
								     <br>
								     <div class="row">
								      <div class="col-half">
								        <h4>Engine Details</h4>
								       </div>
								    </div>
								      <div class="row col-12">
								        <div class="col-md-3">
								         <label class="tcolor">Engine No</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      
								        <div class="col-md-3">
								          <label class="tcolor">Chassis No </label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      
								        <div class="col-md-3">
								          <label class="tcolor">Gear Box No</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								    
								        <div class="col-md-3">
								          <label class="tcolor">VIN No</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      </div>
								      
								     								    
								      <div class="row col-12">
								        <div class="col-md-3">
								         <label class="tcolor">Unladen WT (KG)</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      
								        <div class="col-md-3">
								          <label class="tcolor">RLW (KG) </label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      
								        <div class="col-md-3">
								          <label class="tcolor">GVS</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								    
								        <div class="col-md-3">
								              <label class="tcolor">Class</label>
								              <div class="col-half">
										        <div class="form-floating">
										        <select class="form-select" aria-label="Default select example">
													  <option selected>BRIGS</option>
													  <option value="1">-----</option>
													  <option value="2">----</option>
													  <option value="3">-----</option>
												</select>
											  </div>											  
											  </div>
								      </div>
								      
								         <div class="row col-12">
								           <div class="col-md-3">
								              <label class="tcolor">Type Of Body</label>
								              <div class="col-half">
										        <div class="form-floating">
										        <select class="form-select" aria-label="Default select example">
													  <option selected>Chemical tanker</option>
													  <option value="1">-----</option>
													  <option value="2">----</option>
													  <option value="3">-----</option>
												</select>
											  </div>											  
											  </div>
								      </div>
								        <div class="col-md-3">
								         <label class="tcolor">Length(meters)</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      
								        <div class="col-md-3">
								          <label class="tcolor">Breadth(meters)</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      
								        <div class="col-md-3">
								          <label class="tcolor">Width(meters)</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      </div>
								      
								       <div class="row col-12">
								        <div class="col-md-3">
								         <label class="tcolor">Seating Capacity</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      
								        <div class="col-md-3">
								          <label class="tcolor">Standing Capacity</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								      
								        <div class="col-md-3">
								          <label class="tcolor">No of Tyres</label>
										    <div class="form-floating">
										      <input type="text" class="form-control" id="floatingInputGrid" placeholder="Enrt Owner Serial number" value=" ">
										    </div>
								          </div>
								    
								        <div class="col-md-3">
								              <label class="tcolor">No of Cylinder</label>
								              <div class="col-half">
										        <div class="form-floating">
										        <select class="form-select" aria-label="Default select example">
													  <option selected>1</option>
													  <option value="1">2</option>
													  <option value="2">3</option>
													  <option value="3">4</option>
												</select>
											  </div>											  
											  </div>
											</div>  
								        </div>
								      
								      <div class="row col-12">
								           <div class="col-md-3">
								              <label class="tcolor">Color</label>
								              <div class="col-half">
										        <div class="form-floating">
										        <select class="form-select" aria-label="Default select example">
													  <option selected>Red</option>
													  <option value="1">Blue</option>
													  <option value="2">Black</option>
													  <option value="3">Yellow</option>
												</select>
											  </div>											  
											  </div>
											</div>  
								          <div class="col-md-3">
								              <label class="tcolor">Fuel</label>
								              <div class="col-half">
										        <div class="form-floating">
										        <select class="form-select" aria-label="Default select example">
													  <option selected>Petrol</option>
													  <option value="1">Diesel</option>
													  <option value="2">CNg</option>
													
												</select>
											  </div>											  
											  </div>
											</div>  
								        
								      </div>
								      <div class="row col-12">
								          <div class="col-4">
								            <label class="tcolor">RC-Validity Date</label>
											<div class="input-group input-group-merge" >
												<input type="text" id="data4" name="data4"  class="form-control" value=""/> 
											<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
											</div>
												<script>
																$(document).ready(function() {
																	$( function() {
															$( "#data4" ).datepicker({
													dateFormat: 'dd-M-yy',
													changeMonth: true,
											            changeYear: true
														 /* minDate: 0,
														maxDate:7  */
											             });
											          } );
											         });
	
				                              </script>
								          </div>
								          <div class="col-4">
								           <label class="tcolor">Insurance validity Date</label>
											<div class="input-group input-group-merge" >
												<input type="text" id="data5" name="data5"  class="form-control" value=""/> 
											<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
											</div>
												<script>
																$(document).ready(function() {
																	$( function() {
															$( "#data5" ).datepicker({
													dateFormat: 'dd-M-yy',
													changeMonth: true,
											            changeYear: true
														 /* minDate: 0,
														maxDate:7  */
											             });
											          } );
											         });
	
				                              </script>
								          </div>
								          <div class="col-4">
								           <label class="tcolor">PUC validity Date</label>
											<div class="input-group input-group-merge" >
												<input type="text" id="data6" name="data6"  class="form-control" value=""/> 
											<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
											</div>
												<script>
																$(document).ready(function() {
																	$( function() {
															$( "#data6" ).datepicker({
													dateFormat: 'dd-M-yy',
													changeMonth: true,
											            changeYear: true
														 /* minDate: 0,
														maxDate:7  */
											             });
											          } );
											         });
	
				                              </script>
								          </div>
								      </div>
								      <br>
								      <div class="row">
								        <div class="col-half">
								       <h4>Upload Documents</h4>
								       </div>
								      </div>
								         <div class="row col-12">
								           <div class="col-md-6">
								             <div class="col-xs-4">
								                    <div class="row justify-content-center">
							                            <div class="col-md-12 col-lg-30 col-12">
							                                <div class="form-group files">
							                                <label class="my-auto tcolor">Upload RC Book</label>
							                                <input name="addfile" type="file" id="addfile"  class="form-control" multiple></div>
							                            </div>
							                        </div>   
							                    </div>   
							                   </div> 
							                    <div class="col-md-6">
							                     <div class="col-xs-4">
								                    <div class="row justify-content-center">
							                            <div class="col-md-12 col-lg-30 col-12">
							                                <div class="form-group files">
							                                <label class="my-auto tcolor">Upload Image </label>
							                                <input name="addfile" type="file" id="addfile"  class="form-control" multiple></div>
							                            </div>
							                        </div>   
							                    </div>   
							                    </div>          
								         </div>
											<br>
											<br>	
											<br>
											<br>
										 <div class="row col-12">
										   <div class="col-4"></div>
											<div class="d-grid col-3">
											   <button type="button" class="btn btn-warning btn-lg">Submit</button>
											</div>
											 <div class="col-4"></div>
											<div class="col-4"></div>	
										</div>									
															        
   
								 <!--  ***************************** *************************************************** --> 
                                </form>
                            </div>  <!--  end of card body -->
                        </div>
                    </div>
                </div>
            </section>
            <!-- Basic Vertical form layout section end -->

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