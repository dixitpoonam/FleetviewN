<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="javax.activation.*"%>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page">

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
<script type="text/javascript">
		onload = function() {
			document.getElementById("trans").value = "Select";
		};

		function Reload() {
			//alert("Hej");  
			window.location.reload();
		}
		function downloadExcelFormat() {
			window.location = "Task_List_Format.xls";

		}
		/*function Editvalues() {

		 var f = uploadTask.file.value;
		 //	alert(">>file"+f);
		 window.open ("uploadTask1.jsp?filename="+f);
		
		 }*/
		function confirmSubmit() {

			var fup = uploadTask.file.value;
			var ext = fup.substring(fup.lastIndexOf('.') + 1);

			//alert(">>"+fup+">>>>"+ext);
			if (ext == "xls") {
				// return true;
			} else {
				alert("Upload Excel file only");
				return false;
			}

			var agree = confirm("Are you sure you wish submit this Shipment List?");
			if (agree)
				return true;
			else
				return false;
		}
	</script>

</head>
<body>
<%
		String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
			String MM_dbConn_USERNAME = "fleetview";
			String MM_dbConn_PASSWORD = "1@flv";
			String MM_dbConn_STRING = "jdbc:mysql://173.234.153.82:3306/db_gps";

			try {
				Class.forName(MM_dbConn_DRIVER);

				Connection con2 = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME,
						MM_dbConn_PASSWORD);
				Statement stat = con2.createStatement();

			} catch (Exception e) {
				e.printStackTrace();
			}
	%>

	<!-- BEGIN: Content-->
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-6">
							<h3 class="content-header-title  mb-0" style="color: #060637">Upload Total Shipment</h3>
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
									<form class="form form-vertical" name="uploadTask" method="post" enctype="multipart/form-data"
		                                 onsubmit="return confirmSubmit()" action="ShipmentInsert.jsp">
									

										<div class="row">
											<div class="d-grid gap-2 mx-auto col-6" align="center">
											  <a href="ShipmentReport.jsp"><u><i>Shipment Details Report</i></u> </a>
											</div>
										</div>
										
										<div class="row">	
																					</div>
										
										<div class="row">
										<div class="col-3"></div>
										     <div class="col-5">
										        <div>
								                   <label class="form-label tcolor">Upload file </label>
							                       <input class="form-control form-control-lg" name="file" id="file" type="file">
							                   </div>
											 </div>
											 <div class="col-2 mt-2">
										      <a href="http://myfleetview.net/FleetView/ddgimages/Shipment.xls">Sample Format </a>
											    <img src="images/excel.jpg" width="20px" height="20px"
						                             style="border-style: none" title="download excel format"></img>
											</div>
											 
										</div> 
											
											 <div class="d-grid gap-2 col-4 mx-auto mt-3">
											    <button class="btn btn-primary btn2" type="submit" name="uploadexl" id="uploadexl" value="Submit">Submit</button>
										   </div>
										<%
											String msg = request.getParameter("msg");
								
												System.out.println("The msg is :" + msg);
												if (msg != null) {
										%>
										<table border="0" width="100%" align="center">
											<tr>
												<td align="center" bgcolor="#f5f5f5"><font size="2"><b>File
															Uploaded Successfully</b></font></td>
											</tr>
										</table>
										<%
											} else {
										%>
										<table border="0" width="100%" align="center">
											<tr>
												<td align="center" bgcolor="#f5f5f5"><font size="2"><b>Please
															Upload Only .xls Format Files.</b></font></td>
											</tr>
										</table>
										<%} %>
											 
										
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
</jsp:useBean>
</html>
