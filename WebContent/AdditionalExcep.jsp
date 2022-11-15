<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp"%>
<%@ page import = "java.io.FileNotFoundException"%>
<%@ page import = "java.io.FileOutputStream"%>
<%@ page import = " java.io.IOException"%>
<%@ page import="javax.activation.*" %>


<jsp:useBean id="centconn" class="FormToolConnection.FormToolConn" scope="page">


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
<!-- <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"> -->
<link rel="stylesheet" href="css/table/TemplateCSS.css">

<script>
function formValidation()
{
var displaylabel="";
var displaycount="";
var count3="";
if((element_3_6.value==0)){
displaylabel+='<font face="Arial" size="1" color="red">Mandatory Field</font>,';
displaycount+='6,';
}if((element_3_7.value==0)){
displaylabel+='<font face="Arial" size="1" color="red">Mandatory Field</font>,';
displaycount+='7,';
}if((element_3_8.value==0)){
displaylabel+='<font face="Arial" size="1" color="red">Mandatory Field</font>,';
displaycount+='8,';
}if((element_3_9.value==0)){
displaylabel+='<font face="Arial" size="1" color="red">Mandatory Field</font>,';
displaycount+='9,';
}// Mandatorytransworld
// alphatransworld
// charactertransworld
if(!(element_3_7.value==0))
{
var numbers = /^[0-9.]+$/;
if(element_3_7.value.match(numbers))
{
count3+='7,';
}
else
{
displaylabel+='<font face="Arial" size="1" color="red">Please Enter Number only</font>,';
displaycount+='7,';
}
}if(!(element_3_8.value==0))
{
var numbers = /^[0-9.]+$/;
if(element_3_8.value.match(numbers))
{
count3+='8,';
}
else
{
displaylabel+='<font face="Arial" size="1" color="red">Please Enter Number only</font>,';
displaycount+='8,';
}
}if(!(element_3_9.value==0))
{
var numbers = /^[0-9.]+$/;
if(element_3_9.value.match(numbers))
{
count3+='9,';
}
else
{
displaylabel+='<font face="Arial" size="1" color="red">Please Enter Number only</font>,';
displaycount+='9,';
}
}if(!(element_3_10.value==0))
{
var numbers = /^[0-9.]+$/;
if(element_3_10.value.match(numbers))
{
count3+='10,';
}
else
{
displaylabel+='<font face="Arial" size="1" color="red">Please Enter Number only</font>,';
displaycount+='10,';
}
}else{count3+='10,';}if(!(element_3_11.value==0))
{
var numbers = /^[0-9.]+$/;
if(element_3_11.value.match(numbers))
{
count3+='11,';
}
else
{
displaylabel+='<font face="Arial" size="1" color="red">Please Enter Number only</font>,';
displaycount+='11,';
}
}else{count3+='11,';}// numbertransworld
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

function Quantity(){
	//alert("here");
	var km=document.getElementById("element_3_7").value;
	var kmpl=document.getElementById("element_3_8").value;
	
	try {
		var qunty=km/kmpl;
		qunty=Math.round(qunty * 100) / 100
		//alert("here"+qunty);
		document.getElementById("element_3_9").value = qunty;
	}
	catch(err) {
	    document.getElementById("element_3_9").innerHTML = err.message;
	}

	
	
}

function amount(){
	//alert("here");
	var qnty=document.getElementById("element_3_9").value;
	var rate=document.getElementById("element_3_10").value;
	
	try {
		var amnt=qnty*rate;
		amnt=Math.round(amnt * 100) / 100
		//alert("here"+qunty);
		if(amnt==0){
			document.getElementById("element_3_11").value = "wrong Amount";
		}else{
		document.getElementById("element_3_11").value = amnt;
		}
	}
	catch(err) {
	    document.getElementById("element_3_11").innerHTML = err.message;
	}
}

function cardfinder(){
	var driverinfo=document.getElementById("element_3_3").value;
	//alert("driverinfo:-"+driverinfo);
	
	try
	{
	var ajaxRequest;  // The variable that makes Ajax possible!
	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}  
	catch (e)
	{
		// Internet Explorer Browsers
		try
		{
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} 
		catch (e)
		{
			try
			{
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			catch (e)
			{
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			try
			{
			var reslt=ajaxRequest.responseText;
			//alert(reslt);
			var reslt1;
			//reslt=reslt.replace(/^\s+|\s+$/g,'');
			//alert(reslt);
			//reslt1=reslt.split("#");
			//document.getElementById("thisdaydiv1").innerHTML = reslt1[0];
			//document.getElementById("fdate9").innerHTML = reslt1[0];
			document.getElementById("element_3_6").value=reslt;
			//document.getElementById('temp2').style.display='none';
						
			}
			catch(e)
			{
				alert(e);
			}
		}
	};
	
	var queryString ="?driverinfo="+driverinfo;
	//alert(queryString);
	ajaxRequest.open("POST", "AjaxCardnofinder.jsp" + queryString, true);
	ajaxRequest.send(null); 
	}
	catch(e)
	{
		alert(e);
	}

}

</script>
</head>
<body>
<%
		Connection con1 = null;
			Statement stdynamicdrop = null;
			String datenew1 = "", datenew2 = "", datenew3 = "";
			datenew1 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
			datenew3 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date());
			datenew2 = datenew1;
			centconn.getConnection();
			con1 = centconn.ReturnConnection();
			stdynamicdrop = con1.createStatement();
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
							<h3 class="content-header-title  mb-0" style="color: #060637">Additional Ad-hoc Request</h3>
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
													<label for=" User Name:-" class="tcolor"><b>Vehicle Number :</b></label><br>
													<div class="input-container">
													<select class="form-select" id="element_3_1" name="element_3_1"
														aria-label="Default select example">
														<option value="select" selected="selected">select</option>
														<%
															String sqlregno = "select VehicleRegNumber,vehiclecode from db_gps.t_vehicledetails where vehiclecode in "
																		+ session.getAttribute("VehList").toString() + " order by VehicleRegNumber";
																System.out.println("*******" + sqlregno);
																PreparedStatement ps = con1.prepareStatement(sqlregno);
																ResultSet rsregno = ps.executeQuery();
																while (rsregno.next()) {
																	//vehiclecode= rsregno.getString("vehiclecode");
																	//VehRegNo=rsregno.getString("VehicleRegNumber");
																	//System.out.println("VehicleRegNo-->"+VehRegNo);
														%>
														<option value="<%=rsregno.getString("VehicleRegNumber")%>"><%=rsregno.getString("VehicleRegNumber")%></option>
														<%
															}
														%>
													</select>
												</div>
												</div>
											</div>
											<div class="col-6">
												<div class="md-2">
													<label for=" First Name:-" class="tcolor"><b>Driver Name :</b></label><br>
													<div class="input-container">
													<select class="form-select" id="element_3_3" name="element_3_3"
													 onchange="cardfinder();"
														aria-label="Default select example">
														<option value="select" selected="selected">select</option>
														<%
															String sqlregno1 = "select distinct(DriverName),DriverID from db_gps.t_drivers where (Owner='"
																		+ session.getAttribute("usertypevalue").toString() + "' or GPNAME='"
																		+ session.getAttribute("usertypevalue").toString()
																		+ "') and ACTIVESTATUS='Active' order by drivername";
																System.out.println("*******" + sqlregno);
																PreparedStatement ps1 = con1.prepareStatement(sqlregno1);
																ResultSet rsregno1 = ps1.executeQuery();
																while (rsregno1.next()) {
																	//vehiclecode= rsregno.getString("vehiclecode");
																	//VehRegNo=rsregno.getString("VehicleRegNumber");
																	//System.out.println("VehicleRegNo-->"+VehRegNo);
														%>
														<option
															value="<%=rsregno1.getString("DriverName") + "-" + rsregno1.getString("DriverID")%>"><%=rsregno1.getString("DriverName") + "(" + rsregno1.getString("DriverID") + ")"%></option>
														<%
															}
														%>
													</select>
												</div>
												</div>
											</div>
										</div>
										<div class="row col-12 mt-2">
											<div class="col-md-4">
												<label class="tcolor"><font style="color:red">*</font><b>Card Number :</b></label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="element_3_6" name="element_3_6"
					                                       readonly="readonly" placeholder="Enter Card Number" >
												</div>
											</div>
											<div class="col-md-4">
												<label class="tcolor"><b><font style="color:red">*</font>
														KM :</b></label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="element_3_7" name="element_3_7"
														placeholder="Enter kilo metre">
												</div>
											</div>
											<div class="col-4">
												<label  class="tcolor"><b><font style="color:red">*</font>
														KMPL :</b></label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="element_3_8" name="element_3_8"
														placeholder="Enter  Kilometers Per Litre">
												</div>
											</div>
										</div>
										<div class="row col-12 mt-2">
											<div class="col-md-4">
												<label class="tcolor"><font style="color:red">*</font><b>Diesel  Quantity :</b></label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="element_3_9" name="element_3_9"
													       placeholder="Enter Diesel Quantity">
													<font style="color:;" size="3" ><b><u><a href="#" onclick="Quantity();">LoadQuantity</a></u></b></font>      
												</div>
											</div>
											<div class="col-md-4">
												<label class="tcolor"><b>
														Default Fuel Rate :</b></label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="element_3_10" name="element_3_10"
														placeholder="Enter Default Fuel Rate">
												</div>
											</div>
											<div class="col-md-4">
												<label  class="tcolor"><b>
														Fuel Amount :</b></label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="element_3_11" name="element_3_11"
														placeholder="Enter Fuel Amount">
													<font style="color:;" size="3" ><b><u><a href="#" onclick="amount();">LoadAmount</a></u></b></font>
												</div>
											</div>
										</div>
										<div class="row col-12 mt-2">
										  <div class="col-md-6">
												<label for="" class="tcolor"><b>Reason :</b></label><br>
												<div class="input-container">
													<textarea class="form-control" id="element_3_12" name="element_3_12"
														placeholder="Enter Reason Here"></textarea>
												</div>
											</div>
										</div>

										<div class="d-grid gap-2 col-4 mx-auto mt-2">
											<button class="btn btn-primary btn2" id="saveForm" name="submit" type="submit" onClick="return validate()" value="Submit">Submit</button>
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

	</jsp:useBean>
	<%@ include file="footernew1.jsp"%>

</body>
</html>
