<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.util.ArrayList" %>
<%@ include file="headernew1.jsp"%>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page"></jsp:useBean>
<%
	fleetview.getConnection(MM_dbConn_DRIVER, MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
%>
<html>
<head>
<title>Fuel Entry Example</title>

<!-- <script src="js/datatable/feather.min.js"></script>
<script src="js/datatable/moment.js"></script>
<link rel="stylesheet" href="css/table/jquery-ui.css">

 <script src="js/datatable/jquery-ui.js"></script> 
Add icon library
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	<link rel="stylesheet" href="css/table/TemplateCSS.css"> -->
	
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



	var date1=document.getElementById("fueldate").value;
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

function validate()
{
	 
    var driv=document.fuelform.drivers.value;
    //alert("DRIVER"+driv);
    var petpump=document.fuelform.petpump.value;
    var varValue = document.fuelform.odometer.value;
    var amount=document.fuelform.amount.value;
    var lits=document.fuelform.lits.value;
    //alert("LITER"+lits);
	 var veh=document.fuelform.vehs.value;
	var dat= document.fuelform.fueldate.value;
    var hour = document.fuelform.ehours.value; 
//alert("dat"+dat);	

    if(veh=="Select")
	    {
	        alert("Please Select Vehicle No");
	        return false;
	    }
    if(dat==null || dat.trim()==""){
	        alert("Please Select Date & time");
	        return false;
}
	 if(driv=="Select")
	    {
	        alert("Please Select Driver");
	        return false;
	    }
   
     if(lits==null || lits.trim()=="")
   	  {
   	  alert("Please Enter Litres");
	        return false;
   	  }
     var invalid = /^[0-9.]+$/;
	 if(isNaN(lits))
		 {
		 alert("Please Enter Numeric or Float Value Only For Litres");
	        return false;
		 }
	 
	
	 if(amount.trim()==null || amount.trim()=="")
	  {
	  alert("Please Enter Amount");
       return false;
	  }
 var invalid = /^[0-9.]+$/;
if(isNaN(amount))
	 {
	 alert("Please Enter Numeric or Float Value Only For Amount");
       return false;
	 }
		
    
 if(varValue.trim()!="")
	  {
	  if(isNaN(varValue))
  	     {
  		   alert("Odometer Reading should be Numeric Only ");
  		   return false;
  	     }
	  
	  }
 
	 if(varValue==null || varValue=="")
	 {
	 	alert("Please Enter Odometer Value");
	 	return false;
	 }
 
 
	 if(hour=="" || hour==null){}
	 
	 else
	{
		
		 var valid = /^\d+(\.\d+)?$/;
		 if(!valid.test(hour))
		 {
		 	alert("Engine Hours: Please Enter Valid Numeric or FLoat Value");
		 	return false;
		 }
	}	

    return datevalidate(); 

   
 }
	function confirmSubmit()
	{
		//var veh=document.fuelform.vehs.value;
	    var driv=document.fuelform.drivers.value;
	    var petpump=document.fuelform.petpump.value;
	    var varValue = document.fuelform.odometer.value;
	    var amount = document.fuelform.amount.value;
	    var lits=document.fuelform.lits.value;
	    var veh=document.fuelform.vehs.value;
	    var hour = document.fuelform.ehours.value;
	    var split = veh.split(",");
		var agree=confirm("Vehicle: "+split[0]+"\nOdometer : "+varValue+"\nLiters: "+lits+"\n\nAre you sure you want to continue with these values?");
		if (agree)
			return true ;
		else
			return false ;
		
		}

</script>

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

<script language="javascript">

function validateModelPopUP(){
   
    
    var drvId = document.adddriver.drvId.value;
     if(drvId.length=="")
	{
		alert("Please enter driver Id.");
		return false;
	}
        
      var name = document.adddriver.drvName.value;
    if(name=="")
	{
		alert("Please enter driver name.");
		return false;
	}
         var transName = document.adddriver.transpName.value;
    if(transName=="Select")
	{
		alert("Please select transporter name.");
		return false;
	}
    
}

</script>


</head>
<body>
 <%!Connection con1, con2;
 String driveridjsp="";
 %>
 <%
	try {
			Class.forName(MM_dbConn_DRIVER);
			con1 = fleetview.ReturnConnection();
			Statement stmt1 = con1.createStatement(), stmt11=con1.createStatement();
			ResultSet rs2 = null, rs3 = null, rs4 = null, rs5 = null;
			String sql2 = "", sql3 = "", sql4 = "", sql5 = "",sql1="";
			String user = session.getValue("usertypevalue").toString();
			String usertype = session.getValue("TypeofUser").toString();
			java.util.Date d = new java.util.Date();
			int hours = (d.getHours());
			int minutes = (d.getMinutes());
			int i=0;
			String nwfrmtdte = new SimpleDateFormat("dd-MMM-yyyy")
					.format(new java.util.Date());
			DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

			Calendar now123=Calendar.getInstance();
			
			String sysdate22 = dateFormat.format(now123.getTime());
			System.out.println(">>>>>>>>>>>>>>>n "+sysdate22);
			
		   /* for model pop up */
			String msg = (String)request.getParameter("msg");
			//out.println(msg);
			String drvnm = (String)request.getParameter("drvnm");
			String transpName = request.getParameter("transporter");
			//System.out.println("trans====>"+transpName);
			
			ArrayList alTransporterName = new ArrayList();
		String fromPage = (String) request.getParameter("frPg");
			
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
							<h3 class="content-header-title  mb-0" style="color: #060637">Fuel
								Information</h3>
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
								<div class="card-header">
									<h6 style="color: red;">
										( <span style="color: red;">*</span> indicates mandatory fields)
									</h6>
								</div>
								<div class="card-body card">
									<!-- Start card body -->
 <form name="fuelform" method="get" action="fuelentryinsrt.jsp" onSubmit="return validate();">
                     <%
		     	String inserted = request.getParameter("inserted");
		     	String lastOdometerReading=request.getParameter("lastOdometerReading"); 
		     		if (!(inserted == null)) {
		     				
		     			if("yes".equalsIgnoreCase(inserted))
		     			{
%>

					<br></br> &nbsp;&nbsp;&nbsp;<b>Successfully Inserted! Click <a
						href="currentposition2.jsp">Here </a> to go to main page.
					</b>

					<%
			     		}
		     			else if("no".equalsIgnoreCase(inserted))
			     		   {
			     				
	%>

					&nbsp;&nbsp;&nbsp;<b>Last Odometer Reading entered was <%=lastOdometerReading %><br>Please
						enter higher value than this.</br></b>

					<%
			     				
			     			}
			     		}
			     			
	%>
										<div class="row align-item start">
											<div class="col-4">
												<div class="mb-2">
												<label  class="tcolor"><font color="red">*</font><b>Vehicle No :</b></label><br>
												<div class="input-container">
													<select class="form-select"
													     name="vehs"
														aria-label="Default select example">
														<option value="Select">Select</option>
														<%
															try {
																String sql= "select * from t_vehicledetails where vehicleCode in"+session.getValue("VehList").toString()+" order by VehicleRegNumber ";
																ResultSet rst = stmt1.executeQuery(sql);
																System.out.println("RSSSSSTTT"+sql);
																String regNo="",vehCode="";
																while (rst.next()) {
																regNo = rst.getString("VehicleRegNumber");
																vehCode=rst.getString("vehicleCode");
													%>
																						<option value="<%=regNo%>,<%=vehCode%>"><%=regNo%></option>
																						<%
																}
														} catch (Exception e) {
														System.out.print("Exception" + e);
														}
														%>
															
														</select>

													</div>
												</div>
											</div>

											<div class="col-4">
												<div class="mb-2">
													<label class="tcolor"><font color="red">*</font>Date Time:</label>
													<div class="input-group input-group-merge">
														<input type="text" id="fueldate" name="fueldate"
															class="form-control" value=" " /> <span
															class="input-group-text"><svg
																xmlns="http://www.w3.org/2000/svg" width="14"
																height="14" viewBox="0 0 24 24" fill="none"
																stroke="currentColor" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"
																class="feather feather-calendar">
																<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
																<line x1="16" y1="2" x2="16" y2="6"></line>
																<line x1="8" y1="2" x2="8" y2="6"></line>
																<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
													</div>
													<script>
																$(document).ready(function() {
																$( function() {
															$( "#fueldate" ).datepicker({
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
				<div class="col-md-1">
					<label for="basicSelect">HH:</label>
						<div class="input-group input-group-merge">
					<select name="hhTime" id="hhTime" class="form-select">

									<option value="00" selected>00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<%
										for ( i = 10; i < 24; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
									}
											
									%>
					</select>
					</div>
					</div>
					
					<div class="col-md-1">
					    <label for="basicSelect">MM</label>
						<div class="input-group input-group-merge">
					     <select name="mmTime" id="mmTime" class="form-select">
																		
									<option value="00" selected>00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<%
										for ( i = 10; i < 60; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}
											
									%>
								</select>
					</div>
					</div>						
			</div>
										 
					<%
				 	String sql7 = "select * from t_drivers where Owner='"+ user + "' order by DriverName asc";
					ResultSet rs7 = stmt1.executeQuery(sql7);
                   %>
										<div class="row align-item start">
											<div class="col-3">
												<label class="tcolor"><font color="red">*</font>Driver:</label>
												<!--  <div class="md-2"> -->
												<!-- <div class="col-half"> -->
												<div class="form-floating">
													<select class="form-select"
													    name="drivers" id="drivers"
														aria-label="Default select example">
														<option value="Select">Select</option>
														<%
															while (rs7.next()) {
																String drivers = rs7.getString("DriverName");
																//System.out.println("drivers-->>"+drivers);
													%>
																						<option><%=drivers%></option>
																						<%
																				}
													%>
													</select>

												</div>
												<!--  </div> -->
											</div>

											<div class="col-2">
												<div class="md-2">
													<label class="tcolor">Add New Driver Here:</label>
													<br>
													   <!-- Trigger the modal with a button -->
	                                  			<button type="button" class="btn btn-primary btn2" data-bs-toggle="modal"
																data-bs-target="#myModal">Add New Driver</button>
													   
<%-- 													<button class="btn btn-primary btn2" type="button"><a href="AddNewDriver.jsp?transporter=<%=user%>"><font style="color:#FFFFFF;">Add New Driver</font></a></button>
 --%>												</div>
											</div>
											<div class="col-3">
												<div class="mb-2">
													<label class="tcolor"><font color="red">*</font><b> Liters:</b></label><br>
													
														<input class="form-control" type="text"
															placeholder="Enter Liters"  name="lits">
													
												</div>
											</div>

											<div class="col-2">
												<div class="mt-2">
													<div class="form-check form-check-inline">
														<input class="form-check-input" type="checkbox"
															name="fulltank" id="fulltank" value="Yes"> 
															<label
															class="form-check-label tcolor" for="inlineCheckbox1">Full
															Tank</label>
													</div>
												</div>
											</div>
										</div>
										<div class="row align-item start">
											<div class="col-3">
												
													<label class="tcolor"><font color="red">*</font><b>Amount:</b></label><br>
													<div class="input-container">
														<input class="form-control" type="text"
															placeholder="Add Amount" name="amount" id="amount">
													</div>
												
											</div>

											<div class="col-3">
											 
												 <label class="tcolor"><font color="red">*</font><b>Odometer:</b></label><br>
													<input class="form-control" type="text"
														placeholder="Add Odometer " name="odometer">
											</div>
											<div class="col-3">
												 <div class="mt-2"> 
													<div class="form-check">
														<input class="form-check-input" type="checkbox" name="Reset" id="Reset" value="OdometerReset">
														 <label
															class="form-check-label tcolor" for="defaultCheck1"><font color="red">*</font>
															Odometer Reset</label>
													</div>
												</div>
 											</div>
											</div>


											<div class="row align-item start">
											<div class="col-3">
											<div class="mt-2">
												<label class="tcolor"><b>Engine Hours:</b></label><br>
												<div class="input-container">
													<input class="form-control" type="text"
														placeholder="Enter Engine hours" name="ehours" id="ehours">
												</div>
												</div>
											</div>
											
											<%
		 	                             	if (session.getAttribute("fuelformat").toString()
 	       					               .equalsIgnoreCase("Gal")) {
                                            %>
											<div class="col-3">
											<div class="mt-2">
												<label class="tcolor"><b>Gas Station:</b></label><br>
													<input class="form-control" type="text"
														placeholder="Enter Gas Station" name="petpump" required="required">
											</div>
											</div>
											<%
 				   										} else {
											%>
											<div class="col-3">
											<div class="mt-2">
												<label class="tcolor"><b>Petrol Pump:</b></label><br>
													<input class="form-control" type="text"
														placeholder="Enter Petrol Pump" name="petpump">
											</div>
											</div>
											<%}%>
											
											<div class="col-6">
											 <div class="mt-2">
										     	<label class="tcolor"><b>Remark:</b></label><br>
													<textarea class="form-control"
														placeholder="White a comment here" id="cmntreason" name="remark"></textarea>
											</div>	
											</div>
										</div>
										
										<div class="d-grid gap-2 col-6 mx-auto mt-2 tcolor">
										     <input type="submit" value="Submit"" value="Register" class="btn btn-primary btn2">
   								              <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We recommend that you top up your tank at least once a week</p>
   								    	</div>
										
										<!-- <div class="d-grid gap-2 col-6 mx-auto mt-1 tcolor">
										  
										  <p>We recommend that you top up your tank at least once a week</p>
										 
										</div > -->
										
										
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
	
	<!-- end app-content -->
	<!-- END: Content-->
	<!--  Model Pop up for add driver -->
<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="tcolor">Add New Driver</h3>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
	     <form name="adddriver" action="addDriverInDB.jsp" method="post" id="newModalForm"  onSubmit="return validateModelPopUP();">   
	        <section class="sectionNew">
	         <%  /* sql1 = "select distinct vehregno from t_group where  gpname = 'Castrol' order by vehregno desc;  ";
		       rs2 = stmt11.executeQuery(sql1);
		        while(rs2.next()){
		      
		          alTransporterName.add(i, rs2.getString("vehregno").toString());
		          alTransporterName.add(rs2.getString("vehregno").toString());
		       } */
		        
		    	String ins=request.getParameter("inserted");
				if(msg==null)
				{
				}
				else{
					 if(msg.equalsIgnoreCase("F")){ %>
						<script>
						alert("Driver Id already exists...Data not saved");
						</script> 
					<% }else{ %>
					<script>
					alert("Successfully Saved");
					</script>
				<%}
				}
		%>
			<!-- Modal body -->
			<div class="modal-body">
				
					<div class="row col-10">
						<label for="formFile" class="tcolor">Driver Id: </label>
						<input class="form-control" type="text" id="drvId" name="drvId"/>
					</div>
					<div class="row col-10">
						<label for="formFile" class="tcolor">Driver Name: </label>
						<input class="form-control" type="text" id="drvName" name="drvName"/>
					</div>
	
				   <input type="hidden" id="transpName" name="transpName" value="<%=transpName %>" />
	
			</div>
	       
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary btn2">Submit</button>
	
				<button type="sumbit" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
	       </section>
	     </form>
		</div>
	</div>
	</div>
	
<!--  Model Pop up for add driver -->	
<%
	} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				con1.close();
			}
			catch(Exception e)
			{
				
			}	
		
			try{
				fleetview.closeConnection();
			}
			catch(Exception e)
			{
				
			}
		}
%>

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
