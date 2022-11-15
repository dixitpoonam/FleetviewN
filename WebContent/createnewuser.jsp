<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp"%>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page">
	<%
		fleetview.getConnection(MM_dbConn_DRIVER, MM_dbConn_STRING,
					MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	%>
	<%!Connection con1;%>

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


<script>
     /* $(document).ready(function(){

   $("#datepicker").datepicker({ 
   	        autoclose: true, 
   	        todayHighlight: true, format: 'd-M-yyyy',
   	  }).datepicker('update', new Date());
   	});
     
     $("#datepicker2").datepicker({ 
	        autoclose: true, 
	         format: 'd-M-yyyy',dateLimit: { days: 7 },

     }).datepicker('update', new Date());  */
     
     
/* 	  var date = new Date();
	  var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
	  var end = new Date(date.getFullYear(), date.getMonth(), date.getDate()); */

/* 	  $('#datepicker').datepicker({
	format: "mm/dd/yyyy",
	todayHighlight: true,
	startDate: today,
	endDate: end,
	autoclose: true
	  });
	  $('#datepicker2').datepicker({
	format: "mm/dd/yyyy",
	todayHighlight: true,
	startDate: today, dateLimit: { days: 7 },
	endDate: end,
	autoclose: true
	  });

	  $('#datepicker,#datepicker2').datepicker('setDate', today); */
     
     function validateUsr(){
		  alert("Please Enter Value for UserName/Email_Id");
	     	var usrname=document.getElementById("usrname").value;
	     	if(usrname=="")
	     		{
	     			document.getElementById("UnameLabel").style.display= "";
	     			return false;
	     		}
	  }

     function  validateFnm()
     {
     	
     	
     	var fname=document.getElementById("fname").value;
     	
     	    if(fname=="" || fname==" " || fname==null) 
     	    {
     	    	//alert(1234);
     	        document.getElementById("FnameLabel").style.display = "";
     	        return false;
     	    }
     	}



     function  validateLnm()
     {
     	//alert("Please Enter Value for LastName");
     	var lname=document.getElementById("lname").value;
     	if(lname=="" || lname==" " || lname==null)
     		{
     			document.getElementById("LnameLabel").style.display= "";
     			return false;
     		}
     	
     }
     function  validatefrom()
     {
     	//alert("Allocate From Date  from Calender ");
     	var allocdate=document.getElementById("allocdate").value;
     	if(allocdate=="" || allocdate==" " || allocdate==null)
     	{
     		document.getElementById("Valdate").style.display= "";
     		return false;
     	}
     	
     }
     /* function  validatetill()
     {
     	//alert("Allocate Till Date from Calender ");
     	//return false;
     	 
     } 
      function  validateVehicle()
     {
     	//alert("Allocate Vehicle  ");
     	var addVeh=document.getElementById("assigned").value;
     	if(addVeh=="" || addVeh==" " || addVeh==null)
     		{
     		//alert("Allocate Vehicle  ");
     			document.getElementById("AddVeh").style.display= "";
     			return false;
     		}
     	 
     } */

     function dateformat1(days)
     {
     	 if(days==1)
     		return('Jan');
     	 else
     		if(days==2)
     			return('Feb');
     		else
     			if(days==3)
     				return('Mar');
     			else
     				if(days==4)
     					return('Apr');
     				else
     					if(days==5) //timeformat: "%M:%S"
     						
     						return('May');
     					else
     						if(days==6)
     							return('Jun');
     						else
     							if(days==7)
     								return('Jul');
     							else
     								if(days==8)
     									return('Aug');
     								else
     									if(days==9)
     										return('Sep');
     									else
     										if(days==10)
     											return('Oct');
     										else
     											if(days==11)
     												return('Nov');
     											else
     												if(days==12)
     													return('Dec');
      }

     function returnexpdt()
     {
     	try
     	{
     	var dt =document.getElementById("allocdate").value;
     	var date,mon,year;
     	date = dt.substring(0,2);
     	mon = dt.substring(3,6);
     	year = dt.substring(7,11);
     	var mon1 = dateformat(mon);
       	 var dt2 = new Date(mon1+"/"+date+"/"+year); 
     	 dt2.setDate(dt2.getDate()+7);
     	//alert("88888888888  "+dt2);
      	var date1 = ""+dt2.getDate(); 
      	var month = dt2.getMonth()+1;
      	month = dateformat1(month);
      	var year1 = dt2.getFullYear();
     	//alert("88888888888  "+month);
     	if(date1.length == 1)
     	{
     		date1 = "0"+date1;
     	}
     	document.getElementById("expdate").value = date1+"-"+month+"-"+year1;
        //	alert(document.getElementById("expdate").value);
     	}
     	catch(e)
     	{
     		//alert(e);
     	}
     	
     }

     function validateuser()
     {

     	try
     	{
     		
     var usr = document.getElementById("usrname").value;
     //var pwd = document.getElementById("pwd").value;
     //var cnfpwd = document.getElementById("cnfpwd").value;
     var fname = document.getElementById("fname").value;
     var lname = document.getElementById("lname").value;
     var phno = document.getElementById("phno").value;
     var loc = document.getElementById("loc").value;
     var desg = document.getElementById("desg").value;
     var desg = document.getElementById("desg").value;
     var dest =  document.createuser.assigned;
     var dest1 = document.createuser.assigned1;
     //alert(dest.length);

     var Val2 = document.getElementsByName("trk");
     var flg2=0;
      for ( var i = 0; i < Val2.length; i++ ) 
     	  {	
     		if ( Val2[i].checked==true)
     	 		{
     			TChkAdhJ =Val2[i].value;
     			if ( Val2[i].value=='IAL')
     				{
     				flg2=1;
     				document.getElementById("UserType").value=Val2[i].value;
     				}
     		 }	
     	  }



     var desg = document.getElementById("desg").value;

     if(usr == "")
     {
     	alert("Please enter the username!!");
     	
     	return false;
     }
     else if(flg2=="1")
     {
     	//alert("You Selected IAL User!!");

     }
      else
     {
        	var usrname = validateEmail(usr);
     	if(!usrname)
     	{
     		alert("Enter Valid email_ID!!");
     		
     		return false;
     	}
     } 
     /*if(pwd == "")
     {
     	alert("Please enter the password!!");
     	return false;
     }

     //alert(cnfpwd);
     //alert(pwd);
     //alert(pwd != cnfpwd);
     if(pwd != cnfpwd)
     {
     	alert("Confirm password doesn't match with password!!");
     	return false;
     }
     */

     if(fname == "")
     {
     	alert("Please enter the FirstName!!");
     	
     	return false;
     }

     if(lname == "")
     {
     	alert("Please enter the LastName!!");
     	
     	return false;
     }

     if(phno == "")
     {
     	//alert("Please enter the Phone No!!");
     	
     	//return false;
     }
     else
     {
     	if(isNaN(phno))
     	{
     		alert("Contact No should be numeric!!");
     		
     		return false;
     	}
     }


     //alert(dest.length);
     if(dest.length == 0)
     {
     	alert("Please Allocate the vehicles to the user!!");
     	
     	return false;
     }

     //alert(dest.options.length);

     try
     {
     //alert("HIiiii");


     for(var count=0; count < dest.options.length; count++) {   
                 var option = dest.options[count];

                 var newOption = document.createElement("option");
                 newOption.value = option.value;
                 newOption.text = option.text;
                 newOption.selected = true;
                 try {
                          dest1.add(newOption, null); //Standard
                          dest.remove(count, null);
                  }catch(error) {
                          dest1.add(newOption); // IE only
                          dest.remove(count);
                  }
                 count--;
       
     }
     }
     catch(e)
     {
     	//alert(e);
     }

     //return datevalidate();
     	}
     	catch(e)
     	{
     		alert(e);
     		return false;
     		
     	}
     	return true;
     }

     function datevalidate()
     {
     	try
     	{
     	//alert("***");
     	var date1=document.getElementById("allocdate").value;
     	var date2 = document.getElementById("expdate").value;
     	var dm1,dd1,dy1,dm2,dd2,dy2;
     	var dd11,yy11,mm1,mm11,dd12,yy12,mm2,mm12;
     	var dm1,dd1,dy1,dm2,dd2,dy2;
     	var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;
     	dd11=date1.substring(0,2);
     	dd22=date2.substring(0,2);
     	mm1=date1.substring(3,6);
     	mm2=date2.substring(3,6);
     	mm11=dateformat(mm1);
     	mm22=dateformat(mm2);
     	yy11=date1.substring(7,11);
     	yy22=date2.substring(7,11);
     	var date=new Date();
     	var month=date.getMonth()+1;
     	var day=date.getDate();
     	var year=date.getFullYear();
     	
        // alert("yy11  "+yy11+"  year   "+year);
       //  alert("mm11  "+mm11+"  month   "+month);
        // alert("dd11  "+dd11+"  day   "+day);
     if(date1 == "" | date2 == "")
     {
     	alert("Please enter the Allocation Date and Expiry Date");
     	
     	return false;
     }
     else
     {
     	if(yy11< year | yy22< year)
     	{
     		alert("selected date should not be Less than todays date");
     		//alert("year");
     		document.getElementById("allocdate").value="";
     		document.getElementById("expdate").value="";
     		document.getElementById("allocdate").focus;
     		
     		return false;
     	} 
     	else if(year==yy11 & year==yy22)
     	{
     		if(mm11<month  | mm22<month)
     		{
     			alert("selected date should not be Less than todays date");
     			//alert("month");
     			document.getElementById("allocdate").value="";
     		document.getElementById("expdate").value="";
     		document.getElementById("allocdate").focus;
     			return false;
     		}
     	}
     	if(mm11==month  & mm22==month)
     	{
     		if(dd11<day  | dd22<day)
     		{
     			alert("selected date should not be Less than todays date");
     			//alert("day");
     			document.getElementById("allocdate").value="";
     		document.getElementById("expdate").value="";
     		document.getElementById("allocdate").focus;
     			return false;
     		}
     	}
     	//  alert("yy11  "+yy11+"  year   "+year);
     	 //  alert("mm11  "+mm11+"  month   "+month);
     	  //  alert("dd11  "+dd11+"  day   "+day);

     	   // alert("yy22  "+yy11+"  year   "+year);
     		 //  alert("mm22  "+mm11+"  month   "+month);
     		 //   alert("dd22  "+dd11+"  day   "+day);

     		  //  alert("yy22  "+yy22+"  yy11   "+yy11);
     			//   alert("mm22  "+yy22+"  mm11   "+mm11);
     			  //  alert("dd22  "+yy22+"  dd11   "+dd11);
     	if(yy11 > yy22)
     	{
     		alert("Allocation date year should not be greater than Expiry date year");
     		document.getElementById("allocdate").value="";
     		document.getElementById("expdate").value="";
     		document.getElementById("allocdate").focus;
     		return false;
     	}
     	else if(year==yy11 & year==yy22)
     	{
     		 if(mm11>mm22)
     	{
     		alert("Allocation date year should not be greater than Expiry date year");
     		document.getElementById("allocdate").value="";
     		document.getElementById("expdate").value="";
     		document.getElementById("allocdate").focus;
     		return false;
     	}
     	}
     	if(mm11==month & mm22==month) 
     	{
     		if(yy11==yy22)
     		{
     		if(dd11 > dd22)
     		{
     			alert("Allocation date year should not be greater than Expiry date year");
     			document.getElementById("allocdate").value="";
     			document.getElementById("expdate").value="";
     			document.getElementById("allocdate").focus;
     			return false;
     		}
     		}
     	}
     	else
     		if(yy11<yy22)
     		{
     			return true;
     		}
     	else
     		if(dd11 > dd22)
     	{
     			if(mm11<mm22)
     			{
     				return true;
     			}
     			
     		alert("Allocation date year should not be greater than Expiry  date year");
     		document.getElementById("allocdate").value="";
     		document.getElementById("expdate").value="";
     		document.getElementById("allocdate").focus;
     		return false;
     	}
     }
     	}
     	catch(e)
     	{
     		alert(e);
     	}
     	return true;
     }

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
     					if(days=='May') //timeformat: "%M:%S"
     						
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

     function validateEmail(usrname)
     {
         var splitted = usrname.match("^(.+)@(.+)$");
         if(splitted == null) return false;
         if(splitted[1] != null )
         {
           var regexp_user=/^\"?[\w-_\.]*\"?$/;
           if(splitted[1].match(regexp_user) == null) return false;
         }
         if(splitted[2] != null)
         {
           var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
           if(splitted[2].match(regexp_domain) == null) 
           {
     	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
     	    if(splitted[2].match(regexp_ip) == null) return false;
           }// if
           return true;
         }
     return false;

     var flag = false;
     var pattern=/^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+\.([a-zA-Z])+([a-zA-Z])+/;
     var pattern1 = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;  

     if(pattern1.test(email))
     {
     	flag = true;
     }
     else
     {
     	if(pattern.test(email))
     	{
     		flag = true;
     	}
     	else
     	{
     		flag = false;
     	}
     }
     if(flag)
     {
     	return true;
     }
     else
     {
     	return false;
     }

     }
     
   /*   function addusernew()
     {
    	 var a=document.getElementById("resources").value;
    	 alert ("aaa "+a);
     } */
     
     </script>
<script>
function addUser(){
	//alert("hi...in add user");
	try
 	{
 	//alert("HIiiii");
     var src = document.createuser.resources;
     var dest = document.createuser.assigned;
     //alert("1");
     for(var count=0; count < src.options.length; count++) {
    	// alert("2");
         if(src.options[count].selected == true) {
        	 //alert("3");
                 var option = src.options[count];
  
                 var newOption = document.createElement("option");
                 newOption.value = option.value;
                 newOption.text = option.text; 
                 newOption.selected = false;
                 try {
                          dest.add(newOption, null); //Standard
                          src.remove(count, null);
                  }catch(error) {
                          dest.add(newOption); // IE only
                          src.remove(count);
                  }
                 count--;
         }
     }
 	}
 	catch(e)
 	{
 		alert(e);
 	}
}

function removeUser(){
	//alert("hi in remove user");
	var src =document.createuser.assigned;
    var dest =  document.createuser.resources;
 
    for(var count=0; count < src.options.length; count++) {
 
        if(src.options[count].selected == true) {
                var option = src.options[count];
 
                var newOption = document.createElement("option");
                newOption.value = option.value;
                newOption.text = option.text;
                newOption.selected = false;
                try {
                         dest.add(newOption, null); //Standard
                         src.remove(count, null);
                        
                 }catch(error) {
                         dest.add(newOption); // IE only
                         src.remove(count);
                        
                 }
                count--;
        }
    }
}
</script>



<%

String usrname="";
String fname="";
String lname="";
String phno="";
String loc="";
String desg="";
String allocdate="";
String expdate="";
String Msg=request.getParameter("Msg");
System.out.println("******    "+Msg);
if(Msg!=null && Msg.equalsIgnoreCase("1"))
{
	%>
<script>
	alert("Username already exist!!");
	</script>
<%
	
}
else
	if(Msg!=null && Msg.equalsIgnoreCase("2"))
	{
		%>
<script>
		alert("FirstName and LastName already exist!!");
		</script>
<%
		
	}
	else
		if(Msg!=null && Msg.equalsIgnoreCase("3"))
		{
			%>
<script>
			alert("User created Successfully.");
			</script>
<%
			
		}

%>

</head>
<body>
	<%
try {
//System.out.println("$$$$$$$$$   ");
Class.forName(MM_dbConn_DRIVER);
con1 = fleetview.ReturnConnection();
Statement st = con1.createStatement();
String vehlist = session.getAttribute("VehList").toString();
String nwfrmtdte = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
java.util.Date date = new SimpleDateFormat("dd-MMM-yyyy").parse(nwfrmtdte);
Calendar cal=Calendar.getInstance();
cal.add(Calendar.WEEK_OF_MONTH,1);
String date1 = new SimpleDateFormat("dd-MMM-yyyy").format(cal.getTime());

//String FileUploadPath =getServletContext().getInitParameter("configuredUploadDir"); 
//out.println("FileUploadPath   "+FileUploadPath);
//File uploadDir = new File(FileUploadPath);
//out.println("IIIIIII  "+uploadDir.toString());
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
							<h3 class="content-header-title  mb-0" style="color: #060637">Create
								New Login ID</h3>
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
					
						<div class="col-md-12 col-12">
							<div class="card">
								<div class="card-header">
									<h6 style="color: red;">
										( <span style="color: red;">*</span> indicates mandatory
										fields)
									</h6>
								</div>
								<div class="card-body card">
									<!-- Start card body -->
									<form id="createuser" enctype="multipart/form-data" method="get"
					action="insertnewuser.jsp" onsubmit="return validateuser();"
					name="createuser"></form> 
									<!-- <form id="createuser" enctype="multipart/form-data"
										method="get" action=" " onsubmit="return validateuser();"
										name="createuser"> -->
										
									<div class="row col-12">
										<div class="col-4">
											<div class="md-2">
												<label for=" User Name:-" class="tcolor"><font
													color="red">*</font><b>Email ID: </b></label><br> 
													<input class="form-control" type="text" placeholder="Enter Email ID" id="usrname" name="usrname"
													    onblur="validateUsr()">
												    
												    <p style="color: orange;">Password will be sent to this
													mail id.</p>
											</div>
										</div>
									</div>
									<div class="row col-12">
										<div class="col-6">
											<div class="md-2">
												<label for="FnameLabel" id="FnameLabel" class="tcolor"><font
													color="red">*</font><b> First Name:</b></label><br> 
													<input class="form-control" type="text" id="fname" name="fname"
													  value="" onblur="validateFnm()" placeholder=" Enter your First Name:-">
											</div>
										</div>
										<div class="col-6">
											<label for="Last Name" class="tcolor" for="LnameLabel"
												id="LnameLabel"><font color="red">*</font><b>
													Last Name:</b></label><br> <input class="form-control" type="text"
												id="lname" name="lname" value=""
												onblur="validateLnm()"
												placeholder="Enter your Last Name">
										</div>
									</div>
									<div class="row col-12">

										<div class="col-4">
											<label for=" Designation:-" class="tcolor"><b>
													Contact No:</b></label><br> <input class="form-control"
												type="text" id="phno" name="phno" value=""
												placeholder="Enter your  Designation:-">
										</div>
										<div class="col-4">
											<label for="Old Password:-" class="tcolor"><b>Location:
											</b></label><br> <input class="form-control" type="text" id="loc"
												name="loc" value="" placeholder="Enter your Loaction">

										</div>
										<div class="col-4">
											<label for="  New Password:-" class="tcolor"><b>
													Designation:</b></label><br> <input class="form-control"
												type="text" id="desg" name="desg" value=""
												onblur="return validateLnm();"
												placeholder="Enter your Designation">

										</div>
									</div>
									<div class="row col-12">
										<div class="col-4">
											<div class="mb-2">
												<label class="tcolor"><font color="red">*</font>Allocate
													From:</label>
												<div class="input-group input-group-merge"  id="datepicker">
													<input type="text" id="allocdate" name="allocdate"
														readonly="readonly" onblur="return validatefrom();"
														class="form-control" value="<%=nwfrmtdte %>"
														<% System.out.println("Todays date"+nwfrmtdte);%>
														<%-- value="<%=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date())%>" --%> />
													<span class="input-group-text"><svg
															xmlns="http://www.w3.org/2000/svg" width="14" height="14"
															viewBox="0 0 24 24" fill="none" stroke="currentColor"
															stroke-width="2" stroke-linecap="round"
															stroke-linejoin="round" class="feather feather-calendar">
																<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
																<line x1="16" y1="2" x2="16" y2="6"></line>
																<line x1="8" y1="2" x2="8" y2="6"></line>
																<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
												</div>

											</div>
										</div>
										<div class="col-4">
											<div class="mb-2">
												<label class="tcolor"><font color="red">*</font>Allocate
													Till:</label>
												<div class="input-group input-group-merge"  id="datepicker2">
													<%System.out.println("Date11111"+date1); %>
													<input type="text" id="expdate" name="expdate"
														value="<%=date1 %>" onblur="return datevalidate();"
														readonly="readonly" class="form-control" value=" " /> <span
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

											</div>
										</div>
									</div>
									<div class="row col-12">
										<div class="col-md-3">
											<label class="tcolor">User Type:</label><br>
											<div class="form-check">
												<input class="form-check-input" type="radio" value="EndUser"
													id="trk" name="trk" checked="checked"> <label
													class="form-check-label tcolor" for="flexRadioDefault1">End
													User:</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check mt-2">
												<input class="form-check-input" type="radio" value="Group"
													id="trk" name="trk"> <label
													class="form-check-label tcolor" for="flexRadioDefault2">Group:</label>
											</div>
										</div>
										<%
					if(session.getAttribute("usertypevaluemain").toString().equalsIgnoreCase("IAL_INDIA") || (session.getAttribute("usertypevaluemain").toString().equalsIgnoreCase("ALL") && session.getAttribute("usertypevalue").toString().equalsIgnoreCase("IAL_INDIA")))
					{
					%>
										<div class="col-md-2">
											<label class=" control-lable" for="forodo">&nbsp;&nbsp;&nbsp;IAL
												: </label> &nbsp;&nbsp;&nbsp;<input class="form-check-input"
												type="radio" value="IAL" id="trk" name="trk">
										</div>
										<%
					}
				%>
									</div>
								
								<div class="row">
									<div class="col-3 px-3">
										<label class="tcolor"><b>Allocate
												Vehicles:</b></label><br>
												 <input type="hidden" name="UserType" id="UserType" value=""></input>
										<div class="input-container">
											<select class="form-select" name="resources" id="resources"
												 aria-label="Default select example"
												style="width: 300px" size="7" multiple="multiple">

												<%
		String sql = "select VehicleRegNumber from db_gps.t_vehicledetails where vehiclecode in "+vehlist+" order by VehicleRegNumber";
		ResultSet rs = st.executeQuery(sql);
		int i=0;
		
		while(rs.next())
		{
			System.out.println("*******");
			%>
												<option value="<%=rs.getString("VehicleRegNumber") %>"><%=rs.getString("VehicleRegNumber") %></option>
												<%
	i++;
	}
	
	%>


											</select>
										</div>
									</div>
									<!-- <div class="col-4">
									  <input type="button" id="add" name="add" class="button"
									value="&gt;" style="font-weight: bold;" onClick="addUser();" />
								      <br> <br>
								
								 <input type="button" class="button"
									value="&lt;" onClick="removeUser()" style="font-weight: bold;" />
									
									</div> -->
									
									 <div class="col-3">
										<div class="d-grid gap-2 col-2 mx-auto mt-3">
										  
											<input type="button" class="btn btn-outline-primary"
												id="add" name="add" value="&gt;" onclick="addUser()"></input>
										</div>
                                        <% System.out.println("afterr move..."); %>

										<div class="d-grid gap-2 col-2 mx-auto mt-3">
											<input type="button" class="btn btn-outline-primary"
												value="&lt;" onclick="removeUser()"></input>
										</div>

									</div>
									<% System.out.println("afterr move..."); %>
									
									<div class="col-3">
										<label for="Old Password:-" class="tcolor"><b></b></label><br>
										<div class="input-container">
											<select class="form-select" name="assigned" id="assigned"
												multiple="multiple" onblur="return validateVehicle();"
												aria-label="Default select example" style="width: 300px"
												size="7">
												<option selected></option>

											</select> <select name="assigned1" style="width: 160px; display: none"
												size="7">

											</select>

										</div>
									</div>
								</div>

								<div class="d-grid gap-2 col-6 mx-auto mt-2 btn2">
									<input class="btn btn-primary btn2" type="submit" value="Submit"></input>
								</div>
								
								<%
		} catch (Exception e) {
			out.println("Please Select The Transporter");
		} finally {
			try {
			} catch (Exception e) {
				con1.close();
			}
			try {
				fleetview.closeConnection();
			} catch (Exception e) {
			}
		}
		%>
								</form>
								</div>
								

								
							</div>
							<!--  end of card body -->
						</div>
					
			
			</section>
			<!-- Basic Vertical form layout section end -->
		</div>
	</div>
	<!--  end content body -->
	
	</div><!-- end content wrapper-->
	
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
</jsp:useBean>