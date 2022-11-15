<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew.jsp"%>


<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page"></jsp:useBean>
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
<link rel="stylesheet" href="bootstrap.min.css">
<link href="uiform/app.css" rel="stylesheet" type="text/css" />

<!-- Date & time -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="uiform/bootstrap-datetimepicker.css" rel="stylesheet"
	type="text/css" />
<script src="uiform/jquery.min.js"></script>
<script src="uiform/moment-with-locales.js"></script>
<script src="uiform/bootstrap-datetimepicker.js"></script>
<!-- For Icon -->

<!-- <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet" type="text/css" /> -->

<script>
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

	<%
	try {
			Class.forName(MM_dbConn_DRIVER);
			con1 = fleetview.ReturnConnection();
			Statement stmt1 = con1.createStatement();
			ResultSet rs2 = null, rs3 = null, rs4 = null, rs5 = null;
			String sql2 = "", sql3 = "", sql4 = "", sql5 = "";
			String user = session.getValue("usertypevalue").toString();
			String usertype = session.getValue("TypeofUser").toString();
			java.util.Date d = new java.util.Date();
			int hours = (d.getHours());
			int minutes = (d.getMinutes());
			String nwfrmtdte = new SimpleDateFormat("dd-MMM-yyyy")
					.format(new java.util.Date());
			DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

			Calendar now123=Calendar.getInstance();
			
			String sysdate22 = dateFormat.format(now123.getTime());
			System.out.println(">>>>>>>>>>>>>>>n "+sysdate22);

			
			
			
			
			
%>

	<div class="generic-container"
		style="margin-left: 275px; margin-top: 15px;">

		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead"><center>
						<b>Fuel Information</b>
					</center> </span>
			</div>
			<div class="formcontainer">
				<form name="fuelform" method="get" action="fuelentryinsrt.jsp"
					onSubmit="return validate();" class="form-horizontal">
					<input type="hidden" /> <b>(<font color="red"> *</font>
						indicates mandatory fields)
					</b>
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
					<br>
					<br>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="vehicleno"><font
								color="red"> * </font>Vehicle No :</label>
							<div class="col-md-7">
								<select class="form-control input-sm" name="vehs"
									style="width: 170px;">
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

					<!-- data-date-format="mm-dd-yyyy" -->



					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="fordatetime"><font
								color="red"> * </font>Date-Time :</label>
							<div class="col-md-7">
								<div class='input-group date' id='datetimepicker1'
									style="width: 190px;">
									<input type='text' id="fueldate" name="fueldate"
										class="form-control input-sm" /> <span
										class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
					</div>




					<%
	 	String sql7 = "select * from t_drivers where Owner='"+ user + "' order by DriverName asc";
		ResultSet rs7 = stmt1.executeQuery(sql7);
%>


					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="fordriver"><font
								color="red">* </font> Driver : </label>
							<div class="col-md-3">
								<select class="form-control input-sm" name="drivers"
									id="drivers" style="width: 170px;">
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
							<a class="col-md-2 control-lable"
								href="AddNewDriver.jsp?transporter=<%=user%>"> &nbsp;<span
								class="glyphicon glyphicon-plus"></span>Add New Driver
							</a>

							<%-- <a class="col-md-2 control-lable" href="AddNewDriver.jsp?transporter=<%=user%>"><i class="icon-pencil icon-2x"></i><font size="2">Add New Driver</font></a> --%>


						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" name="lits" for="forliters"><font
								color="red">* </font> Liters :</label>
							<div class="col-md-4">
								<input type="text" class="form-control input-sm" name="lits"
									placeholder="Enter Liters" style="width: 170px;">
							</div>

							<label class="col-md-2 control-lable" for="inputZip">Full
								Tank :</label> <input type="checkbox" class="form-check-input"
								name="fulltank" id="fulltank" value="Yes">

						</div>
					</div>


					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="foramt"><font
								color="red">* </font> Amount : </label>
							<div class="col-md-7">
								<input type="text" name="amount"
									class="username form-control input-sm"
									placeholder="Enter Amount" style="width: 170px;" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="odometer"><font
								color="red">* </font> Odometer : </label>
							<div class="col-md-4">
								<input type="text" class="form-control input-sm" name="odometer"
									placeholder="Enter Odometer" style="width: 170px;">
							</div>

							<label class="col-md-2 control-lable" for="forodo">Odometer
								Reset : </label> <input type="checkbox" class="form-check-input"
								name="Reset" id="Reset" value="OdometerReset">

						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="foramt">Engine
								Hours:</label>
							<div class="col-md-8">
								<input type="text" name="ehours" id="ehours"
									class="username form-control input-sm"
									placeholder="Enter Engine Hrs" style="width: 170px;" />
							</div>
						</div>
					</div>




					<%
		 	       	if (session.getAttribute("fuelformat").toString()
 	       					.equalsIgnoreCase("Gal")) {
%>


					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="forgstation">Gas
								Station :</label>
							<div class="col-md-7">
								<input type="text" name="petpump"
									class="username form-control input-sm"
									placeholder="Enter Gas Sation" required />

							</div>
						</div>
					</div>
					<%
 					} else {
%>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="forpump">Petrol
								Pump :</label>
							<div class="col-md-7">
								<input type="text" name="petpump"
									class="username form-control input-sm"
									placeholder="Enter Petrol Pump" />

							</div>
						</div>
					</div>
					<%}%>
					<!--                       <a href=""><i class=" icon-briefcase icon-2x"></i>Portfolio</a> -->




					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="forremark">Remark
								: </label>
							<div class="col-md-7">
								<textarea class="form-control" id="cmntreason" name="remark"
									rows="3" placeholder="Enter Remark Here"></textarea>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="text-center">
							<input type="submit" value="Submit"
								class="btn btn-primary btn-sm">
							<!--  <button type="button"  class="btn btn-warning btn-sm" >Reset Form</button> -->
						</div>
					</div>

					<font size="2" style="font-weight: bold;">
						<center>We recommend that you top up your tank at least
							once a week</center>
					</font>

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
					<%
		//fleetview.closeConnection();
	%>

				</form>
			</div>
		</div>

	</div>
	<br>
	<%@ include file="footernew.jsp"%>
</body>
</html>