<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp" %>


 <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"></jsp:useBean>
<%
	fleetview.getConnection(MM_dbConn_DRIVER, MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
%>
<html>
  <head>  
    <title>Fuel Entry Example</title>  
    <style>
     
    </style>
    <!-- For UI Only These 2 links -->
     <!-- <link rel="stylesheet" href="bootstrap.min.css"> -->
       <!-- <link href="uiform/app.css" rel="stylesheet" type="text/css" /> -->
       
       <!-- Date & time --> 
         <!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> -->
  <link href="uiform/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
  <script src="uiform/moment-with-locales.js"></script>
  <script src="uiform/bootstrap-datetimepicker.js"></script>
  <script src="js/datatable/feather.min.js"></script>
  <link rel="" href="css/table/responsive.bootstrap.min.css">


<!-- For Icon -->

<!-- <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet" type="text/css" /> -->

     <script>
     $(document).ready(function(){

  $('#datetimepicker1').datepicker({
 		
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
//  alert("Monh"+month);
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
     
  </head>
  <body>
<%!Connection con1;%>


<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h2 class="content-header-title float-start mb-0">Fuel Information</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="content-body">
			

			<!-- Basic Vertical form layout section start -->
			<section id="basic-vertical-layouts">
				<div class="row">
					
					<div class="col-md-12 col-12">
						<div class="card">
							<div class="card-header">
								<h6>( <span style="color:red;">*</span> indicates mandatory fields)</h6>
							</div>
							<div class="card-body">
								<form class="form form-vertical" method="POST">
									<div class="row col-12">
										<div class="col-md-6">
											<div class="mb-1">
												<label class="form-label" for="first-name-icon">Vehicle No<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text"><i data-feather="hash"></i></span>
													<input type="text" id="first-name-icon" class="form-control" name="fname-icon" placeholder="Vehicle No" />
												</div>
											</div>
										</div>
										<div class="col-md-6"></div>
										<div class="col-md-6">
											<div class="mb-1">
												<label class="form-label" for="first-name-icon">Date-Time<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text"><i data-feather="calendar"></i></span>
													<input type="date" id="first-name-icon" class="form-control abc" name="fname-icon" placeholder="Date-Time" />
												</div>
											</div>
										</div>
										<div class="col-md-6"></div>

										<div class="col-md-6">
											<div class="mb-1">
												<label class="form-label" for="first-name-icon">Driver<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text"><i data-feather="user"></i></span>
													<input type="text" id="first-name-icon" class="form-control" name="fname-icon" placeholder="Driver" />
												</div>
											</div>
										</div>
										<div class="col-md-6 mt-2">
											<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#myModal">Add New Driver</button>
										</div>

										<div class="col-md-6">
											<div class="mb-1">
												<label class="form-label" for="first-name-icon">Liters <span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text"><i data-feather="user"></i></span>
													<input type="text" id="first-name-icon" class="form-control" name="fname-icon" placeholder="Liters" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-check form-check-inline mt-2">
												<label class="form-check-label" for="inlineCheckbox1">Full Tank</label>
												<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="checked">
												 </div>
										</div>

										<div class="col-md-6">
											<div class="mb-1">
												<label class="form-label" for="password-icon">Amount<span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text"><i data-feather="dollar-sign"></i></span>
													<input type="password" id="password-icon" class="form-control" name="contact-icon" placeholder="Amount" />
												</div>
											</div>
										</div>
										<div class="col-md-6"></div>
									   
										<div class="col-md-6">
											<div class="mb-1">
												<label class="form-label" for="contact-info-icon">Odometer <span style="color:red;">*</span></label>
												<div class="input-group input-group-merge">
													<span class="input-group-text"><i data-feather="smartphone"></i></span>
													<input type="number" id="contact-info-icon" class="form-control" name="contact-icon" placeholder="Odometer" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-check form-check-inline mt-2">
												<label class="form-check-label" for="inlineCheckbox1">Odometer Reset </label>
												<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="checked">
												 </div>
										</div>

										<div class="col-md-6">
											<div class="mb-1">
												<label class="form-label" for="email-id-icon">Engine Hours</label>
												<div class="input-group input-group-merge">
													<span class="input-group-text"><i data-feather="clock"></i></span>
													<input type="text" id="email-id-icon" class="form-control" name="email-id-icon" placeholder="Engine Hours" />
												</div>
											</div>
										</div>
									<div class="col-md-6"></div>
									   <div class="col-md-6">
										<div class="mb-1">
											<label class="form-label" for="email-id-icon">Petrol Pump</label>
											<div class="input-group input-group-merge">
												<span class="input-group-text"><i data-feather="clock"></i></span>
												<input type="text" id="email-id-icon" class="form-control" name="email-id-icon" placeholder="Enter Petrol Pump" />
											</div>
										</div>
										</div>
										<div class="col-md-6"></div>

									 <div class="col-md-6">
										<div class="mb-1">
											<label class="form-label" for="remark">Remark</label>
											<textarea class="form-control" id="remark" rows="4"></textarea>

										</div>
										</div>
										<div class="col-md-6"></div>

									
								  <br /> <br />
									   
										<div class="col-12">
											<button type="Submit" class="btn btn-primary me-1">Submit</button>
										   
										</div>
										<p>We Recommend that you top up your tank at least once a week</p>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Basic Vertical form layout section end -->

		</div>
	</div>
</div>

<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Add New Driver</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
	
			<!-- Modal body -->
			<div class="modal-body">
				<form action="#" class="align-items-center">
					<div class="row col-12">
						<label for="formFile" class="form-label">Driver Id: </label>
						<input class="form-control" type="text" id="formFile">
					</div>
					<div class="row col-12">
						<label for="formFile" class="form-label">Driver Name: </label>
						<input class="form-control" type="text" id="formFile">
					</div>
	
				</form>
	
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Submit</button>
	
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
	
		</div>
	</div>
	</div>

<script>
	$(window).on('load', function () {
		if (feather) {
			feather.replace({
				width: 14,
				height: 14
			});
		}
	})
</script>
      <br>
      <%@ include file="footernew1.jsp"%> 
  </body>
</html>