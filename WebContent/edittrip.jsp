<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*"
	import=" java.text.*" import="moreservlets.listeners.*" errorPage=""%>

<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="javax.activation.*"%>
<%@ include file="headernew1.jsp"%>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page">
	<%
		fleetview.getConnection(MM_dbConn_DRIVER, MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

			//	String buffer=request.getParameter("buffer");
			//	System.out.println("buffer--------------------->"  +buffer);
	%>
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

<script language="javascript">
	function formValidation() {

		// alphanumeric
		// email
	}
	var showothstartloc = "No";
	var showothdestloc = "No";
	var showothdrivid = "No";
	var tripgen = "No";
	var showothvendorr = "No";
	var showothLoadreasonn = "No";
	var othTripCategoryy = "No";
	var othGoodsContentt = "No";
	var strtend = "";

	function newcontainer() {
		//alert("in job order");
		var newempid123 = document.tripform.containerno.value;

		document.getElementById("newcontainerno").style.display = "none";
		if (newempid123 == null || newempid123 == "" || newempid123.length == 0) {
			//document.getElementById("abc").style.display="none";
			document.getElementById("newcontainerno").style.display = "";
		}
	}

	function cancelbutton()

	{

		location = 'currentposition2.jsp';
		//alert("in cancel 1");

		/*      document.getElementById("mytable").style.visibility="hidden";
		    //alert("in cancel 2");
		     document.tripform.action ="currentposition2.jsp";
		  //alert("in cancel 3");
		document.forms["tripform"].submit(); */
		//alert("in cancel 4");
	}

	function validate() {
		try {
			var v6 = document.tripform.calender.value;
			var v7 = document.tripform.sttime1.value;
			// var v77=document.tripform.sttime2.value;
			//alert("jhgsd--->"+document.tripform.dest1.value);  
			var v8 = document.tripform.dest.value;
			var v9 = document.tripform.driverid.value;
			var v99 = document.tripform.vendor.value;
			//var v99=document.tripform.vendor.value;
			var v10 = document.tripform.tripid.value;
			var v19 = document.tripform.joborderno.value;
			var fkms = document.tripform.fxdkm.value;//document.getElementById("fxdkm").value;
			var ftime = document.tripform.ftme.value;//document.getElementById("fxtme").value;
			var weit = document.tripform.weight.value;
			var friegh = document.tripform.frie.value;
			var adva = document.tripform.adv.value;
			var lrissue = document.tripform.lrissue.value;
			var lrcontact = document.tripform.lrcontact.value;
			var revenue = document.tripform.revenue.value;
			var branchcode = document.tripform.bcode.value;
			var tokenchargespaid = document.tripform.element_3_20.value;

			var invalidbranchcode = /^[A-Z a-z 0-9]+$/;
			/* var v20=document.tripform.containerno.value;
			v20=v20.trim();
			 *///alert("v20"+v20);
			var etadate = document.tripform.etadate.value;
			var etatime1 = document.tripform.etatime1.value;
			var drivname = document.getElementById("newdrivname").value;
			var drivvalid = /^[A-Z a-z .]+$/;
			var numericExpressionn = /^[.0-9]+$/;
			var numericExpressionn1 = /^[.:0-9]+$/;

			if (document.tripform.route[0].checked == true) {
				var fixroute = document.tripform.routename.value;

				if (fixroute == "Select") {
					alert("Please select the Fixed route");
					return false;
				}

				{
					console.log("inside datevalidate");
					var date1 = document.getElementById("calender").value;
					var date2 = document.getElementById("calender1").value;
					var date3 = document.getElementById("etadate").value;
					var timehr1 = document.getElementById("rpttime1").value;
					var timemin1 = document.getElementById("rpttime2").value;
					var timehr2 = document.getElementById("sttime1").value;
					var timemin2 = document.getElementById("sttime2").value;
					var timehr3 = document.getElementById("etatime1").value;
					var timemin3 = document.getElementById("etatime2").value;

					var tripissue = document.getElementById("element_3_3").value;

					var dm1, dd1, dy1, dm2, dd2, dy2;
					var dd11, yy11, mm1, mm2, mm11, dd22, yy22, mm22, dd33, mm3, mm33, yy33;

					dd11 = date1.substring(0, 2);
					dd22 = date2.substring(0, 2);
					dd33 = date3.substring(0, 2);
					dd44 = tripissue.substring(0, 2);

					mm1 = date1.substring(3, 6);
					mm2 = date2.substring(3, 6);
					mm3 = date3.substring(3, 6);
					mm4 = tripissue.substring(3, 6);

					mm11 = dateformat(mm1);
					mm22 = dateformat(mm2);
					mm33 = dateformat(mm3);
					mm44 = dateformat(mm4);

					yy11 = date1.substring(7, 11);
					yy22 = date2.substring(7, 11);
					yy33 = date3.substring(7, 11);
					yy44 = tripissue.substring(7, 11);

					if (yy11 < yy22) {
						alert("Start date should not be smaller than report date");

						return false;
					} else if (yy22 == yy11) {
						if (mm11 < mm22) {
							alert("Start date should not be smaller than report date");

							return false;
						} else if (mm11 == mm22) {
							if (dd11 < dd22) {
								alert("Start date should not be smaller than report date");

								return false;
							} else if (dd11 == dd22) {

								if (timehr2 < timehr1) {
									alert("Start time should not be smaller than report time");
									return false;
								}

								else if (timehr2 == timehr1) {
									if (timemin2 < timemin1) {
										alert("Start time should not be smaller than report time");

										return false;
									}
								}

							}
						}
					}

					if (yy33 < yy11) {
						alert("ETA date should not be smaller than Start date");

						return false;
					} else if (yy33 == yy11) {
						if (mm33 < mm11) {
							alert("ETA date should not be smaller than Start date");

							return false;
						} else if (mm33 == mm11) {
							if (dd33 < dd11) {
								alert("ETA date should not be smaller than Start date");

								return false;
							} else if (dd33 == dd11) {
								if (timehr3 < timehr2) {
									alert("ETA time should not be smaller than Start time");
									return false;
								}

								else if (timehr3 == timehr2) {
									if (timemin3 < timemin2) {
										alert("ETA time should not be smaller than Start time");

										return false;
									}
								}
							}

						}
					}

					if (yy33 == yy11 && mm33 == mm11 && dd33 == dd11
							&& timehr3 == timehr2 && timemin3 == timemin2)

					{
						alert("ETA Date and time should not be same as Start Date and time");

						return false;
					}

					if (yy22 == yy11 && mm11 == mm22 && dd11 == dd22
							&& timehr2 == timehr1 && timemin2 == timemin1) {
						alert("Start Date and time should not be same as Report Date and time");

						return false;
					}

					if (yy44 > yy22 || (dd44 > dd22) || (mm44 > mm22)) {
						alert("Trip Issue date should be less than or  equal to Report Date");
						return false;
					}

					if (v10 == "") {
						alert("Please enter Trip Id");
						return false;
					}

					if (v99 == "" || v99 == "Select") {
						alert("Please Select Customer");
						return false;
					}
					if (v9 == "Select") {
						alert("Please select Driver Id (Name) from the list");
						return false;
					}

					if (showothvendorr == "Yes") {
						var v111 = document.tripform.othvendor.value;
						var invalidcustomer = /^[A-Z a-z]+$/;
						if (v111.length == 0) {
							alert("Please enter new Customer");
							return false;
						}
						if (v111.length != 0 && !invalidcustomer.test(v111)) {
							alert("Please Enter Only Character  Value for Customer");
							return false;
						}
					}

					var name = document.getElementById("element_3_21").value;
					var invalid = /^[a-zA-Z .]+$/;

					if (!invalid.test(name) && !((name == "" || name == null))) {
						alert("Please Enter Character Value for Sales Person");
						//document.getElementById("fatherlabel").style.display="";
						return false;
					}

					//Spfunction();
					/* return true; */
				}

			} else {
				var stloc = document.tripform.stloc.value;
				var dest = document.tripform.dest.value;

				if (stloc == "Select") {
					alert("Please select Start Location");
					return false;
				}

				if (dest == "Select") {
					alert("Please select Destination");
					return false;
				}

				/*if(stloc==dest)
				{
					alert("Start Location and Destination cannot be same");
				   return false;
				}*/

				{
					console.log("inside datevalidate");
					var date1 = document.getElementById("calender").value;
					var date2 = document.getElementById("calender1").value;
					var date3 = document.getElementById("etadate").value;
					var timehr1 = document.getElementById("rpttime1").value;
					var timemin1 = document.getElementById("rpttime2").value;
					var timehr2 = document.getElementById("sttime1").value;
					var timemin2 = document.getElementById("sttime2").value;
					var timehr3 = document.getElementById("etatime1").value;
					var timemin3 = document.getElementById("etatime2").value;

					var tripissue = document.getElementById("element_3_3").value;

					var dm1, dd1, dy1, dm2, dd2, dy2;
					var dd11, yy11, mm1, mm2, mm11, dd22, yy22, mm22, dd33, mm3, mm33, yy33;

					dd11 = date1.substring(0, 2);
					dd22 = date2.substring(0, 2);
					dd33 = date3.substring(0, 2);
					dd44 = tripissue.substring(0, 2);

					mm1 = date1.substring(3, 6);
					mm2 = date2.substring(3, 6);
					mm3 = date3.substring(3, 6);
					mm4 = tripissue.substring(3, 6);

					mm11 = dateformat(mm1);
					mm22 = dateformat(mm2);
					mm33 = dateformat(mm3);
					mm44 = dateformat(mm4);

					yy11 = date1.substring(7, 11);
					yy22 = date2.substring(7, 11);
					yy33 = date3.substring(7, 11);
					yy44 = tripissue.substring(7, 11);

					if (yy11 < yy22) {
						alert("Start date should not be smaller than report date");

						return false;
					} else if (yy22 == yy11) {
						if (mm11 < mm22) {
							alert("Start date should not be smaller than report date");

							return false;
						} else if (mm11 == mm22) {
							if (dd11 < dd22) {
								alert("Start date should not be smaller than report date");

								return false;
							} else if (dd11 == dd22) {

								if (timehr2 < timehr1) {
									alert("Start time should not be smaller than report time");
									return false;
								}

								else if (timehr2 == timehr1) {
									if (timemin2 < timemin1) {
										alert("Start time should not be smaller than report time");

										return false;
									}
								}

							}
						}
					}

					if (yy33 < yy11) {
						alert("ETA date should not be smaller than Start date");

						return false;
					} else if (yy33 == yy11) {
						if (mm33 < mm11) {
							alert("ETA date should not be smaller than Start date");

							return false;
						} else if (mm33 == mm11) {
							if (dd33 < dd11) {
								alert("ETA date should not be smaller than Start date");

								return false;
							} else if (dd33 == dd11) {
								if (timehr3 < timehr2) {
									alert("ETA time should not be smaller than Start time");
									return false;
								}

								else if (timehr3 == timehr2) {
									if (timemin3 < timemin2) {
										alert("ETA time should not be smaller than Start time");

										return false;
									}
								}
							}

						}
					}

					if (yy33 == yy11 && mm33 == mm11 && dd33 == dd11
							&& timehr3 == timehr2 && timemin3 == timemin2)

					{
						alert("ETA Date and time should not be same as Start Date and time");

						return false;
					}

					if (yy22 == yy11 && mm11 == mm22 && dd11 == dd22
							&& timehr2 == timehr1 && timemin2 == timemin1) {
						alert("Start Date and time should not be same as Report Date and time");

						return false;
					}

					if (yy44 > yy22 || (dd44 > dd22) || (mm44 > mm22)) {
						alert("Trip Issue date should be less than or  equal to Report Date");
						return false;
					}

					if (v10 == "") {
						alert("Please enter Trip Id");
						return false;
					}

					if (v99 == "" || v99 == "Select") {
						alert("Please Select Customer");
						return false;
					}
					if (v9 == "Select") {
						alert("Please select Driver Id (Name) from the list");
						return false;
					}

					if (showothvendorr == "Yes") {
						var v111 = document.tripform.othvendor.value;
						var invalidcustomer = /^[A-Z a-z]+$/;
						if (v111.length == 0) {
							alert("Please enter new Customer");
							return false;
						}
						if (v111.length != 0 && !invalidcustomer.test(v111)) {
							alert("Please Enter Only Character  Value for Customer");
							return false;
						}
					}

					var name = document.getElementById("element_3_21").value;
					var invalid = /^[a-zA-Z .]+$/;

					if (!invalid.test(name) && !((name == "" || name == null))) {
						alert("Please Enter Character Value for Sales Person");
						//document.getElementById("fatherlabel").style.display="";
						return false;
					}
					//Spfunction();
					/* return true; */
				}

			}

			if (v6.length == 0) {
				alert("Please select the departure date");
				return false;
			}

			if (v7 == "Select") {
				alert("Please select the departure time");
				return false;
			}

			function datevalidate() {
				console.log("inside datevalidate");
				var date1 = document.getElementById("calender").value;
				var date2 = document.getElementById("calender1").value;
				var date3 = document.getElementById("etadate").value;
				var timehr1 = document.getElementById("rpttime1").value;
				var timemin1 = document.getElementById("rpttime2").value;
				var timehr2 = document.getElementById("sttime1").value;
				var timemin2 = document.getElementById("sttime2").value;
				var timehr3 = document.getElementById("etatime1").value;
				var timemin3 = document.getElementById("etatime2").value;

				var tripissue = document.getElementById("element_3_3").value;

				var dm1, dd1, dy1, dm2, dd2, dy2;
				var dd11, yy11, mm1, mm2, mm11, dd22, yy22, mm22, dd33, mm3, mm33, yy33;

				dd11 = date1.substring(0, 2);
				dd22 = date2.substring(0, 2);
				dd33 = date3.substring(0, 2);
				dd44 = tripissue.substring(0, 2);

				mm1 = date1.substring(3, 6);
				mm2 = date2.substring(3, 6);
				mm3 = date3.substring(3, 6);
				mm4 = tripissue.substring(3, 6);

				mm11 = dateformat(mm1);
				mm22 = dateformat(mm2);
				mm33 = dateformat(mm3);
				mm44 = dateformat(mm4);

				yy11 = date1.substring(7, 11);
				yy22 = date2.substring(7, 11);
				yy33 = date3.substring(7, 11);
				yy44 = tripissue.substring(7, 11);

				if (yy11 < yy22) {
					alert("Start date should not be smaller than report date");

					return false;
				} else if (yy22 == yy11) {
					if (mm11 < mm22) {
						alert("Start date should not be smaller than report date");

						return false;
					} else if (mm11 == mm22) {
						if (dd11 < dd22) {
							alert("Start date should not be smaller than report date");

							return false;
						} else if (dd11 == dd22) {

							if (timehr2 < timehr1) {
								alert("Start time should not be smaller than report time");
								return false;
							}

							else if (timehr2 == timehr1) {
								if (timemin2 < timemin1) {
									alert("Start time should not be smaller than report time");

									return false;
								}
							}

						}
					}
				}

				if (yy33 < yy11) {
					alert("ETA date should not be smaller than Start date");

					return false;
				} else if (yy33 == yy11) {
					if (mm33 < mm11) {
						alert("ETA date should not be smaller than Start date");

						return false;
					} else if (mm33 == mm11) {
						if (dd33 < dd11) {
							alert("ETA date should not be smaller than Start date");

							return false;
						} else if (dd33 == dd11) {
							if (timehr3 < timehr2) {
								alert("ETA time should not be smaller than Start time");
								return false;
							}

							else if (timehr3 == timehr2) {
								if (timemin3 < timemin2) {
									alert("ETA time should not be smaller than Start time");

									return false;
								}
							}
						}

					}
				}

				if (yy33 == yy11 && mm33 == mm11 && dd33 == dd11
						&& timehr3 == timehr2 && timemin3 == timemin2)

				{
					alert("ETA Date and time should not be same as Start Date and time");

					return false;
				}

				if (yy22 == yy11 && mm11 == mm22 && dd11 == dd22
						&& timehr2 == timehr1 && timemin2 == timemin1) {
					alert("Start Date and time should not be same as Report Date and time");

					return false;
				}

				if (yy44 > yy22 || (dd44 > dd22) || (mm44 > mm22)) {
					alert("Trip Issue date should be less than or  equal to Report Date");
					return false;
				}

				var name = document.getElementById("element_3_21").value;
				var invalid = /^[a-zA-Z .]+$/;

				if (!invalid.test(name) && !((name == "" || name == null))) {
					alert("Please Enter Character Value for Sales Person");
					//document.getElementById("fatherlabel").style.display="";
					return false;
				}

				var toll = document.getElementById("toll").value;

				var rto = document.getElementById("rto").value;

				var loading = document.getElementById("loading").value;
				var unloading = document.getElementById("unloading").value;

				var weighbridge = document.getElementById("weighbridge").value;
				var da = document.getElementById("DA").value;
				var othexpense = document.getElementById("othexpense").value;

				var fuel = document.getElementById("fuel").value;
				var invalidnumber = /^[0-9.]+$/;
				if (toll.trim() != "")

				{
					if (!(invalidnumber.test(toll))) {
						alert("Please Enter Valid Numeric Value for Toll");
						return false;
					}

					if (isNaN(toll)) {
						alert("Please Enter Numeric Value only for Toll");
						return false;
					}

				}

				if (rto.trim() != "")

				{

					if (!(invalidnumber.test(rto))) {
						alert("Please Enter Valid Numeric Value for RTO");
						return false;
					}

					if (isNaN(rto)) {
						alert("Please Enter Numeric Value only for RTO");
						return false;
					}

				}

				if (loading.trim() != "")

				{

					if (!(invalidnumber.test(loading))) {
						alert("Please Enter Valid Numeric Value for Loading");
						return false;
					}

					if (isNaN(loading)) {
						alert("Please Enter Numeric Value only for Loading");
						return false;
					}

				}

				if (unloading.trim() != "")

				{
					if (!(invalidnumber.test(unloading))) {
						alert("Please Enter Valid Numeric Value for UnLoading");
						return false;
					}
					if (isNaN(unloading)) {
						alert("Please Enter Numeric Value only for UnLoading");
						return false;
					}

				}

				if (weighbridge.trim() != "")

				{

					if (!(invalidnumber.test(weighbridge))) {
						alert("Please Enter Valid Numeric Value for WeighBridge");
						return false;
					}

					if (isNaN(weighbridge)) {
						alert("Please Enter Numeric Value only for WeighBridge");
						return false;
					}

				}

				if (da.trim() != "")

				{

					if (!(invalidnumber.test(da))) {
						alert("Please Enter Valid Numeric Value for DA");
						return false;
					}

					if (isNaN(da)) {
						alert("Please Enter Numeric Value only for DA");
						return false;
					}

				}

				if (fuel.trim() != "")

				{

					if (!(invalidnumber.test(fuel))) {
						alert("Please Enter Valid Numeric Value for Fuel");
						return false;
					}

					if (isNaN(fuel)) {
						alert("Please Enter Numeric Value only for Fuel");
						return false;
					}

				}

				if (othexpense.trim() != "")

				{

					if (!(invalidnumber.test(othexpense))) {
						alert("Please Enter Valid Numeric Value for Other Expense");
						return false;
					}

					if (isNaN(othexpense)) {
						alert("Please Enter Numeric Value only for Other Expense");
						return false;
					}

				}

				//Spfunction();
				return true;
			}

			if (v10 == "") {
				alert("Please enter Trip Id");
				return false;
			}

			if (v9 == "Select") {
				alert("Please select Driver Id (Name) from the list");
				return false;
			}
			if (showothstartloc == "Yes") {
				var v10 = document.tripform.othstrtloc.value;

				if (v10.length == 0) {
					alert("Please enter new start location");
					return false;
				}

			}

			if (showothdestloc == "Yes") {
				var v11 = document.tripform.othdest.value;

				if (v11.length == 0) {
					alert("Please enter new destination");
					return false;
				}
			}

			/*  var triptype=document.tripform.TripCategory.value;
			 if(triptype=='Select')
			 {
			  alert("Please Select Trip Type");
			  return false;
			 } */

			if (showothvendorr == "Yes") {
				var v111 = document.tripform.othvendor.value;
				var invalidcustomer = /^[A-Z a-z]+$/;
				if (v111.length == 0) {
					alert("Please enter new Customer");
					return false;
				}
				if (v111.length != 0 && !invalidcustomer.test(v111)) {
					alert("Please Enter Only Character  Value for Customer");
					return false;
				}
			}

			if (showothLoadreasonn == "Yes") {
				var v1111 = document.tripform.othLoadreason.value;

				if (v1111.length == 0) {
					alert("Please enter new Reason");
					return false;
				}
			}
			var customercontact = document.tripform.element_3_14.value;

			var invalid = /^[0-9]+$/;

			if (!(customercontact.length == 0)) {
				if (!invalid.test(customercontact)) {

					alert("Please Enter Numeric Value only for Customer Contact No");

					return false;

				}

				if ((customercontact.trim().length < 10)
						|| (customercontact.trim().length > 15)) {
					alert("Customer Contact No should be 10-15 digits");
					return false;
				}

			}

			if (!(tokenchargespaid.match(numericExpressionn))
					&& tokenchargespaid.length != 0) {
				alert("Please Enter Valid Numeric Value for Token charges Paid");
				return false;

			}

			/* var joborderno=document.tripform.joborderno.value; */

			var letter = /^[A-Za-z]+$/;
			if (!(lrissue.match(letter)) && lrissue.length != 0) {
				alert('Please enter characters value for LR Issue');
				return false;
			}

			if (!invalidbranchcode.test(branchcode) && branchcode.length != 0)

			{
				alert("Please Enter Only Alphanumeric Value for Branch Code")
				return false;

			}

			if (document.tripform.route[0].checked == true) {

			} else {

				// alert("for non fixed route");

				/*if(fkms.length==0)
				{
				alert("Please enter Fixed Km");
				   return false;
				}*/
				/*  if(!(fkms.match(numericExpressionn))&& fkms.length!=0)
				{
					alert("Please enter Numeric value for Fixed Km");
				    return false;
				 } */
				/*if(ftime.length==0)
				{
					alert("Please enter Fixed Time");
				    return false;
				}*/
				/*  if(!(ftime.match(numericExpressionn))&& ftime.length!=0)
				{
					alert("Please enter Numeric value for Fixed Time");
				    return false;
				} */

			}

			/* if(weit.length==0)
			{
				alert("Please enter Weight");
			      return false;
			}*/

			if (isNaN(weit) && weit.length != 0)

			{
				alert("Please Enter Numeric value for Weight");
				return false;

			}
			if (!(weit.match(numericExpressionn)) && weit.length != 0) {
				alert("Please enter Valid Numeric value for Weight");
				return false;
			}

			if (isNaN(revenue) && revenue.length != 0)

			{
				alert("Please Enter Numeric value for Revenue");
				return false;
			}

			if (!(revenue.match(numericExpressionn)) && revenue.length != 0) {
				alert("Please Enter Valid Numeric value for Revenue");
				return false;
			}
			/* if(!(joborderno.match(numericExpressionn))&& joborderno.length!=0)
			{
				alert("Please enter Numeric value for Job Order No");
			    return false;
			} */
			/* if(adva.length==0)
			{
				alert("Please enter Advance value");
			    return false;
			}*/

			if (isNaN(adva) && adva.length != 0)

			{
				alert("Please Enter  Numeric value for Advance");
				return false;

			}
			if (!(adva.match(numericExpressionn)) && adva.length != 0) {
				alert("Please Enter Valid Numeric value for Advance");
				return false;
			}

			if (isNaN(lrcontact) && lrcontact.length != 0)

			{
				alert("Please Enter Numeric value for LR Contact");
				return false;

			}

			if (!(lrcontact.match(numericExpressionn)) && lrcontact.length != 0) {
				alert("Please Enter  Valid Numeric value for LR Contact");
				return false;
			}
			/*if(friegh.length==0)
			{
				alert("Please enter Fright value");
			    return false;
			}*/

			if (isNaN(friegh) && friegh.length != 0) {

				alert("Please Enter Numeric value for Freight");
				return false;
			}

			if (!(friegh.match(numericExpressionn)) && friegh.length != 0) {
				alert("Please Enter Valid Numeric value for Freight");
				return false;
			}

			var fixedkm = document.tripform.fxdkm.value;
			var ratekm = document.tripform.ratekm.value;
			var ratehr = document.tripform.ratehr.value;
			var ftme = document.tripform.ftme.value;
			if (isNaN(fixedkm) && fixedkm.length != 0) {
				alert("Please Enter Numeric value for Fixed KM");
				return false;
			}

			if (!(fixedkm.match(numericExpressionn)) && fixedkm.length != 0) {
				alert("Please Enter Valid Numeric value for Fixed KM");
				return false;
			}

			if (isNaN(ratekm) && ratekm.length != 0) {
				alert("Please Enter Numeric value for Rate/Km");
				return false;
			}

			if (!(ratekm.match(numericExpressionn)) && ratekm.length != 0) {
				alert("Please Enter Valid Numeric value for Rate/Km");
				return false;
			}

			if (isNaN(ratehr) && ratehr.length != 0) {
				alert("Please enter Numeric value for Rate/hr");
				return false;
			}

			if (!(ratehr.match(numericExpressionn)) && ratehr.length != 0) {
				alert("Please Enter Valid Numeric value for Rate/hr");
				return false;
			}

			if (!(ftme.match(numericExpressionn1)) && ftme.length != 0) {
				alert("Please Enter Valid Numeric value for Fixed Time");
				return false;
			}

			//Spfunction();
			var name = document.getElementById("element_3_21").value;
			var invalid = /^[a-zA-Z .]+$/;

			if (!invalid.test(name) && !((name == "" || name == null))) {
				alert("Please Enter Character Value for Sales Person");
				//document.getElementById("fatherlabel").style.display="";
				return false;
			}
			//if(showothTripCategory=="Yes")
			//{ 
			var v1111 = document.tripform.othTripCategory.value;

			/*   if(v1111.length==0)
			   { 
			      alert("Please enter other Category");
			      return false;
			   }
			 *///}
			if (showothdrivid == "Yes") {
				var v12 = document.tripform.othdriverid.value;
				var v13 = document.tripform.drivername.value;
				var v14 = document.tripform.newdrvname.value;

				if (v12.length == 0) {
					alert("Please enter new Driver Id");
					return false;
				}

				duplicatedriverid();

				if (isNaN(v12)) {
					alert("Please enter valid number for Driver Id");
					return false;
				}

				if (v14.length == 0) {
					alert("Please enter new Driver Name");
					return false;
				}

				if (v13.length == 0) {
					alert("Please enter new Driver name");
					return false;
				}

				/*   
				  if(drivname.trim()==""||drivname.trim()==null)
				 	 {
				 	 
				 	 
				 	 } */
				if (drivname.trim() != "" && !drivvalid.test(drivname)) {
					alert("Please Enter Valid Characters  Driver Name");
					return false;
				}

				if (v10 == "") {
					alert("Please enter Trip Id");
					return false;
				}

				if (v99 == "" || v99 == "Select") {
					alert("Please Select Customer");
					return false;
				}
				// Spfunction();
				var name = document.getElementById("element_3_21").value;
				var invalid = /^[a-zA-Z .]+$/;

				if (!invalid.test(name) && !((name == "" || name == null))) {
					alert("Please Enter Character Value for Sales Person");
					//document.getElementById("fatherlabel").style.display="";
					return false;
				}

				/* 	var name1=document.getElementById("element_3_21").value;
				   var invalid=/^[a-zA-Z .]+$/;
				   
				   if(!invalid.test(name1) && (name1.trim()!="" || name1!=null)){
				   	console.log("insite sales on submit");
				   	// document.getElementById("fatherlabel").style.display="";
				   	alert("Sales Person :Enter Character Value ");
				   		     return false;
				   		 }	
				 } */
			}
			if (etatime1 == "Select") {
				alert("Please select ETA Time");
				return false;
			}

			/* if(v19=="")  
			{
			    alert("Please Job order No");
			    return false;   
			} */
			/* if(v20=="" || v20.length==0)  
			{
			    alert("Please enter Container No");
			    return false;   
			} */
			if (v10 == "") {
				alert("Please enter Trip Id");
				return false;
			}

			if (v99 == "" || v99 == "Select") {
				alert("Please Select Customer");
				return false;
			}
			//Spfunction();
			//document.getElementById("fatherlabel").style.display="none";	

			var name = document.getElementById("element_3_21").value;
			var invalid = /^[a-zA-Z .]+$/;

			if (!invalid.test(name) && !((name == "" || name == null))) {
				alert("Please Enter Character Value for Sales Person");
				//document.getElementById("fatherlabel").style.display="";
				return false;

			}
			return datevalidate();

			var toll = document.getElementById("toll").value;
			var rto = document.getElementById("rto").value;
			var loading = document.getElementById("loading").value;
			var unloading = document.getElementById("unloading").value;
			var weighbridge = document.getElementById("weighbridge").value;
			var da = document.getElementById("DA").value;
			var othexpense = document.getElementById("othexpense").value;
			var fuel = document.getElementById("fuel").value;
			var invalidnumber = /^[0-9.]+$/;
			if (toll.trim() != "")

			{
				if (!(invalidnumber.test(toll))) {
					alert("Please Enter Valid Numeric Value for Toll");
					return false;
				}

				if (isNaN(toll)) {
					alert("Please Enter Numeric Value only for Toll");
					return false;
				}

			}

			if (rto.trim() != "")

			{

				if (!(invalidnumber.test(rto))) {
					alert("Please Enter Valid Numeric Value for RTO");
					return false;
				}

				if (isNaN(rto)) {
					alert("Please Enter Numeric Value only for RTO");
					return false;
				}

			}

			if (loading.trim() != "")

			{

				if (!(invalidnumber.test(loading))) {
					alert("Please Enter Valid Numeric Value for Loading");
					return false;
				}

				if (isNaN(loading)) {
					alert("Please Enter Numeric Value only for Loading");
					return false;
				}

			}

			if (unloading.trim() != "")

			{
				if (!(invalidnumber.test(unloading))) {
					alert("Please Enter Valid Numeric Value for UnLoading");
					return false;
				}
				if (isNaN(unloading)) {
					alert("Please Enter Numeric Value only for UnLoading");
					return false;
				}

			}

			if (weighbridge.trim() != "")

			{

				if (!(invalidnumber.test(weighbridge))) {
					alert("Please Enter Valid Numeric Value for WeighBridge");
					return false;
				}

				if (isNaN(weighbridge)) {
					alert("Please Enter Numeric Value only for WeighBridge");
					return false;
				}

			}

			if (da.trim() != "")

			{

				if (!(invalidnumber.test(da))) {
					alert("Please Enter Valid Numeric Value for DA");
					return false;
				}

				if (isNaN(da)) {
					alert("Please Enter Numeric Value only for DA");
					return false;
				}

			}

			if (fuel.trim() != "")

			{

				if (!(invalidnumber.test(fuel))) {
					alert("Please Enter Valid Numeric Value for Fuel");
					return false;
				}

				if (isNaN(fuel)) {
					alert("Please Enter Numeric Value only for Fuel");
					return false;
				}

			}

			if (othexpense.trim() != "")

			{

				if (!(invalidnumber.test(othexpense))) {
					alert("Please Enter Valid Numeric Value for Other Expense");
					return false;
				}

				if (isNaN(othexpense)) {
					alert("Please Enter Numeric Value only for Other Expense");
					return false;
				}

			}

		} catch (e) {
			alert(e);
			return false;
		}
	}

	function dateformat(days) {
		if (days == 'Jan')
			return (1);
		else if (days == 'Feb')
			return (2);
		else if (days == 'Mar')
			return (3);
		else if (days == 'Apr')
			return (4);
		else if (days == 'May')
			return (5);
		else if (days == 'Jun')
			return (6);
		else if (days == 'Jul')
			return (7);
		else if (days == 'Aug')
			return (8);
		else if (days == 'Sep')
			return (9);
		else if (days == 'Oct')
			return (10);
		else if (days == 'Nov')
			return (11);
		else if (days == 'Dec')
			return (12);
	}
	function datevalidate() {
		var date1 = document.getElementById("calender").value;
		var date2 = document.getElementById("calender1").value;
		var date3 = document.getElementById("etadate").value;
		var timehr1 = document.getElementById("rpttime1").value;
		var timemin1 = document.getElementById("rpttime2").value;
		var timehr2 = document.getElementById("sttime1").value;
		var timemin2 = document.getElementById("sttime2").value;
		var timehr3 = document.getElementById("etatime1").value;
		var timemin3 = document.getElementById("etatime2").value;

		var tripissue = document.getElementById("element_3_3").value;

		var dm1, dd1, dy1, dm2, dd2, dy2;
		var dd11, yy11, mm1, mm2, mm11, dd22, yy22, mm22, dd33, mm3, mm33, yy33;

		dd11 = date1.substring(0, 2);
		dd22 = date2.substring(0, 2);
		dd33 = date3.substring(0, 2);
		dd44 = tripissue.substring(0, 2);

		mm1 = date1.substring(3, 6);
		mm2 = date2.substring(3, 6);
		mm3 = date3.substring(3, 6);
		mm4 = tripissue.substring(3, 6);

		mm11 = dateformat(mm1);
		mm22 = dateformat(mm2);
		mm33 = dateformat(mm3);
		mm44 = dateformat(mm4);

		yy11 = date1.substring(7, 11);
		yy22 = date2.substring(7, 11);
		yy33 = date3.substring(7, 11);
		yy44 = tripissue.substring(7, 11);

		if (yy11 < yy22) {
			alert("Start date should not be smaller than report date");

			return false;
		} else if (yy22 == yy11) {
			if (mm11 < mm22) {
				alert("Start date should not be smaller than report date");

				return false;
			} else if (mm11 == mm22) {
				if (dd11 < dd22) {
					alert("Start date should not be smaller than report date");

					return false;
				} else if (dd11 == dd22) {

					if (timehr2 < timehr1) {
						alert("Start time should not be smaller than report time");
						return false;
					}

					else if (timehr2 == timehr1) {
						if (timemin2 < timemin1) {
							alert("Start time should not be smaller than report time");

							return false;
						}
					}

				}
			}
		}

		if (yy33 < yy11) {
			alert("ETA date should not be smaller than Start date");

			return false;
		} else if (yy33 == yy11) {
			if (mm33 < mm11) {
				alert("ETA date should not be smaller than Start date");

				return false;
			} else if (mm33 == mm11) {
				if (dd33 < dd11) {
					alert("ETA date should not be smaller than Start date");

					return false;
				} else if (dd33 == dd11) {
					if (timehr3 < timehr2) {
						alert("ETA time should not be smaller than Start time");
						return false;
					}

					else if (timehr3 == timehr2) {
						if (timemin3 < timemin2) {
							alert("ETA time should not be smaller than Start time");

							return false;
						}
					}
				}

			}
		}

		if (yy33 == yy11 && mm33 == mm11 && dd33 == dd11 && timehr3 == timehr2
				&& timemin3 == timemin2)

		{
			alert("ETA Date and time should not be same as Start Date and time");

			return false;
		}

		if (yy22 == yy11 && mm11 == mm22 && dd11 == dd22 && timehr2 == timehr1
				&& timemin2 == timemin1) {
			alert("Start Date and time should not be same as Report Date and time");

			return false;
		}

		if (yy44 > yy22 || (dd44 > dd22) || (mm44 > mm22)) {
			alert("Trip Issue date should be less than or  equal to Report Date");
			return false;
		}

		var name = document.getElementById("element_3_21").value;
		var invalid = /^[a-zA-Z .]+$/;

		if (!invalid.test(name) && !((name == "" || name == null))) {
			alert("Please Enter Character Value for Sales Person");
			//document.getElementById("fatherlabel").style.display="";
			return false;
		}
		//Spfunction();
		return true;
	}

	function showothloc(dropdown) {
		//alert("hii")
		var vv1 = dropdown.selectedIndex;
		//  alert(vv1);
		var SelValue1 = dropdown.options[vv1].value;
		// alert(SelValue1);
		if (SelValue1 == "Other") {
			document.tripform.othstrtloc.style.display = "block";
			showothstartloc = "Yes";
		} else {
			document.tripform.othstrtloc.style.display = "none";
			document.tripform.othstrtloc.value = "";
			showothstartloc = "No";
		}
	}
	function Spfunction() {
		//document.getElementById("name1").style.display="none";
		//document.getElementById("fatherlabel").style.display="none";	
		var name = document.getElementById("element_3_21").value;
		var invalid = /^[a-zA-Z .]+$/;

		if (!invalid.test(name) && !((name == "" || name == null))) {
			alert("Please Enter Character Value for Sales Person");
			//document.getElementById("fatherlabel").style.display="";
			return false;
		}

	}

	function showothdest(dropdown) {

		var vv1 = dropdown.selectedIndex;
		// alert(vv1); 
		var SelValue1 = dropdown.options[vv1].value;
		// alert(SelValue1);
		if (SelValue1 == "Other") {
			document.tripform.othdest.style.visibility = "visible";
			showothdestloc = "Yes";
		} else {
			document.tripform.othdest.style.visibility = "hidden";
			document.tripform.othdest.value = "";
			showothdestloc = "No";
		}

		var a = document.tripform.stloc.value;
		var b = document.tripform.dest.value;
		if ((a != "Other") && (b != "Other")) {
			getvalues(a, b);

		}

	}
	function getvalues(p, q) {

		var ajaxRequest; // The variable that makes Ajax possible!

		try {
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		} catch (e) {
			// Internet Explorer Browsers
			try {
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function() {

			if (ajaxRequest.readyState == 4) {
				var reslt = ajaxRequest.responseText;

				//alert(reslt);
				var resnew = reslt.split("#");

				//document.getElementById("side_bar").innerHTML=resnew[4];
				var km = resnew[1];
				var time = resnew[2];

				document.tripform.fxdkm.value = km;
				document.tripform.ftme.value = time;
				//document.tripform.drivername.value=reslt;

			}
		}

		var queryString = "?StartPlace=" + p + "&EndPlace=" + q;

		ajaxRequest.open("GET", "AjaxGetkmtime.jsp" + queryString, true);
		ajaxRequest.send(null);

	}
	function showothvendor(dropdown) {
		var vv1 = dropdown.selectedIndex;

		var SelValue1 = dropdown.options[vv1].value;

		if (SelValue1 == "Other") {
			document.tripform.othvendor.style.visibility = "visible";
			showothvendorr = "Yes";
		} else {
			document.tripform.othvendor.style.visibility = "hidden";
			document.tripform.othvendor.value = "";
			showothvendorr = "No";
		}
	}
	function showothcategry(dropdown) {
		var vvt1 = dropdown.selectedIndex;

		var SelValuet1 = dropdown.options[vvt1].value;

		if (SelValuet1 == "Other")//TripCategory
		{//othTripCategory

			document.tripform.othTripCategory.style.visibility = "visible";
			othTripCategoryy = "Yes";
		} else {

			document.tripform.othTripCategory.style.visibility = "hidden";
			document.tripform.othTripCategory.value = "";
			othTripCategoryy = "No";
		}
	}

	function showothcontent(dropdown) {
		var vvt1 = dropdown.selectedIndex;

		var SelValuet1 = dropdown.options[vvt1].value;

		if (SelValuet1 == "Other")//TripCategory
		{//othTripCategory
			document.tripform.othGoodsContent.style.visibility = "visible";
			othGoodsContentt = "Yes";
		} else {
			document.tripform.othGoodsContent.style.visibility = "hidden";
			document.tripform.othGoodsContent.value = "";
			othGoodsContentt = "No";
		}
	}
	function showothLoadreason(dropdown) {
		var vv11 = dropdown.selectedIndex;

		var SelValue11 = dropdown.options[vv11].value;

		if (SelValue11 == "Other") {
			document.tripform.othLoadreason.style.visibility = "visible";
			showothLoadreasonn = "Yes";
		} else {
			document.tripform.othLoadreason.style.visibility = "hidden";
			document.tripform.othLoadreason.value = "";
			showothLoadreasonn = "No";
		}
	}
	function showothrdriverid(dropdown) {

		var vv1 = dropdown.selectedIndex;

		var SelValue1 = dropdown.options[vv1].value;

		if (SelValue1 == "Other") {
			document.tripform.othdriverid.style.display = "";
			document.getElementById("newid").style.display = "";

			document.tripform.newdrvname.style.display = "";
			document.getElementById("newdrvname").style.display = "";

			//document.getElementById("mydriverdetaildiv").style.visibility="visible";
			//document.getElementById("tabid").style.visibility="visible";

			showothdrivid = "Yes";
			document.tripform.drivername.readOnly = false;
		} else {
			document.tripform.othdriverid.style.display = 'none';
			document.getElementById("newid").style.display = 'none';

			document.tripform.newdrvname.style.display = 'none';
			document.getElementById("newdrvname").style.display = 'none';

			//document.getElementById("mydriverdetaildiv").style.visibility="hidden";

			document.tripform.othdriverid.value = "";
			document.tripform.newdrvname.value = "";
			// document.tripform.drivername.readOnly=true;
			showothdrivid = "No";

		}

		var ajaxRequest; // The variable that makes Ajax possible!

		try {
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		} catch (e) {
			// Internet Explorer Browsers
			try {
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function() {
			if (ajaxRequest.readyState == 4) {
				var reslt = ajaxRequest.responseText;
				// alert(reslt);
				document.tripform.drivername.value = reslt;

			}
		}
		var queryString = "?drivid=" + SelValue1;
		ajaxRequest.open("GET", "Ajaxgetdriver.jsp" + queryString, true);
		ajaxRequest.send(null);
	}

	function RadChange(ind) {
		if (ind == 0) {
			var ajaxRequest; // The variable that makes Ajax possible!

			try {
				// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
			} catch (e) {
				// Internet Explorer Browsers
				try {
					ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}

			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function() {
				if (ajaxRequest.readyState == 4) {
					var reslt = ajaxRequest.responseText;

					document.getElementById("mydiv").innerHTML = reslt;
				}
			}
			ajaxRequest.open("GET", "Ajaxgetstrtdtrips.jsp", true);
			ajaxRequest.send(null);

			document.tripform.stloc.disabled = "true";

			document.tripform.trigger.style.visibility = "hidden";

			document.tripform.dest.disabled = "true";

			document.tripform.driverid.disabled = "true";

			document.tripform.tripid.value = "";

			document.tripform.calender1.disabled = false;
			document.tripform.trigger1.disabled = false;
			document.tripform.arrivatime1.disabled = false;
			document.tripform.arrivatime2.disabled = false;

			document.tripform.sttime1.disabled = true;
			document.tripform.sttime2.disabled = true;

			document.tripform.route[0].disabled = true;
			document.tripform.route[1].disabled = true;

			document.getElementById("routediv").innerHTML = "";
			document.getElementById("routediv1").innerHTML = "";

			document.getElementById("mydiv2").innerHTML = "";
			document.getElementById("destdiv1").innerHTML = "";

		} else {
			document.tripform.stloc.disabled = false;
			document.tripform.trigger.style.visibility = "visible";
			document.tripform.othstrtloc.style.visibility = "hidden";
			document.tripform.othstrtloc.readOnly = false;
			document.tripform.othstrtloc.value = "";

			//document.tripform.calender.readOnly=false;
			document.tripform.calender.value = "";

			document.tripform.dest.disabled = false;
			document.tripform.othdest.value = "";
			document.tripform.othdest.style.visibility = "hidden";
			document.tripform.othdest.readOnly = false;

			document.tripform.driverid.disabled = false;
			document.tripform.othdriverid.value = "";
			document.tripform.othdriverid.readOnly = false;
			document.tripform.othdriverid.style.visibility = "hidden";

			document.tripform.drivername.disabled = false;
			document.tripform.drivername.value = "";

			document.tripform.tripid.disabled = false;
			var vv = document.tripform.tripid.value;
			document.tripform.tripid.value = vv;

			document.tripform.calender1.disabled = true;
			document.tripform.calender1.value = "";
			document.tripform.trigger1.disabled = true;
			document.tripform.arrivatime1.disabled = true;
			document.tripform.arrivatime2.disabled = true;

			document.tripform.sttime1.disabled = false;
			document.tripform.sttime2.disabled = false;
			document.tripform.sttime.style.visibility = "hidden";
			document.tripform.sttime.value = "";

			document.tripform.drivername.readOnly = true;

			document.tripform.route[0].disabled = false;
			document.tripform.route[1].disabled = false;

			var ajaxRequest; // The variable that makes Ajax possible!

			try {
				// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
			} catch (e) {
				// Internet Explorer Browsers
				try {
					ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}

			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function() {
				if (ajaxRequest.readyState == 4) {

					var reslt = ajaxRequest.responseText;
					//alert(reslt);
					document.getElementById("mydiv").innerHTML = reslt;
				}
			}
			//var queryString = "?drivid=" +SelValue1;
			ajaxRequest.open("GET", "Ajaxgetvehs.jsp", true);
			ajaxRequest.send(null);

		}
	}

	function showstloc(dropdown) {
		var vv1 = dropdown.selectedIndex;

		var SelValue1 = dropdown.options[vv1].value;
		//alert(SelValue1);

		var ajaxRequest; // The variable that makes Ajax possible!

		try {
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		} catch (e) {
			// Internet Explorer Browsers
			try {
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function() {
			if (ajaxRequest.readyState == 4) {
				var reslt = ajaxRequest.responseText;

				//document.getElementById("mydiv1").innerHTML="<input type='text' name='stloc' class='formElement' > ";

				document.tripform.othstrtloc.style.visibility = "visible";
				document.tripform.othstrtloc.readOnly = true;

				document.tripform.othdest.style.visibility = "visible";
				document.tripform.othdest.readOnly = true;

				document.tripform.othdriverid.style.visibility = "visible";
				document.tripform.othdriverid.readOnly = true;

				document.tripform.sttime.readOnly = true;
				document.tripform.sttime.style.visibility = "visible";

				var reslt = ajaxRequest.responseText;
				var mySplitResult = reslt.split("$#");
				//var mySplitResult1=  mySplitResult[0]; 
				//var mySplitResult2=  mySplitResult[1];
				//alert(reslt);
				document.tripform.othstrtloc.value = mySplitResult[0];
				document.tripform.calender.value = mySplitResult[1];
				document.tripform.othdest.value = mySplitResult[2];
				document.tripform.othdriverid.value = mySplitResult[3];
				document.tripform.drivername.value = mySplitResult[4];
				document.tripform.tripid.value = mySplitResult[5];
				document.tripform.sttime.value = mySplitResult[6];

				document.tripform.calender.readOnly = true;

			}
		}
		var queryString = "?veh=" + SelValue1;
		ajaxRequest.open("GET", "Ajaxgetstrtinfo.jsp" + queryString, true);
		ajaxRequest.send(null);

	}

	function getTripInfo(aa) {
		if (aa.value == "Yes") {
			tripgen = "Yes";
			//alert("In tripgen yes");
			//document.tripform.stloc.disabled="true";
			// document.getElementById("mydiv02").style.display="";

			//document.tripform.element_1_ori.style.visibility="hidden";
			//document.tripform.element_1_dest.style.visibility="hidden";
			document.getElementById("element_1_ori").style.display = 'none';
			document.getElementById("element_1_dest").style.display = 'none';

			document.tripform.stloc.style.visibility = "hidden";
			document.tripform.dest.style.visibility = "hidden";
			//document.tripform.dest.disabled="true"; 
			document.tripform.tripid.value = "";
			document.tripform.driverid.selectedIndex = 0;
			document.tripform.drivername.value = "";
			document.getElementById("mydiv2").style.display = "";
			document.getElementById("fixeddiv").style.display = "";
			document.getElementById("destdiv1").style.display = "";
			document.tripform.othstrtloc.value = "";
			document.tripform.othstrtloc.style.visibility = "hidden";
			document.tripform.fxdkm.style.visibility = "visible";
			document.tripform.ftme.style.visibility = "visible";
			//document.tripform.fxdkm.style.visibility="hidden";
			//document.tripform.ftme.style.visibility="hidden";
			document.tripform.fxdkm.style.d = "";
			document.tripform.ftme.style.visibility = "";
			//tdp=document.getElementById("fx01");
			document.getElementById("fx01").style.display = "";
			//document.getElementById("ft01").style.display='none';
			//document.tripform.eta.value="";

			var ajaxRequest; // The variable that makes Ajax possible!

			try {
				// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
			} catch (e) {
				// Internet Explorer Browsers
				try {
					ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						drivername
						// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}

			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function() {
				if (ajaxRequest.readyState == 4) {
					var reslt = ajaxRequest.responseText;
					//  alert(reslt);
					document.getElementById("routediv").innerHTML = reslt;

				}
			}

			//alert("hi");
			ajaxRequest.open("GET", "AjaxGetTripInfo.jsp", true);
			ajaxRequest.send(null);
			// alert("out tripgen yes");
		} else {
			//alert("In tripgen No");
			tripgen = "No";

			//document.tripform.stloc.disabled=false;
			//document.tripform.element_1_ori.style.visibility="visible";
			//document.tripform.element_1_dest.style.visibility="visible";
			document.getElementById("element_1_ori").style.display = "";
			document.getElementById("element_1_dest").style.display = "";
			document.tripform.stloc.style.visibility = "visible";

			document.tripform.dest.style.visibility = "visible";
			//document.tripform.dest.disabled=false; 	
			document.tripform.fxdkm.style.visibility = "visible";
			document.tripform.ftme.style.visibility = "visible";
			document.getElementById("fx01").style.display = '';
			//document.getElementById("ft01").style.display='';

			document.getElementById("routediv").innerHTML = "";

			document.tripform.tripid.value = "";

			document.getElementById("routediv1").innerHTML = "";
			document.getElementById("mydiv2").innerHTML = "";
			document.getElementById("destdiv1").innerHTML = "";
			//document.tripform.stloc1.value="";
			//alert("out tripgen No");
			//document.tripform.dest1.value="";

			document.getElementById("mydiv2").style.display = 'none';
			document.getElementById("fixeddiv").style.display = 'none';
			document.getElementById("destdiv1").style.display = 'none';

		}
	}
	function fun2(bb) {
		if (!(bb.value == "Select")) {
			var val1 = bb.value;
			//alert(val1);
			//var val2=val1.subString(0,indexof("\)")+1);
			//alert(val2);

			var v2 = val1.split("/");
			//alert(v2[0]);
			//  alert(v2[1]);
			//  alert(v2[2]);
			var v3 = v2[2].split("-");
			// alert(v3);
			// alert(v3[0]);
			//  alert(v3[1]);
			//  alert(v3);

			strtend = bb.value;
			//alert(strtend);
			var ajaxRequest; // The variable that makes Ajax possible!

			try {
				// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
			} catch (e) {
				// Internet Explorer Browsers
				try {
					ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}

			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function() {
				if (ajaxRequest.readyState == 4) {
					var reslt = ajaxRequest.responseText;
					// alert(reslt);
					var res = reslt.split("#");
					//  alert("result after split"+res);
					//  alert("result length"+res.length);

					var result = "<b>Route Points <BR></b>";
					for (i = 0; i < res.length - 2; i++) {
						result = result + res[i] + "<br>";
					}

					//alert("---"+res[i-1])
					// alert(v3[0]);
					document.getElementById("castrolroutecode").value = v3[0];
					//  alert(document.getElementById("castrolroutecode").value);
					//  alert(v3[1]);
					document.getElementById("castrolroutecode1").value = v3[1];
					//  alert(document.getElementById("castrolroutecode1").value);
					//  document.getElementById("routediv1").innerHTML=result;
					//   document.getElementById("mydiv3").innerHTML=" <label for='stfixlox' name='stfixlox' ><font color='maroon' size='2'> <b></b></font> </label> <input type='hidden'  name='stlocnew' id='stlocnew' value='"+v3[0]+"' />";
					// document.getElementById("mydiv4").innerHTML=" <label for='stfixlox' name='stfixlox' ><font color='maroon' size='2'> <b></b></font> </label> <input type='hidden'  name='stlocnew1' id='stlocnew1' value='"+v3[1]+"' />";
					document.getElementById("mydiv2").innerHTML = " <label for='stfixlox' name='stfixlox' > Start Fixed Location: <font color='maroon' size='2'> <b> "
							+ v2[0]
							+ " </b></font> </label> <input type='hidden'  name='stloc1' id='stloc1' value='"+v2[0]+"' readonly />";
					document.getElementById("destdiv1").innerHTML = "<label for='stfixlox' name='stfixlox' >End Fixed Location: <font color='maroon' size='2'> <b> "
							+ v2[1]
							+ " </b> </font> </label> <input type='hidden' name='dest1' id='dest1' value='"+v2[1]+"' readonly/>";
					var resltt = ajaxRequest.responseText;
					// alert(resltt);
					var ress = resltt.split("#");
					for (i = 0; i < res.length; i++) {
						result = result + res[i] + "<br>";
					}

					document.getElementById("fixeddiv").innerHTML = "<label name='fixeddst' id='fixeddst'> <font color='maroon' size='2'> <b></b></font> </label><br><label name='fixedtme' id='fixedtme'><font color='maroon' size='2'> <b></b></font> </label><input type='hidden' name='fixeddst1' id='fixeddst1' value='"+ress[i-1]+"' readonly/><input type='hidden' name='fixedtme1' id='fixedtme1' value='"+ress[i-2]+"' readonly/>";
					// document.tripform.fxdkm.style.value="hidden";
					//document.tripform.ftme.style.value="hidden";
					document.tripform.fxdkm.value = ress[i - 1];
					document.tripform.ftme.value = ress[i - 2];

				}
			}

			//alert("hi");
			var queryString = "?tripid=" + v2[0] + "&tripid1=" + v2[1] + "";
			ajaxRequest.open("GET", "AjaxGetTripInfoDetails.jsp" + queryString,
					true);
			ajaxRequest.send(null);

		}

	}

	function funETA() {
		try {
			//alert(">><<<");
			var stdte = document.tripform.calender.value;
			var dy1 = stdte.substring(0, 2);
			var dy2 = stdte.substring(3, 6);
			var dy3 = stdte.substring(7, 11);
			var dd1 = dy3.substring(2, 4);
			//alert(dd1);

			if (dy2 == 'Jan')
				dy2 = "0" + 01;
			else if (dy2 == 'Feb')
				dy2 = "0" + 02;
			else if (dy2 == 'Mar')
				dy2 = "0" + 03;
			else if (dy2 == 'Apr')
				dy2 = "0" + 04;
			else if (dy2 == 'May')
				dy2 = "0" + 05;
			else if (dy2 == 'Jun')
				dy2 = "0" + 06;
			else if (dy2 == 'Jul')
				dy2 = "0" + 07;
			else if (dy2 == 'Aug')
				dy2 = "0" + 08;
			else if (dy2 == 'Sep')
				dy2 = "0" + 09;
			else if (dy2 == 'Oct')
				dy2 = 10;
			else if (dy2 == 'Nov')
				dy2 = 11;
			else if (dy2 == 'Dec')
				dy2 = 12;
			//var dd3=dy3.substring(8,10);
			//alert(dd1);
			//alert(dy2);
			//alert(dy1);

			//alert(styr);
			var x, y;

			var vehno = document.tripform.vehno.value;
			var vehno1 = vehno.replace(/ /g, "").replace(/_/g, "");
			//alert(">>>>"+vehno1);
			var lt = vehno1.length;
			//alert(">>>>"+lt);
			if (lt == 10) {
				//alert(">>>>");
				if (isNaN(vehno1[0])) {
					x = vehno1.substr(0, 2);
					y = vehno1.substr(6, 4);
				} else {
					//alert(">>"+x+"<<y"+y);
					x = vehno1.substr(8, 2);
					y = vehno1.substr(0, 4);
					//alert(">>"+x+"<<y"+y);

				}
			} else if (lt == 9) {

				if (isNaN(vehno1[0])) {

					var x = vehno1.substr(0, 2);
					var y = vehno1.substr(5, 4);

				} else {
					//alert(">>1");

					if (isNaN(vehno1[2])) {

						var x = vehno1.substr(8, 2);
						var y = vehno1.substr(0, 2);

					} else {

						var x = vehno1.substr(8, 2);
						var y = vehno1.substr(0, 3);
					}
					//alert(">>2");

					if (isNaN(vehno1[3])) {
						//alert(">>3");

						var x = vehno1.substr(7, 2);
						var y = vehno1.substr(0, 3);

					} else {

						var x = vehno1.substr(8, 2);
						var y = vehno1.substr(0, 4);
					}

					//	var x=vehno1.substr(7,2);
					// var y=vehno1.substr(0,4);
				}
			} else if (lt == 8) {
				if (isNaN(vehno1[0])) {
					var x = vehno1.substr(0, 2);
					var y = vehno1.substr(4, 4);
				} else {

					var x = vehno1.substr(6, 2);
					var y = vehno1.substr(0, 4);
				}
			} else if (lt <= 7) {
				if (isNaN(vehno1[0])) {
					var x = vehno1.substr(0, 1);
					var y = vehno1.substr(3, 4);
				} else {

					var x = vehno1.substr(6, 1);
					var y = vehno1.substr(0, 4);
				}

			}

			//alert(">>>>>"+x);
			//alert(">>>>>"+y);

			//alert(mar);
			//	var len=vehnoo.length;
			//alert(len)
			var tripid;

			tripid = dd1 + "" + dy2 + "" + dy1 + "" + y + "" + x;
			//alert(">>"+tripid);

			//document.tripform.tripid.value=tripid;

			//alert("tripid-->"+tripid)

			var vall1 = strtend;
			//alert(vall1);
			if (vall1 == "") {
				//alert("First Select Location");
			} else {
				//	alert("ETA Calculated For Selected Location");
				var strtdte = document.tripform.calender.value;
				//alert("strtdte:-"+strtdte);
				var strttmehrs = document.tripform.sttime1.value;
				//alert("strttmehrs:-"+strttmehrs);
				var strttmemin = document.tripform.sttime2.value;
				//alert("strttmemin:-"+strttmemin);	
				var ajaxRequest; // The variable that makes Ajax possible!

				try {
					// Opera 8.0+, Firefox, Safari
					ajaxRequest = new XMLHttpRequest();
				} catch (e) {
					// Internet Explorer Browsers
					try {
						ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
					} catch (e) {
						try {
							ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
						} catch (e) {
							// Something went wrong
							alert("Your browser broke!");
							return false;
						}
					}
				}

				// Create a function that will receive data sent from the server
				ajaxRequest.onreadystatechange = function() {
					if (ajaxRequest.readyState == 4) {
						var resltt = ajaxRequest.responseText;
						// alert(resltt);
						var ress = resltt.split("#");
						var etadate = ress[1];
						var etahrs = ress[2];
						var etamin = ress[3];

						document.tripform.etadate.value = etadate;
						document.tripform.etatime1.value = etahrs;
						document.tripform.etatime2.value = etamin;

					}
				}

				var queryString = "?Rcode=" + strtend + "&strtdte=" + strtdte
						+ "&strttmehrs=" + strttmehrs + "&strttmemin="
						+ strttmemin;
				//alert(queryString);
				ajaxRequest
						.open("GET", "AjaxGetETAcal.jsp" + queryString, true);
				ajaxRequest.send(null);
			}

		} catch (e) {
			alert(e);
		}
	}
	function upload() {
		var name1 = document.getElementById("Filename1").value;
		//alert(name1);
		var valid_extensions = /(.jpg|.jpeg|.png|.bmp)$/i;

		var uploadedFile = document.getElementById("Filename1");
		var fileSize = uploadedFile.files[0].size;
		/*  if(fileSize>=1,024*1,024*5)
		  {
		  alert ("Uploaded file should be less than 5 MB");
		  document.getElementById("Filename1").value="";
		return false;
		  }    */
		if (!valid_extensions.test(name1)) {

			alert("Please upload only jpg,png,jpeg and bmp formatted file");
			document.getElementById("Filename1").value = "";
			return false;
		}
		if (valid_extensions.test(name1) && fileSize >= 1024 * 1024 * 1) {
			alert("Uploaded  file should be less than 1 MB");
			document.getElementById("Filename1").value = "";
			return false;
		}

		if (valid_extensions.test(name1)) {

			document.getElementById("Filename1").style.display = "none";

			document.getElementById("f1").innerHTML = name1;
			document.getElementById("f1").style.display = "";
			document.getElementById("f6").value = name1;

			document.getElementById("remove1").style.display = "";
		} else {
			alert("Please upload only jpg,png,jpeg and bmp formatted file");
			document.getElementById("Filename1").value = "";
			return false;

		}
	}

	function remove1() {
		document.getElementById("f1").innerHTML = "";
		document.getElementById("f1").style.display = "none";
		document.getElementById("remove1").style.display = "none";
		document.getElementById("Filename1").value = "";
		document.getElementById("f6").value = "";
		document.getElementById("Filename1").style.display = "";
	}

	function computrtriptime() {

		//if(bb.value=="Yes")
		//{ 

		//alert("hi");
		var numericExpressionn = /^[.0-9]+$/;
		var fixedkm = document.getElementById("fxdkm").value;
		//alert(fixedkm);
		var tripexpence = document.getElementById("tripexp").value;
		//alert(tripexpence);
		var ratekm = document.getElementById("ratekm").value;
		//alert(ratekm);
		var ratehr = document.getElementById("ratehr").value;
		//alert(ratehr);
		var startdate = document.getElementById("calender").value;

		//alert(cal);
		var sttime1 = document.getElementById("sttime1").value;
		var sttime2 = document.getElementById("sttime2").value;
		var sum = parseInt(fixedkm) * parseInt(ratekm);

		//alert(tripexpence);

		if (ratekm == "0") {
			alert("Rate/Km should be > 0");
			return false;

		}

		if (ratehr == "0") {
			alert("Rate/hr should be > 0");
			return false;
		}

		if (parseInt(tripexpence) < parseInt(sum)) {
			alert("Trip Expense Should Not Be Less Than (Fixed Km * Rate/Km) ");
			return false;
		}

		if (ratekm == null || ratekm == "") {
			alert("Please Enter Rate/Km")
			return false;
		}
		if (isNaN(ratekm) && ratekm.length != 0) {
			alert("Please enter Numeric value for rate/km");
			return false;
		}

		if (!(ratekm.match(numericExpressionn)) && ratekm.length != 0) {
			alert("Please enter Numeric value for rate/km");
			return false;
		}

		if (ratehr == null || ratehr == "") {
			alert("Please Enter Rate/Hour")
			return false;
		}

		if (isNaN(ratehr) && ratehr.length != 0) {
			alert("Please enter Numeric value for rate/hr");
			return false;
		}

		if (!(ratehr.match(numericExpressionn)) && ratehr.length != 0) {
			alert("Please enter Numeric value for rate/hr");
			return false;
		}

		if (fixedkm == null || fixedkm == "") {
			alert("Please Enter Fixed Km")
			return false;
		}

		if (isNaN(fixedkm) && fixedkm.length != 0) {
			alert("Please enter Numeric value for fixed km");
			return false;

		}

		if (!(fixedkm.match(numericExpressionn)) && fixedkm.length != 0) {
			alert("Please enter Numeric value for fixed km");
			return false;
		}

		if (tripexpence == null || tripexpence == "") {
			alert("Please Enter Trip Expense");
			return false;
		}

		if (isNaN(tripexpence) && tripexpence.length != 0) {
			alert("Please enter Numeric value for trip expense");
			return false;

		}

		if (!(tripexpence.match(numericExpressionn)) && tripexpence.length != 0) {
			alert("Please enter Numeric value for trip expense");
			return false;
		}

		//alert(sttime1);

		//tripgen="Yes";
		//document.tripform.stloc.style.visibility="hidden";
		//document.tripform.dest.style.visibility="hidden";
		//document.tripform.dest.disabled="true"; 
		//document.tripform.tripid.value="";
		//document.tripform.driverid.selectedIndex = 0;
		//document.tripform.drivername.value ="";
		//document.getElementById("mydiv2").style.display="";
		//document.getElementById("fixeddiv").style.display="";
		//document.getElementById("destdiv1").style.display="";
		document.getElementById("etatime2").style.display = "none";
		document.getElementById("etatime3").style.display = "";

		var ajaxRequest; // The variable that makes Ajax possible!

		try {
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		} catch (e) {
			// Internet Explorer Browsers
			try {
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					drivername
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function() {
			if (ajaxRequest.readyState == 4) {
				var reslt = ajaxRequest.responseText.split("#");

				// alert(reslt);
				//document.getElementById("testdemodiv").innerHTML=reslt;
				var v = reslt[0];
				if (parseInt(v) < 0) {
					alert("Wrong inputs");
					// document.getElementById("fxdkm").value="";
					document.getElementById("tripexp").value = "";
					document.getElementById("ratekm").value = "";
					document.getElementById("ratehr").value = "";
					document.getElementById("ftme").value = "";
					//document.getElementById("etatime2").style.display="true";
					// document.getElementById("fxdkm").readOnly = true;
					return false;
				}
				document.getElementById("ftme").value = reslt[0];
				document.getElementById("etadate").value = reslt[1];
				//document.getElementById("etatime1").value=reslt[2];
				//document.getElementById("etatime2").value=reslt[3];
				document.tripform.etatime1.value = reslt[2];
				document.tripform.etatime2.value = reslt[3];
				document.tripform.etatime3.value = reslt[3];
				//   document.tripform.etatime3.innerHTML=reslt[3];

				//  document.getElementById("fxdkm").setAttribute("readonly", "readonly"); 
			}
		}

		//alert("hi");
		var querystring = "?fixedkm=" + fixedkm + "&tripexpence=" + tripexpence
				+ "&ratekm=" + ratekm + "&ratehr=" + ratehr + "&startdate="
				+ startdate + "&sttime1=" + sttime1 + "&sttime2=" + sttime2
				+ "";
		ajaxRequest.open("GET", "Ajaxtripenddate.jsp" + querystring, true);
		ajaxRequest.send(null);
		// alert("out tripgen yes");
		//}

	}

	function computetripexpence123() {

		//if(bb.value=="Yes")
		//{ 

		//alert("hi");
		var numericExpressionn = /^[.0-9]+$/;
		var fixedtime = document.getElementById("ftme").value;

		var fixedkm = document.getElementById("fxdkm").value;
		//alert(fixedkm);
		//var tripexpence=document.getElementById("tripexp").value;
		//alert(tripexpence);
		var ratekm = document.getElementById("ratekm").value;
		//alert(ratekm);
		var ratehr = document.getElementById("ratehr").value;
		//alert(ratehr);
		//var startdate=document.getElementById("calender").value;

		//alert(cal);
		//var sttime1=document.getElementById("sttime1").value;
		//var sttime2=document.getElementById("sttime2").value;

		//alert(tripexpence);
		if (ratekm == null || ratekm.trim() == "") {
			alert("Please Enter Rate/Km");
			return false;
		}

		if (isNaN(ratekm) && ratekm.length != 0) {
			alert("Please Enter Numeric value for rate/km");
			return false;
		}

		if (!(ratekm.match(numericExpressionn)) && ratekm.length != 0) {
			alert("Please Enter Valid Numeric value for rate/km");
			return false;
		}
		if (ratehr == null || ratehr == "") {
			alert("Please Enter Rate/Hour");
			return false;
		}

		if (isNaN(ratehr) && ratehr.length != 0) {
			alert("Please Enter Numeric value for rate/hr");
			return false;
		}

		if (!(ratehr.match(numericExpressionn)) && ratehr.length != 0) {
			alert("Please Enter Valid Numeric value for rate/hr");
			return false;
		}

		if (fixedkm == null || fixedkm == "") {
			alert("Please Enter Fixed Km")
			return false;
		}
		if (isNaN(fixedkm) && fixedkm.length != 0) {
			alert("Please Enter Numeric value for fixed km");
			return false;
		}

		if (!(fixedkm.match(numericExpressionn)) && fixedkm.length != 0) {
			alert("Please Enter Valid Numeric value for fixed km");
			return false;
		}

		if (fixedtime == null || fixedtime == "") {
			alert("Please  Valid Enter Fixed Time")
			return false;
		}
		//alert(sttime1);

		//tripgen="Yes";
		//document.tripform.stloc.style.visibility="hidden";
		//document.tripform.dest.style.visibility="hidden";
		//document.tripform.dest.disabled="true"; 
		//document.tripform.tripid.value="";
		//document.tripform.driverid.selectedIndex = 0;
		//document.tripform.drivername.value ="";
		//document.getElementById("mydiv2").style.display="";
		//document.getElementById("fixeddiv").style.display="";
		//document.getElementById("destdiv1").style.display="";
		//document.getElementById("etatime2").style.display="none";
		//document.getElementById("etatime3").style.display="";

		var ajaxRequest; // The variable that makes Ajax possible!

		try {
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		} catch (e) {
			// Internet Explorer Browsers
			try {
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					drivername
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function() {
			if (ajaxRequest.readyState == 4) {
				var reslt = ajaxRequest.responseText;
				//alert(reslt);
				//reslt.trim();
				//document.getElementById("tripexp").value=ajaxRequest.responseText;
				document.tripform.tripexp.value = reslt.trim();
				document.getElementById("tripexp").innerHTML = reslt.trim();
				//document.getElementById("testdemodiv").innerHTML=reslt;
				/* document.getElementById("ftme").value=reslt[0];
				document.getElementById("etadate").value=reslt[1];
				//document.getElementById("etatime1").value=reslt[2];
				//document.getElementById("etatime2").value=reslt[3];
				document.tripform.etatime1.value=reslt[2];
				document.tripform.etatime2.value=reslt[3];
				document.tripform.etatime3.value=reslt[3];
				//   document.tripform.etatime3.innerHTML=reslt[3]; */
			}
		}

		//alert("hi");
		var querystring = "?fixedkm=" + fixedkm + "&ratekm=" + ratekm
				+ "&ratehr=" + ratehr + "&fixedtm=" + fixedtime + "";
		ajaxRequest.open("GET", "Ajaxtripexpence.jsp" + querystring, true);
		ajaxRequest.send(null);
		// alert("out tripgen yes");
		//}

	}

	function duplicatedriverid() {

		var driverid = document.tripform.othdriverid.value;

		if (driverid.trim() == "") {
			alert("Please Enter Driverid");
			return false;
		}

		//alert("Licence No:-"+id);
		var ajaxRequest; // The variable that makes Ajax possible!

		try {
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		} catch (e) {
			// Internet Explorer Browsers
			try {
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function() { //document.getElementById("dirid2").style.display="none";
			if (ajaxRequest.readyState == 4) {

				var reslt = ajaxRequest.responseText;
				var abc = reslt;
				//alert("result:-"+abc);
				if (abc.trim() == "") {
					//alert("in if");

					//document.getElementById("licenceno").value="";
				} else {
					alert(abc.trim());
					document.getElementById("othdriverid").value = "";
					//document.getElementById("licenceno").value="";
					//return on;
					//document.getElementById("err1").innerHTML=reslt;
				}
				//document.getElementById("err1").innerHTML=reslt;

			}
		}
		//alert("abc");
		var queryString = "?driverid=" + driverid;
		ajaxRequest.open("GET", "Ajax_TripDriverid.jsp" + queryString, true);
		ajaxRequest.send(null);

	}
</script>

</head>
<body>
	<%!Connection con1;%>
	<%
		Statement stdynamicdrop = null;
			String datenew1 = "", datenew2 = "", datenew3 = "";
			datenew1 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
			datenew3 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date());
			datenew2 = datenew1;
			String strloc, strdate, strtime, endp, driverid, drivern, triid;

			try {
				System.out.println("INNN ");
				Class.forName(MM_dbConn_DRIVER);
				con1 = fleetview.ReturnConnection();
				Statement stmt1 = con1.createStatement();
				Statement stmt2 = con1.createStatement();
				Statement stmt3 = con1.createStatement();
				Statement stmt4 = con1.createStatement();
				Statement stmt5 = con1.createStatement();
				Statement stmt6 = con1.createStatement();
				Statement stmt7 = con1.createStatement();
				Statement stmt8 = con1.createStatement();
				Statement stmt10 = con1.createStatement();

				Statement stmt9 = con1.createStatement();
				Statement stmt355 = con1.createStatement();
				String tripflag = "false";
				ResultSet rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs33 = null;
				String sql2 = "", sql3 = "", sql4 = "", sql5 = "", sql33 = "";
				String vehno = "", prvdid = "", lastdriverid = "", lastdrivername = "";
				String weight = "", vendor = "", TripCategory = "", goodscontent = "", loadrsn = "", loadcmnt = "",
						fxd = "", fxtm = "", frieg = "", adv = "", joborderno = "", revenue = "", containerno = "";
				String lrissue = "", lrcontact = "", boffice = "", pod = "", JStatus = "", cnno = "";

				String ReportDate = "", strdatetime = "", ReportTimehrs = "", ReportDate1 = "", ETA1 = "",
						ReportTimemin = "", StartTimehrs = "", StartTimemin = "", ETA = "", ETAhrs = "",
						ETAmin = "";
				vehno = request.getParameter("vehno");
				/* ======================================================== */

				System.out.println("INNN 2222");

				vehno = request.getParameter("vehno");
				strloc = request.getParameter("strloc");
				endp = request.getParameter("endp");
				//strdate=request.getParameter("strdate");
				strdate = request.getParameter("strdate");
				strtime = request.getParameter("StartTime");
				strdatetime = strdate + " " + strtime;

				System.out.println("strdate1-->" + strdate);
				if (strdate == null) {

				} else {
					strdate = new SimpleDateFormat("dd-MMM-yyyy")
							.format(new SimpleDateFormat("yyyy-MM-dd").parse(strdate));

				}

				StartTimehrs = request.getParameter("StartTime");

				//StartTimehrs = new SimpleDateFormat("HH").format(new SimpleDateFormat("HH").parse(StartTimehrs));
				StartTimehrs = new SimpleDateFormat("HH")
						.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(strdatetime));
				//StartTimemin = new SimpleDateFormat("mm").format(new SimpleDateFormat("mm").parse(StartTimehrs));
				StartTimemin = new SimpleDateFormat("mm")
						.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(strdatetime));

				System.out.println("StartTimehrs--->" + StartTimehrs);
				System.out.println("StartTimemin--->" + StartTimemin);
				ReportDate1 = request.getParameter("ReportDateTime");

				ReportDate = request.getParameter("ReportDateTime");
				ReportTimehrs = request.getParameter("ReportDateTime");
				ReportTimemin = request.getParameter("ReportDateTime");
				//System.out.println("ReportDate--->"+ReportDate);
				//System.out.println("ReportTimehrs--->"+ReportTimehrs);
				//System.out.println("ReportTimemin-->"+ReportTimemin);
				ETA1 = request.getParameter("ETA");

				ETA = request.getParameter("ETA");
				ETAhrs = request.getParameter("ETA");
				ETAmin = request.getParameter("ETA");
				//System.out.println("ETA--->"+ETA);
				//System.out.println("ETAhrs--->"+ETAhrs);
				//System.out.println("ETAmin-->"+ETAmin);
				System.out.println("INNN 333");

				if (request.getParameter("tripflag") != null) {
					tripflag = request.getParameter("tripflag");
				}
				System.out.println("\n\n TRIP FLAG from edit--->>>" + tripflag);
				System.out.println("\n\n report date-->> " + ReportDate);
				String nullable = "";
				nullable = "null";

				if (ReportDate == null || ReportDate.equalsIgnoreCase(nullable)) {
					System.out.println("\n\n in null of report time ");
					ReportDate = "-";
					ReportTimehrs = "-";
					ReportTimemin = "-";
				} else {
					System.out.println("\n\n in not null of reporrt time");
					ReportDate = new SimpleDateFormat("dd-MMM-yyyy")
							.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ReportDate1));
					ReportTimehrs = new SimpleDateFormat("HH")
							.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ReportDate1));
					ReportTimemin = new SimpleDateFormat("mm")
							.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ReportDate1));
				}

				/*
				 System.out.println("ReportDate--->"+ReportDate);
				 System.out.println("ReportTimehrs--->"+ReportTimehrs);
				 System.out.println("ReportTimemin-->"+ReportTimemin);*/
				String nullableeta = "";
				nullableeta = "null";
				System.out.println("\nETA-->>" + ETA);
				if (ETA == null || ETA.equalsIgnoreCase(nullableeta)) {
					System.out.println("\n\n if loop");
					ETA = "-";
					ETAhrs = "-";
					ETAmin = "-";
				} else {
					System.out.println("\n\n else loop");
					ETAhrs = new SimpleDateFormat("HH")
							.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETA));
					ETAmin = new SimpleDateFormat("mm")
							.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETA));
					ETA = new SimpleDateFormat("dd-MMM-yyyy")
							.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETA));

				}

				//String strdate1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(strdate));
				Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
				//String strdate = formatter1.format(strdate1);
				//String rptdte = formatter1.format(ReportDate);

				driverid = request.getParameter("driverid");
				drivern = request.getParameter("drivern");
				triid = request.getParameter("tripid");
				String toll = "", rto = "", loading = "", unloading = "", tripregion = "", loadstatus = "",
						wieghbridge = "", da = "", fixedkm = "", ratekm = "", tripexpense = "", othexpense = "",
						fuel = "";
				String LPO = "", trailerno = "", custcontactperson = "", custcontactno = "", tokenno = "",
						tokenchargespaid = "", salesperson = "", containertype = "", containerstatus = "",
						rate_hour = "", cnfilename = "";

				/* =========================================================== */
				String sql72 = "select * from t_startedjourney where TripId='" + triid + "'";

				rs5 = stmt1.executeQuery(sql72);
				if (rs5.next()) {
					weight = rs5.getString("Weight");
					vendor = rs5.getString("Vendor");
					TripCategory = rs5.getString("TripCategory");
					frieg = rs5.getString("Frieght");
					adv = rs5.getString("Advance");
					loadrsn = rs5.getString("Loadreason");
					loadcmnt = rs5.getString("Loadcomments");
					goodscontent = rs5.getString("GoodsContent");
					lrissue = rs5.getString("lrissuedby");
					lrcontact = rs5.getString("lrcontact");
					boffice = rs5.getString("branchoffice");
					cnno = rs5.getString("cnnumber");
					JStatus = rs5.getString("JStatus");
					joborderno = rs5.getString("joborderno");

					containerno = rs5.getString("containerno");
					toll = rs5.getString("Toll");
					rto = rs5.getString("RTO");
					loading = rs5.getString("Loading");
					unloading = rs5.getString("UnLoading");
					wieghbridge = rs5.getString("WeighBridge");

					da = rs5.getString("DA");
					othexpense = rs5.getString("othexpense");
					LPO = rs5.getString("LPO");
					trailerno = rs5.getString("trailerno");
					custcontactperson = rs5.getString("customercontperson");
					custcontactno = rs5.getString("customercontno");
					tokenno = rs5.getString("tokenno");
					tokenchargespaid = rs5.getString("tokenchargespaid");
					salesperson = rs5.getString("salesperson");
					revenue = rs5.getString("revenue");
					containertype = rs5.getString("containertype");
					containerstatus = rs5.getString("containerstatus");
					rate_hour = rs5.getString("rate_hour");
					fuel = rs5.getString("fuel");
					cnfilename = rs5.getString("cnfilename");

					tripregion = rs5.getString("tripregion");
					loadstatus = rs5.getString("loadstatus");

				}
				String user = session.getValue("usertypevalue").toString();
				System.out.println("ooh" + user);

				String typeofuser = session.getAttribute("TypeofUser").toString();
				System.out.println(" User Suyog " + typeofuser);

				java.util.Date d = new java.util.Date();
				//String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();
				int hours = (d.getHours());
				int minutes = (d.getMinutes());
				try {
					minutes = Integer.parseInt(session.getAttribute("Minute").toString());
				} catch (Exception e) {
					e.printStackTrace();
					minutes = (d.getMinutes());
				}

				String nwfrmtdte = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

				String duplicatetripid = request.getParameter("duplicatetripid");
				if (duplicatetripid == null) {
				} else {
	%>

	<div class="d-grid gap-2 col-8 mx-auto mt-2">
		<font color="maroon"> <B> This Trip Id is already been
				allocated. Please enter new one. </B></font>
	</div>
	<%
		}
				String driveriddup = request.getParameter("duplicate");
				if (driveriddup == null) {
				} else {
	%>
	<div class="d-grid gap-2 col-8 mx-auto mt-2">
		<font color='maroon'> <B> This Driver Id has already been
				allocated. Please enter another Id </B></font>
	</div>
	<%
		}
	%>
	<input type="hidden" name="vehno" value="<%=vehno%>" />


	<!-- BEGIN: Content-->
	<div class="app-content content ">
		<!-- app-content content -->
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<!-- content-wrapper -->
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0" style="color: #060637">
								Edit Trip Information of Vehicle
								<%=vehno%>
								Trip
								<%=triid%></h3>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">

							<%@ include file="RegisterCompScript.jsp"%>

							<button id="kt_engage_demos_toggle"
								class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0 btn2">
								<span id="kt_engage_demos_label">Help</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="content-body">
				<!-- content-body -->
				<!-- Basic Vertical form layout section start -->

				<section class="sectionNew" id="basic--layouts">
					<div class="row">
						<!-- Main ROw -->
						<div class="col-md-12 col-12">
							<!-- col-md-12 -->
							<div class="card">
								<!-- card -->
								<div class="card-body card">
									<!-- card-body card -->

									<!-- 									<form  class="form form-vertical" name="tripform" action="tripstartentryupdated.jsp" method="post" onSubmit="return validate();" enctype="multipart/form-data">
 -->
									<form class="form form-vertical" name="tripform" action=""
										method="post" onSubmit="return validate();"
										enctype="multipart/form-data">

										<input type="hidden" name="castrolroutecode"
											id="castrolroutecode" value=""></input> <input type="hidden"
											name="castrolroutecode1" id="castrolroutecode1" value=""></input>


										<div class="row col-12 mb-2" style="display: none">
											<div class="col-8 mt-1">
												<label id="element_1" name="element_1" class="tcolor"><font
													style="color: red;">*</font>Fixed Route: </label>
												<div class="form-check form-check-inline ">
													<input class="form-check-input" type="radio" id="route"
														name="route" value="Yes" onclick="getTripInfo(this);">
													<label class="form-check-label">Yes</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" id="route"
														name="route" value="No" checked
														onclick="getTripInfo(this);"> <label
														class="form-check-label">No</label>
												</div>
											</div>
										</div>
										<%
											sql2 = "select distinct Warehouse from t_warehousedata where Owner='" + user
															+ "'  order by WareHouse asc ";
													System.out.println(
															"ssqqll my------------------------------------------------------------------>>" + sql2);
													rs2 = stmt1.executeQuery(sql2);
										%>

										<div class="row">
											<!-- Item alignment center  -->
											<div class="col-6">
												<label class="tcolor" id="element_1_ori"
													name="element_1_ori"><font color="red">*</font>Origin</label><br>
												<div>
													<div>
														<div id="routediv"></div>
													</div>
													<div>
														<div id="routediv1"></div>
													</div>
													<div>
														<div>
															<div id="mydiv2"></div>
														</div>

													</div>
													<div>
														<div>
															<div id="fixeddiv"></div>
														</div>
													</div>
													<div id="mydiv02" class="input-container">
														<select class="form-select" name="stloc" id="stloc"
															onChange="showothloc(this);"
															aria-label="Default select example">
															<option value="<%=strloc%>" selected="selected"><%=strloc%></option>

															<!-- <option value="Select" selected="selected" >Select</option> -->
															<%
																String startLocation = "Select";
																		String sql9 = "select StartPlace from t_completedjourney where VehRegNo='" + vehno
																				+ "' order by StartDate desc limit 1";
																		System.out.println(sql9);
																		ResultSet rs9 = stmt9.executeQuery(sql9);
																		if (rs9.next()) {
																			startLocation = rs9.getString("StartPlace");
															%>
															<option value="<%=startLocation%>"><%=startLocation%>
															</option>
															<%
																}

																		while (rs2.next()) {
															%>
															<option value="<%=rs2.getString("WareHouse")%>"><%=rs2.getString("WareHouse")%>
															</option>
															<%
																}
															%>
															<option value="Other">Other</option>
														</select>
													</div>
													<div class="mt-1">
														<input type="text" class="form-control" name="othstrtloc"
															style="display: none;" placeholder="Enter Origin" />
													</div>
												</div>
											</div>
											<%
												sql3 = "select distinct Warehouse from t_warehousedata where Owner='" + user
																+ "'  order by WareHouse asc ";
														//out.print(sql3); 
														rs3 = stmt2.executeQuery(sql3);
											%>
											<div class="col-6">
												<label class="tcolor" id="element_1_dest"
													name="element_1_dest"> <font color="red">*</font>Destination
												</label>
												<div class="input-container">
													<select class="form-select" id="dest" name="dest"
														aria-label="Default select example"
														onChange="showothdest(this);">
														<option value="<%=endp%>" selected="selected"><%=endp%></option>

														<%
															while (rs3.next()) {
														%>
														<option value="<%=rs3.getString("WareHouse")%>"><%=rs3.getString("WareHouse")%>
														</option>
														<%
															}
														%>
														<option value="Other">Other</option>
													</select>
												</div>
												<div class="mt-1">
													<input type="text" class="form-control" name="othdest"
														id="thedest" style="visibility: hidden;"
														placeholder="Enter Destination" />
												</div>
												<div id="destdiv1"></div>
											</div>

										</div>
										<div class="row">
											<!-- Item alignment center  -->
											<div class="col-6">
												<label class="tcolor" id="element_1_dest"
													name="element_1_dest"> <font color="red">*</font>Working
													Zone
												</label><br>
												<div class="input-container">
													<select class="form-select" name="Zone" id="Zone"
														aria-label="Default select example">
														<option value="<%=tripregion%>" selected="selected"><%=tripregion%></option>

														<option value="East">East</option>
														<option value="West">West</option>
														<option value="South">South</option>
														<option value="North">North</option>
													</select>
												</div>
											</div>

											<div class="col-6">
												<label class="tcolor" id="element_1_dest"
													name="element_1_dest"> <font color="red">*</font>Load/Unload
												</label><br>
												<div class="input-container">
													<select class="form-select" name="lounl" id="lounl"
														aria-label="Default select example">
														<option value="<%=loadstatus%>" selected="selected"><%=loadstatus%></option>

														<option value="Load">Load</option>
														<option value="Unload">Unload</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-4">
												<label class="tcolor" id="element_1" name="element_1"><font
													color="red">*</font>Start:</label>
												<div class="input-group input-group-merge">
													<input type="text" id="calender" name="calender"
														class="form-control" value="<%=strdate%>"
														onblur="javascript:funETA();" readonly="readonly" /> <span
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
													$(document)
															.ready(
																	function() {
																		$(function() {
																			$(
																					"#calender")
																					.datepicker(
																							{
																								dateFormat : 'dd-M-yy',
																								changeMonth : true,
																								changeYear : true
																							/* minDate: 0,
																									maxDate:7  */
																							});
																		});

																	});
												</script>
											</div>
											<div class="col-1">
												<label class="tcolor">HH:</label>
												<div class="input-group input-group-merge">
													<select name="sttime1" id="sttime1" class="form-select"
														value="" onblur="javascript:funETA();">

														<option value="<%=StartTimehrs%>" selected="selected"><%=StartTimehrs%></option>

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
											<div class="col-1">
												<label class="tcolor">MM</label>
												<div class="input-group input-group-merge">
													<select name="sttime2" id="sttime2" class="form-select"
														onblur="javascript:funETA();">
														<option value="<%=StartTimemin%>"><%=StartTimemin%></option>

														<option value="00">00</option>
														<option value="10">10</option>
														<option value="20">20</option>
														<option value="30">30</option>
														<option value="40">40</option>
														<option value="50">50</option>
													</select>
												</div>
											</div>
											<div class="col-4">
												<label class="tcolor" id="element_1" name="element_1"><font
													color="red">*</font>End(ETA):</label>
												<div class="input-group input-group-merge">
													<input type="text" id="etadate" name="etadate"
														class="form-control" size="15" value="<%=ETA%>"
														readonly="readonly" /> <span class="input-group-text"><svg
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
													$(document)
															.ready(
																	function() {
																		$(function() {
																			$(
																					"#etadate")
																					.datepicker(
																							{
																								dateFormat : 'dd-M-yy',
																								changeMonth : true,
																								changeYear : true
																							/* minDate: 0,
																									maxDate:7  */
																							});
																		});

																	});
												</script>
											</div>
											<div class="col-1">
												<label class="tcolor">HH:</label>
												<div class="input-group input-group-merge">
													<select name="etatime1" id="etatime1" class="form-select">
														<option value="<%=ETAhrs%>" selected="selected"><%=ETAhrs%></option>

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
											<div class="col-1">
												<label class="tcolor">MM</label>
												<div class="input-group input-group-merge">
													<select id="etatime2" name="etatime2" class="form-select">
														<option value="<%=ETAmin%>"><%=ETAmin%></option>

														<option value="00">00</option>
														<option value="10">10</option>
														<option value="20">20</option>
														<option value="30">30</option>
														<option value="40">40</option>
														<option value="50">50</option>
													</select> <input type=text name="etatime3" id="etatime3"
														class="form-control" style="display: none;">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1"><font
													color="red">*</font>Trip Issue:</label>
												<div class="input-group input-group-merge">
													<input type="text" id="element_3_3" name="element_3_3"
														class="form-control" value="<%=datenew1%>"
														readonly="readonly" /> <span class="input-group-text"><svg
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
													$(document)
															.ready(
																	function() {
																		$(function() {
																			$(
																					"#element_3_3")
																					.datepicker(
																							{
																								dateFormat : 'dd-M-yy',
																								changeMonth : true,
																								changeYear : true
																							/* minDate: 0,
																									maxDate:7  */
																							});
																		});

																	});
												</script>
											</div>
											<div class="col-4">
												<label class="tcolor" id="element_1" name="element_1"><font
													color="red">*</font>Reporting</label>
												<div class="input-group input-group-merge">
													<input type="text" id="calender1" name="calender1"
														class="form-control" size="15" value="<%=ReportDate%>"
														readonly="readonly" /> <span class="input-group-text"><svg
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
													$(document)
															.ready(
																	function() {
																		$(function() {
																			$(
																					"#calender1")
																					.datepicker(
																							{
																								dateFormat : 'dd-M-yy',
																								changeMonth : true,
																								changeYear : true
																							/* minDate: 0,
																									maxDate:7  */
																							});
																		});

																	});
												</script>
											</div>
											<div class="col-md-1">
												<label class="tcolor">HH:</label>
												<div class="input-group input-group-merge">
													<select name="rpttime1" id="rpttime1" class="form-select">
														<option value="<%=ReportTimehrs%>"><%=ReportTimehrs%></option>

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
											<div class="col-md-1">
												<label class="tcolor">MM</label>
												<div class="input-group input-group-merge">
													<select id="rpttime2" name="rpttime2" class="form-select">
														<option value="<%=ReportTimemin%>"><%=ReportTimemin%></option>

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
										<div class="row col-12">
											<%
												String sql34 = "";
														if (typeofuser.equals("GROUP") || typeofuser.equalsIgnoreCase("GROUP")) {
															//String sql355="select GPname from db_gps.t_group where gpname='Castrol'";
															//ResultSet rs355=stmt355.executeQuery(sql355);
															//String Who=rs355.getString(1);

															sql34 = "select Distinct(TripCategory) from t_startedjourney where GPName='" + user
																	+ "' order By TripCategory Asc";

															//System.out.print("");
														}

														else {
															sql34 = "select Distinct(TripCategory) from t_startedjourney where OwnerName='" + user
																	+ "'  OR GPName='" + user + "' order By TripCategory Asc";

														}

														// out.print(sql3);
														if (user.equals("Castrol")) {
															sql34 = "select TripCategory from db_gps.t_startedjourney where TripCategory='Tanker' limit 1";
															ResultSet rs34 = stmt3.executeQuery(sql34);
															System.out.print("hhh" + user);
											%>

											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Trip
													Type:</label><br>
												<div class="input-container">
													<select class="form-select" id="TripCategory"
														name="TripCategory" aria-label="Default select example"
														onChange='showothcategry(this)'>
														<option value="<%=TripCategory%>" selected="selected"><%=TripCategory%></option>
														<%
															while (rs34.next()) {
														%>
														<option value="<%=rs34.getString("TripCategory")%>"><%=rs34.getString("TripCategory")%>
														</option>


														<%
															}
														%>

														<option value="Other">Other</option>
													</select>
												</div>
												<div class="mt-1">
													<input type="text" class="form-control"
														name="othTripCategory" id="othTripCategory"
														style="visibility: hidden;" placeholder="Enter Trip Type" />
												</div>
												<div id="categorydiv1"></div>
											</div>
											<%
												} else {
															ResultSet rs34 = stmt4.executeQuery(sql34);
															System.out.println("Trip cat query is " + sql34);
											%>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Trip
													Type:</label><br>
												<div class="input-container">
													<select class="form-select" id="TripCategory"
														name="TripCategory" aria-label="Default select example"
														onChange='showothcategry(this)'>
														<option value="<%=TripCategory%>" selected="selected"><%=TripCategory%></option>
														<%
															while (rs34.next()) {
														%>
														<option value="<%=rs34.getString("TripCategory")%>"><%=rs34.getString("TripCategory")%>
														</option>


														<%
															}
														%>

														<option value="Other">Other</option>
													</select>
												</div>
												<div class="mt-1">
													<input type="text" class="form-control"
														name="othTripCategory" id="othTripCategory"
														style="visibility: hidden;" placeholder="Enter Trip Type" />
												</div>
												<div id="categorydiv1"></div>
											</div>
											<%
												}
											%>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Trip
													Id:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="tripid"
														name="tripid" value="<%=triid%>"
														placeholder="Enter Trip Id" readonly="readonly">
												</div>
											</div>
										</div>
										<%
											sql33 = "select Distinct(Vendor) from t_startedjourney where OwnerName='" + user + "' OR GPName='"
															+ user + "' order By Vendor Asc";
													// out.print(sql3); 
													rs33 = stmt5.executeQuery(sql33);
										%>
										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1"><font
													color="red">*</font>Customer:</label><br>
												<div class="input-container">
													<select class="form-select" id="vendor" name="vendor"
														aria-label="Default select example"
														onChange="showothvendor(this);">
														<option value="<%=vendor%>"><%=vendor%></option>
														<%
															while (rs33.next()) {
														%>
														<option value="<%=rs33.getString("Vendor")%>"><%=rs33.getString("Vendor")%>
														</option>
														<%
															}
														%>
														<option value="Other">Other</option>
													</select>
												</div>
												<div class="mt-1">
													<input type="text" class="form-control" name="othvendor"
														id="thevendor" style="visibility: hidden;"
														placeholder="Enter customer name" />
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">
													<font color="red"> *</font>Driver Name:
												</label><br>
												<div class="input-container">
													<select class="form-select" id="driverid" name="driverid"
														aria-label="Default select example"
														onChange="showothrdriverid(this);">
														<%
															sql4 = "select * from t_completedjourney where VehRegNo='" + vehno
																			+ "' order by StartDate desc limit 1";
																	System.out.println(sql4);
																	rs5 = stmt6.executeQuery(sql4);
																	if (rs5.next()) {
																		lastdriverid = rs5.getString("DriverId");
																		lastdrivername = rs5.getString("DriverName");
														%>
														<option value="<%=rs5.getString("DriverID")%>"><%=rs5.getString("DriverName") + "( " + rs5.getString("DriverID") + " )"%>
														</option>
														<%
															} else {
														%>
														<option value="<%=driverid%>"><%=driverid%></option>
														<%
															}
																	sql4 = "select * from t_drivers where Owner='" + user + "' and DriverID<>'" + lastdriverid
																			+ "' order by DriverName asc ";
																	rs4 = stmt6.executeQuery(sql4);
														%>
														<%
															while (rs4.next()) {
																		//System.out.println("IN while");
														%>
														<option value="<%=rs4.getString("DriverID")%>"><%=rs4.getString("DriverName") + "( " + rs4.getString("DriverID") + " )"%>
														</option>
														<%
															} //
														%>
														<option value="Other">Other</option>
													</select>
												</div>
												<div class="mt-1" id="tabid">
													<label class="tcolor" id="newid" name="newid"
														style="display: none">Driver Id:</label><br> <input
														type="text" class="form-control" name="othdriverid"
														style="display: none;" placeholder="Enter Driver Id " /> <label
														class="tcolor" id="newdrvname" name="newdrvname"
														style="display: none">Driver Name:</label><br> <input
														type="text" class="form-control" id="newdrivname"
														name="newdrvname" style="display: none;"
														placeholder="Enter Driver Name" />
												</div>
											</div>
										</div>

										<input type="hidden" name="drivername"
											value="<%=lastdrivername%>" readonly />

										<div class="row col-12">
											<div class="col-6">
												<div class="md-2">
													<label class="tcolor">LPO :</label><br>
													<div class="input-container">
														<input class="form-control" type="text" id="element_3_11"
															value="<%=LPO%>" name="element_3_11"
															placeholder="Enter LPO">
													</div>
												</div>
											</div>
											<div class="col-6">
												<div class="md-2">
													<label class="tcolor" id="element_1" name="element_1">Trailer
														No:</label>

													<div class="input-container">
														<input class="form-control" type="text" id="element_3_12"
															name="element_3_12" value="<%=trailerno%>"
															placeholder="Enter Trailer No">
													</div>
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<div class="md-2">
													<label class="tcolor" id="element_1" name="element_1">Customer
														Contact Person:</label><br>
													<div class="input-container">
														<input class="form-control" type="text" id="element_3_13"
															name="element_3_13" value="<%=custcontactperson%>"
															placeholder="Enter Customer Contact Person">
													</div>
												</div>
											</div>
											<div class="col-6">
												<div class="md-2">
													<label class="tcolor" id="element_1" name="element_1">Customer
														contact No:</label><br>
													<div class="input-container">
														<input class="form-control" type="text" id="element_3_14"
															name="element_3_14" value="<%=custcontactno%>"
															placeholder=" Enter Customer contact No">
													</div>
												</div>
											</div>
										</div>

										<div class="row col-12">
											<div class="col-6">
												<div class="md-2">
													<label class="tcolor" id="element_1" name="element_1">Container
														No:</label><br>
													<div class="input-container">
														<input class="form-control" type="text" id="containerno"
															name="containerno" value="<%=containerno%>"
															placeholder="Enter Container No">
													</div>
												</div>
											</div>
											<div class="col-6">
												<div class="md-2">
													<label class="tcolor" id="element_1" name="element_1">Job
														Order No:</label><br>
													<div class="input-container">
														<input class="form-control" type="text" id="joborderno"
															name="joborderno" value="<%=joborderno%>"
															placeholder=" Enter Job Order No">
													</div>
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<div class="md-2">
													<label class="tcolor" id="element_1" name="element_1">Container
														Type:</label><br>
													<div class="input-container">
														<input class="form-control" type="text" id="element_3_17"
															name="element_3_17" value="<%=containertype%>"
															placeholder="Enter Container Type">
													</div>
												</div>
											</div>
											<div class="col-6">
												<div class="md-2">
													<label class="tcolor" id="element_1" name="element_1">Revenue:</label><br>
													<div class="input-container">
														<input class="form-control" type="text" id="revenue"
															name="revenue" value="<%=revenue%>"
															placeholder=" Enter Revenue">
													</div>
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Token
													No:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="element_3_19"
														name="element_3_19" value="<%=tokenno%>"
														placeholder="Enter Token No">
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Token
													Charges Paid:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="element_3_20"
														name="element_3_20" value="<%=tokenchargespaid%>"
														placeholder=" Enter Token Charges Paid">
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Sales
													Person:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="element_3_21"
														name="element_3_21" value="<%=salesperson%>"
														placeholder="Enter Sales Person name">
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Container
													Status :</label><br>
												<div class="input-container">
													<select class="form-select" id="element_3_22"
														name="element_3_22" aria-label="Default select example">
														<option value="<%=containerstatus%>" selected="selected"><%=containerstatus%></option>
														<option value="-">-</option>
														<option value="Import">Import</option>
														<option value="Export">Export</option>
													</select>
												</div>
											</div>
										</div>

										<%
											sql33 = "select Distinct(Loadreason) from t_startedjourney where OwnerName='" + user
															+ "'  OR GPName='" + user + "'  order By Vendor Asc";
													// out.print(sql3); 
													rs33 = stmt7.executeQuery(sql33);
										%>
										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Load
													Delay Reason:</label><br>
												<div class="input-container">
													<select class="form-select" id="Loadreason"
														name="Loadreason" onChange="showothLoadreason(this);"
														aria-label="Default select example">
														<option value=<%=loadrsn%>>Select</option>
														<%
															while (rs33.next()) {
														%>
														<option value="<%=rs33.getString("Loadreason")%>"><%=rs33.getString("Loadreason")%>
														</option>
														<%
															}
														%>
														<option value="Other">Other</option>
													</select>
												</div>
												<div class="mt-1">
													<input type="text" class="form-control"
														name="othLoadreason" id="othLoadreason"
														style="visibility: hidden;"
														placeholder="Enter Load Delay Reason " />
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Weight
													Load</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="weight"
														value="<%=weight%>" name="weight"
														placeholder="Enter Weight Load">
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor">Freight :</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="frie"
														name="frie" value="<%=frieg%>"
														placeholder=" Enter Freight">
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">CN
													:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="cnnumber"
														name="cnnumber" value="<%=cnno%>" placeholder="Enter CN">
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Advance:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="adv" name="adv"
														value="<%=adv%>" placeholder="Enter in Advance">
													Rs.
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Branch
													Office Code:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="bcode"
														name="bcode" value="<%=boffice%>"
														placeholder=" Enter Branch Office Code ">
												</div>
											</div>
											<%
												String sql45 = "select Distinct(GoodsContent) from t_startedjourney where OwnerName='" + user
																+ "' OR GPName='" + user + "' order By GoodsContent Asc";
														// out.print(sql3); 
														ResultSet rs45 = stmt8.executeQuery(sql45);
											%>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Product
													Name:</label><br>
												<div class="input-container">
													<select class="form-select" id="GoodsContent"
														name="GoodsContent" aria-label="Default select example"
														onChange='showothcontent(this)'>
														<option value="<%=goodscontent%>"><%=goodscontent%></option>
														<%
															while (rs45.next()) {
														%>
														<option value="<%=rs45.getString("GoodsContent")%>"><%=rs45.getString("GoodsContent")%>
														</option>


														<%
															}
														%>

														<option value="Other">Other</option>
													</select>
												</div>
												<div class="mt-1">
													<input type="text" class="form-control"
														name="othGoodsContent" id="othGoodsContent"
														style="visibility: hidden;"
														placeholder="Enter Product Name" />
												</div>
												<div id="contentdiv1"></div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">LR
													Issued By:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="lrissue"
														name="lrissue" value="<%=lrissue%>"
														placeholder="LR Issued By">
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">LR
													Contact:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="lrcontact"
														name="lrcontact" value="<%=lrcontact%>"
														placeholder="LR Contact">
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div id="fx01" class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Fixed
													KM:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="fxdkm"
														name="fxdkm" value="<%=fixedkm%>"
														placeholder="Enter Fixed KM:">
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Rate/Km:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="ratekm"
														name="ratekm" value="<%=ratekm%>"
														placeholder=" Enter Rate/Km " onblur="validateRatekm()">
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Rate/Hr.:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="ratehr"
														value="<%=rate_hour%>" name="ratehr"
														placeholder="Enter Rate/Hr.">
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Fixed
													Time :</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="ftme"
														name="ftme" value="<%=fixedkm%>"
														placeholder=" Enter Fixed Time">
												</div>
												<div class="d-grid gap-2 col-5 mx-auto mt-1">
													<button class="btn btn-primary" name="Computetripexpence"
														value="Compute Trip Expense"
														onClick="return computetripexpence123()">Compute
														Trip Expense</button>
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div id="fx9" class="col-6">
												<label id="element_1" name="element_1" class="tcolor">
													Trip Expense:</label><br> <input class="form-control"
													type="text" id="tripexp" name="tripexp"
													placeholder="Trip Expense" value="<%=tripexpense%>"
													readonly="readonly">

												<div class="d-grid gap-2 col-5 mx-auto mt-1">
													<button class="btn btn-primary" name="Compute ETA"
														value="Compute ETA" onClick="return computrtriptime()">Compute
														ETA</button>
												</div>
											</div>

											<div class="col-6">
												<label id="element_1" name="element_1" class="tcolor">CN
													File Upload :</label>
												<%
													if (cnfilename == "" || cnfilename.equals("")) {
												%>
												<label class="tcolor"> <font face="Arial"
													id="oldaddfnm123" size="2">NA</font></label>&nbsp;
												<%
													} else {
												%>
												<label class="tcolor"> <font face="Arial"
													id="oldaddfnm123" size="2"><%=cnfilename%></font></label>&nbsp;
												<%
													}
												%>
												<input class="form-control" type="file" name="Filename1"
													id="Filename1" value="" onchange="upload();"> <font
													id="f1" style="display: none;" name="f1"></font> <a
													href="#" onclick="remove1();" id="remove1"
													style="display: none;">Remove</a> <input id="f6" name=f6
													class="form-control" type="text" value=""
													style="display: none;" />
											</div>
										</div>

										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Toll
													:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="toll"
														name="toll" value="<%=toll%>" placeholder="Enter Toll">
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">RTO:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="rto" name="rto"
														value="<%=rto%>" placeholder=" Enter RTO">
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Loading
													:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="loading"
														name="loading" value="<%=loading%>"
														placeholder="Enter Loading">
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Unloading
													:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="unloading"
														name="unloading" value="<%=unloading%>"
														placeholder=" Enter Unloading ">
												</div>
											</div>
										</div>
										<div class="row col-12">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">WeighBridge
													:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="weighbridge"
														name="weighbridge" value="<%=wieghbridge%>"
														placeholder="Enter WeighBridge">
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">DA
													:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="DA" name="DA"
														value="<%=da%>" placeholder=" Enter DA">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Fuel
													:</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="fuel"
														name="fuel" value="<%=fuel%>" placeholder="Enter Fuel">
												</div>
											</div>
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1">Other
													Expense :</label><br>
												<div class="input-container">
													<input class="form-control" type="text" id="othexpense"
														name="othexpense" value="<%=othexpense%>"
														placeholder=" Enter Other Expence">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-6">
												<label class="tcolor" id="element_1" name="element_1"><b>Comments</b></label><br>
												<div class="input-container">
													<textarea class="form-control" name="loadcmnt"
														placeholder="Enter a comment here"><%=loadcmnt%></textarea>
												</div>
											</div>
										</div>
										<div class="row mt-1">
											<div class="col-2"></div>
											<div class="d-grid col-4">
												<button class="btn btn-primary btn2" type="submit"
													id="saveForm" name="submit" onClick="return validate()">Submit</button>
											</div>
											<div class="d-grid col-4">
												<button class="btn btn-danger" type="reset" name="submit"
													onclick="cancelbutton();">Cancel</button>

											</div>
										</div>
									</form>
								</div>
								<!-- card-body card -->
							</div>
							<!-- card -->
						</div>
						<!-- col-md-12 -->
					</div>
					<!-- Main ROw -->
				</section>
				<!-- Basic Vertical form layout section end -->
			</div>
			<!-- content-body -->
		</div>
		<!-- content-wrapper -->
	</div>
	<!-- app-content content -->

	<%
		} catch (Exception e) {
				out.println("Exception----->" + e);
			} finally {
				try {
					con1.close();
				} catch (Exception e) {
				}
				try {
					//fleetview.closeConnection();
				} catch (Exception e) {
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
</jsp:useBean>
