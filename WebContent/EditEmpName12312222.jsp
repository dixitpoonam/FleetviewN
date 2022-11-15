<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp"%>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page">
	<%
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

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

<script>
	
</script>
<style type="text/css">
.sectionNew1 {
	max-width: 80em;
	padding: 3em 3em 3em 3em;
	margin: 0em auto;
	background-color: #fff;
	border-radius: 4.2px;
	box-shadow: 0px 3px 10px -2px rgba(0, 0, 0, 0.2);
}
</style>
<script type="text/javascript">

function validate()
{
	try
	{
	//alert("Hiiiiii");
	//var re=/^[\s\-]+[a-zA-Z0-9.,@_\s-]+$/;
	
	var re=/^[A-Za-z0-9]+[\s\-]*[\s\- .,@_&A-Za-z0-9]*[A-Za-z.]+$/;
	var v1=document.addgrpform.owner.value;
	var v2=document.addgrpform.vehcles.value;
	//alert(v2);
	
	if(v1=="Select")
	{	
		alert("Select OwnerName i.e (Transporter) ");
		return false;
	}
	else if(v2=="Select")
	{
		alert("Select Vehicle");
		return false;
	}
	
	else	
	{
		if(document.addgrpform.extAll.checked)
		{
			var v3 = document.addgrpform.email.value;
			if(v3.length=="")
			{
				
			}
			else
			{
				var sss=validateEmail(v3);
				if(!sss)
				{
				    //alert(sss);
					alert("Please enter valid email id");
					return false;
				} else{
						if(!re.test(v3))
						{
						alert("Remove First Space From Email");
						return false;
						}
					}	
			}

			var v4 = document.addgrpform.phno.value;
			if(v4.length=="")
			{
				
			}
			else
			{
				if(isNaN(v4))
				{
					alert("Please valid Mobile No");
					return false;
				}
			}

			var v5 = document.addgrpform.newHOD.value;
			if(v5.length=="")
			{
				
			}
			else
			{
				var sss=validateEmail(v5);
				if(!sss)
				{
				    //alert(sss);
					alert("HOD ID should be an email id");
					return false;
				}else{
					if(!re.test(v5))
					{
					alert("Remove First Space From HOD Id");
					return false;
					}
				}	
			}
			
			var v6=document.addgrpform.empname.value;
			if(v6.length=="")
			{
				alert("Enter Emp Name");
				return false;
			}else{
				if(!re.test(v6))
				{
				alert("Remove First Space From EMP Name");
				return false;
				}
			}
			//alert(v3);
			var v7=document.addgrpform.empcode.value;
			if(v7.length=="")
			{
				alert("Enter Emp Code");
				return false;
			}
			//alert(v4);
			
			var v8=document.addgrpform.newempid.value;
			if(v8.length=="")
			{
				alert("Enter New FleetView Id");
				return false;
			}
			var sss=validateEmail(v8);
			if(!sss)
			{
			    //alert(sss);
				alert("Please enter valid Username");
				return false;
			}else{
				if(!re.test(v8))
				{
				alert("Remove First Space From FleetView Id");
				return false;
				}
			}
 	
			var v10=document.addgrpform.newHOD.value;
			if(v10.length=="")
			{
				alert("Enter HOD EmailID");
				return false;
			}else
				{
				if(!re.test(v10))
				{
				alert("Remove First Space From HOD Id");
				return false;
				}
				}
			var v11=document.addgrpform.email.value;
			if(v11.length=="")
			{
				alert("Enter Email ID");
				return false;
			}else{
				if(!re.test(v9))
				{
				alert("Remove First Space From HOD Email Id");
				return false;
				}
			}

			var v9=document.addgrpform.phno.value;
			var rs=/^[+]{0,1}[0-9]{10,15}$/;
			if(v9.length=="")
			{
				alert("Enter Mobile Number");
				return false;
			}else{
		         if(!rs.test(v9))
		         {
		        	 
		        	 alert("Please Enter 10 To 15 Digit Mobile Number");
		        	 return false;
		         }	
		         }
		}
		else
		{
			/* var v3=document.addgrpform.empid.value;
			if(v3.length=="")
			{
				alert("Enter FleetView Emp Id");
				return false;
			}

			var sss=validateEmail(v3);
			if(!sss)
			{
		   	     //alert(sss);
				 alert("Please enter valid Username");
				 return false;
			} 
 */
			var v4 =  document.addgrpform.oldHOD.value;
			//alert(v4);
             
            if(v4 == "-")
			{
				//alert(v4);
			}
			else
			{
				
				if(v4.length == "")
				{
					var v5 = document.addgrpform.newHOD.value;
					if(v5.length == "")
					{
						
					}
					else
					{
						
						sss=validateEmail(v5);
						if(!sss)
						{
					   	     //alert(sss);
							 alert("HOD ID should be an email id");
							 return false;
						} else{
							if(!re.test(v5))
							{
							alert("Remove First Space From HOD Id");
							return false;
							}
						}
					}
				}
				else
				{
					//alert("&&&&&"+v4);
					
					//alert("&&&&&"+v4);
					sss=validateEmail(v4);
					//alert(sss);
					if(!sss)
					{
				   	     //alert(sss);
						 alert("HOD ID should be an email id");
						 return false;
					} else
						{
						if(!re.test(v4))
						{
						alert("Remove First Space From HOD Id");
						return false;
						}
						}
				}
			}
		}
		//alert(v5);
		
	}
	var v19=document.addgrpform.oldusername.value;
	var v20=document.addgrpform.oldmanagername.value;
	var v21=document.addgrpform.oldRSMname.value;
	
	//var re=/^[\s\-]+[a-zA-Z0-9.,@_\s-]+$/;
	
	var re=/^[A-Za-z0-9]+[\s\-]*[\s\- .,@_&A-Za-z0-9]*[A-Za-z.]+$/;
	
	if(v19.length=="")
	{
		alert("Select User Name");
		return false;
	}
	else{
		if(v19=="-")
			{
			
			}
		else{
		if(!re.test(v19))
		{
		alert("Remove First Space User Name");
		return false;
		}
		}
		}
	if(v20.length=="")
	{
		alert("Select Manager ");
		return false;
	}
	else{
		if(v20=="-")
		{
		
		}
	else{
		if(!re.test(v20))
		{
		alert("Remove First Space Manager Name");
		return false;
		}
	}
		}
	
	if(v21.length=="")
	{
		alert("Select RSM ");
		return false;
	}
	else{
		if(v21=="-")
		{
		
		}
	else{
		if(!re.test(v21))
		{
		alert("Remove First Space From RSM Name");
		return false;
		}
	}
		}
	
	if(document.getElementById("calender").value=="")
		{
	  		alert("Please Select the Allocation Date");
			return false;
		}
	return datevalidate();
	return true;
	
	}
	catch(e)
	{
		//alert(e);
	}
}






	 function datevalidate()
	 {
	 	var date1=document.getElementById("calender").value;
		
		var dm1,dd1,dy1,dm2,dd2,dy2;
		var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;

		dd11=date1.substring(0,2);
		mm1=date1.substring(3,6);
		mm11=dateformat(mm1);
					
		yy11=date1.substring(7,11);
		
		var date=new Date();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var year=date.getFullYear();
		
		if(yy11>year)
		{xmlhttp.open("GET","Ajaxredirectpage.jsp?id="+a,true);
			alert("Selected Date Should Not Be Greater Than Today's Date");
			document.getElementById("calender").value="";
			document.getElementById("calender").focus;
			return false;
		}
		else if(year==yy11)
		{
  			if(mm11>month)
			{
				alert("Selected Date Should Not Be Greater Than Today's Date");
				document.getElementById("calender").value="";
				document.getElementById("calender").focus;
				return false;
			}
		}
		if(mm11==month)
		{
			if(dd11>day)
			{
				alert("Selected Date Should Not Be Greater Than Today's Date");
				document.getElementById("calender").value="";
				document.getElementById("calender").focus;
				return false;
			}
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
function validateEmail(email)
{

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

function formsubmit()
{
	
	try
	{
		var aa=document.addgrpform.owner.value;
	var owner = document.getElementById("owner").value;
	//alert("owner"+owner);
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
		      
			document.getElementById("vehcles").innerHTML=reslt;
			//document.getElementById("oldHOD").value = reslt;
			}
			catch(e)
			{
				//alert(e);
			}
		} 
	};
	
	var queryString = "?owner="+owner;
	ajaxRequest.open("GET", "AjaxGetVeh.jsp" + queryString, true);
	ajaxRequest.send(null); 
	}
	catch(e)
	{
		//alert(e);
	}

}
function formsubmit1()
{
	alert("After select vehicle...");
	try
	{
		var vehcles=document.addgrpform.vehcles.value;
	var vehcles = document.getElementById("vehcles").value;
	//alert("vehcles"+vehcles);
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
		      //reslt = reslt.replace(/\s+/g,'');
			//alert(reslt);
			//vehcles=reslt;
			//document.getElementById("tr6").style.display = "none";
			//document.getElementById("newHOD").value = "";
			//document.getElementById("tr5").style.display="";
			document.getElementById("tp").innerHTML=reslt;
			//document.getElementById("oldHOD").value = reslt;
			}
			catch(e)
			{
				//alert(e);
			}
		} 
	};
	
	var queryString = "?vehcles="+vehcles;
	ajaxRequest.open("GET", "AjaxGetvehcles.jsp" + queryString, true);
	ajaxRequest.send(null); 
	}
	catch(e)
	{
		//alert(e);
	}

	/* var bb=document.addgrpform.owner.value;
	if(!(bb=="Select"))
	{	
		document.addgrpform.submit();
		document.getElementById("owner").disabled=true;
		//document.getElementById("showuser").style.display="";
		//document.getElementById("showmanager").style.display="";
	} */
}
function redirect()
{
	var check=validate();
	//alert(check);
	if(check==true)
	{
	document.addgrpform.action="cnfrmempname.jsp";
	document.addgrpform.submit();
	}
	
}

