<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp"%>

<html>
<head>
<title>Entry Form Template</title>
  <script src="uiform/bootstrap-datetimepicker.js"></script>
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
	
<!-- <link rel="" href="css/table/responsive.bootstrap.min.css">
<script src="uiform/bootstrap-datetimepicker.js"></script>
<link href="uiform/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
 -->
 <script type="text/javascript">

$(document).ready(function(){

$('#datetimepicker1').datetimepicker({
	
	 format: 'DD-MMM-YYYY LT',
	}); 
	

});     
function dateformat(days)
{
	 if(days=='Jan')
		return(1);
	 else
		if(days=='Feb')
			return(2);
		else
			if(days=='Mar')
				return(3);
			else
				if(days=='Apr')
					return(4);
				else
					if(days=='May')
						return(5);
					else
						if(days=='Jun')
							return(6);
						else
							if(days=='Jul')
								return(7);
							else
								if(days=='Aug')
									return(8);
								else
									if(days=='Sep')
										return(9);
									else
										if(days=='Oct')
											return(10);
										else
											if(days=='Nov')
												return(11);
											else
												if(days=='Dec')
													return(12);
 }
function datevalidate()
{



	var date1=document.getElementById("date").value;
	//var date2=document.getElementById("current1").value;

	
	var dm1,dd1,dy1,dm2,dd2,dy2;
	var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;



	
	dd11=date1.substring(0,2);
	//dd22=date2.substring(0,2);
	//alert("Date"+dd11);
	
	mm1=date1.substring(3,6);
	//mm2=date2.substring(3,6);
	//alert("Month"+mm1);
	
 	mm11=dateformat(mm1);
	//mm22=dateformat(mm2);
	//alert("DDD"+mm11);
	

	yy11=date1.substring(7,11);
	//yy22=date2.substring(7,11);
	
	

	var date=new Date();
	var month=date.getMonth()+1;
//alert("Monh"+month);
	var day=date.getDate();
//alert("Day"+day);
	
	var year=date.getFullYear();
//alert("Year"+year);
	if(yy11>year)
	{
		alert("Selected date should not be greater than todays date");
		
		return false;
	}
	else if(year==yy11)
	{
			if(mm11>month)
		{
			alert("Selected date should not be greater than todays date");
			
			return false;
		}
	}
	if(mm11==month)
	{
		if(dd11>day)
		{
			alert("Selected date should not be greater than todays date");
			
			return false;
		}
	}

	return confirmSubmit();	

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
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-6">
							<h3 class="content-header-title  mb-0" style="color: #060637">Complaint
								Registration Form</h3>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">
							<button type="button"
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0 btn2"
								data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
								Register Complaint</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal" id="registerComplaintModal">
				<!-- Start modal -->
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="content-body">
							<!--  start content body -->
							<!-- Basic Vertical form layout section start -->
							<!-- Modal Header -->
							<div class="modal-header tcolor">
								<h4 class="modal-title">Complaint Registration Form</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>
							<!-- Modal body -->
							<div class="modal-body">
								<section class="" id="basic--layouts">
									<div class="row">
										<div class="col-md-12 col-12">
											<div class="card">
												<div class="card-header ms-05">
													<h6>
														( <span style="color: red;">*</span> indicates mandatory
														fields)
													</h6>
												</div>
												<div class="card-body card">
													<div class="row">
														<div class="col-12">
															<label class="tcolor pt-0"> Total Complaint </label> <a
																href="#">0</a> <label class="tcolor m-2">
																Pending</label> <a href="#">0</a> <label class="tcolor m-2">Closed</label>
															<a href="#">0</a>
														</div>
													</div>

													<!-- Start card body -->
													<form name="entryform" class="form form-vertical"
														method="POST">

														<div class="row mb-1">
															<div class="col-6">
																<label class="tcolor"><b>User Name:</b></label><br>
																<input class="form-control" type="text"
																	placeholder="Enter User name">
															</div>
														</div>

														<div class="row mb-1">
															<div class="col-10">
																<label class="tcolor"><font style="color: red;">*</font>Description
																	:</label><br>
																<textarea class="form-control"
																	placeholder="Please write Description here"
																	id="floatingTextarea"></textarea>
															</div>
														</div>


														<div class="row  mb-1">
															<div class="col-6">
																<label class="tcolor"><b> Report Name:</label><br>
																<input class="form-control" type="text"
																	placeholder="Enter Report Name">
															</div>
														</div>
														<div class="row  mb-1">
															<div class="col-4">
																<label class="tcolor"><font style="color: red;">*</font>Category</label><br>
																<select class="form-select"
																	aria-label="Default select example">
																	<option selected>BE</option>
																	<option value="1">Diploma</option>
																	<option value="2">HSC</option>
																	<option value="3">SSC</option>
																</select>
															</div>
															<div class="col-4">
																<label class="tcolor"><font style="color: red;">*</font>SubCategory</label><br>
																<select class="form-select"
																	aria-label="Default select example">
																	<option selected>BE</option>
																	<option value="1">Diploma</option>
																	<option value="2">HSC</option>
																	<option value="3">SSC</option>
																</select>
															</div>
															<div class="col-4">
																<label class="tcolor"><font style="color: red;">*</font>Vehicle
																	No</label><br> <select class="form-select"
																	aria-label="Default select example">
																	<option selected>BE</option>
																	<option value="1">Diploma</option>
																	<option value="2">HSC</option>
																	<option value="3">SSC</option>
																</select>
															</div>
														</div>

														<div class="row  mb-1">
											               	<div class="col-md-6">
																<div class="mb-1">
																	<label class="form-label" for="first-name-icon">Date-Time<span style="color:red;">*</span></label>
																	<div class="input-group input-group-merge">
																		<span class="input-group-text"><i data-feather="calendar"></i></span>
																		<input type="date" id="date" class="form-control abc" name="date" placeholder="Date-Time" />
																	</div>
																	<script>
																$(document).ready(function() {
																$( function() {
															$( "#date" ).datepicker({
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
															<div class="col-4">
																<label class="tcolor"><font style="color: red;">*</font>Priority</label><br>
																<select class="form-select"
																	aria-label="Default select example">
																	<option selected>High</option>
																	<option value="1">Medium</option>
																	<option value="2">Low</option>

																</select>
															</div>

														</div>
														<div class="row  md-1">
															<div class="col-6">
																<label class="tcolor">Add Email recipients:</label><br>
																<input class="form-control" type="text"
																	placeholder="Please enter comma separated email ids"
																	name=""> (Please enter comma separated email
																Id's)
															</div>
															<div class="col-4 mt-2">
																<label class="tcolor">Call Me Back:</label><input
																	class="form-check-input" type="checkbox" />
															</div>
														</div>

														<div class="row mt-2">
															<!-- Start Row -->
															<div class="col-12">
																<a href="#">Attach File</a>
																<div>
																	<p class="tcolor">
																		(You can attach a screen shot of the error page<br>
																		or a file which you would like to link with this
																		complaint entry.)
																	</p>
																</div>

																<div class="col-8">
																	<!-- File comment -->
																	<label class="tcolor">File Comments :</label>
																	<textarea class="form-control"
																		placeholder="Please write Comment here"
																		id="floatingTextarea">
															       </textarea>
																</div>
																<div class="row mt-2">
																	<div class="col-8">
																		<div class="col-md-12 col-lg-30 col-12">
																			<div class="form-group files">
																				<label class="tcolor">Upload Your File </label> 
																				<input name="addfile" type="file" id="addfile"
																					class="form-control" multiple>
																			</div>
																		</div>
																	</div>
																	<div class="col-4 mt-2">
																		<a href="#">Remove</a>
																	</div>
																</div>

															</div>
														</div>
														<!-- End row -->

													</form>
												</div>
											</div>
											<!--  end of card body -->
										</div>
										</div>
								</section>
								<!-- Basic Vertical form layout section end -->
							</div>
						</div>
						<!-- Modal body -->
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-primary btn2">Register</button>

							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">Close</button>
						</div>

					</div>
					<!-- content-body -->

				</div>
				<!-- end modal-content -->

			</div>
			<!-- end modal-dialog -->

		</div>
		<!-- end Start modal -->

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
