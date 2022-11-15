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
.sectionNew {
	max-width: 100em;
	padding: 3em 3em 3em 3em;
	margin: 0em auto;
	background-color: #fff;
	border-radius: 4.2px;
	box-shadow: 0px 3px 10px -2px rgba(0, 0, 0, 0.2);
}

.tcolor {
	color: #060637;
	font-weight: bold;
	font-size: 12px;
	font-family: Verdana, arial, sans-serif;
}

h4 {
	color: #f0a500;
}

dropdow
.btn2 {
	background-color: #151564;
}

.input-container {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	width: 100%;
	margin-bottom: 15px;
	
}
.cardcol{ 
    background-color:#D5DFF4;
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
							<h3 class="content-header-title  mb-0" style="color: #060637">Entry
								Form Template</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="content-body">
				<!--  start content body -->
				<!-- Basic Vertical form layout section start -->

				<section class="sectionNew" id="basic--layouts">
					<div class="row">
						<div class="col-md-12">
							<div class="card">

								<div class="card-body card">
									<!-- Start card body -->
									<form name="entryform" class="form form-vertical" method="POST">

										<div class="row align-items-start">
											<!-- Item alignment start  -->
											<div class="col-6">
												<div class="mb-3">
													<label class="tcolor">First Name</label> <input type="text"
														class="form-control" id="exampleFormControlInput1"
														placeholder="Enter your first name">
												</div>
											</div>
											<div class="col-6">
												<div class="mb-3">
													<label class="tcolor">Last Name</label> <input type="text"
														class="form-control" id="exampleFInput1"
														placeholder="Enter your last name">
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<div class="mb-3">
													<label class="tcolor">Email ID</label> <input type="email"
														class="form-control" id="examut1"
														placeholder="Enter your Mail ID">
												</div>
											</div>
											<div class="col-6">
												<div class="mb-3">
													<label class="tcolor">Password</label> <input
														type="password" class="form-control" id="e"
														placeholder="Enter Password">
												</div>
											</div>
										</div>
										<div class="row align-items-start">
											<!-- Item alignment center  -->
											<div class="col-3">
												<label for="Old Password:-" class="tcolor"><b>Education</b></label><br>
												<div class="input-container">
													<select class="form-select"
														aria-label="Default select example">
														<option selected>BE</option>
														<option value="1">Diploma</option>
														<option value="2">HSC</option>
														<option value="3">SSC</option>
													</select>
												</div>
											</div>
											<div class="col-6">
												<label for="" class="tcolor"><b>Comments</b></label><br>
												<div class="input-container">
													<textarea class="form-control"
														placeholder="Leave a comment here" id="floatingTextarea"></textarea>
												</div>
											</div>


										</div>
										<div class="row align-items-start">
											<div class="col-md-3">
												<label for="  New Password:-" class="tcolor">Education</label><br>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value=""
														id="flexCheckDefault"> <label
														class="form-check-label" for="flexCheckDefault">BE</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value=""
														id="flexCheckChecked" checked> <label
														class="form-check-label" for="flexCheckChecked">Diploma</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value=""
														id="flexCheckChecked" checked> <label
														class="form-check-label" for="flexCheckChecked">HSC</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value=""
														id="flexCheckChecked" checked> <label
														class="form-check-label" for="flexCheckChecked">SSC</label>
												</div>
											</div>
											<div class="col-md-3">
												<label for="  New Password:-" class="tcolor">Gender</label><br>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="flexRadioDefault" id="flexRadioDefault1"> <label
														class="form-check-label" for="flexRadioDefault1">Male</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="flexRadioDefault" id="flexRadioDefault2" checked>
													<label class="form-check-label" for="flexRadioDefault2">Female</label>
												</div>
											</div>
											<div class="col-3">
												<label class="tcolor">City</label>
												<div class="btn-group">
													<button type="button"
														class="btn btn-primary dropdown-toggle"
														data-bs-toggle="dropdown" aria-expanded="false">
														City</button>
													<ul class="dropdown-menu dropdown-menu-end">
														<li><button class="dropdown-item" type="button">Pune</button></li>
														<li><button class="dropdown-item" type="button">Mumbai
															</button></li>
														<li><button class="dropdown-item" type="button">Delhi</button></li>
													</ul>
												</div>
											</div>

											<div class="col-3">
												<label class="tcolor">Date</label>
												<div class="input-group input-group-merge">
													<input type="text" name="data" id="data"
														class="form-control" value="  "> <span
														class="input-group-text"><svg
															xmlns="http://www.w3.org/2000/svg" width="14" height="14"
															viewBox="0 0 24 24" fill="none" stroke="currentColor"
															stroke-width="2" stroke-linecap="round"
															stroke-linejoin="round" class="feather feather-calendar">
															<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
															<line x1="16" y1="2" x2="16" y2="6"></line>
															<line x1="8" y1="2" x2="8" y2="6"></line>
															<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
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
										<div class="row">
										  <div class="m-2">
											<div class="accordion" id="accordionPanelsStayOpenExample">
												<div class="accordion-item">
													<h2 class="accordion-header" id="panelsStayOpen-headingOne">
														<button class="accordion-button tcolor btn btn-primary" type="button"
															data-bs-toggle="collapse"
															data-bs-target="#panelsStayOpen-collapseOne"
															aria-expanded="true"
															aria-controls="panelsStayOpen-collapseOne">
															Transworld Technologies ltd</button>
													</h2>
													<div id="panelsStayOpen-collapseOne"
														class="accordion-collapse collapse show"
														aria-labelledby="panelsStayOpen-headingOne">
														<div class="accordion-body">
														     We are using
															Transworld's Fuel Flow Measuring System. The system meets
															our requirements and we find it extremely satisfactory.
															We have found the system to be accurate the range of +-
															50 ml. Transworld's technology is advanced and their
															domain expertise is extensive. We have no hesitation in
															recommending this solution to users who value cutting
															edge technology that delivers efficiency and safety at a
															good value for money.
														</div>
													</div>
												</div>
											</div>
											</div>
                                             <br>
                                             <br>
                                             
											<div class="row">
											  <div class="col-4">
											     <div class="m-2">
												<div class="card cardcol">
													<div class="card-header">Transworld</div>
													<div class="card-body">
														<h5 class="card-title">Transworld technology</h5>
														<p class="card-text">Transworld's technology is advanced and their
															domain expertise is extensive.</p>
														<a href="#" class="btn btn-primary">Go To Next</a>
													</div>
												</div>
											  </div>
											   </div>	
											   <div class="col-4">
											     <div class="m-2">
												<div class="card cardcol">
													<div class="card-header">Transworld</div>
													<div class="card-body">
														<h5 class="card-title">Transworld technology</h5>
														<p class="card-text">Transworld's technology is advanced and their
															domain expertise is extensive.</p>
														<a href="#" class="btn btn-primary">Go To Next</a>
													</div>
												</div>
											  </div>
											   </div>	
											   <div class="col-4">
											     <div class="m-2">
												<div class="card cardcol">
													<div class="card-header">Transworld</div>
													<div class="card-body">
														<h5 class="card-title">Transworld technology</h5>
														<p class="card-text">Transworld's technology is advanced and their
															domain expertise is extensive.</p>
														<a href="#" class="btn btn-primary">Go To Next</a>
													</div>
												</div>
											  </div>
											   </div>	
											</div>
											<div class="row">
											 <div class="accordion accordion-flush" id="accordionFlushExample">
											  <div class="accordion-item">
											    <h2 class="accordion-header" id="flush-headingOne">
											      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
											        Accordion Item #1
											      </button>
											    </h2>
											    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
 											      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
 											    </div>
											  </div>
											  
											  
											</div>
											</div>



											<div class="d-grid gap-2 col-6 mx-auto">
												<button class="btn btn-primary btn2" type="submit">Register</button>
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