function allSelected()
{
	alert("in side allSelected......");
	if(document.addgrpform.extAll.checked)
	{
		
		document.getElementById("checkstatus").value = "Yes"; 
		//document.getElementById("tr3").style.display = "none";
		document.getElementById("tr5").style.display = "none";
		//document.getElementById("empid").value = ""; 
		document.getElementById("HOD").innerHTML = "";
		document.getElementById("oldHOD").value = "";
		document.getElementById("tr1").style.display = "";
		document.getElementById("tr2").style.display = "";
		document.getElementById("tr4").style.display = "";
		document.getElementById("tr6").style.display = "";
		document.getElementById("tr7").style.display = "";
		document.getElementById("tr8").style.display = "";
		document.getElementById("tr9").style.display = "";
		document.getElementById("tr10").style.display = "";
		document.getElementById("empn").style.display = "none";
		document.getElementById("coden").style.display = "none";
		
	}
	else
	{
		document.getElementById("checkstatus").value = "No"; 
		//document.getElementById("tr3").style.display = "";
		document.getElementById("tr1").style.display = "none";
		document.getElementById("tr2").style.display = "none";
		document.getElementById("tr4").style.display = "none";
		document.getElementById("tr6").style.display = "none";
		document.getElementById("empname").value = ""; 
		document.getElementById("empcode").value = ""; 
		document.getElementById("newempid").value = ""; 
		document.getElementById("newHOD").value = "";
		document.getElementById("tr7").style.display = "none";
		document.getElementById("tr8").style.display = "none";
		document.getElementById("tr9").style.display = "none";
		document.getElementById("tr10").style.display = "none";
		document.getElementById("email").value = ""; 
		document.getElementById("phno").value = ""; 
		document.getElementById("deg").value = ""; 
		document.getElementById("loc").value = ""; 
		document.getElementById("empn").style.display = "";
		document.getElementById("coden").style.display = "";
	}
}

