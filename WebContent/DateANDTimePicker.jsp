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
		<script src="https://unpkg.com/feather-icons@4.10.0/dist/feather.min.js"></script>
	

<script>
	function ValidateName() {
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
	function ValidateEmail() {
		//alert("onblur email...");
		var text = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/;
		//alert(text);
		var txtEmail = document.entryform.email;
		//alert("email id:"+txtEmail.value);
		if (txtEmail.value == "") {
			alert("Please Enter EmailID");
			return false;
		}

		if (!text.test(txtEmail.value)) {
			alert("Please Enter valid EmailID");
			return false;
		}
	}

	function ValidatePhone() {
		//alert("on blur")
		var mob = document.entryform.phoneno.value;
		//alert("mob no:"+mob);
		var text = /^[0-9]+$/;

		if (mob == "") {
			alert("please enter Phone Number");
			return false;
		}
		if (!(mob == 0)) {
			if (isNaN(mob)) {
				alert("please enter numeric value");
				return false;
			}
			if (!text.test(mob)) {
				alert("please enter numeric value");
				return false;
			}
			return true;
		}
	}

	function validateAll() {
		alert("in Validate All");
		var nameval = document.entryform.contactperson.value;
		var mob = document.entryform.phoneno.value;
		var txtEmail = document.entryform.email;

		var text_email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/;

	}
</script>
<style type="text/css">
@charset "ISO-8859-1";

*, *:before, *:after {
	box-sizing: border-box;
}

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

input, input[type="radio"]+label, input[type="checkbox"]+label:before,
	select option, select {
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

input:focus+.input-icon i {
	color: #f0a500;
}

input:focus+.input-icon:after {
	border-right-color: #f0a500;
}

input[type="radio"] {
	display: none;
}

input[type="radio"]+label, select {
	display: inline-block;
	width: 50%;
	text-align: center;
	float: left;
	border-radius: 0;
}

input[type="radio"]+label:first-of-type {
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
}

input[type="radio"]+label:last-of-type {
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
}

input[type="radio"]+label i {
	padding-right: 0.4em;
}

input[type="radio"]:checked+label, input:checked+label:before, select:focus,
	select:active {
	background-color: #f0a500;
	color: #fff;
	border-color: #bd8200;
}

input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	position: relative;
	display: block;
	padding-left: 1.6em;
}

input[type="checkbox"]+label:before {
	position: absolute;
	top: 0.2em;
	left: 0;
	display: block;
	width: 1em;
	height: 1em;
	padding: 0;
	content: "";
}

input[type="checkbox"]+label:after {
	position: absolute;
	top: 0.45em;
	left: 0.2em;
	font-size: 0.8em;
	color: #fff;
	opacity: 0;
	font-family: FontAwesome;
	content: "\f00c";
}

input:checked+label:after {
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

select:focus, select:active {
	outline: 0;
}

select option {
	background-color: #f0a500;
	color: #fff;
}

.input-group {
	margin-bottom: 1em;
	zoom: 1;
}

.input-group:before, .input-group:after {
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
}

.row {
	zoom: 1;
}

.row:before, .row:after {
	content: "";
	display: table;
}

.row:after {
	clear: both;
}

.col-half {
	padding-right: 10px;
	float: left;
	width: 50%;
}

.col-half:last-of-type {
	padding-right: 0;
}

.col-third {
	padding-right: 10px;
	float: left;
	width: 33.33333333%;
}

.col-third:last-of-type {
	padding-right: 0;
}

.btn2 {
	background-color: #151564;
}

.input-container {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	width: 100%;
	margin-bottom: 15px;
}
</style>

<script>
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

										 <div class="container">
										   <div class="row">
										      <div class='col-sm-6'>
										         <div class="form-group">
										            <div class='input-group date' id='datetimepicker5'>
										               <input type='text' class="form-control" />
										               <span class="input-group-addon">
										               <span class="glyphicon glyphicon-calendar"></span>
										               </span>
										            </div>
										         </div>
										      </div>
										      <script type="text/javascript">
										         $(function () {
										             $('#datetimepicker5').datetimepicker({
										                 defaultDate: "11/1/2013",
										                 disabledDates: [
										                     moment("12/25/2013"),
										                     new Date(2013, 11 - 1, 21),
										                     "11/22/2013 00:53"
										                 ]
										             });
										         });
										      </script>
										   </div>
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
