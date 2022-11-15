<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp"%>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page"></jsp:useBean>

<html>
<head>
<title>Vehicle Tracking System</title>

<script src="js/datatable/feather.min.js"></script>
<script src="js/datatable/moment.js"></script>
<link rel="stylesheet" href="css/table/jquery-ui.css">
<link rel="stylesheet" href="css/table/TemplateCSS.css">
<script src="js/datatable/jquery-ui.js"></script>
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script>
<!-- <script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css"> -->
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>	

<!-- <link rel="stylesheet" type="text/css" href="css/table/jquery.datetimepicker.css">
<link rel="stylesheet" type="text/css" href="js/datatable/jquery.datetimepicker.js"> -->

<link rel="stylesheet" type="text/css" href="css/table/jquery.datetimepicker.css">
        <script src="js/datatable/jquery.datetimepicker.js"></script>

<script>
function validate()
{
	 if(document.getElementById('VehCode').selectedIndex == 0)
	 {
	 alert("Please select Vehicle No");
	 return false;
	 }
	 else
	 {
		 var x = document.forms["formupdate"]["distance"].value;
		 //var x= document.getElementById('distance').selectedIndex == 0
		  //  var y = document.forms["formupdate"]["reason"].value; 
		   var d1 = document.forms["formupdate"]["data1"].value;
	    var d2 = document.forms["formupdate"]["data2"].value;
	    var date=new Date().toISOString().slice(0, 19).replace('T', ' ');

	    if(d2 == d1 || d2 < d1){
		    alert("To Date should be greater than from date");
		    return false;
	    }
		  
		 if (x==null || x==" ") {
		        alert("Please Enter The Distance ");
		        return false;
		    }
		 var numbers = /^[0-9]+$/;
		    if(document.forms["formupdate"]["distance"].value.match(numbers)){
			    }else{
			    	 alert('Please Enter the distance in numeric characters only '); 
			    	 return false;
			    }
		   
	}
		var check1=	document.getElementById('rule1').checked;
		var check2=	document.getElementById('rule2').checked;
		var check3=	document.getElementById('rule3').checked;
	
		
		if(check1 == false ){
			alert("Please Accept All The Rules");
			return false;
		}
		if(check2 == false ){
			alert("Please Accept All The Rules");
			return false;
		}
		if(check3 == false ){
			alert("Please Accept All The Rules");
			return false;
		}
	 
}	
</script>
</head>
<body>
<%!Connection con1;%>
<%
	fleetview.getConnection(MM_dbConn_DRIVER, MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	String defaultDate = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	
	Class.forName(MM_dbConn_DRIVER);
	con1 = fleetview.ReturnConnection();
	Statement stmt1 = con1.createStatement();
	Statement stmt2 = con1.createStatement();
	ResultSet rs = null;
	
	String VehCode=request.getParameter("vehcode");
	String vehregno=request.getParameter("vehregno");
	String time1="",time2="";
	
	System.out.println(" vehcode is  "+VehCode+" vehregno "+vehregno);
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
							<h3 class="content-header-title  mb-0" style="color: #060637">Vehicle ND Intimation
							</h3>
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
									<div class="card-header">
                                <h6>( <span style="color:red;">*</span> indicates mandatory fields)</h6>
                            </div>
								<div class="card-body card">
									<!-- Start card body -->
									<form name="saveNDEntry"  class="form form-vertical" id="formupdate" method="post" action="" onSubmit="return validate();" >
									<%
										try {
												Class.forName(MM_dbConn_DRIVER);
												con1 = fleetview.ReturnConnection();
												
												String sql2 = "", sql3 = "", sql4 = "", sql5 = "";
												String user = session.getValue("usertypevalue").toString();
												String usertype = session.getValue("TypeofUser").toString();
												java.util.Date d = new java.util.Date();
												int hours = (d.getHours());
												int minutes = (d.getMinutes());
												String nwfrmtdte = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
														.format(new java.util.Date());
												DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
									
												Calendar now123=Calendar.getInstance();
												
												String sysdate22 = dateFormat.format(now123.getTime());
												System.out.println(">>>>>>>>>>>>>>>n "+sysdate22);
			
		                         	%>
		                         	<input type="hidden" name="transporter" id="transporter" value="<%=user %>"></input>
		                         	
										<div class="row col-12">
											<div class="col-6">
												<label for="Old Password:-" class="tcolor"><font color="red">*</font><b>Vehicle No :</b></label><br>
												<div class="input-container">
													<select class="form-select select"
													    name="VehCode" id="VehCode"
														aria-label="Default select example">
														<option value="Select">Select</option>
														<%
                                                           String fromtime="",totime="";
														try {
															
															//take the from date to date from t_defaultvals and do the validations
															String owner="";
															//String fromtime="",totime="";
															String sql= "select * from t_vehicledetails where vehicleCode in"+session.getValue("VehList").toString()+" order by VehicleRegNumber ";
															System.out.println(" sql "+sql);
															ResultSet rst = stmt1.executeQuery(sql);
															String regNo="";
															while (rst.next()) {
															regNo = rst.getString("VehicleRegNumber");
															VehCode=rst.getString("vehicleCode");
															owner=rst.getString("Ownername");
															
															
															String sql1="select NightDrivingFromTime, NightDrivingToTime from t_defaultvals where Ownername='"+owner+"' ";
															rs=stmt2.executeQuery(sql1);
															if(rs.next()){
																fromtime=rs.getString("NightDrivingFromTime");
																totime=rs.getString("NightDrivingToTime");
																
															//	System.out.println("NightDrivingFromTime->"+fromtime);
															//	System.out.println("NightDrivingToTime->"+totime);
																
															}
												            %>
																		<option value="<%=VehCode%>"><%=regNo%></option>
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
                                          <div class="row col-12">
											<div class="col-6">
											  
											  <input type="hidden" id="fromtime" name="fromtime" value="<%=fromtime %>"></input>
	      			                          <input type="hidden" id="totime" name="totime" value="<%=totime %>"></input>
												
												<label class="tcolor"><font color="red">*</font> From Date:</label>
												<div class="input-group input-group-merge">
													<input type="text"id="MdateF" name="data1"
														class="form-control"  value="<%=nwfrmtdte %>" /> 
														<span
														class="input-group-text"><svg
															xmlns="http://www.w3.org/2000/svg" width="14" height="14"
															viewBox="0 0 24 24" fill="none" stroke="currentColor"
															stroke-width="2" stroke-linecap="round"
															stroke-linejoin="round" class="feather feather-calendar">
															<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
															<line x1="16" y1="2" x2="16" y2="6"></line>
															<line x1="8" y1="2" x2="8" y2="6"></line>
															<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
												</div>
												<script>
							$(document).ready(function() {
								$(function() {
									$("#MdateF").datetimepicker({
										dateFormat : 'dd-M-yy',
										controlType : 'select',
										oneLine : true,
										timeFormat : 'HH:mm:ss',
										changeMonth : true,
										changeYear : true
									});
								});

							});
						</script>
											</div>

											<div class="col-6">
												<label class="tcolor"><font color="red">*</font>To Date:</label>
												<div class="input-group input-group-merge">
													<input type="text"  id="MdateT" name="data2"  value="<%=nwfrmtdte %>" 
														class="form-control" /> <span
														class="input-group-text"><svg
															xmlns="http://www.w3.org/2000/svg" width="14" height="14"
															viewBox="0 0 24 24" fill="none" stroke="currentColor"
															stroke-width="2" stroke-linecap="round"
															stroke-linejoin="round" class="feather feather-calendar">
															<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
															<line x1="16" y1="2" x2="16" y2="6"></line>
															<line x1="8" y1="2" x2="8" y2="6"></line>
															<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
												</div>
												<script>
							$(document).ready(function() {
								$(function() {
									$("#MdateT").datetimepicker({
										dateFormat : 'dd-M-yy',
										controlType : 'select',
										oneLine : true,
										timeFormat : 'HH:mm:ss',
										changeMonth : true,
										changeYear : true
									});
								});

							});
						</script>
												
											</div>
										</div>
								         <div class="row col-12">
								            <div class="col-6">
												<div class="mb-3">
													<label class="tcolor"><font color="red">*</font> Distance :</label> <input type="text"
														class="form-control"  name="distance" id="distance" 
														placeholder="Enter the Distance ">
												</div>
											</div>
											<div class="col-6">
												<div class="mb-3">
													<label class="tcolor"><font color="red">*</font>Reason :</label> <input type="text"
														class="form-control" name="reason" id="reason"
														placeholder="Enter the Reason ">
												</div>
											</div>
								         </div>
                                         <div class="row col-12">
                                           <div class="col-6">
                                           <div class="mt-1">                                           
                                           <div class="form-check">
											  <input class="form-check-input" type="checkbox" id="rule1" name="rule1" value="rule1">
											  <label class="form-check-label tcolor" for="flexCheckDefault"><font color="red">*</font>
											 I will follow road safety rules
											  </label>
											</div>
										   </div>
										   
										    <div class="mt-2">   	
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" id="rule2" name="rule2" value="rule2">
											  <label class="form-check-label tcolor" for="flexCheckChecked"><font color="red">*</font>
											  I will not drink and drive
											  </label>
											</div>
											</div>
											
											<div class="mt-2">   	
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" id="rule3" name="rule3" value="rule3" >
											  <label class="form-check-label tcolor" for="flexCheckChecked"><font color="red">*</font>
											 I am driving for personal reason
											  </label>
											</div>
										   </div>	
                                         </div>
                                         </div>
								         <div class="d-grid gap-2 col-6 mx-auto">
											<button class="btn btn-primary btn2"  type="submit" name="Submit" value="Submit">Register</button>
										</div>
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