function newempidval(){
	var newempid123=document.addgrpform.newempid.value;
	//var re=/^[\s\-]+[a-zA-Z0-9.,@_\s-]+$/;
	
	var re=/^[A-Za-z0-9]+[\s\-]*[\s\- .,@_&A-Za-z0-9]*[A-Za-z.]+$/;
	
	document.getElementById("newempidn").style.display="none";
	//document.getElementById("newempidn1").style.display="none";
	if(newempid123==null || newempid123=="" || newempid123.length==0){
		document.getElementById("abc").style.display="none";
	   document.getElementById("newempidn").style.display="";
	}else{
		if(!re.test(newempid123))
		{
		alert("Remove First Space From Emp ID");
		//document.getElementById("abc").style.display="none";
		//document.getElementById("newempidn1").style.display = "";
		return false;
		}
		}
}
		
function hodval(){
	//var re=/^[^\s]+[a-zA-Z0-9.,@_\s-]+$/;
	var re=/^[A-Za-z0-9]+[\s\-]*[\s\- .,@_&A-Za-z0-9]*[A-Za-z.]+$/;
	var hodcode123=document.addgrpform.newHOD.value;
	document.getElementById("hodn").style.display="none";
	if(hodcode123==null || hodcode123=="" || hodcode123.length==0){
	   document.getElementById("hodn").style.display="";
	}else{
		var sss=validateEmail(hodcode123);
		if(!sss)
		{
		    //alert(sss);
			alert("HOD ID should be an email id and Check First Space");
			return false;
		}else{
					if(!re.test(hodcode123))
					{
					alert("Remove First Space From HOD Id");
					return false;
					}
		    }	
		}
}
function phnoval(){
	var phnoncode123=document.addgrpform.phno.value;
	var rs=/^[+]{0,1}[0-9]{10,15}$/;
	document.getElementById("phnon").style.display="none";
	if(phnoncode123==null || phnoncode123=="" || phnoncode123.length==0){
	   document.getElementById("phnon").style.display="";
	}else{
		if(!rs.test(phnoncode123))
			{
			  alert("Please Enter 10 To 15 Digit Mobile Number");
			  return false;
			}
	}
}
function emailval(){

	var emailcode123=document.addgrpform.email.value;
	
	//var re=/^[\s\-]+[a-zA-Z0-9.,@_\s-]+$/;
	var re=/^[A-Za-z0-9]+[\s\-]*[\s\- .,@_&A-Za-z0-9]*[A-Za-z.]+$/;
	
	document.getElementById("emailn").style.display = "none";
	//document.getElementById("emailn1").style.display = "none";
	
	if(emailcode123==null || emailcode123=="" || emailcode123.length==0){
		document.getElementById("emailn").style.display = "";
		return false;
	}else{
		var sss=validateEmail(emailcode123);
		if(!sss)
		{
		    //alert(sss);
			alert("Enter Proper Email ID and Check First Space");
			return false;
		}else{
					if(!re.test(emailcode123))
					{
					alert("Remove First Space From Email Id");
					return false;
					}
		    }	
		}

}
function codeval(){
	//empcode
	var empcode123=document.addgrpform.empcode.value;
	document.getElementById("coden").style.display = "none";

	if(empcode123==null || empcode123=="" || empcode123.length==0){
		document.getElementById("coden").style.display = "";
		return false;
	}

	
}


