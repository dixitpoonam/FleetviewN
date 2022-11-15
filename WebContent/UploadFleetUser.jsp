<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="moreservlets.listeners.*" errorPage="" %>
<link href="css/Fleetview.css" rel="stylesheet" type="text/css"></link>
<style type="text/css">@import url(jscalendar-1.0/calendar-blue.css);</style>
<%@ page import = "java.io.FileNotFoundException"%>
<%@ page import = "java.io.FileOutputStream"%>
<%@ page import = " java.io.IOException"%>
<%@ page import="javax.activation.*" %>
<%@ include file="headernew.jsp"%> 
<script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script> 
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script> 
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script> 
<%-- <jsp:useBean id="centconn" class="FormToolConnection.FormToolConn" scope="page"> --%> 
 <jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page">
	
	

<script type="text/javascript">

		
		onload=function()
		{
			document.getElementById("trans").value="Select";
		};
		
		function Reload()
		{
			//alert("Hej");  
		    window.location.reload(); 
		}
		function downloadExcelFormat()  
		{  
			     window.location = "Task_List_Format.xls";
		         
		}
		/*function Editvalues() {
		
			var f = uploadTask.file.value;
		//	alert(">>file"+f);
			window.open ("uploadTask1.jsp?filename="+f);
			
		}*/
		function confirmSubmit()
		{
		
			
			var fup = uploadTask.file.value;
			var ext = fup.substring(fup.lastIndexOf('.') + 1);
		
		//alert(">>"+fup+">>>>"+ext);
		    if(ext =="xls")
		    {
		      // return true;
		    }
		    else
		    {
		        alert("Upload Excel file only");
		        return false;
		    }
			
		var agree=confirm("Are you sure you wish submit this User-tagging List?");
		if (agree)
			return true ;
		else
			return false ;
		}
</script>

<%
		String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
		String MM_dbConn_USERNAME = "fleetview";
		String MM_dbConn_PASSWORD = "1@flv";
	    String MM_dbConn_STRING = "jdbc:mysql://164.68.105.216/db_gps";
	   // String MM_dbConn_STRING = "jdbc:mysql://localhost/db_gps";


		try {
			Class.forName(MM_dbConn_DRIVER);

			Connection con2 = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		Statement stat = con2.createStatement();


		} catch (Exception e) {
			e.printStackTrace();
		}
%>

<form name="uploadTask" method="post" enctype="multipart/form-data" onsubmit="return confirmSubmit()" action="InsertFleetUser.jsp">

<table border="0" align="center" width="100%">
<tr><td align="center"><font color="black" size="3"><b><i>Upload Fleet User</i></b></font></td></tr>
</table>

				

<table border="0" width="100%" align="center">


				


<tr>
	<td  align="center" bgcolor="#f5f5f5" ><font size="2"><b>Browse excel file :</b></font>
		<INPUT NAME="file" id ="file" TYPE="file" size="20">
	</td>
</tr>
<br>
</table>

<br>

<table border="0" width="100%" align="center">
<tr>
<td bgcolor="#f5f5f5" align="center"><font size="2"><b><input type ="submit" name ="uploadexl" id="uploadexl" value="Submit"/></b></font></td>        
</tr>
</table>

<%
	String msg=request.getParameter("msg");
	
	System.out.println("The msg is :"+msg);
	if(msg !=null) {
%>
<table border="0" width="100%" align="center">
<tr>
<td  align="center" bgcolor="#f5f5f5"><font size="2"><b>File Uploaded Successfully</b></font></td>
</tr>
</table>
<%}else{ %>
<table border="0" width="100%" align="center" >
<tr>
<td  align="center" bgcolor="#f5f5f5"><font size="2"><b>Please Upload Only .xls Format Files.</b></font></td>
</tr>
</table>
<%} %>


</form>
</jsp:useBean>
<%@ include file="footernew.jsp" %>



