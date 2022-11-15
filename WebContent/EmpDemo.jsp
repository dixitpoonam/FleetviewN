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
<style type="text/css">
.sectionCSs{
	max-width: 37em;
	padding: 1em 3em 3em 3em;
	margin: 0em auto;
	background-color:;
	border-radius: 2.2px;
	box-shadow: 0px 3px 10px -2px rgba(0, 0, 0, 0.2);
	background-color:#FAFBFC;
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
                                     <section class="section sectionCSs">
										<div class="row col-12">
											<div class="col-10">
												<div class="md-2">
													<label style="color:orange;" class="tcolor">Current EMP Name And Code :</label><br>
													
												</div>
											</div>
											</div>
										<div class="row mb-1">
										 <div class="col-3">
										    <label class="tcolor">User Name:</label> 
										 </div>
										 
										 <div class="col-4">
										  <input class="form-control" type="text" name="newuser" id="newuser" ></input> 
										 </div>
										</div>	
										<div class="row mb-1">
											<div class="col-3">
											  <label class="tcolor">User Name:</label>
												
											</div>
											<div class="col-4">
											  <input class="form-control" type="text" placeholder=" Enter User Name:-" name="">
											  
											</div>
											<div class="col-4">
											 <a href = "#" ><u>Change User</u> </a>
											</div>
											
										</div>
										<hr>
										<div class="row mb-1">
											<div class="col-3">
											  <label class="tcolor">Manager Name :</label>
												
											</div>
											<div class="col-4 ">
											  <input class="form-control" type="text" placeholder=" Enter Manager Name:-" name="">
											  
											</div>
											<div class="col-4">
											 <a href = "#" ><u>Change Manager</u> </a>
											</div>
										</div>
										<hr>
										<div class="row mb-1">
											<div class="col-3">
											  <label class="tcolor">RSM Name :</label>
												
											</div>
											<div class="col-4">
											  <input class="form-control" type="text" placeholder=" Enter RSM Name:-" name="">
											  
											</div>
											<div class="col-4">
											 <a href = "#" ><u>Change RSM </u></a>
											</div>
										</div>
										<hr>
										<div class="mt-1">
								     <label class="tcolor" style=color:orange;>Create New User Id</label>
									 <input class="form-check-input" type="checkbox" name="extAll" id="extAll" value="yes" onclick="selectCheck();" />(Select check BOX Here)
									</div>
									
									<div class="row mt-1" id="name" style="display:none;">
									<label class="tcolor">New EMP Name</label>
									<input class="form-control" type="text" id="name" name="name">
									</div>
									
									<div class="row mt-1" id="empCode" style="display:none;">
									<label class="tcolor">New EMP Code</label>
									<input class="form-control" type="text" id="empCode" name="empCode">
									
									</div>
									<div class="row mt-1" id="fid" style="display:none;">
									<label class="tcolor">New Fleetview ID </label>
									<input class="form-control" type="text" id="fid" name="fid">
									<p style="color:black;">(Please enter FleetView Id as username)</p>
									</div>
									
									<div class="row mt-1" id="hod" style="display:none;">
									<label class="tcolor">HOD</label>
									<input class="form-control" type="text" id="hod" name="hod">
									</div>
									
									<div class="row mt-1" id="email" style="display:none;">
									<label class="tcolor">Email</label>
									<input class="form-control" type="text" id="email" name="email">
									</div>
									
									<div class="row mt-1" id="mno" style="display:none;">
									<label class="tcolor">Mobile No</label>
									<input class="form-control" type="text" id="mno" name="">
									</div>
									
									<div class="row mt-1" id="desg" style="display:none;">
									<label class="tcolor">Designation</label>
									<input class="form-control" type="text" id="desg" name="">
									</div>
									
									<div class="row mt-1" id="loc" style="display:none;">
									<label class="tcolor">Location</label>
									<input class="form-control" type="text" id="loc" name="">
									</div>
									
										</section>
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