function rsmval()
{
	var rsmname=document.addgrpform.oldRSMname.value;
	document.getElementById("rsmm").style.display = "none";

	if(rsmname==null || rsmname=="" || rsmname.length==0){
		document.getElementById("rsmm").style.display = "";
		return false;
	}
	
	
	}

function manval()
{
	var managername=document.addgrpform.oldmanagername.value;
	document.getElementById("mann").style.display = "none";

	if(managername==null || managername=="" || managername.length==0){
		document.getElementById("mann").style.display = "";
		return false;
	}
	
	
	}

function usrval()
{
	var username=document.addgrpform.oldusername.value;
	document.getElementById("usrn").style.display = "none";

	if(username==null || username=="" || username.length==0){
		document.getElementById("usrn").style.display = "";
		return false;
	}
	
	
	}
	
function empval(){
	
	var empname123=document.addgrpform.empname.value;
	//alert("empname123 :- "+empname123);
	
	document.getElementById("empn").style.display = "none";
	//document.getElementById("empn1").style.display = "none";
 //alert("empname123 :- "+empname123);
	//var re=/^[\s\-]+[a-zA-Z0-9.,@_\s-]+$/;
	var re=/^[A-Za-z0-9]+[\s\-]*[\s\- .,&A-Za-z0-9]*[A-Za-z.]+$/;
	
	//alert("empname123 :- "+empname123);
	if(empname123==null || empname123=="" || empname123.length==0){
		document.getElementById("empn").style.display = "";
		return false;
	}else{
		if(!re.test(empname123))
		{
		alert("Remove First Space");
		//document.getElementById("empn1").style.display = "";
		return false;
		}
		}
	
}

function showrsm(){
	
	document.getElementById("oldRSMname").removeAttribute("readonly");
	document.getElementById("oldrsm123").value = "true";
	 return false;
}
function showmanager(){
	
	document.getElementById("oldmanagername").removeAttribute("readonly");
	document.getElementById("oldmanager123").value = "true";
	 return false;
}
function showuser()
{
	//alert("in show user");
	//document.getElementById("oldusername").disabled=false;
	 //var eleman = document.getElementById("oldusername");
	   // eleman.removeAttribute("disabled"); 
	    document.getElementById("oldusername").removeAttribute("readonly");
	    document.getElementById("olduser123").value = "true";
	    return false;
		 
	/* document.getElementById("tr20").style.display = "none";
	document.getElementById("olduser").value = "";
	document.getElementById("tr19").style.display = "";
	document.getElementById("newuser").value = ""; */
}

function setname(newuser){
	//alert("in set");
	//document.getElementById("oldusername").value=newuser;
	document.addgrpform.oldusername.value=newuser;
	document.getElementById("searchuser").style.display='none';
	
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
			var reslt=ajaxRequest.responseText;
			//alert("reslt:-"+reslt);
			var reslt1=reslt.split("#");
			//document.getElementById("oldmanagername").innerHTML=reslt;
			document.getElementById("oldmanagername").value=reslt1[0].trim();
			document.getElementById("oldRSMname").value=reslt1[1].trim();
		} 
	}
	var queryString = "?oldmanagername=" +newuser;
	ajaxRequest.open("GET", "AjaxSetoldmanager.jsp" + queryString, true);
	ajaxRequest.send(null);
	
}

function setname1(newmanager){
	//alert("in set1");
	//document.getElementById("oldusername").value=newuser;
	document.addgrpform.oldmanagername.value=newmanager;
	document.getElementById("searchmanager").style.display='none';
	
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
			var reslt=ajaxRequest.responseText;
			//alert("reslt:-"+reslt);
			//var reslt1=reslt.split("#");
			//document.getElementById("oldmanagername").innerHTML=reslt;
			//document.getElementById("oldmanagername").value=reslt1[0].trim();
			document.getElementById("oldRSMname").value=reslt.trim();
		} 
	}
	var queryString = "?oldmanagername=" +newmanager;
	ajaxRequest.open("GET", "AjaxSetoldRSM.jsp" + queryString, true);
	ajaxRequest.send(null);	
}


function setname2(newrsm){
	//alert("in set1");
	//document.getElementById("oldusername").value=newuser;
	document.addgrpform.oldRSMname.value=newrsm;
	document.getElementById("searchrsm").style.display='none';
	
}



function timer2(){
	
	setTimeout("mysearch2()",2000);
}

function mysearch2(){
	
	//alert("in olduser");
	//document.getElementById("searchuser").style.visibility="visible";
	
	var x2=document.getElementById("oldrsm123").value;
	//alert(x);
	if(x2=="false"){
		//alert("-false");
		
	}
	else{
	
	
	document.getElementById("searchrsm").style.display='block';
	var oldRSMname=document.addgrpform.oldRSMname.value;
	var oldRSMname=document.getElementById("oldRSMname").value;
	//alert("oldmanagername:-"+oldmanagername);
	if(oldRSMname.length=="")
		{
		document.getElementById("searchrsm").style.visibility='hidden';
		}
	else{
		
		document.getElementById("searchrsm").style.visibility="visible";
		
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
			var reslt=ajaxRequest.responseText;
			document.getElementById("searchrsm").innerHTML=reslt;
		} 
	}
	var queryString = "?oldRSMname=" +oldRSMname;
	ajaxRequest.open("GET", "AjaxGetoldRSM.jsp" + queryString, true);
	ajaxRequest.send(null); 
	}
	
	}
}

