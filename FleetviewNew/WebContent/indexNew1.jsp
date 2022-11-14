<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@ include file="headernew1.jsp"%> --%>

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

<!-- ****************************  -->
<!--<script src="searchhi.js" type="text/javascript"></script> -->
<!--<script src="sorttable.js" type="text/javascript"></script> -->
<!--<link href="css/erratic.css" rel="StyleSheet" type="text/css"></link> -->
<!-- <script src="js/elabel.js" type="text/javascript"></script> -->
<style type="text/css">@import url(jscalendar-1.0/calendar-blue.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script src="js/searchhi.js" type="text/javascript"></script>
<!--<link href="css/table/vertical-menu.css" rel="stylesheet"> -->
<link href="css/table/bootstrap-extended.css" rel="stylesheet">
<link href="css/table/bootstrap.css" rel="stylesheet">
<link href="css/table/style.css" rel="stylesheet">
<link href="css/table/components.css" rel="stylesheet">
<link href="css/table/vendors.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">

<!-- ****************************  -->

<style type="text/css">
html,body{
background-image: url('FleetImages/photo3.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
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
							<h3 class="content-header-title  mb-0" style="color: #060637">Sign/Login Page</h3>
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
							<div class="card w-80">

								<div class="card-body card">
									<!-- Start card body -->
									<form name="entryform" class="form form-vertical" method="POST">
										   <div class="d-grid gap-2 col-6 mx-auto">
												<label for=" User Name:-" class="tcolor"><b>User Id</b></label>
												<div class="input-container">
													  <input class="form-control" type="text"
														placeholder="Enter User name" name="">
												</div>
											</div>
											<div class="d-grid gap-2 col-6 mx-auto">
												<label for=" First Name:-" class="tcolor"><b>
														Password</b></label>
												<div class="input-container">
													<input class="form-control" type="password"
														placeholder=" Enter your Password" name="">
												</div>
											</div>

										<div class="d-grid gap-2 col-6 mx-auto mt-2">
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
