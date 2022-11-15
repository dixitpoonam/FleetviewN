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
							<h3 class="content-header-title  mb-0" style="color: #060637">
								Complaint
								Registration Form</h3>
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
								<h6>
									(<span style="color: red;">*</span> indicates mandatory fields)
								</h6>
								<div class="card-body card">
									<div class="row">
										<div class="col-12">
											<label class="tcolor pt-0"> Total Complaint </label> <a
												href="#">0</a> <label class="tcolor m-2"> Pending</label> <a
												href="#">0</a> <label class="tcolor m-2">Closed</label> <a
												href="#">0</a>
										</div>
									</div>
									<!-- Start card body -->
									<form name="entryform" class="form form-vertical" method="POST">
										<div class="row mb-1">
											<div class="col-6">
												<label class="tcolor"><b>User Name:</b></label><br> <input
													class="form-control" type="text"
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
											<div class="col-4">
												<label>Date:</label>
												<div class="input-group input-group-merge">
													<input type="text" id="data1" name="data1"
														class="form-control" value="" /> <span
														class="input-group-text"><svg
															xmlns="http://www.w3.org/2000/svg" width="14" height="14"
															viewBox="0 0 24 24" fill="none" stroke="currentColor"
															stroke-width="2" stroke-linecap="round"
															stroke-linejoin="round" class="feather feather-calendar">
																			<rect x="3" y="4" width="18" height="18" rx="2"
																ry="2"></rect>
																			<line x1="16" y1="2" x2="16" y2="6"></line>
																			<line x1="8" y1="2" x2="8" y2="6"></line>
																			<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
												</div>
												<script>
																	$(document)
																			.ready(function() {
																						$(function() {
																							$("#data1")
																									.datepicker(
																											{
																												dateFormat : 'dd-M-yy',
																												changeMonth : true,
																												changeYear : true
																											/* minDate: 0,
																											maxDate:7 */
																											});
																						});

																					});
																</script>
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
													name=""> (Please enter comma separated email Id's)
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
														or a file which you would like to link with this complaint
														entry.)
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
																<label class="tcolor">Upload Your File </label> <input
																	name="addfile" type="file" id="addfile"
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