function timer1(){
	
	setTimeout("mysearch1()",2000);
}

function mysearch1(){
	//alert("in olduser");
	//document.getElementById("searchuser").style.visibility="visible";
	
	var x1=document.getElementById("oldmanager123").value;
	//alert(x);
	if(x1=="false"){
		//alert("-false");
		
	}
	else{
	
	
	document.getElementById("searchmanager").style.display='block';
	var oldmanagername=document.addgrpform.oldmanagername.value;
	var oldmanagername=document.getElementById("oldmanagername").value;
	//alert("oldmanagername:-"+oldmanagername);
	if(oldmanagername.length=="")
		{
		document.getElementById("searchmanager").style.visibility='hidden';
		}
	else{
		
		document.getElementById("searchmanager").style.visibility="visible";
		
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
			var reslt=ajaxRequest.responseText;
			document.getElementById("searchmanager").innerHTML=reslt;
		} 
	}
	var queryString = "?oldmanagername=" +oldmanagername;
	ajaxRequest.open("GET", "AjaxGetoldmanager.jsp" + queryString, true);
	ajaxRequest.send(null); 
	}
	
	}
}


function timer(){
	//to display the please wait ..
	//document.getElementById("plzwait").style.display="";
	setTimeout("mysearch()",2000);
	}
	
function mysearch(){
	//alert("in olduser");
	//document.getElementById("searchuser").style.visibility="visible";
	//var x = document.getElementById("oldusername").disabled;
	var x=document.getElementById("olduser123").value;
	//alert(x);
	if(x=="false"){
		//alert("-false");
		
	}
	else{
		//alert("-true");
	
	
	
	document.getElementById("searchuser").style.display='block';
	var oldusername=document.addgrpform.oldusername.value;
	var oldusername=document.getElementById("oldusername").value;
	//alert("oldusername:-"+oldusername);
	if(oldusername.length=="")
		{
		 document.getElementById("searchuser").style.visibility='hidden';
		//document.getElementById("searchuser").style.display="none";
		}
	else{
		
		document.getElementById("searchuser").style.visibility="visible";
		
		
		
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
			var reslt=ajaxRequest.responseText;
			document.getElementById("searchuser").innerHTML=reslt;
			//document.getElementById("plzwait").style.display="none";
		} 
	}
	var queryString = "?oldusername=" +oldusername;
	ajaxRequest.open("GET", "AjaxGetolduser.jsp" + queryString, true);
	ajaxRequest.send(null); 
	}
	
	}
}

function showtext()
{
	document.getElementById("tr5").style.display = "none";
	document.getElementById("HOD").innerHTML = "";
	document.getElementById("oldHOD").value = "";
	document.getElementById("tr6").style.display = "";
	document.getElementById("newHOD").value = "";
}

function changehod()
{
	try
	{
		
	var username = document.getElementById("empid").value; 
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
		      reslt = reslt.replace(/\s+/g,'');
			//alert(reslt);
			document.getElementById("tr6").style.display = "none";
			document.getElementById("newHOD").value = "";
			document.getElementById("tr5").style.display="";
			document.getElementById("HOD").innerHTML=reslt;
			document.getElementById("oldHOD").value = reslt;
			}
			catch(e)
			{
				//alert(e);
			}
		} 
	};
	
	var queryString = "?username="+username;
	ajaxRequest.open("GET", "AjaxGetHOD.jsp" + queryString, true);
	ajaxRequest.send(null); 
	}
	catch(e)
	{
		//alert(e);
	}
	
}

</script>
</head>
<body>
	<%! 
