<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--  <%@ include file="headernew1.jsp"%>
 --%>
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
<link rel="" href="css/table/responsive.bootstrap.min.css">
	
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
								
								<div class="modal-footer">
							<button type="button" class="btn btn-primary btn2">Register</button>

							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">Close</button>
						</div>
							</div>
						</div>
						<!-- Modal body -->
						<!-- Modal footer -->
						

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
