<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" import="moreservlets.listeners.*" errorPage=""%>
<link href="css/Fleetview.css" rel="stylesheet" type="text/css"></link>
<style type="text/css">
@import url(jscalendar-1.0/calendar-blue.css);
</style>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="javax.activation.*"%>
<%@ include file="headernew.jsp"%>
<script type="text/javascript" language="javascript"
	src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript"
	src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript"
	src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript"
	src="calendar/behaviour.js"></script>
<script type="text/javascript" language="javascript"
	src="calendar/datepicker.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript"
	src="calendar/behaviors.js"></script>
<%-- <jsp:useBean id="centconn" class="FormToolConnection.FormToolConn" scope="page"> --%>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page">
	<%
		fleetview.getConnection(MM_dbConn_DRIVER, MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

			//	String buffer=request.getParameter("buffer");
			//	System.out.println("buffer--------------------->"  +buffer);
	%>
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
			if (newempid123 == null || newempid123 == ""
					|| newempid123.length == 0) {
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

						if (!invalid.test(name)
								&& !((name == "" || name == null))) {
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

						if (!invalid.test(name)
								&& !((name == "" || name == null))) {
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

				if (!invalidbranchcode.test(branchcode)
						&& branchcode.length != 0)

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

				if (!(lrcontact.match(numericExpressionn))
						&& lrcontact.length != 0) {
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
				document.tripform.othstrtloc.style.visibility = "visible";
				showothstartloc = "Yes";
			} else {
				document.tripform.othstrtloc.style.visibility = "hidden";
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
				ajaxRequest.open("GET", "AjaxGetTripInfoDetails.jsp"
						+ queryString, true);
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
								ajaxRequest = new ActiveXObject(
										"Microsoft.XMLHTTP");
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

					var queryString = "?Rcode=" + strtend + "&strtdte="
							+ strtdte + "&strttmehrs=" + strttmehrs
							+ "&strttmemin=" + strttmemin;
					//alert(queryString);
					ajaxRequest.open("GET", "AjaxGetETAcal.jsp" + queryString,
							true);
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

			if (!(tripexpence.match(numericExpressionn))
					&& tripexpence.length != 0) {
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
			var querystring = "?fixedkm=" + fixedkm + "&tripexpence="
					+ tripexpence + "&ratekm=" + ratekm + "&ratehr=" + ratehr
					+ "&startdate=" + startdate + "&sttime1=" + sttime1
					+ "&sttime2=" + sttime2 + "";
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
			ajaxRequest
					.open("GET", "Ajax_TripDriverid.jsp" + queryString, true);
			ajaxRequest.send(null);

		}
	</script>

	<%
		//Connection con1 = null;
			Statement stdynamicdrop = null;
			String datenew1 = "", datenew2 = "", datenew3 = "";
			datenew1 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
			datenew3 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date());
			datenew2 = datenew1;
			String strloc, strdate, strtime, endp, driverid, drivern, triid;
			//centconn.getConnection();
			//con1=centconn.ReturnConnection();
			//Class.forName(MM_dbConn_DRIVER);
			//con1 = fleetview.ReturnConnection();
			//stdynamicdrop=con1.createStatement();
			//String user = session.getValue("usertypevalue").toString();
			//System.out.println("ooh"+user);
			/* java.util.Date d = new java.util.Date();
							//String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();
							int hours = (d.getHours());
							int minutes = (d.getMinutes());
							try{
								minutes=Integer.parseInt(session.getAttribute("Minute").toString());
							}catch(Exception e){
								e.printStackTrace();
								 minutes = (d.getMinutes());
							} */
	%>

	<form name="tripform" action="tripstartentryupdated.jsp" method="post"
		onSubmit="return validate();" enctype="multipart/form-data">
		<input type="hidden" name="castrolroutecode" id="castrolroutecode"
			value=""></input> <input type="hidden" name="castrolroutecode1"
			id="castrolroutecode1" value=""></input>


		<%!Connection con1;%>
		<div id="mytable">
			<%
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
			<table border="0" width="100%" class="stats">
				<tr>
					<td>
						<div align="center">
							<font color="maroon"> <B> This Trip Id is already been
									allocated. Please enter new one. </B>
							</font>
						</div>
					</td>
				</tr>
			</table>
			<%
				}

						String driveriddup = request.getParameter("duplicate");
						if (driveriddup == null) {
						} else {
			%>
			<table border="0" width="110%" bgcolor="white" class="stats">
				<tr>
					<td>
						<div align="center">
							<font color="maroon"> <b>This Driver Id has already
									been allocated. Please enter another Id </b>
							</font>
						</div>
					</td>
				</tr>
			</table>

			<%
				}
			%><input type="hidden" name="vehno" value="<%=vehno%>" />

			<div align="center" class="headerlay">
				<table style="color: #fff;">
					<tbody>
						<tr>
							<td><label id="element_1" name="element_1"
								class="description" for="element_1"><font size="3">
										<b>Edit Trip Information of Vehicle <%=vehno%> Trip <%=triid%></b>
								</font> </label></td>
						</tr>
					</tbody>
				</table>
			</div>

			<table border="0" width="400" align="center"
				class="sortable_entry_new">

				<tr style="display: none">
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><font color="red"> *</font><b>Fixed
								Route : </b> </label><input id="route" name="route" class="element radio"
						type="radio" value="Yes" onclick="getTripInfo(this);">Yes<input
						id="route" name="route" class="element radio" type="radio"
						value="No" checked onclick="getTripInfo(this);">No</textarea>1,1</td>
					<td>1,2</td>
				</tr>
				<%
					sql2 = "select distinct Warehouse from t_warehousedata where Owner='" + user
									+ "'  order by WareHouse asc ";
							System.out.println(
									"ssqqll my------------------------------------------------------------------>>" + sql2);
							rs2 = stmt1.executeQuery(sql2);
				%>
				<tr>
					<td><label id="element_1_ori" name="element_1_ori"
						class="description" for="element_1"><font color="red">
								*</font><b>Origin :</b> </label> <%-- <select id="stloc" name="stloc"  class="element select medium" onChange="showothloc(this);"> 
<%
						String startLocation="Select";
							String sql9 = "select StartPlace from t_completedjourney where VehRegNo='"
											+ vehno + "' order by StartDate desc limit 1";
									System.out.println("sql9:-------------------------------------------------------"+sql9);
									ResultSet rs9 = stmt9.executeQuery(sql9);
									if (rs9.next()) {
										startLocation = rs9.getString("StartPlace");
						%>
						<option value="<%=startLocation%>" selected="selected"><%=startLocation%>
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
						<option value="Other">Other</option> --%> </select>&nbsp;&nbsp;&nbsp; <!-- <input type="text" class="element text medium" name="othstrtloc" style="visibility: hidden;width: 150px" /> -->
						<table border="0">
							<tr>
								<td>
									<div id="routediv"></div>
								</td>
								<td>
									<div id="routediv1">
								</td>
							</tr>
							<tr>
								<td>
									<div id="mydiv2"></div>
								</td>

							</tr>
							<tr>
								<td>
									<div id="fixeddiv"></div>
								</td>
							</tr>
						</table>
						<div id="mydiv02">
							<select name="stloc" class="element select medium"
								style="width: 200px" id="stloc" onChange="showothloc(this);">


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
							<input type="text" class="element text medium" name="othstrtloc"
								style="visibility: hidden; width: 150px" />
						</div> <!-- 	<input type="text" class="element text medium" name="othstrtloc" style="visibility: hidden;width: 150px" /> -->

						<br>
					<br>
					<!--4,1-->
				</td>
					<%
						sql3 = "select distinct Warehouse from t_warehousedata where Owner='" + user
										+ "'  order by WareHouse asc ";
								//out.print(sql3); 
								rs3 = stmt2.executeQuery(sql3);
					%>
					<td><label id="element_1_dest" name="element_1_dest"
						class="description" for="element_1"><font color="red">
								*</font><b>Destination :</b> </label> <select id="dest" name="dest"
						class="element select medium" onChange="showothdest(this);">
							<!-- <option value="Select">Select</option> -->
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
					</select><input type="text" class="element text medium" name="othdest"
						id="thedest" style="visibility: hidden; width: 150px" />
						<div id="destdiv1"></div> <br>
					<br>
					<!--4,2--></td>
				</tr>


				<tr>
					<td><label id="element_1_dest" name="element_1_dest"
						class="description" for="element_1"><font color="red">
								*</font><b>Working Zone :</b></label> <select name="Zone" id="Zone"
						style="width: 100px" class="element select medium">




							<option value="<%=tripregion%>" selected="selected"><%=tripregion%></option>

							<option value="East">East</option>
							<option value="West">West</option>
							<option value="South">South</option>
							<option value="North">North</option>
					</select></td>


					<td><label id="element_1_dest" name="element_1_dest"
						class="description" for="element_1"><font color="red">
								*</font><b>Load/Unload :</b></label> <select name="lounl" id="lounl"
						style="width: 100px" class="element select medium">
							<option value="<%=loadstatus%>" selected="selected"><%=loadstatus%></option>

							<option value="Load">Load</option>
							<option value="Unload">Unload</option>
					</select> <br>
					<br></td>
				</tr>




				<tr>

					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><font color="red"> *</font><b>Start :
						</b> </label> <input type="text" id="calender" name="calender"
						class="element text medium" style="width: 125px; height: 19px;"
						size="13" value="<%=strdate%>" onblur="javascript:funETA();"
						readonly /> &nbsp;&nbsp;&nbsp;&nbsp; <script
							type="text/javascript">
							Calendar.setup({
								inputField : "calender", // ID of the input field
								ifFormat : "%d-%b-%Y", // the date format
								button : "calender" // ID of the button
							});
						</script> <font> HH : </font> <select name="sttime1" id="sttime1"
						class="element select small" style="width: 50px"
						onblur="javascript:funETA();">

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

					</select> <font> MM :</font> <select name="sttime2" id="sttime2"
						class="element select medium" style="width: 50px"
						onblur="javascript:funETA();">
							<option value="<%=StartTimemin%>"><%=StartTimemin%></option>
							<option value="00">00</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>

					</select> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <%-- <input id="element_3_4" name="element_3_4"  class="datetimepicker" type="text"  value="<%=datenew3 %>" style="width: 198px;"   readonly/> --%>
						</textarea><br>
					<br>
					<!--3,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>End(ETA) : </b> </label> <%-- <input id="element_3_5" name="element_3_5"  class="datetimepicker" type="text"  value="<%=datenew3 %>" style="width: 198px;"   readonly/> --%>
						<input type="text" class="element text medium"
						style="width: 125px; height: 19px;" id="etadate" name="etadate"
						size="13" value="<%=ETA%>" readonly /> <!--        ///********Visible for fixed route for ETA Calculation*******************************       -->
						<!--<input type="text" name="etadatecal"  style="visibility:hidden" readonly/>-->
						<!--        ///***************************************       -->

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!--  <img src="../images/calendar.png" id="trigger" border="0"> -->
						<!--              <input type="button" name="etatrigger" id="etatrigger" value="Date" class="formElement"> -->
						<script type="text/javascript">
							Calendar.setup({
								inputField : "etadate", // ID of the input field
								ifFormat : "%d-%b-%Y", // the date format
								button : "etadate" // ID of the button
							});
						</script> <font> HH : </font> <!--<input type="text" name="etatime1cal"  style="visibility:hidden" readonly/>-->
						<select name="etatime1" id="etatime1"
						class="element select medium" style="width: 50px">
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
					</select> <font> MM :</font> <select class="element select medium"
						style="width: 50px;" id="etatime2" name="etatime2">

							<option value="<%=ETAmin%>"><%=ETAmin%></option>
							<option value="00">00</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>

					</select> <input type=text name="etatime3" id="etatime3"
						class="element select medium" style="width: 30px; display: none;">
						<br>
					<br>
					<!--3,2--></td>
				</tr>

				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><font color="red"> *</font><b>Trip
								Issue :</b> </label><input id="element_3_3" name="element_3_3"
						class="element text medium" type="text" value="<%=datenew1%>"
						size="15" readonly /> <script type="text/javascript">
							Calendar.setup({
								inputField : "element_3_3",
								ifFormat : "%d-%b-%Y",
								button : "element_3_3"
							});
						</script> </textarea><br>
					<br>
					<!--2,1--></td>

					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Reporting : </b> </label> <input id="calender1"
						name="calender1" class="element text medium"
						style="width: 125px; height: 19px;" size="13" type="text"
						value="<%=ReportDate%>" style="width: 198px;" readonly />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!--  <img src="../images/calendar.png" id="trigger" border="0"> -->
						<!--              <input type="button" name="trigger" id="trigger" value="Date" class="formElement"> -->
						<script type="text/javascript">
							Calendar.setup({
								inputField : "calender1", // ID of the input field
								ifFormat : "%d-%b-%Y", // the date format
								button : "calender1" // ID of the button
							});
						</script> <font> HH : </font> <select class="element select medium"
						id="rpttime1" style="width: 50px" name="rpttime1">
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
					</select> <font> MM :</font> <select class="element select medium"
						id="rpttime2" style="width: 50px" name="rpttime2">
							<option value="<%=ReportTimemin%>"><%=ReportTimemin%></option>
							<option value="00">00</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>

					</select> <br>
					<br>
					<!--2,2--></td>
				</tr>

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

				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Trip Type :</b> </label> <select
						id="TripCategory" name="TripCategory"
						class="element select medium" onChange='showothcategry(this)'>
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
					</select> <input type="text" class="element text medium"
						name="othTripCategory" id="othTripCategory"
						style="visibility: hidden; width: 150px" />
						<div id="categorydiv1"></div> <br>
					<br>
					<!--5,2--></td>

					<%
						} else {
									ResultSet rs34 = stmt4.executeQuery(sql34);
									System.out.println("Trip cat query is " + sql34);
					%>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Trip Type :</b> </label> <select
						id="TripCategory" name="TripCategory"
						class="element select medium" onChange='showothcategry(this)'>
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
					</select> <input type="text" class="element text medium"
						name="othTripCategory" id="othTripCategory"
						style="visibility: hidden; width: 150px" />
						<div id="categorydiv1"></div> <br>
					<br>
					<!--5,2--></td>
					<%
						}
					%>

					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><font color="red"> *</font><b>Trip ID
								:</b> </label> <input id="tripid" name="tripid" class="element text medium"
						type="text" value="<%=triid%>" readonly="readonly" /> <br>
					<br>
					<!--5,1--></td>
				</tr>
				<%
					sql33 = "select Distinct(Vendor) from t_startedjourney where OwnerName='" + user + "' OR GPName='"
									+ user + "' order By Vendor Asc";
							// out.print(sql3); 
							rs33 = stmt5.executeQuery(sql33);
				%>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><font color="red"> *</font><b>Customer
								:</b> </label> <select id="vendor" name="vendor"
						class="element select medium" onChange="showothvendor(this);">
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
					</select><input type="text" class="element text medium" name="othvendor"
						id="thevendor" style="visibility: hidden; width: 150px" />
						<div id="vendordiv1"></div> <br>
					<br>
					<!--6,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><font color="red"> *</font><b>Driver
								Name</b> </label> <select id="driverid" name="driverid"
						class="element select medium" onChange="showothrdriverid(this);">
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
					
						<div id="tabid">
							<!-- <table border="0" id="tabid"><tr><td> -->
							<label id="newid" name="newid" class="description"
								style="display: none" for="element_1"><b>Driv. Id :</b>
							</label>
							<!-- <label name="newid" id="newid" style="visibility: hidden">Driv. Id :</label> -->
							<input type="text" class="element text medium" name="othdriverid"
								style="display: none; width: 200px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label id="newdrvname" name="newdrvname" class="description"
								style="display: none" for="element_1"><b>Driv. Name
									:</b> </label>
							<!-- <label name="newdrvname" id="newdrvname" style="visibility: hidden"> Driv. Name</label> -->
							<input type="text" class="element text medium" id="newdrivname"
								name="newdrvname" style="display: none; width: 200px" />
						</div> <!-- </td></tr></table>  --> <br>
					<br>
					<!--6,2--></td>
				</tr>
				<input type="hidden" name="drivername" value="<%=lastdrivername%>"
					readonly />

				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>LPO :</b> </label><input id="element_3_11"
						name="element_3_11" class="element text medium" type="text"
						value="<%=LPO%>" />
					</textarea><br>
					<br>
					<!--7,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Trailer No :</b> </label><input
						id="element_3_12" name="element_3_12" class="element text medium"
						type="text" value="<%=trailerno%>" />
					</textarea><br>
					<br>
					<!--7,2--></td>
				</tr>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Customer Cont. Person :</b> </label><input
						id="element_3_13" name="element_3_13" class="element text medium"
						type="text" value="<%=custcontactperson%>" />
					</textarea><br>
					<br>
					<!--8,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Customer Cont. No :</b> </label><input
						id="element_3_14" name="element_3_14" class="element text medium"
						type="text" value="<%=custcontactno%>" />
					</textarea><br>
					<br>
					<!--8,2--></td>
				</tr>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Container No : </b> </label> <input
						id="containerno" name="containerno" class="element text medium"
						type="text" value="<%=containerno%>" /> <br>
					<br>
					<!--9,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Job Order No :</b> </label> <input
						id="joborderno" name="joborderno" class="element text medium"
						type="text" value="<%=joborderno%>" /> <br>
					<br>
					<!--9,2--></td>
				</tr>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Container Type :</b> </label> <input
						id="element_3_17" name="element_3_17" type="text" value=""
						class="element text medium" value="<%=containertype%>"> <!-- <select id="element_3_17" name="element_3_17"  class="element select medium" > 
<option value="select" selected="selected">select</option><option value="Z">Z</option><option value="B">B</option></select> -->
						</textarea><br>
					<br>
					<!--10,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Revenue :</b> </label> <input id="revenue"
						name="revenue" class="element text medium" type="text"
						value="<%=revenue%>" />
					</textarea><br>
					<br>
					<!--10,2--></td>
				</tr>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Token No :</b> </label><input id="element_3_19"
						name="element_3_19" class="element text medium" type="text"
						value="<%=tokenno%>" />
					</textarea><br>
					<br>
					<!--11,1--></td>
					<td>
						<!-- <label id="element_1" name="element_1"  class="description" for="element_1"><b>Token Charges Paid :</b> </label>
<select id="element_3_20" name="element_3_20"  class="element select medium" > 
<option value="select" selected="selected">select</option><option value="A">A</option>
<option value="B">B</option><option value="C">C</option></select>
 -->                    <label id="element_1" name="element_1" class="description"
						for="element_1"><b>Token Charges Paid :</b> </label><input
						id="element_3_20" name="element_3_20" class="element text medium"
						type="text" value="<%=tokenchargespaid%>" /> </textarea><br>
					<br>
					<!--11,2-->
					</td>
				</tr>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Sales Person :</b> </label> <input
						id="element_3_21" name="element_3_21" class="element text medium"
						type="text" value="<%=salesperson%>" /> </textarea><br>
					<br>
					<!--11,2--></td>
					<!-- <select id="element_3_21" name="element_3_21"  class="element select medium" > 
<option value="select" selected="selected">select</option><option value="A">A</option><option value="B">B</option><option value="C">C</option></select> -->
					</textarea>
					<br>
					<br>
					<!--12,1-->
					</td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Container Status :</b> </label><select
						id="element_3_22" name="element_3_22"
						class="element select medium">
							<option value="<%=containerstatus%>" selected="selected"><%=containerstatus%></option>
							<option value="-">-</option>
							<option value="Import">Import</option>
							<option value="Export">Export</option>
					</select>
					</textarea><br>
					<br>
					<!--12,2--></td>
				</tr>

				<%
					sql33 = "select Distinct(Loadreason) from t_startedjourney where OwnerName='" + user
									+ "'  OR GPName='" + user + "'  order By Vendor Asc";
							// out.print(sql3); 
							rs33 = stmt7.executeQuery(sql33);
				%>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Load Delay Reason :</b> </label> <select
						id="Loadreason" name="Loadreason"
						onChange="showothLoadreason(this);"
						class="eleMH 12 BP 6580ment select medium">
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
					</select> <br>
					<br>
					<!--13,1--> <input type="text" class="element text medium"
						name="othLoadreason" id="othLoadreason"
						style="visibility: hidden; width: 150px" /></td>
					<td>
						<!--13,2-->
					</td>
				</tr>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Weight Load</b> </label> <input id="weight"
						name="weight" class="element text medium" type="text"
						value="<%=weight%>" /><font size="2"> Kg. </font> </textarea><br>
					<br>
					<!--14,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b> Freight :</b> </label> <input id="frie"
						name="frie" class="element text medium" type="text"
						value="<%=frieg%>" /><font size="2">Rs.</font> <br>
					<br>
					<!--14,2--></td>
				</tr>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>CN :</b> </label> <input id="cnnumber"
						name="cnnumber" class="element text medium" type="text"
						value="<%=cnno%>" /> <br>
					<br>
					<!--15,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Advance :</b> </label> <input id="adv"
						name="adv" class="element text medium" type="text"
						value="<%=adv%>" /><font size="2">Rs.</font> <br>
					<br>
					<!--15,2--></td>
				</tr>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Branch Office Code :</b> </label> <input
						id="bcode" name="bcode" class="element text medium" type="text"
						value="<%=boffice%>" /> </textarea><br>
					<br>
					<!--16,1--></td>

					<%
						String sql45 = "select Distinct(GoodsContent) from t_startedjourney where OwnerName='" + user
										+ "' OR GPName='" + user + "' order By GoodsContent Asc";
								// out.print(sql3); 
								ResultSet rs45 = stmt8.executeQuery(sql45);
					%>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Product Name :</b> </label> <select
						id="GoodsContent" name="GoodsContent"
						class="element select medium" onChange='showothcontent(this)'>
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
					</select> <br>
					<br>
					<!--16,2--> <input type="text" class="element text medium"
						name="othGoodsContent" id="othGoodsContent"
						style="visibility: hidden; width: 150px" />
						<div id="contentdiv1"></div></td>
				</tr>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>LR Issued By :</b> </label> <input id="lrissue"
						name="lrissue" class="element text medium" type="text"
						value="<%=lrissue%>" />
					</textarea><br>
					<br>
					<!--17,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b> LR Contact :</b> </label> <input
						id="lrcontact" name="lrcontact" class="element text medium"
						type="text" value="<%=lrcontact%>" />
					</textarea><br>
					<br>
					<!--17,2--></td>
				</tr>
				<tr>
					<td id="fx01"><label id="element_1" name="element_1"
						class="description" for="element_1"><b>Fixed KM :</b> </label> <input
						id="fxdkm" name="fxdkm" class="element text medium" type="text"
						value="<%=fixedkm%>" /> <br>
					<br>
					<!--18,1--></td>
					<td id="fx10"><label id="element_1" name="element_1"
						class="description" for="element_1"><b>Rate/Km</b> </label> <input
						id="ratekm" name="ratekm" class="element text medium" type="text"
						onblur="validateRatekm()" value="<%=ratekm%>" />
					</textarea><br>
					<br>
					<!--18,2--></td>
				</tr>
				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Rate/Hr.:</b> </label> <input id="ratehr"
						name="ratehr" class="element text medium" type="text"
						value="<%=rate_hour%>" /> </textarea><br>
					<br>
					<!--19,1--></td>
					<td id="fx12"><label id="element_1" name="element_1"
						class="description" for="element_1"><b>Fixed Time :</b> </label> <input
						id="ftme" name="ftme" class="element text medium" type="text"
						value="<%=fixedkm%>" /><font size="2">Hrs.</font> </textarea><br>
					<br>
					<!--19,2--> <input type="button" name="Computetripexpence"
						value="Compute Trip Expense"
						style="border-style: outset; border-color: black"
						onClick="return computetripexpence123()" class="formElement" /></td>

				</tr>
				<tr>
					<td>
						<!--20,1-->
					</td>
					<td>
						<!--20,2-->
					</td>
				</tr>
				<tr>
					<td id="fx9"><label id="element_1" name="element_1"
						class="description" for="element_1"><b>Trip Expense :</b>
					</label> <input id="tripexp" name="tripexp" class="element text medium"
						type="text" value="<%=tripexpense%>" readonly="readonly" /> </textarea><br>
					<br>
					<!--21,1--> <input type="button" name="Compute ETA"
						value="Compute ETA"
						style="border-style: outset; border-color: black"
						onClick="return computrtriptime()" class="formElement" /><br>
					<br></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>CN File Upload :</b> </label> 
						<%
 	                     if (cnfilename == "" || cnfilename.equals("")) {
                        %> <lable>
						<font face="Arial" id="oldaddfnm123" size="2">NA</font></lable>&nbsp;
					   <%
                     	} else {
                        %> <lable>
						<font face="Arial" id="oldaddfnm123" size="2"><%=cnfilename%></font></lable>&nbsp;
						<%
							}
						%> 
						<input type="file" cols="40" name="Filename1" id="Filename1"
						value="" onchange="upload();" /> 
						<font size="2" face="Arial"	color="black" id="f1" style="display: none;" name="f1"></font> 
						<a href="#" onclick="remove1();" id="remove1" style="display: none;"><font
							size="2" face="Arial">Remove</font></a> 
						<input id="f6" name=f6 class="element text medium" type="text" maxlength="255" value=""
						style="width: 150px; height: 20px; display: none;" /></td>
				</tr>


				<tr>


					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Toll :</b> </label> <input id="toll"
						name="toll" class="element text medium" type="text"
						value="<%=toll%>" /> <br>
					<br>
					<!--18,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>RTO:</b> </label> <input id="rto" name="rto"
						class="element text medium" type="text" value="<%=rto%>" />
					</textarea><br>
					<br>
					<!--18,2--></td>




				</tr>


				<tr>


					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Loading :</b> </label> <input id="loading"
						name="loading" class="element text medium" type="text"
						value="<%=loading%>" /> <br>
					<br>
					<!--18,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Unloading :</b> </label> <input id="unloading"
						name="unloading" class="element text medium" type="text"
						value="<%=unloading%>" />
					</textarea><br>
					<br>
					<!--18,2--></td>




				</tr>

				<tr>


					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>WeighBridge :</b> </label> <input
						id="weighbridge" name="weighbridge" class="element text medium"
						type="text" value="<%=wieghbridge%>" /> <br>
					<br>
					<!--18,1--></td>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b> DA :</b> </label> <input id="DA" name="DA"
						class="element text medium" type="text" value="<%=da%>" />
					</textarea><br>
					<br>
					<!--18,2--></td>

				</tr>

				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Fuel :</b> </label> <input id="fuel"
						name="fuel" class="element text medium" type="text"
						value="<%=fuel%>" /> <br>
					<br>
					<!--18,1--></td>


					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Other Expense :</b> </label> <input
						id="othexpense" name="othexpense" class="element text medium"
						type="text" value="<%=othexpense %>" /> <br>
					<br>
					<!--18,1--></td>





				</tr>


				<tr>
					<td><label id="element_1" name="element_1" class="description"
						for="element_1"><b>Comment :</b> </label> <textarea
							class="element textarea medium" name="loadcmnt" rows="4"
							cols="35"><%=loadcmnt %></textarea> <br>
					<br></td>
				</tr>
				<tr>
					<!-- <td><label id="element_1" name="element_1"  class="description" for="element_1"><b></b> </label><input id="saveForm" name="submit"  class="button_text" type="submit" onClick="return validate()" value="Submit" /></textarea><br><br>22,1</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" name="Cancel" style="border-style: outset; border-color: black" value="Cancel" onclick="cancelbutton();"  class="button_text" /></td> -->
				</tr>

			</table>
			<div align="center">
				<input id="saveForm" name="submit"
					style="border-style: outset; border-color: black" type="submit"
					onClick="return validate()" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="button" name="Cancel"
					style="border-style: outset; border-color: black" value="Cancel"
					onclick="cancelbutton();" class="button_text" />
			</div>
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
			<%
 	//fleetview.closeConnection();
 %>
		</div>
	</form>
</jsp:useBean>
<%@ include file="footernew.jsp"%>