Connection con1, con2;
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
							<h3 class="content-header-title  mb-0" style="color: #060637">Add
								Edit Employee Details</h3>
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
									<h6>
										( <span style="color: red;">*</span> indicates mandatory
										fields)
									</h6>
								</div>
								<div class="card-body card">
									<!-- Start card body -->

									<form name="addgrpform" method="get" action=""
										class="form form-vertical" onSubmit="return validate();">
										<%
											try
											{//1 gps 
												Class.forName(MM_dbConn_DRIVER);
												con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
												con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
												
												Statement stmt=con1.createStatement(),stmt1=con1.createStatement(), stmt2=con2.createStatement(),stmt19=con2.createStatement(),stmt20=con2.createStatement(),stmt21=con2.createStatement();
												ResultSet rs1=null, rs2=null, rs3=null,rs19=null,rs20=null;
												String sql="", sql1="", sql2="", sql3="",sql19="",sql20="";
												String tm="";
											
												java.util.Date td =new java.util.Date();
												Format fmt = new SimpleDateFormat("yyyy-MM-dd");
												//Format fmt = new SimpleDateFormat("dd-MMM-yyyy");
												String sdt = fmt.format(td);
											
												tm=td.getHours()+":"+td.getMinutes()+":"+td.getSeconds();
											
												
												 String OwnerName=request.getParameter("owner");
												 String Vehicle=request.getParameter("vehcles");
												 String id=request.getParameter("id");
												 String updated=request.getParameter("updated");
												 String empname = request.getParameter("empname");
												 
												 %>
										<input type="hidden" name="err1" id="err1" value="<%=id %>" />
										<input type="hidden" name="err2" id="err2"
											value="<%=empname %>" />
										<%
	 
													 if(updated==null)
													 {
														 
													 }
													 else
														 if(updated == "1" || updated.equals("1"))
													 {
															 %>
										<script>
																var err = document.getElementById("err1").value;
															    alert("User ID "+err+" already exist !!");
															 </script>
										<%
													 }
														 else
															 if(updated == "2" || updated.equals("2"))
														 {
															 %>

										<script>
																var err = document.getElementById("err1").value;
															    alert("Record updated successfully for ID "+err);
															 </script>

										<%
														 }
															 else
																 if(updated == "3" || updated.equals("3"))
															 {
																 %>
										<script>
																var err = document.getElementById("err1").value;
															    alert("User ID "+err+" does not exist !! Please create new user.");
															     </script>

										<%
															 }
																 else if(updated == "4" || updated.equals("4"))
																 {
																	 %>
										<script>
																	  var err = document.getElementById("err2").value;
															   		  alert(err+" already exist !!");
															    	 </script>

										<%
																 }
																	 else
																		 if(updated == "5" || updated.equals("5"))
																	 {
																		 %>
										<script>
																		  var err = document.getElementById("err2").value;
																   		  alert(err+" is blocked !!");
																    	 </script>

										<%
																	 }
													
													%>
										<div class="d-grid col-5 mx-auto">
											<label class="tcolor"><font color="red">*</font><b>Owner
													Name:</b></label><br> <select class="form-select" name="owner"
												id="owner" onchange="formsubmit();"
												aria-label="Default select example">
												<option value="Select">Select</option>
												<%
													          if(!(null==OwnerName))
																{%>
												<option value="<%=OwnerName %>" selected="selected"><%=OwnerName %></option>
												<%
																	
																}
													 			out.println("1");
													 		%>
												<%
													        String usertypevalue=session.getAttribute("usertypevalue").toString();
													        System.out.println("usertypevalue:-"+usertypevalue);
													        String TypeofUser=session.getAttribute("TypeofUser").toString();
													        System.out.println("TypeofUser:-"+TypeofUser);
													        
													        if(TypeofUser.equals("GROUP"))
													        {
													        	sql="select distinct(VehRegno) as Transporter from db_gps.t_group where GPName='"+usertypevalue+"'";
													        }else{
													        //sql="select Distinct(OwnerName) as Transporter from t_vehicledetails where OwnerName in ('Castrol East','Castrol West','Castrol North','Castrol South','Castrol ILS') and OwnerName not like '%del' order by OwnerName";
													        	sql="select Distinct(OwnerName) as Transporter from t_vehicledetails where OwnerName='"+usertypevalue+"' and OwnerName not like '%del' order by OwnerName";
													        }
													        rs1=stmt2.executeQuery(sql);
													        out.println("2");
													        
													        while(rs1.next())
													   	   {
													        	
													        	if(rs1.getString("Transporter").equalsIgnoreCase(OwnerName)){ 
													 				%>
												<option value="<%=rs1.getString("Transporter") %> "
													selected="selected">
													<%=rs1.getString("Transporter") %>
												</option>
												<%
													 			}else{
																	%>
												<option value="<%=rs1.getString("Transporter") %> ">
													<%=rs1.getString("Transporter") %>
												</option>
												<%	
																}
													 			
													 			%>
												<% } %>

											</select>

										</div>

										<div class="d-grid col-5 mx-auto">

											<label class="tcolor"><font color="red">*</font><b>Vehicles:</b></label><br>

											<select class="form-select" name="vehcles" id="vehcles"
												onchange="formsubmit1();"
												aria-label="Default select example">
												<option value="Select">Select</option>

												<%
													 			if(!(null==Vehicle))
													 			{
													 				%>
												<option value="<%=Vehicle %>" selected="selected"><%=Vehicle %></option>
												<%
													 			}
													 		%>
												<%
														 
														   sql="select Distinct(VehicleRegNumber) from t_vehicledetails where OwnerName='"+OwnerName+"' order by VehicleRegNumber asc";
														   rs2=stmt2.executeQuery(sql);
														   while(rs2.next())
													   	   { %>
												<option value="<%=rs2.getString("VehicleRegNumber") %>">
													<%=rs2.getString("VehicleRegNumber") %>
												</option>
												<% } %>
											</select>

										</div>
								    <% System.out.println(" Vehicle== "+Vehicle);%>

										<% 
										   if(!(null==Vehicle))
 			                                {
											   %>
										<div class="row">
											<div class="col-6">
												<h5>
													<label class="tcolor">Current EMP Name And Code :</label>
												</h5>
											</div>
											<div>
												<%
	 
												   sql="select Empname,Empcode from t_vehicledetails where VehicleRegNumber = '"+Vehicle+"'";
												   rs2=stmt2.executeQuery(sql);
												   while(rs2.next())
											   	   { %>
												<%=rs2.getString("Empname") %>
												&nbsp;&nbsp;&nbsp;
												<%=rs2.getString("Empcode") %>

												<input type="hidden" name="oldempname"
													value="<%=rs2.getString("Empname")%>" /> <input
													type="hidden" name="oldempcode"
													value="<%=rs2.getString("Empcode")%>" />
												<% } %>

											</div>
										</div>

										<div class="row mb-2">
											

												<label class="tcolor"><font color="red">*</font>
												User Name :</label> <input type="text" class="form-control"
													name="newuser" id="newuser" placeholder="Enter User name">
											
										</div>

										<div id="tr20" class="row mb-2">
											<div class="col-6">
												<label class="tcolor"><font color="red">*</font>User
													Name :</label>
												<%
												  	////System.out.println(OwnerName);
												   String hodid="",managerhodid="",UserName="-",rsmid="";
												   sql="select VehicleCode from t_vehicledetails where VehicleRegNumber = '"+Vehicle+"'";
												   rs2=stmt2.executeQuery(sql);
												   while(rs2.next())
											   	   { 
											   	      sql19="select UserName,hodid from t_userdetails where vehid = '"+rs2.getString("VehicleCode")+"'";
												      rs19=stmt19.executeQuery(sql19);
												      if(rs19.next()){
												      %>
												<%-- <%=rs19.getString("UserName") %> --%>
												<% UserName=rs19.getString("UserName"); %>

												<%hodid=rs19.getString("hodid"); %>
												<% } } %>
												<input class="form-control" type="text" name="oldusername" id="oldusername"
													readonly="readonly" value="<%=UserName%>" />
											</div>
											<%if(request.getParameter("vehcles").equalsIgnoreCase("Select")) { %>
											<div>
												<input class="form-control" type="hidden" name="olduser" id="olduser" value="">
												<a href="#" onclick="showuser()">Edit user</a>
											</div>
											<%  }else {%>

											<div>
												<input class="form-control" type="hidden" name="olduser" id="olduser" value="">
												<a href="#" onclick="showuser()">Edit user</font>
												</a>
											</div>

											<%} %>

										</div>

										<div class="row mb-2">
											<!--  row -->

											<label class="tcolor"><font color="red">*</font>Manager
												Name :</label>
											<div>
												<%
														   String USERname="-";
														  	////System.out.println(OwnerName);
														   sql20="select FirstName,LastName,UserName,hodid from t_userdetails where SrNo = '"+hodid+"'";
														   rs20=stmt20.executeQuery(sql20);
														   if(rs20.next())
													   	   { 
															   USERname=rs20.getString("FirstName")+" "+rs20.getString("LastName");
													   	      %>
												<%managerhodid=rs20.getString("hodid"); %>
												<%  } %>
												<input class="form-control" type="text" name="oldmanagername" id="oldmanagername"
													readonly="readonly" value="<%=USERname%>" />
												<%-- <%=USERname %> --%>
											</div>
											<%if(request.getParameter("vehcles").equalsIgnoreCase("Select")) { %>
											<div id="showmanager">
												<input class="form-control" type="hidden" name="oldmanager" id="oldmanager"
													value=""> <a href="#" onclick="showmanager()">Edit
													Manager Name
												</a>
											</div>
											<%}else{ %>
											<div>
												<input class="form-control" type="hidden" name="oldmanager" id="oldmanager"
													value=""> <a href="#" onclick="showmanager()">
													Edit Manager Name
												</a>
											</div>

											<%  } %>
										</div>
										<!-- Row end -->

										<div class="row mb-2">

											<label class="tcolor"><font color="red">*</font>RSM
												Name :</label>
											<div>
												<%
													   String RSMname="-";
													  	////System.out.println(OwnerName);
													   String sql21="select srno,FirstName,LastName,UserName from t_userdetails where SrNo = '"+managerhodid+"'";
													   ResultSet rs21=stmt21.executeQuery(sql21);
													   if(rs21.next())
												   	   { 
														   //RSMname=rs21.getString("FirstName")+" "+rs21.getString("LastName");
												   	      
														   rsmid=rs21.getString("srno");
														   
														   RSMname=rs21.getString("UserName");
												   	      
												   	   }%>

												<%=RSMname%>



												<input type="hidden" name="oldempname" value="<%=RSMname%>" />
												<input type="hidden" name="oldRSMname" value="<%=RSMname%>" />
											</div>

											<%if(request.getParameter("vehcles").equalsIgnoreCase("Select")) { %>
											<div id="showrsm">
												<input type="hidden" name="oldrsm" id="oldrsm" value="">
												<a href="#" onclick="showrsm()">Edit RSM Name
												</a>
											</div>
											<%}else{ %>
											<div>
												<input type="hidden" name="oldrsm" id="oldrsm" value="">
												<a href="#" onclick="showrsm()">Edit RSM Name</a>
											     </div>
											      <% } %>
											     
											   </div>
											   
											    <div class="row mb-2">
											       <label class="tcolor"> Create New User Id <input type="checkbox" name="extAll" id="extAll" value="yes"  onclick="allSelected();"></input></label>
											    </div>
											    <div class="row mb-2" id="tr1">
											       <label  class="tcolor"><font color="red">*</font>New EMp Name :</label>
											      
											      <input class="form-control" type="text" name="empname" id="empname" onblur="empval()"></input>
											      <label name="empn" id="empn" style="display: none;"><font color="red">Please Enter Emp Name</font></label>
 					                              <label name="empn1" id="empn1" style="display: none;"><font color="red">Please Remove First Space</font></label>
											     
											    </div>
											    
											    <div class="row mb-2" id="tr2">
											   <label  class="tcolor"><font color="red">*</font>New EMP Code :</label>  
											  
											       <input class="form-control"  type="text" name="empcode" id="empcode" onblur="codeval()"></input>
 					                               <label name="coden" id="coden" style="display: none;"><font color="red">Please Enter Emp code</font></label>
											  
											    </div>
											    
											   <div class="row mb-2" id="tr4">
											   <label  class="tcolor"><font color="red">*</font>New Fleetview ID :</label>
											   
											     <input class="form-control" type="text" name="newempid" id="newempid" onblur="newempidval()"> </input><div id="abc">Please enter FleetView Id as username</div>
	   				 								<label name="newempidn" id="newempidn"><font color="red">Please Enter New Fleetview Id</font></label></td>
	   				  							    <label name="newempidn1" id="newempidn1"><font color="red">Please Remove First Space</font></label>
											
											   </div>
											   <div class="row mb-2" >
											      <label  class="tcolor"><font color="red">*</font>HOD Email Id:</label>
											      <div id="HOD">
											         <input class="form-control" type="hidden" name="oldHOD" id="oldHOD" value="">
                                                     <a href = "#"  onclick = "showtext()">Change HOD</a>
											      </div>
											   </div>
											   <div class="row mb-2" id="tr6">
											    <label  class="tcolor"><font color="red">*</font>HOD :</label>
											    <div>
											      <input class="form-control" type="text" name="newHOD" id="newHOD" onblur="hodval()"></input> 
      			                                  <label name="hodn" id="hodn"><font color="red">Please Enter HOD</font></label>
											    </div>
											   </div>
											   <div class="row mb-2" id="tr7">
											      <label  class="tcolor"><font color="red">*</font> Email:</label>
											      <div>
											        <input class="form-control" type="text" name="email" id="email" onblur="emailval()"></input> 
									      			<label name="emailn" id="emailn" style="display: none;"><font color="red">Please Enter Email Id</font></label>
									      			<label name="emailn1" id="emailn1" style="display: none;"><font color="red">Please Remove First Space</font></label>
																				      
											      </div>
											   </div>
											   <div class="row mb-2" id="tr8">
											    <label  class="tcolor"><font color="red">*</font> Mobile No:</label>
											    <div>
											       <input class="form-control" type="text" name="phno" id="phno" onblur="phnoval()"></input> 
      			                                   <label name="phnon" id="phnon"><font color="red">Please Enter Mobile Number</font></label>
											    </div>
											   </div>
											   <div class="row mb-2" id="tr9">
											    <label  class="tcolor"><font color="red">*</font>Designation :</label>
											    <div>
											       <input class="form-control" type="text" name="deg" id="deg"></input>
											    </div>
											   </div>
											   <div class="row mb-2" id="tr10">
											     <label  class="tcolor"><font color="red">*</font> Location :</label>
											     <div>
											       <input class="form-control" type="text" name="loc" id="loc"></input>
											     </div>
											   </div>
											   <div class="row mb-2">
											        <label  class="tcolor"><font color="red">*</font> Allocation Date :</label>
											        <div>
											          <input type="text" id="calender" name="calender" value="<%=sdt%>" readonly/>
									             	 	<script type="text/javascript">
											            	 Calendar.setup(
											             	{
											               	    inputField  : "
													calender",         // ID of the input field ifFormat
													: "%Y-%m-%d",     // the date format button
													: "trigger"       // ID of thebutton
											             	}
											            );
									             		</script>
														<input type="hidden" name="checkstatus" id="checkstatus"
														value="No">
											</div>
										</div>

										<% 
 			                                }                /* IF End */
 				                            %>
										<div>
											<div id="tp" name="tp"></div>
										</div>
										<div class="d-grid gap-2 col-5 mx-auto">
											<div class="mb-2">
												<label class="tcolor">Allocation Date:</label>
												<div class="mt-1">
													<div class="input-group input-group-merge">
														<input type="text" id="calender" name="calender"
															value="<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(sdt))%>"
															class="form-control" readonly="readonly"> <span
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
												</div>
											</div>
											<script>

											$(document).ready(function() {
											$( function() {
   										    $( "#calender" ).datepicker({
										    dateFormat: 'dd-M-yy',
											changeMonth: true,
								            changeYear: true
												});
											  } );
															
											});

				 					  </script>
											<input type="hidden" name="checkstatus" id="checkstatus"
												value="No">

										</div>


										<div class="d-grid col-5 mx-auto">
											<button class="btn btn-primary btn2" type="submit"
												value="Submit" name="Submit" onclick="redirect();">Submit</button>
										</div>

									<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
	
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
</jsp:useBean>