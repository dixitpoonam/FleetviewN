<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp"%>
<%@page import="java.util.Date"%>
<%@page import="com.fleetview.beans.classes"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
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

<script type="text/javascript">
	onload = function resertval() {
		//var elems = document.getElementsByName("browser");
		//	for(var i=0;i<elems.length;i++)
		//{
		//	elems[i].checked==false;
		//}

		//document.incident.EmailID.value="";
		//document.getElementById("Number").value="";
		//	document.getElementById("search-text").value="";
		//	document.getElementById("Category").value="Hardware";
		//document.getElementById("Priority").value="Low"; 	
	}

	function cleareall() {
		//alert("in clear");
		document.getElementById("tr1").style.display = "none";
		document.getElementById("comm").style.display = "none";

		document.getElementById("tr2").style.display = "none";
		document.getElementById("tr5").style.display = "none";
		document.getElementById("tr6").style.display = "none";
		document.getElementById("tr7").style.display = "none";
		document.getElementById("tr8").style.display = "none";
		document.getElementById("tr9").style.display = "none";
		document.getElementById("tr10").style.display = "none";
		document.getElementById("tr11").style.display = "none";
		document.getElementById("tr12").style.display = "none";
		document.getElementById("tr13").style.display = "none";
		document.getElementById("tr14").style.display = "none";
		document.getElementById("tr15").style.display = "none";
		document.getElementById("tr16").style.display = "none";
		document.getElementById("tr17").style.display = "none";
		document.getElementById("tr18").style.display = "none";
		document.getElementById("tr18").style.display = "none";
		document.getElementById("tr20").style.display = "none";
		document.getElementById("tr21").style.display = "none";
		document.incident.Filename1.value = "";
		document.incident.Filename2.value = "";
		document.incident.Filename3.value = "";
		document.incident.Filename4.value = "";
		document.incident.Filename5.value = "";
		document.incident.Filename6.value = "";
		document.incident.Filename7.value = "";
		document.incident.Filename8.value = "";
		document.incident.Filename9.value = "";
		document.incident.Filename10.value = "";
	}
	function validateEmail(email) {
		var splitted = email.match("^(.+)@(.+)$");
		if (splitted == null)
			return false;
		if (splitted[1] != null) {
			var regexp_user = /^\"?[\w-_\.]*\"?$/;
			if (splitted[1].match(regexp_user) == null)
				return false;
		}
		if (splitted[2] != null) {
			var regexp_domain = /^[\w-\.]*\.[A-Za-z]{2,4}$/;
			if (splitted[2].match(regexp_domain) == null) {
				var regexp_ip = /^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
				if (splitted[2].match(regexp_ip) == null)
					return false;
			}// if
			return true;
		}
		return false;
	}

	function validateform1() {
		try {

			var emailid = document.incident.EmailID.value;
			var number = document.getElementById("Number").value;
			var desc = document.getElementById("search-text").value;
			var Category = document.getElementById("Category").value;
			var SubCategory = document.getElementById("SubCategory").value;

			if (Category == "Select") {
				alert("Please select Category");
				return false;
			}

			if (SubCategory == "Select") {
				alert("Please select SubCategory");
				return false;
			}

			var cnt = document.incident.counter.value;

			var oth = desc.replace(/^\s\s*/, '').replace(/\s\s*$/, '');

			if (null == desc || desc.length == 0 || oth == "") {
				alert("Please enter the Description!!");
				return false;
			}
			var cat = document.getElementById("Category").value;

			if (cat == "Device") {
				var vehid = document.getElementById("VehId2").value;

				if (vehid == "Select") {
					alert("Please Select Vehicle Number !!");
					return false;
				}

			}

			if (cnt == 0) {
				//alert("count");
				if (document.incident.Filename1.value == ""
						|| document.incident.Filename2.value == ""
						|| document.incident.Filename3.value == ""
						|| document.incident.Filename4.value == ""
						|| document.incident.Filename5.value == ""
						|| document.incident.Filename6.value == ""
						|| document.incident.Filename7.value == ""
						|| document.incident.Filename8.value == ""
						|| document.incident.Filename9.value == ""
						|| document.incident.Filename10.value == "") {
					//alert("in if");	

					//alert("in else");	

					document.incident.Filename1.value = "";
					document.incident.Filename2.value = "";
					document.incident.Filename3.value = "";
					document.incident.Filename4.value = "";
					document.incident.Filename5.value = "";
					document.incident.Filename6.value = "";
					document.incident.Filename7.value = "";
					document.incident.Filename8.value = "";
					document.incident.Filename9.value = "";
					document.incident.Filename10.value = "";

				}

			}

			if (emailid != "") {
				/*alert("Please enter valid Email ID");
				return false;
				}
				else
				{*/
				//emai=document.getElementById("email").value;
				var temp = new Array();
				temp = emailid.split(",");
				for (var i = 0; i < temp.length; i++) {
					var sss = validateEmail(temp[i]);
					//alert(temp[i]);
					if (!sss) {
						//alert(sss);
						alert("Please enter valid Email Id");
						return false;
					}
				}
			}

			var elems = document.getElementsByName("browser");
			for (var i = 0; i < elems.length; i++) {
				if (elems[i].checked == true) {
					//alert("if yes");
					if (number == "") {
						alert("Please enter Number");
						return false;
					}
					if (isNaN(number)) {

						//var n1=document.getElementById("no").value;
						var n2 = number.match("#");
						var n4 = number.match("-");
						var n3 = number.match("[+]");
						var splitted3 = number
								.match("[A-Za-z!@$%^&*()_,.<>;:]");
						if ((n2 != null || n4 != null || n3 != null)
								&& null == splitted3) {
							if (n2 == "#" && (number.charAt(0)) != "#") {
								alert("Invalid number!!");
								return false;
							} else {
								for (var i = 1; i <= number.length; i++) {
									if (number.charAt(i) == "#") {
										alert("Invalid number!!");
										return false;
									}
								}
							}

							//alert(n1.match("[+]"));
							if (n3 == "+" && (number.charAt(0)) != "+") {
								alert("Invalid number!!");
							} else {
								for (var i = 1; i <= number.length; i++) {
									if (number.charAt(i) == "+") {
										alert("Invalid number!!");
										return false;
									}
								}
							}

							var cnt = 1;
							//alert(n1.match("-"));
							if (number.charAt(0) == "-") {
								alert("Invalid number!!");
								return false;
							} else {
								for (var i = 1; i <= number.length; i++) {
									if (number.charAt(i) == "-") {
										if (cnt > 2) {
											alert("Invalid number!!");
											return false;
										}
										cnt++;
									}

								}
							}
						} else {
							alert("Please enter Numeric Value");
							return false;
						}

					}
					if ((number.length < 4) || (number.length > 15)) {
						//alert("Hii");
						alert("Please enter valid Mobile Number");
						return false;
					}

				}

				// alert(number.length);
				return true;
			}
		} catch (e) {
			//alert(e);
			return false;
		}

	}

	function getradio() {
		//alert("Hii in radio 1");
		var elems = document.getElementsByName("browser");
		for (var i = 0; i < elems.length; i++) {
			if (elems[i].checked == true) {
				document.incident.Number.value = "";
				document.getElementById("tr3").style.display = "";
			} else if (elems[i].checked == false) {
				document.incident.Number.value = "";
				document.getElementById("tr3").style.display = "none";
			}
		}

	}
	function getradio1() {
		//alert("Hii");

		document.getElementById("tr3").style.display = "none";
	}
	function attach() {
		try {
			//alert("Hii");
			//alert("in attach ");

			var cnt = document.incident.counter.value;
			//alert("351 count "+cnt);
			if (cnt > 0) {
				//alert("count "+cnt);
			} else {
				cnt = 1;
				var flagvalue = document.incident.flagvalue.value;
				flagvalue++;
				document.incident.flagvalue.value = flagvalue;
				//alert(cnt);
				document.incident.counter.value = cnt;

				document.getElementById("tr1").style.display = "";
				document.getElementById("comm").style.display = "";

				document.incident.Filename1.style.display = "";
				// document.incident.Filename1.value="";
				//document.getElementById("imageDiv").innerHTML="";
				document.getElementById("imageDiv").style.display = "none";
				//  document.incident.Upload.style.display="";  
				document.getElementById("tr2").style.display = "";
			}
		} catch (e) {
			alert(e);
		}
	}

	function attach1() {
		var cnt = document.incident.counter.value;
		cnt++;
		//alert(cnt);
		document.incident.counter.value = cnt;
		//alert("in attach1 ");

		document.getElementById("tr5").style.display = "";
		document.incident.Filename2.style.display = "";
		//document.getElementById("imageDiv1").innerHTML="";
		document.getElementById("imageDiv1").style.display = "none";
		document.getElementById("tr2").style.display = "none";
		document.getElementById("tr6").style.display = "";
	}
	function attach2() {
		var cnt = document.incident.counter.value;
		cnt++;
		//alert(cnt);
		document.incident.counter.value = cnt;
		//alert("in attach2 ");
		document.getElementById("tr7").style.display = "";
		document.incident.Filename3.style.display = "";
		//document.getElementById("imageDiv2").innerHTML="";
		document.getElementById("imageDiv2").style.display = "none";
		document.getElementById("tr6").style.display = "none";
		document.getElementById("tr8").style.display = "";
	}
	function attach3() {
		var cnt = document.incident.counter.value;
		cnt++;
		//alert(cnt);
		document.incident.counter.value = cnt;
		//alert("in attach3 ");
		document.getElementById("tr9").style.display = "";
		document.incident.Filename4.style.display = "";
		//document.getElementById("imageDiv3").innerHTML="";
		document.getElementById("imageDiv3").style.display = "none";
		document.getElementById("tr8").style.display = "none";
		document.getElementById("tr10").style.display = "";
	}
	function attach4() {
		var cnt = document.incident.counter.value;
		cnt++;
		//alert(cnt);
		document.incident.counter.value = cnt;
		//alert("in attach4 ");
		document.getElementById("tr11").style.display = "";
		document.incident.Filename5.style.display = "";
		//document.getElementById("imageDiv4").innerHTML="";
		document.getElementById("imageDiv4").style.display = "none";
		document.getElementById("tr10").style.display = "none";
		document.getElementById("tr12").style.display = "";
		// document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
	}
	function attach5() {
		var cnt = document.incident.counter.value;
		cnt++;
		//	alert(cnt);
		document.incident.counter.value = cnt;
		//alert("in attach5 ");
		document.getElementById("tr13").style.display = "";
		document.incident.Filename6.style.display = "";
		//document.getElementById("imageDiv5").innerHTML="";
		document.getElementById("imageDiv5").style.display = "none";
		document.getElementById("tr12").style.display = "none";
		document.getElementById("tr14").style.display = "";
		// document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
	}
	function attach6() {
		var cnt = document.incident.counter.value;
		cnt++;
		//alert(cnt);
		document.incident.counter.value = cnt;
		//alert("in attach6 ");
		document.getElementById("tr15").style.display = "";
		document.incident.Filename7.style.display = "";
		//document.getElementById("imageDiv6").innerHTML="";
		document.getElementById("imageDiv6").style.display = "none";
		document.getElementById("tr14").style.display = "none";
		document.getElementById("tr16").style.display = "";
		// document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
	}
	function attach7() {
		var cnt = document.incident.counter.value;
		cnt++;
		//alert(cnt);
		document.incident.counter.value = cnt;
		//alert("in attach7 ");
		document.getElementById("tr17").style.display = "";
		document.incident.Filename8.style.display = "";
		//document.getElementById("imageDiv7").innerHTML="";
		document.getElementById("imageDiv7").style.display = "none";
		document.getElementById("tr16").style.display = "none";
		document.getElementById("tr18").style.display = "";
		// document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
	}
	function attach8() {
		var cnt = document.incident.counter.value;
		cnt++;
		//alert(cnt);
		document.incident.counter.value = cnt;
		//alert("in attach8 ");
		document.getElementById("tr19").style.display = "";
		document.incident.Filename9.style.display = "";
		//document.getElementById("imageDiv8").innerHTML="";
		document.getElementById("imageDiv8").style.display = "none";
		document.getElementById("tr18").style.display = "none";
		document.getElementById("tr20").style.display = "";
		// document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
	}
	function attach9() {
		var cnt = document.incident.counter.value;

		cnt++;
		//alert(cnt);
		document.incident.counter.value = cnt;
		//alert("in attach9 ");
		document.getElementById("tr21").style.display = "";
		document.incident.Filename10.style.display = "";
		//document.getElementById("imageDiv9").innerHTML="";
		document.getElementById("imageDiv9").style.display = "none";
		document.getElementById("tr20").style.display = "none";

		// document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
	}

	function upload() {
		try {
			var id_value = document.getElementById('up').value;
			var file1 = document.incident.Filename1.value;

			if (id_value != '') {
				var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
				// var valid_type = /(.txt|.jpeg|.doc)$/i;

				if (valid_extensions.test(id_value)) {

					document.incident.Filename1.style.display = "none";
					document.getElementById("imageDiv").style.display = "";
					document.getElementById("f1").innerHTML = file1;

					//alert('OK');
				}
				// else if()
				else {

					var cnt = document.incident.counter.value;

					cnt--;
					// alert(cnt);
					if (cnt == 0) {
						document.incident.counter.value = cnt;
						cleareall();
						document.getElementById("f1").innerHTML = "";

					} else {

						document.incident.counter.value = cnt;
						document.incident.Filename1.value = "";

						document.incident.Filename2.value = "";
						document.getElementById("tr1").style.display = "none";
						document.getElementById("comm").style.display = "none";

						document.getElementById("tr2").style.display = "none";
						document.getElementById("f1").innerHTML = "";
					}
					alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");

				}
			}

			//alert(file1);

			//document.incident.Upload.style.display="none";

		} catch (e) {
			alert(e);
		}

	}

	function upload1() {
		try {
			var file1 = document.incident.Filename2.value;
			var id_value = document.getElementById('up1').value;

			if (id_value != '') {
				var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.ods|.xls|.pdf|.txt~)$/i;
				if (valid_extensions.test(id_value)) {
					//alert(file1);

					document.incident.Filename2.style.display = "none";
					document.getElementById("imageDiv1").style.display = "";
					document.getElementById("f2").innerHTML = file1;
					//document.incident.Upload.style.display="none";

				} else {

					var cnt = document.incident.counter.value;

					cnt--;
					// alert(cnt);
					if (cnt == 0) {
						document.incident.counter.value = cnt;
						cleareall();
						document.getElementById("f2").innerHTML = "";
					} else {

						document.incident.counter.value = cnt;

						document.incident.Filename2.value = "";
						document.getElementById("tr5").style.display = "none";
						document.getElementById("f2").innerHTML = "";
					}
					alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");

				}
			}
		} catch (e) {
			alert(e);
		}
	}

	function upload2() {
		try {
			var file1 = document.incident.Filename3.value;
			var id_value = document.getElementById('up2').value;

			if (id_value != '') {
				var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
				if (valid_extensions.test(id_value)) {
					//alert(file1);

					document.incident.Filename3.style.display = "none";
					document.getElementById("imageDiv2").style.display = "";
					document.getElementById("f3").innerHTML = file1;
					//document.incident.Upload.style.display="none";

				} else {

					var cnt = document.incident.counter.value;

					cnt--;
					// alert(cnt);
					if (cnt == 0) {
						document.incident.counter.value = cnt;
						cleareall();
						document.getElementById("f3").innerHTML = "";
					} else {

						document.incident.counter.value = cnt;

						document.incident.Filename3.value = "";
						document.getElementById("tr7").value = "";
						document.getElementById("tr7").style.display = "none";
						document.getElementById("f3").innerHTML = "";
					}
					alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");

				}
			}
		} catch (e) {
			alert(e);
		}
	}

	function upload3() {
		try {
			var file1 = document.incident.Filename4.value;
			var id_value = document.getElementById('up3').value;

			if (id_value != '') {
				var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
				if (valid_extensions.test(id_value)) {
					//alert(file1);

					document.incident.Filename4.style.display = "none";
					document.getElementById("imageDiv3").style.display = "";
					document.getElementById("f4").innerHTML = file1;
					//document.incident.Upload.style.display="none";

				} else {
					var cnt = document.incident.counter.value;

					cnt--;
					// alert(cnt);
					if (cnt == 0) {
						document.incident.counter.value = cnt;
						cleareall();
						document.getElementById("f4").innerHTML = "";
					} else {

						document.incident.counter.value = cnt;

						document.incident.Filename4.value = "";
						document.getElementById("tr9").value = "";
						document.getElementById("tr9").style.display = "none";
						document.getElementById("f4").innerHTML = "";

					}

					alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");

				}
			}

		} catch (e) {
			alert(e);
		}
	}

	function upload4() {
		try {
			var file1 = document.incident.Filename5.value;
			var id_value = document.getElementById('up4').value;

			if (id_value != '') {
				var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
				if (valid_extensions.test(id_value)) {
					//alert(file1);

					document.incident.Filename5.style.display = "none";
					document.getElementById("imageDiv4").style.display = "";
					document.getElementById("f5").innerHTML = file1;
					//document.incident.Upload.style.display="none";

				} else {
					var cnt = document.incident.counter.value;

					cnt--;
					//alert(cnt);
					if (cnt == 0) {
						document.incident.counter.value = cnt;
						cleareall();
						document.getElementById("f5").innerHTML = "";
					} else {

						document.incident.counter.value = cnt;

						document.incident.Filename5.value = "";
						document.getElementById("tr11").value = "";
						document.getElementById("tr11").style.display = "none";
						document.getElementById("f5").innerHTML = "";

					}
					alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");

				}
			}
		} catch (e) {
			alert(e);
		}
	}

	function upload5() {
		try {
			var file1 = document.incident.Filename6.value;
			var id_value = document.getElementById('up5').value;

			if (id_value != '') {
				var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
				if (valid_extensions.test(id_value)) {
					//alert(file1);

					document.incident.Filename6.style.display = "none";
					document.getElementById("imageDiv5").style.display = "";
					document.getElementById("f6").innerHTML = file1;
					//document.incident.Upload.style.display="none";

				} else {
					var cnt = document.incident.counter.value;

					cnt--;
					//  alert(cnt);
					if (cnt == 0) {
						document.incident.counter.value = cnt;
						cleareall();
						document.getElementById("f6").innerHTML = "";
					} else {

						document.incident.counter.value = cnt;

						document.incident.Filename6.value = "";
						document.getElementById("tr13").style.display = "none";
						document.getElementById("f6").innerHTML = "";
					}
					alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");

				}
			}
		} catch (e) {
			alert(e);
		}
	}

	function upload6() {
		try {
			var file1 = document.incident.Filename7.value;
			var id_value = document.getElementById('up6').value;

			if (id_value != '') {
				var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
				if (valid_extensions.test(id_value)) {
					//alert(file1);

					document.incident.Filename7.style.display = "none";
					document.getElementById("imageDiv6").style.display = "";
					document.getElementById("f7").innerHTML = file1;
					//document.incident.Upload.style.display="none";

				} else {
					var cnt = document.incident.counter.value;

					cnt--;
					//  alert(cnt);
					if (cnt == 0) {
						document.incident.counter.value = cnt;
						cleareall();
						document.getElementById("f7").innerHTML = "";
					} else {

						document.incident.counter.value = cnt;

						document.incident.Filename7.value = "";
						document.getElementById("tr15").style.display = "none";
						document.getElementById("f7").innerHTML = "";
					}
					alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");

				}
			}
		} catch (e) {
			alert(e);
		}
	}

	function upload7() {
		try {
			var file1 = document.incident.Filename8.value;
			var id_value = document.getElementById('up7').value;

			if (id_value != '') {
				var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
				if (valid_extensions.test(id_value)) {
					//alert(file1);

					document.incident.Filename8.style.display = "none";
					document.getElementById("imageDiv7").style.display = "";
					document.getElementById("f8").innerHTML = file1;
					//document.incident.Upload.style.display="none";

				} else {
					var cnt = document.incident.counter.value;

					cnt--;
					// alert(cnt);
					if (cnt == 0) {
						document.incident.counter.value = cnt;
						cleareall();
						document.getElementById("f8").innerHTML = "";
					} else {

						document.incident.counter.value = cnt;

						document.incident.Filename8.value = "";
						document.getElementById("tr17").style.display = "none";
						document.getElementById("f8").innerHTML = "";
					}
					alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");

				}
			}
		} catch (e) {
			alert(e);
		}
	}

	function upload8() {
		try {
			var file1 = document.incident.Filename9.value;
			var id_value = document.getElementById('up8').value;

			if (id_value != '') {
				var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
				if (valid_extensions.test(id_value)) {
					//alert(file1);

					document.incident.Filename9.style.display = "none";
					document.getElementById("imageDiv8").style.display = "";
					document.getElementById("f9").innerHTML = file1;
					//document.incident.Upload.style.display="none";

				} else {
					var cnt = document.incident.counter.value;

					cnt--;
					//  alert(cnt);
					if (cnt == 0) {
						document.incident.counter.value = cnt;
						cleareall();
						document.getElementById("f9").innerHTML = "";
					} else {

						document.incident.counter.value = cnt;

						document.incident.Filename9.value = "";
						document.getElementById("tr19").style.display = "none";
						document.getElementById("f9").innerHTML = "";
					}
					alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");

				}
			}

		} catch (e) {
			alert(e);
		}
	}

	function upload9() {
		try {
			var file1 = document.incident.Filename10.value;
			var id_value = document.getElementById('up9').value;

			if (id_value != '') {
				var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
				if (valid_extensions.test(id_value)) {
					//alert(file1);

					document.incident.Filename10.style.display = "none";
					document.getElementById("imageDiv9").style.display = "";
					document.getElementById("f10").innerHTML = file1;
					//document.incident.Upload.style.display="none";

				} else {
					var cnt = document.incident.counter.value;

					cnt--;
					// alert(cnt);
					if (cnt == 0) {
						document.incident.counter.value = cnt;
						cleareall();
						document.getElementById("f10").innerHTML = "";
					} else {

						document.incident.counter.value = cnt;

						document.incident.Filename10.value = "";
						document.getElementById("tr21").style.display = "none";
						document.getElementById("f10").innerHTML = "";
					}
					alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
				}
			}
		} catch (e) {
			alert(e);
		}
	}

	function cancel() {
		//alert("in cancel");
		var cnt = document.incident.counter.value;

		cnt--;
		// alert(cnt);
		if (cnt == 0) {
			document.incident.counter.value = cnt;
			cleareall();
			document.getElementById("f1").innerHTML = "";

		} else {

			document.incident.counter.value = cnt;
			document.incident.Filename1.value = "";

			document.incident.Filename2.value = "";
			document.getElementById("tr1").style.display = "none";
			document.getElementById("comm").style.display = "";

			document.getElementById("tr2").style.display = "none";
			document.getElementById("f1").innerHTML = "";
		}
	}
	function cancel1() {//alert("in cancel 1");
		var cnt = document.incident.counter.value;

		cnt--;
		// alert(cnt);
		if (cnt == 0) {
			document.incident.counter.value = cnt;
			cleareall();
			document.getElementById("f2").innerHTML = "";
		} else {

			document.incident.counter.value = cnt;

			document.incident.Filename2.value = "";
			document.getElementById("tr5").style.display = "none";
			document.getElementById("f2").innerHTML = "";
		}
	}
	function cancel2() {//alert("in cancel 2");
		var cnt = document.incident.counter.value;

		cnt--;
		// alert(cnt);
		if (cnt == 0) {
			document.incident.counter.value = cnt;
			cleareall();
			document.getElementById("f3").innerHTML = "";
		} else {

			document.incident.counter.value = cnt;

			document.incident.Filename3.value = "";
			document.getElementById("tr7").value = "";
			document.getElementById("tr7").style.display = "none";
			document.getElementById("f3").innerHTML = "";
		}
	}
	function cancel3() {//alert("in cancel 3");
		var cnt = document.incident.counter.value;

		cnt--;
		// alert(cnt);
		if (cnt == 0) {
			document.incident.counter.value = cnt;
			cleareall();
			document.getElementById("f4").innerHTML = "";
		} else {

			document.incident.counter.value = cnt;

			document.incident.Filename4.value = "";
			document.getElementById("tr9").value = "";
			document.getElementById("tr9").style.display = "none";
			document.getElementById("f4").innerHTML = "";

		}
	}
	function cancel4() {//alert("in cancel 4");
		var cnt = document.incident.counter.value;

		cnt--;
		//alert(cnt);
		if (cnt == 0) {
			document.incident.counter.value = cnt;
			cleareall();
			document.getElementById("f5").innerHTML = "";
		} else {

			document.incident.counter.value = cnt;

			document.incident.Filename5.value = "";
			document.getElementById("tr11").value = "";
			document.getElementById("tr11").style.display = "none";
			document.getElementById("f5").innerHTML = "";

		}
	}
	function cancel5() {//alert("in cancel 5");
		var cnt = document.incident.counter.value;

		cnt--;
		//  alert(cnt);
		if (cnt == 0) {
			document.incident.counter.value = cnt;
			cleareall();
			document.getElementById("f6").innerHTML = "";
		} else {

			document.incident.counter.value = cnt;

			document.incident.Filename6.value = "";
			document.getElementById("tr13").style.display = "none";
			document.getElementById("f6").innerHTML = "";
		}
	}
	function cancel6() {//alert("in cancel 6");
		var cnt = document.incident.counter.value;

		cnt--;
		//  alert(cnt);
		if (cnt == 0) {
			document.incident.counter.value = cnt;
			cleareall();
			document.getElementById("f7").innerHTML = "";
		} else {

			document.incident.counter.value = cnt;

			document.incident.Filename7.value = "";
			document.getElementById("tr15").style.display = "none";
			document.getElementById("f7").innerHTML = "";
		}
	}
	function cancel7() {//alert("in cancel 7");
		var cnt = document.incident.counter.value;

		cnt--;
		// alert(cnt);
		if (cnt == 0) {
			document.incident.counter.value = cnt;
			cleareall();
			document.getElementById("f8").innerHTML = "";
		} else {

			document.incident.counter.value = cnt;

			document.incident.Filename8.value = "";
			document.getElementById("tr17").style.display = "none";
			document.getElementById("f8").innerHTML = "";
		}
	}
	function cancel8() {//alert("in cancel 8");
		var cnt = document.incident.counter.value;

		cnt--;
		//  alert(cnt);
		if (cnt == 0) {
			document.incident.counter.value = cnt;
			cleareall();
			document.getElementById("f9").innerHTML = "";
		} else {

			document.incident.counter.value = cnt;

			document.incident.Filename9.value = "";
			document.getElementById("tr19").style.display = "none";
			document.getElementById("f9").innerHTML = "";
		}
	}
	function cancel9() {//alert("in cancel 9");
		var cnt = document.incident.counter.value;

		cnt--;
		// alert(cnt);
		if (cnt == 0) {
			document.incident.counter.value = cnt;
			cleareall();
			document.getElementById("f10").innerHTML = "";
		} else {

			document.incident.counter.value = cnt;

			document.incident.Filename10.value = "";
			document.getElementById("tr21").style.display = "none";
			document.getElementById("f10").innerHTML = "";
		}
	}
	function getComplaintReport(fname, lname, email) {
		var total = 'total';
		window
				.open(
						'showComplaintDetails.jsp?fname=' + fname + '&lname='
								+ lname + '&status=' + total + '&email='
								+ email + '',
						'mywindow',
						'width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');

	}
	function getComplaintReportp(fname, lname, email) {
		var total = 'ptotal';

		window
				.open(
						'showComplaintDetails.jsp?fname=' + fname + '&lname='
								+ lname + '&status=' + total + '&email='
								+ email + '',
						'mywindow',
						'width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');

	}
	function getComplaintReports(fname, lname, email) {
		var total = 'stotal';

		window
				.open(
						'showComplaintDetails.jsp?fname=' + fname + '&lname='
								+ lname + '&status=' + total + '&email='
								+ email + '',
						'mywindow',
						'width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');

	}

	function veh() {
		var cat = document.getElementById("Category").value;

		if (cat == "Device") {
			document.getElementById("VehId").style.display = "";
			//document.getElementById("VehId1").style.visibility="visible";
			//document.getElementById("VehId2").style.visibility="visible";

			document.getElementById("VehId2").style.display = "";
			document.getElementById("VehId1").style.display = "";
			return true;
		} else {
			document.getElementById("VehId").style.display = "none";
			document.getElementById("VehId2").style.display = "none";
			document.getElementById("VehId2").style.display = "none";
		}
		return false;

	}
