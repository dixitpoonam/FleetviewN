<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp" %>

<html>
  <head>  
    <title>Entry Form Template</title>  
    
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
 <style type="text/css">
     .tcolor{
        color:#000080;
        font-weight:bold;
        font-size: 100%;
        font-family:Verdana,arial, sans-serif;
      } 
      
      /* Full-width input fields */
input[type=text], input[type=password] {
 /*  width: 100%; */
  padding: 15px;
 /*  margin: 5px 0 22px 0; */
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus{
  background-color: #ddd;
  outline: none;
}
.boxcolor{background-color:#f1f1f1;}
.col{
    color:#000080;
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
					<div class="col-6">
						<h3 class="content-header-title  mb-0" style="color:#0D0D75">Entry Form Template</h3>
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
        <div class="content-body p-8"> <!--  start content body -->
           <!-- Basic Vertical form layout section start -->
           
            <section id="basic-vertical-layouts">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h6 class="tcolor">( <span style="color:red;">*</span> indicates mandatory fields)</h6>
                            </div>
                            
                            <div class="card-body"> <!-- Start card body -->
                                <form name="entryform" class="form form-vertical" method="POST">
                                
                                    <div class="row col-12"><!-- row1 start -->
                                        <div class="col-md-5">
                                           <div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon">Vehicle<span style="color:red;">*</span></label>
												<select class="form-select  boxcolor" aria-label="Default select example">
												    <span class="input-group-text"><i data-feather="truck"></span>
													  <option selected>Vehicle 1</option>
													  <option value="1">Vehicle 2</option>
													  <option value="2">Vehicle 3</option>
													  <option value="3">Vehicle 4</option>
												</select>
											</div>
                                        </div>
                                        <div class="col-md-1"></div>
                                        <div class="col-md-5">
										<div class="mb-1">
											<label class="form-label tcolor" for="first-name-icon">Maintenance Type<span style="color:red;">*</span></label>
											 <select class="form-select  boxcolor" aria-label="Default select example">
											   <span class="input-group-text "><i data-feather="truck"></span>
													  <option selected>Value 1</option>
													  <option value="1">Value 2</option>
													  <option value="2">Value 3</option>
													  <option value="3">Value 4</option>
											</select>
										</div>
										</div>
									  </div><!-- row1 end -->
									
									  <div class="row col-12"> <!-- row2 start -->
									   <div class="col-md-5">
											<div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon">Maintenance Details<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text  boxcolor"><i data-feather="user"></i></span>
<!-- 													<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder="Vendor Name" />
 -->												   <input class="form-control  boxcolor" type="text" placeholder="Readonly input here...">
												</div>
											</div>
										</div>
										 <div class="col-md-1"></div>
									    	<div class="col-md-5">    <!-- Date -->
												<label class="tcolor" for="from">Maintenance Date</label>
												<div class="input-group input-group-merge" >
												 <span class="input-group-text boxcolor"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
													<input type="text" name="data" id="data"  class="form-control boxcolor" placeholder="Select Date here" value=""> 
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
                                         </div> <!-- row2 end -->
									     			
                                    <div class="row col-12"> <!-- row3 start -->	
	                                    <div class="col-md-5">
											    <div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon">Maintenance KM<span style="color:red;">*</span></label>
													 <div class="input-group input-group-merge">
														<span class="input-group-text boxcolor"><i data-feather="user"></i></span>
														<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder="Maintenance KM" />
										            </div>
												</div>												
										 </div>
										  <div class="col-md-1"></div> 
							         <div class="col-md-5">
										<label class="tcolor" for="Next Maintenance date">Next Maintenance Date</label>
										<div class="input-group input-group-merge" >
											<span class="input-group-text boxcolor"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
											<input type="text" id="data1" name="data1" class="form-control boxcolor" value="" placeholder="Select Date here"> 
										</div>
										<script>
														$(document).ready(function() {
															$( function() {
													$( "#data1" ).datepicker({
											dateFormat: 'dd-M-yy',
											changeMonth: true,
									            changeYear: true
												/* minDate: 0,
												maxDate:7 */
											});
											} );
														
											});
											
									   </script>
								</div>
									</div> <!-- row3 end --> 
										
								  <div class="row col-12"> <!-- row4 start -->	
								      <div class="col-md-5">
									       <div class="mb-1">
											<label class="form-label tcolor" for="first-name-icon">Next Maintenance After<span style="color:red;">*</span></label>
												 <div class="input-group input-group-merge">
													<span class="input-group-text boxcolor"><i data-feather="user"></i></span>
													<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder="Next Maintenance After" />
									            </div>
											</div>			
									     </div>
										 <div class="col-md-1"></div> 
							         <div class="col-md-5">
											<div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon">Vendor Name<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text boxcolor"><i data-feather="user"></i></span>
													<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder="Vendor Name" />
												</div>
											</div>
										</div>
							      </div>  <!-- row4 end -->
									
									<div class="row col-12"> <!-- row5 start -->	
									  <div class="col-md-5">
											<div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon">Amount<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text boxcolor"><i data-feather="dollar-sign"></i></span>
													<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder="Amount" />
												</div>
											</div>
										</div>
										 <div class="col-md-1"></div> 
							         <div class="col-md-5">
											<div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon">Receipt No<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text boxcolor"><i data-feather="user"></i></span>
													<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder="Reciept No" />
												</div>
											</div>
										</div>
							        </div>  <!-- row5 end -->	
							        
							          <div class="row col-12"> <!-- row6 start -->	
							             <div class="col-md-5">
											<div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon"> Document ID<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text boxcolor"><i data-feather="user"></i></span>
													<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder=" Document ID" />
												</div>
											</div>
										</div>
										 <div class="col-md-1"></div> 
							         <div class="col-md-5">
											<div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon">Tyre Serial No<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text boxcolor"><i data-feather="user"></i></span>
													<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder="Maintenance Engine Hours" />
												</div>
											</div>
										</div>
							         </div>  <!-- row6 end -->	
							         
							          <div class="row col-12"> <!-- row7 start -->	
							           <div class="col-md-5">
											<div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon">Tyre Details<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text boxcolor"><i data-feather="user"></i></span>
													<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder=" Next Engine Hours" />
												</div>
											</div>
										</div>
										 <div class="col-md-1"></div> 
							         <div class="col-md-5">
											<div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon"> Maintenance Engine Hours<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text boxcolor"><i data-feather="user"></i></span>
													<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder="Alert Before Days" />
												</div>
											</div>
										</div>
							        </div>  <!-- row7 end -->	
							        
							          <div class="row col-12"> <!-- row7 start -->	
							           <div class="col-md-5">
											<div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon">Next Engine Hours<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text boxcolor"><i data-feather="user"></i></span>
													<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder=" Next Engine Hours" />
												</div>
											</div>
										</div>
										 <div class="col-md-1"></div> 
							         <div class="col-md-5">
											<div class="mb-1">
												<label class="form-label tcolor" for="first-name-icon">Alert Before Days<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text boxcolor"><i data-feather="user"></i></span>
													<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder="Alert Before Days" />
												</div>
											</div>
										</div>
							        </div>  <!-- row7 end -->	
							        
								 <div class="row col-12"> <!-- row8 start -->   
								   <div class="col-md-5">
										<div class="mb-1">
											<label class="form-label tcolor" for="first-name-icon">Email to Address<span style="color:red;">*</span></label>
											<div class="input-group input-group-merge">
												<span class="input-group-text boxcolor"><i data-feather="user"></i></span>
												<input type="text" id="first-name-icon" class="form-control boxcolor" name="fname-icon" placeholder="Alert Before Days" />
											</div>
										</div>
									</div>
	                               <div class="col-md-1"></div> 
							         <div class="col-md-5">
	                                <div class="col-xs-4">
	                                 <div class="row justify-content-center">
                                       <div class="col-md-12 col-lg-50 col-12">
                                         <div class="form-group files">
                                           <label class="my-auto tcolor">Upload Your File </label>
                                           <input name="addfile" type="file" id="addfile"  class="form-control boxcolor" multiple></div>
                                       </div>
                                     </div>
                                   </div>   
                                  </div>        
								 
							   </div>  <!-- row8 end -->
							   
							   <div class="row col-12">
							       <div class="col-md-5">
									<div class="mb-1">
									 <label class="form-label tcolor" for="first-name-icon">Remark</label>
									 <textarea class="form-control boxcolor" id="remark" name="remark" placeholder="Please write Remark here" rows="2"></textarea>
									</div>
								 </div>	
							   </div>
							   
								<div class="col-12">
									<button type="Submit" class="btn btn-primary me-1 tcolor">Submit</button>
								   
								</div>
							
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