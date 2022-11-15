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
							<h3 class="content-header-title  mb-0" style="color: #060637">Entry
								Form Template</h3>
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
									<form name="entryform" class="form form-vertical" method="POST">

										<div class="row col-12">
											<div class="col-6">
												<div class="md-2">
													<label for=" User Name:-" class="tcolor"><b>User
															Name</b></label><br>
													<div class="input-container">
														<input class="form-control" type="text"
															placeholder="Enter User name" name="usrnm">
													</div>
												</div>
											</div>
											<div class="col-6">
												<div class="md-2">
													<label for=" First Name:-" class="tcolor"><b>
															First Name</b></label><br>
													<div class="input-container">
														<input class="form-control" type="text"
															placeholder=" Enter your First Name:-" name="email">
													</div>
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-4">
												<label for="Last Name" class="tcolor"><b> Last
														Name</b></label><br>
												<div class="input-container">
													<input class="form-control" type="password"
														placeholder="Enter your Last Name" name="psw">
												</div>
											</div>
											<div class="col-4">
												<label for=" Designation:-" class="tcolor"><b>
														Designation</b></label><br>
												<div class="input-container">
													<input class="form-control" type="password"
														placeholder="Enter your  Designation:-" name="psw">
												</div>
											</div>
											<div class="col-4">
												<label for=" Designation:-" class="tcolor"><b>
														Designation</b></label><br>
												<div class="input-container">
													<input class="form-control" type="password"
														placeholder="Enter your  Designation:-" name="psw">
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label for="Old Password:-" class="tcolor"><b>Old
														Password</b></label><br>
												<div class="input-container">
													<input class="form-control" type="password"
														placeholder="Enter your Old Password" name="psw">
												</div>
											</div>
											<div class="col-6">
												<label for="  New Password:-" class="tcolor"><b>
														New Password</b></label><br>
												<div class="input-container">
													<input class="form-control" type="password"
														placeholder="Enter your   New Password" name="psw">
												</div>
											</div>
										</div>

										<div class="d-grid gap-2 col-4 mx-auto mt-2">
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