</script>

<script>
	function consig() {

		var Category = document.getElementById("Category").value;
		alert(Category);

		//alert("Customer---------"+customername);
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
		//alert("eeeeeeeeeeeeeeeeeeeeeeeeee");
		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function() {
			if (ajaxRequest.readyState == 4) {//alert("######################### ");

				var reselt = ajaxRequest.responseText;
				//alert("Original result"+reselt);
				var finalres = reselt.split("#");
				document.getElementById("SubCategory").innerHTML = finalres[0];
				//alert("After trim"+finalres[0]);

			}

		}

		var queryString = "?Category=" + Category;
		//alert("Query String ---"+queryString);
		ajaxRequest.open("GET", "AjaxReg.jsp" + queryString, true);
		ajaxRequest.send(null);

		//re(1);
	}
</script>

<script>
	function hello() {

		//alert("HELLO");
		var cat111 = document.getElementById("Category").value;

		var cat2 = document.getElementById("SubCategory").value;
		//alert(cat2);

		var cat3 = document.getElementById("Veh").value;
		//alert(cat3);

		var data = document.getElementById("data").value;
		//alert(data);

		var cat1 = document.getElementById("Category").value;
		//alert(cat1);
		if (cat1 == "Website") {

			var datel = document.getElementById("data").value;
			//alert(datel);

			if (datel == "Select") {
				alert("Please select date");
				return false;
			}
		} else if (cat1 == "Request") {
			var Vehi = document.getElementById("Veh").value;
			if (Vehi == "Select") {
				alert("Please select Vehicle");
				return false;
			}

		} else if (cat1 == "Vehicle") {

			var datel = document.getElementById("data").value;
			var Vehi = document.getElementById("Veh").value;
			if ((Vehi == "Select")) {
				alert("Please select Vehicle");
				return false;
			}

			if (datel == "Select") {
				alert("Please select date");
				return false;
			}

		}

	}
