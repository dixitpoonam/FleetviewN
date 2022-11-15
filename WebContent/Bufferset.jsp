<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="javax.activation.*"%>
<jsp:useBean id="centconn" class="FormToolConnection.FormToolConn" scope="page">

<html>
<head>
<title>Buffer Setting Master</title>

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
<script>
function formValidation()
{
var displaylabel="";
var displaycount="";
var count3="";
if((element_3_1.value==0)){
displaylabel+='<font face="Arial" size="1" color="red">Mandatory Field</font>,';
displaycount+='1,';
}if((element_3_2.value==0)){
displaylabel+='<font face="Arial" size="1" color="red">Mandatory Field</font>,';
displaycount+='2,';
}// Mandatorytransworld
// alphatransworld
// charactertransworld
if(!(element_3_1.value==0))
{
var numbers = /^[0-9.]+$/;
if(element_3_1.value.match(numbers))
{
count3+='1,';
}
else
{
displaylabel+='<font face="Arial" size="1" color="red">Please Enter Number only</font>,';
displaycount+='1,';
}
}if(!(element_3_2.value==0))
{
var numbers = /^[0-9.]+$/;
if(element_3_2.value.match(numbers))
{
count3+='2,';
}
else
{
displaylabel+='<font face="Arial" size="1" color="red">Please Enter Number only</font>,';
displaycount+='2,';
}
}// numbertransworld
// emailtransworld

if(displaylabel == ""){
return true;
}

else{
var displaylabelres = displaylabel.split(",");
var res1=displaycount.split(",");
var res2=count3.split(",");
var i;
var j;

for(j=0; j < res2.length-1; j++){
 document.getElementById("element_error_"+ res2[j]).style.display='none';
 }
 
for (i = 0; i < displaylabelres.length-1; i++) {
    var element_error_="element_error_"+i;
    var number=i;
    document.getElementById("element_error_"+ res1[i]).style.display="";
    document.getElementById("element_error_"+ res1[i]).innerHTML=displaylabelres[i];
} 

 return false;
}
}
</script>

</head>
<body>
<%
Connection con1 = null;
Statement stdynamicdrop = null;
String datenew1="",datenew2="",datenew3="";
datenew1=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
datenew3=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date());
datenew2=datenew1;
centconn.getConnection();
con1=centconn.ReturnConnection();
stdynamicdrop=con1.createStatement();
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
							<h3 class="content-header-title  mb-0" style="color: #060637">Parameter Setting Master</h3>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">
							
							<%@ include file="RegisterCompScript.jsp" %>
							   
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
													<label class="tcolor"><font style="color:red">*</font><b>Distance Wise Buffer Km :
													</b></label><br>
													<div class="input-container">
														<input class="form-control" type="text" id="element_3_1" name="element_3_1"
															placeholder="Enter Distance Wise Buffer Km">
													</div>
												</div>
											</div>
											<div class="col-6">
												<div class="md-2">
													<label class="tcolor"><font style="color:red">*</font><b>
															GeofenceWise Buffer Km :
															</b></label><br>
													<div class="input-container">
														<input class="form-control" type="text" id="element_3_2" name="element_3_2"
															placeholder=" Enter Geofence Wise Buffer Km">
													</div>
												</div>
											</div>
										</div>
										<div class="row col-12 mt-2">
										   <label class="tcolor">DayWise Buffer Time :</label>
											<div class="col-2">
												<label class="tcolor">HH:</label>
													<div class="input-group input-group-merge">
												<select name="element_3_3" id="element_3_3" class="form-select">
													<option value="00">00</option>
								                   <option value="01">01</option>
								                   <option value="02">02</option>
								                   <option value="03">03</option>
								                   <option value="04">04</option>
								                   <option value="05">05</option>
								                   <option value="06">06</option>
								                   <option value="07">07</option>
								                   <option value="08">08</option>
								                   <option value="09">09</option>
								                   <option value="10">10</option>
								                   <option value="11">11</option> 
								                   <option value="12">12</option>
								                   <option value="13">13</option>
								                   <option value="14">14</option>
								                   <option value="15">15</option>
								                   <option value="16">16</option>
								                   <option value="17">17</option>
								                   <option value="18">18</option>
								                   <option value="19">19</option>
								                   <option value="20">20</option>
								                   <option value="21">21</option> 
								                   <option value="22">22</option>
								                   <option value="23">23</option>
												</select>
												</div>
												</div>
											<div class="col-2">
												<label class="tcolor">MM:</label>
													<div class="input-group input-group-merge">
												<select name="element_3_4" id="element_3_4" class="form-select">
													 <option value="00">00</option>
								                   <option value="10">10</option>
								                   <option value="20">20</option>
								                   <option value="30">30</option> 
								                   <option value="40">40</option>
								                   <option value="50">50</option>
											</select>
												</div>
												</div>
											
										</div>
										
										<div class="d-grid gap-2 col-4 mx-auto mt-2">
											<button class="btn btn-primary btn2"id="saveForm" name="submit" type="submit" onClick="return validate()">Submit</button>
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
 </jsp:useBean>
</html>