</script>

</head>
<body>
	<%!Connection conn, con;
	String ReportName = "", Description = "", Entby = "", Name = "", EmailID = "", Email1 = "", FileName = "",
			Category = "";
	String Priority = "", ClosingComments = "", ClosedBy = "", Status = "";
	Date ComplaintDateTime, UpadteDateTime;
	String ContactNumber = "";
	String PageName = "";%>
	<%
		try {
			String datenew1 = "";

			Calendar cal = Calendar.getInstance();
			String today_dt = new SimpleDateFormat("dd-MMM-yyyy").format(cal.getTime());
			String data2 = today_dt;
			String temp = data2;
			String toDate = new SimpleDateFormat("yyyy-MM-dd")
					.format(new SimpleDateFormat("dd-MMM-yyyy").parse(temp));

			String Bt2 = request.getParameter("submit");

			System.out.println("-INNNNNNNNNNNN-------------" + Bt2);
			if (Bt2 == null || Bt2 == "null" || Bt2.equals("null")) {
				datenew1 = "Select";
			} else {
				datenew1 = request.getParameter("data");
				System.out.println("IN datenew1" + datenew1);

				String newdate = new SimpleDateFormat("yyyy-MM-dd")
						.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew1));
			}

			String Msg = request.getParameter("Msg");
			System.out.println("********Msg " + Msg);
			String desc = "";
			String EmailID = "";
			String Number = "";
			String category = "";
			String priority = "";
			String name = "";

			if (Msg != null && Msg.equalsIgnoreCase("1")) {
				System.out.println("Msg " + Msg);
				desc = request.getParameter("desc");
				PageName = request.getParameter("PageName1");
				EmailID = request.getParameter("email");
				Number = request.getParameter("Number");
				category = request.getParameter("Category");
				priority = request.getParameter("Priority");
				//name=request.getParameter("name");
				//System.out.println("NAME SIS   "+name);
				if (EmailID.equalsIgnoreCase("-")) {
					EmailID = "";
				}
				System.out.println("Number " + Number);
				System.out.println("desc " + desc);
				System.out.println("PageName " + PageName);
				System.out.println("EmailID " + EmailID);
	%>

	<script type="text/javascript">
		try {
			alert("Error was occured while inserting the complaint. Please reattach your attachments and resubmit  your complaint.....");
		} catch (e) {
			alert(e);
		}
	</script>
	<%
		} else if (Msg != null && Msg.equalsIgnoreCase("2")) {
				desc = request.getParameter("desc");
				PageName = request.getParameter("PageName1");
				EmailID = request.getParameter("email");
				Number = request.getParameter("Number");
				category = request.getParameter("Category");
				priority = request.getParameter("Priority");
				name = request.getParameter("name");
				System.out.println("NAME SIS   " + name);
				if (EmailID.equalsIgnoreCase("-")) {
					EmailID = "";
				}
				System.out.println("Number " + Number);
				System.out.println("desc " + desc);
				System.out.println("PageName " + PageName);
				System.out.println("EmailID " + EmailID);
	%>
	<input type="hidden" id="filesize" name="filesize" value="<%=name%>">

	<script>
		var name1 = document.getElementById("filesize").value;
		alert(name1 + " is having large size");
	</script>
	<%
		} else {
				/* PageName = request.getParameter("PageName"); */
				PageName = request.getParameter("pagename");
				System.out.println("page name: " + PageName);
				desc = "";
				EmailID = "";
			}
			
			System.out.println("$$$$$$$$$$$  " + desc);
			System.out.println("$$$$$$$$$$$  " + EmailID);
			String ReportName = "-";
			//System.out.println("\n\n session id-->>"+session.getId().toString()); 
			String fname = (String) session.getAttribute("fname");
			System.out.println("first name    " + fname);
			String lname = (String) session.getAttribute("lname");
			System.out.println("last name    " + lname);
			String email = (String) session.getAttribute("email");
			System.out.println("enamil   " + email);
			Class.forName(MM_dbConn_DRIVER);
			con = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
			Statement s = con.createStatement();
			Statement s1 = con.createStatement();
			Statement s2 = con.createStatement();
			Statement s3 = con.createStatement();

			String sql2 = "select * from db_gps.t_reportnumber where PageName='" + PageName + "'";
			ResultSet rs3 = s2.executeQuery(sql2);
			System.out.println(">>>  " + sql2);
			if (rs3.next()) {
				ReportName = rs3.getString("ReportName");
			}
			int counter = 0;
	%>
	<img id="top" src="newimages/top.png" alt="" style="width: 650px;">

	<div id="form_container">
		<!-- form_container 1 -->

		<%
			int tot = 0, ptot = 0, stot = 0;
				String sqltot = "select count(*) as tot from db_gps.t_ComplaintDetail where EntBy='" + fname + " "
						+ lname + "' or Name='" + fname + " " + lname + "' or Email1='" + email
						+ "' order by UpdatedDateTime ";
				System.out.println("Total Query is " + sqltot);
				ResultSet rscom = s1.executeQuery(sqltot);
				if (rscom.next()) {
					tot = rscom.getInt("tot");
				}
				System.out.println("Total Complaint Count is " + tot);

				String sqlptot = "select count(*) as tot1 from db_gps.t_ComplaintDetail where (EntBy='" + fname + " "
						+ lname + "' or Name='" + fname + " " + lname + "' or Email1='" + email
						+ "') and Status='Pending' order by UpdatedDateTime ";
				System.out.println("Pending Query is " + sqlptot);
				ResultSet rscom1 = s1.executeQuery(sqlptot);
				if (rscom1.next()) {
					ptot = rscom1.getInt("tot1");
				}
				System.out.println("Pending Complaint Count is " + ptot);

				String sqlstot = "select count(*) as tot2 from db_gps.t_ComplaintDetail where (EntBy='" + fname + " "
						+ lname + "' or Name='" + fname + " " + lname + "' or Email1='" + email
						+ "') and Status='Closed' order by UpdatedDateTime ";
				System.out.println("Solved Query is " + sqlstot);
				ResultSet rscom2 = s1.executeQuery(sqlstot);
				if (rscom2.next()) {
					stot = rscom2.getInt("tot2");
				}
				System.out.println("Solved Complaint Count is " + stot);
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
								<h3 class="content-header-title  mb-0" style="color: #060637">
									Complaint Registration Form</h3>
							</div>
						</div>
					</div>
					<div
						class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
						<div class="mb-1 breadcrumb-right">
							<div class="demo-inline-spacing mb-1">
								<!-- <button
									class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0 btn2"
									data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
									Register Complaint</button>
 -->
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

					<section class="" id="basic--layouts">
						<div class="row">
							<div class="col-md-12 col-12">
								<div class="card">
									<h6>
										(<span style="color: red;">*</span> indicates mandatory
										fields)
									</h6>
									<div class="card-body card">
										<div class="row" id="form_container">
											<!-- form_container 1 -->
											<div class="col-12">
												<label class="tcolor pt-0"> Total Complaint </label> <a
													href="#"
													onclick="getComplaintReport('<%=fname%>','<%=lname%>','<%=email%>')"><b><%=tot%></b></a>

												<label class="tcolor m-2"> Pending</label> <a href="#"
													onclick="getComplaintReportp('<%=fname%>','<%=lname%>','<%=email%>')"><b><%=ptot%></b></a>

												<label class="tcolor m-2">Closed</label> <a href="#"
													onclick="getComplaintReports('<%=fname%>','<%=lname%>','<%=email%>')"><b><%=stot%></b></a>
											</div>
										</div>
										<!-- form_container 1 -->

										<!-- Start card body -->
										<form class="form form-vertical" name="incident" method="post"
											onsubmit="return validateform1();"
											action="ComplaintInsert.jsp" enctype="multipart/form-data">
											<div class="form_container">
												<!-- form-container 2 -->

												<div class="row mb-1">
													<div class="col-5 pt-1">
														<label class="tcolor">User Name:</label>&nbsp;&nbsp; <b><%=fname%>&nbsp;
															<%=lname%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=email%></b>
													</div>

												</div>

												<div class="row mb-1">
													<div class="col-8">
														<%
															System.out.println("^^^^^^^^^^^ " + desc);
														%>
														<label class="tcolor"><font style="color: red;">*</font>Description
															:</label><br>
														<textarea class="form-control"
															placeholder="Please write Description here" name="desc"
															id="search-text"><%=desc%></textarea>
														<input type="hidden" name="PageName" id="PageName"
															value="<%=PageName%>" />
													</div>
												</div>


												<div class="row  mb-1">
													<div class="col-12">
														<label class="tcolor">Report Name:</label>&nbsp;&nbsp;&nbsp;<%=ReportName%>
														<input type="hidden" name="ReportName" id="ReportName"
															value="<%=ReportName%>" readonly />
													</div>
												</div>
												<div class="row  mb-1">
													<div class="col-4">
														<label class="tcolor"><font style="color: red;">*</font>Category</label><br>
														<select class="form-select" name="Category" id="Category"
															aria-label="Default select example"
															onchange="return consig()">
															<%
																String cat = request.getParameter("Category");
																	System.out.println("cat::" + cat);
																	if (cat == null) {
																		cat = "Select";
																	} else {
																		cat = "" + cat;
																	}
															%>
															<option value="<%=cat%>"><%=cat%></option>

															<%
																String sqlcomplaint = "select distinct(Category) from db_gps.t_ComplaintCategory order by Category";
																	ResultSet rsc = s1.executeQuery(sqlcomplaint);
																	while (rsc.next()) {

																		String Code = rsc.getString("Category");
																		System.out.println("Code:: " + Code);
															%>
															
															<option value="<%=rsc.getString("Category")%>"><%=rsc.getString("Category")%></option>
															<%
																}
															%>
														</select>
													</div>

													<div class="col-4">
														<label class="tcolor"><font style="color: red;">*</font>SubCategory</label><br>
														<select class="form-select" name="SubCategory"
															id="SubCategory" aria-label="Default select example"
															onchange="return veh()">
															<option value="Select">Select</option>

														</select>
													</div>
													<div class="col-4">
														<label class="tcolor"><font style="color: red;">*</font>Vehicle
															No</label><br> <select class="form-select" name="Veh"
															id="Veh" aria-label="Default select example"
															onchange="return veh()">
															<option>Select</option>
															<%
																String vehList = session.getAttribute("VehList").toString();

																	String sqlcomplaint1 = "Select distinct(Vehiclecode),VehicleRegNumber from db_gps.t_vehicledetails where vehiclecode in "
																			+ vehList + " order by VehicleRegNumber";
																	System.out.println("sqlcomplaint1  ::" + sqlcomplaint1);
																	ResultSet rsc1 = s1.executeQuery(sqlcomplaint1);
																	while (rsc1.next()) {
																		String Code = rsc1.getString("Vehiclecode");
																		String VehregNo = rsc1.getString("VehicleRegNumber");
															%>
															<option value=<%=Code%>>
																<%=VehregNo%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>

												<div class="row  mb-1">
													<div class="col-4">
														<label class="tcolor">Date:</label>
														<div class="input-group input-group-merge">
															<input type="text" id="data" name="from_date1"
																class="form-control" value="<%=datenew1%>" readonly />
															<span class="input-group-text"><svg
																	xmlns="http://www.w3.org/2000/svg" width="14"
																	height="14" viewBox="0 0 24 24" fill="none"
																	stroke="currentColor" stroke-width="2"
																	stroke-linecap="round" stroke-linejoin="round"
																	class="feather feather-calendar">
																			<rect x="3" y="4" width="18" height="18" rx="2"
																		ry="2"></rect>
																			<line x1="16" y1="2" x2="16" y2="6"></line>
																			<line x1="8" y1="2" x2="8" y2="6"></line>
																			<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
														</div>
														<script type="text/javascript">
															$(function() {
																$("#data")
																		.datepicker(
																				{
																					dateFormat : 'dd-M-yy',
																					maxDate : new Date(
																							new Date()
																									.setMonth(new Date()
																											.getMonth()))
																				});
															});
														</script>
													</div>
													<div class="col-4">
														<label class="tcolor"><font style="color: red;">*</font>Priority</label><br>
														<select class="form-select" name="Priority" id="Priority"
															aria-label="Default select example">

															<option value="Low">Low</option>
															<option value="High">High</option>

														</select>
													</div>

												</div>
												
													<div class="d-grid col-6 mx-auto mt-">

														<label class="tcolor">Add Email recipients:</label>
														<%
															System.out.println("^^^^^^^^^^^ " + EmailID);
														%>
														<input class="form-control" type="text" name="EmailID"
															id="EmailID" value="<%=EmailID%>"
															placeholder="Please enter comma separated email ids"
															autocomplete="off"> (Please enter comma separated
														email Id's)
													</div>
												

												<div class="row align-items-start m-1">
													<div class="col-2 pt-0">
														<label class="tcolor">Call Me Back:</label>&nbsp;&nbsp; <input
															class="form-check-input" type="checkbox" name="browser"
															id="browser" value="1" onclick="getradio();" /> Yes
													</div>
													<div class="col-5 pt-0" id="tr3" style="display: none;">
														<input class="form-control" type="text" name="Number"
															id="Number" autocomplete="off" value=""
															placeholder="Please Enter Mobile Number" /> <input
															type="hidden" name="Number1" id="Number1">
													</div>
												</div>



												<div class="row mt-2">
													<!-- Start Row -->
													<input type="hidden" name="counter" id="counter"
														value="<%=counter%>"></input> <input type="hidden"
														name="flagvalue" id="flagvalue" value="<%=counter%>"></input>

													<div class="col-12 mb-2">
														<!-- Col start -->
														<div>
															<a href="#" onclick="attach();">Attach File</a>
															<!-- Attached file -->
															<div>
																<p class="tcolor">
																	(You can attach a screen shot of the error page<br>
																	or a file which you would like to link with this
																	complaint entry.)
																</p>
															</div>
															<div id="div2">
																<!-- div2 -->

																<div class="col-8" id="comm" style="display: none;">
																	<!-- File comment -->
																	<label class="tcolor">File Comments :</label>
																	<textarea class="form-control"
																		placeholder="Please write Comment here"
																		name="comments" id="comments"></textarea>
																</div>

																<div class="row align-items-start m-1" id="tr1"
																	style="display: none;">
																	<input type="hidden" id="ip1" name="ip1" value=""></input>
																	<div class="col-5">
																		<input class="form-control" type="file"
																			name="Filename1" id="up" value=""
																			onchange="upload();" />
																	</div>
																	<div id="imageDiv" style="display: none;">
																		<font id="f1"></font>
																	</div>
																	<div class="col-3 mt-1">
																		<a href="#" onclick="cancel();">Remove</a>
																	</div>
																</div>
																<!-- tr1 -->

																<div class="mt-1" id="tr2" style="display: none;">
																	<div>
																		<a href="#" onclick="attach1();">Attach More Files
																		</a>
																	</div>
																</div>
																<div class="row align-items-start m-1" id="tr5"
																	style="display: none;">
																	<div class="col-5">
																		<input class="form-control" type="file"
																			name="Filename2" value="" id="up1"
																			onchange="upload1();" />
																	</div>
																	<div id="imageDiv1" style="display: none;">
																		<font id="f2"></font>
																	</div>
																	<div class="col-3 mt-1">
																		<a href="#" onclick="cancel1();">Remove</a>
																	</div>
																</div>

																<div id="tr6" style="display: none;">
																	<div>
																		<a href="#" onclick="attach2();">Attach More Files</a>
																	</div>
																</div>
																<div class="row align-items-start m-1" id="tr7"
																	style="display: none;">
																	<div class="col-5">
																		<input class="form-control" type="file"
																			name="Filename3" value="" id="up2"
																			onchange="upload2();" />
																	</div>
																	<div id="imageDiv2" style="display: none;">
																		<font id="f3"></font>
																	</div>
																	<div class="col-3 mt-1">
																		<a href="#" onclick="cancel2();">Remove</a>
																	</div>
																</div>

																<div id="tr8" style="display: none;">
																	<div>
																		<a href="#" onclick="attach3();">Attach More Files</a>
																	</div>
																</div>
																<div class="row align-items-start m-1" id="tr9"
																	style="display: none;">
																	<div class="col-5">
																		<input class="form-control" type="file"
																			name="Filename4" value="" id="up3"
																			onchange="upload3();" />
																	</div>
																	<div id="imageDiv3" style="display: none;">
																		<font id="f4"></font>
																	</div>
																	<div class="col-3 mt-1">
																		<a href="#" onclick="cancel3();">Remove</a>
																	</div>
																</div>

																<div id="tr10" style="display: none;">
																	<div>
																		<a href="#" onclick="attach4();">Attach More Files</a>
																	</div>
																</div>
																<div class="row align-items-start m-1" id="tr11"
																	style="display: none;">
																	<div class="col-5">
																		<input class="form-control" type="file"
																			name="Filename5" value="" id="up4"
																			onchange="upload4();" />
																	</div>
																	<div id="imageDiv4" style="display: none;">
																		<font id="f5"></font>
																	</div>
																	<div class="col-3 mt-1">
																		<a href="#" onclick="cancel4();">Remove</a>
																	</div>
																</div>

																<div id="tr12" style="display: none;">
																	<div>
																		<a href="#" onclick="attach5();">Attach More Files</a>
																	</div>
																</div>
																<div class="row align-items-start m-1" id="tr13"
																	style="display: none;">
																	<div class="col-5">
																		<input class="form-control" type="file"
																			name="Filename6" value="" id="up5"
																			onchange="upload5();" />
																	</div>
																	<div id="imageDiv5" style="display: none;">
																		<font id="f6"></font>
																	</div>
																	<div class="col-3 mt-1">
																		<a href="#" onclick="cancel5();">Remove</a>
																	</div>
																</div>

																<div id="tr14" style="display: none;">
																	<div>
																		<a href="#" onclick="attach6();">Attach More Files</a>
																	</div>
																</div>
																<div class="row align-items-start m-1" id="tr15"
																	style="display: none;">
																	<div class="col-5">
																		<input class="form-control" type="file"
																			name="Filename7" value="" id="up6"
																			onchange="upload6();" />
																	</div>
																	<div id="imageDiv6" style="display: none;">
																		<font id="f7"></font>
																	</div>
																	<div class="col-3 mt-1">
																		<a href="#" onclick="cancel6();">Remove</a>
																	</div>
																</div>

																<div id="tr16" style="display: none;">
																	<div>
																		<a href="#" onclick="attach7();">Attach More Files</a>
																	</div>
																</div>
																<div class="row align-items-start m-1" id="tr17"
																	style="display: none;">
																	<div class="col-5">
																		<input class="form-control" type="file"
																			name="Filename8" value="" id="up7"
																			onchange="upload7();" />
																	</div>
																	<div id="imageDiv7" style="display: none;">
																		<font id="f8"></font>
																	</div>
																	<div class="col-3 mt-1">
																		<a href="#" onclick="cancel7();">Remove</a>
																	</div>
																</div>

																<div id="tr18" style="display: none;">
																	<div>
																		<a href="#" onclick="attach8();">Attach More Files</a>
																	</div>
																</div>
																<div class="row align-items-start m-1" id="tr19"
																	style="display: none;">
																	<div class="col-5">
																		<input class="form-control" type="file"
																			name="Filename9" value="" id="up8"
																			onchange="upload8();" />
																	</div>
																	<div id="imageDiv8" style="display: none;">
																		<font id="f9"></font>
																	</div>
																	<div class="col-3 mt-1">
																		<a href="#" onclick="cancel8();">Remove</a>
																	</div>
																</div>

																<div id="tr20" style="display: none;">
																	<div>
																		<a href="#" onclick="attach9();">Attach More Files</a>
																	</div>
																</div>
																<div class="row align-items-start m-1" id="tr21"
																	style="display: none;">
																	<div class="col-5">
																		<input class="form-control" type="file"
																			name="Filename10" value="" id="up9"
																			onchange="upload9();" />
																	</div>
																	<div id="imageDiv9" style="display: none;">
																		<font id="f10"></font>
																	</div>
																	<div class="col-3 mt-1">
																		<a href="#" onclick="cancel9();">Remove</a>
																	</div>
																</div>


															</div>
															<!-- div2 -->
														</div>
														<!-- Attached file -->
													</div>
													<!-- Col end -->
												</div>
												<!-- End row -->

												<div>
													<div></div>
												</div>
												<div>
													<div></div>
												</div>
												<div class="d-grid gap-2 col-6 mx-auto mt-2">
													<input class="btn btn-primary btn2" type="submit"
														id="submit" name="submit" value="Submit"
														onclick="return hello()" />
												</div>
												<%
													if (Msg != null && Msg.equalsIgnoreCase("1")) {
															if (!(Number.equalsIgnoreCase("")) && !(Number.equalsIgnoreCase("-"))) {
																System.out.println("in number " + Number);
												%>
												<input type="hidden" id="Number2" value="<%=Number%>"></input>

												<script>
													try {

														var elems = document
																.getElementsByName("browser");
														for (var i = 0; i < elems.length; i++) {
															elems[i].checked = true;
														}
														document
																.getElementById("tr3").style.display = "";
														//alert("Number2 "+document.getElementById("Number2").value);

														document
																.getElementById("Number").value = document
																.getElementById("Number2").value;

														//alert("Number "+document.getElementById("Number").value);
													} catch (e) {
														//alert(e);
													}
												</script>
												<%
													System.out.println("in number1");
															}
												%>
												<input type="hidden" id="Category1" value="<%=category%>"></input>
												<input type="hidden" id="priority1" value="<%=priority%>"></input>
												<script>
													//alert("Category1 "+document.getElementById("Category1").value);
													//	alert("priority1 "+document.getElementById("priority1").value);
													document
															.getElementById("Category").value = document
															.getElementById("Category1").value;
													document
															.getElementById("Priority").value = document
															.getElementById("priority1").value;
												</script>
												<%
													}
												%>


											</div>
											<!-- form-container 2 -->
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

	<%
		} catch (Exception e) {
			System.out.println("Exception--------->" + e);
			e.printStackTrace();
		}
	%>
</body>
</html>
