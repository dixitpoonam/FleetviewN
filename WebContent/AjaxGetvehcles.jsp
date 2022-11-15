<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%-- <%@ include file="header.jsp" %> --%>
<%@ include file="Connections/conn.jsp" %>
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
<style type="text/css">
.sectionCSs{
	max-width: 37em;
	padding: 1em 3em 3em 3em;
	margin: 0em auto;
	background-color:;
	border-radius: 2.2px;
	box-shadow: 0px 3px 10px -2px rgba(0, 0, 0, 0.2);
	background-color:#FAFBFC;
}
</style>
</head>

<%!
Connection con1;
%>

<%
try {
    
    
    Class.forName(MM_dbConn_DRIVER);
//	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    Statement stmt1=con1.createStatement();
    Statement stmt2=con1.createStatement();
    ResultSet rs22=null;
    String sql=""; 
    String Vehicle = request.getParameter("vehcles");
    Statement stmt=con1.createStatement(),stmt19=con1.createStatement(),stmt20=con1.createStatement(),stmt21=con1.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null,rs19=null,rs20=null;
	String sql1="", sql2="", sql3="",sql19="",sql20="";
	String tm="";

	java.util.Date td =new java.util.Date();
	Format fmt = new SimpleDateFormat("yyyy-MM-dd");
	//Format fmt = new SimpleDateFormat("dd-MMM-yyyy");
	String sdt = fmt.format(td);

	tm=td.getHours()+":"+td.getMinutes()+":"+td.getSeconds();

	
	 String OwnerName=request.getParameter("owner");
	 //String Vehicle=request.getParameter("vehcles");
	 String id=request.getParameter("id");
	 String updated=request.getParameter("updated");
	 String empname = request.getParameter("empname");
	 %>
	 <input type="hidden" name="err1" id="err1" value="<%=id %>"/>
	 <input type="hidden" name="err2" id="err2" value="<%=empname %>"/>
	 <%if(!(null==Vehicle))
		{ %>

<section class="section sectionCSs">
	<div class="row col-12">
		<div class="col-10">
			<div class="mb-2">
				<label style="color: orange;" class="tcolor">Current EMP
					Name And Code :</label><br>
				<%
					// String OwnerName=request.getParameter("owner");
							////System.out.println(OwnerName);
							sql = "select Empname,Empcode from t_vehicledetails where VehicleRegNumber = '" + Vehicle + "'";
							rs2 = stmt2.executeQuery(sql);
							while (rs2.next()) {
				%>
				<%=rs2.getString("Empname")%>
				&nbsp;&nbsp;&nbsp;
				<%=rs2.getString("Empcode")%>

				<input type="hidden" name="oldempname"
					value="<%=rs2.getString("Empname")%>" /> <input type="hidden"
					name="oldempcode" value="<%=rs2.getString("Empcode")%>" />
				<%
					}
				%>
			</div>
		</div>
	</div>

	<div class="row mb-1" id="tr19" style="display: none;">
		<div class="col-3">
			<label class="tcolor"><font color="red">*</font>User Name:</label>
		</div>
		<div>
			<input class="form-control" type="text" name="newuser" id="newuser"></input>
		</div>
	</div>
 
<hr>
	<div class="row mb-1" id="tr20">
		<div class="col-2">
			<label class="tcolor"><font color="red">*</font>User</label>
		</div>
		<div class="col-6">
			<%
				////System.out.println(OwnerName);
						String hodid = "", managerhodid = "", UserName = "-";
						sql = "select VehicleCode from t_vehicledetails where VehicleRegNumber = '" + Vehicle + "'";
						rs2 = stmt2.executeQuery(sql);
						while (rs2.next()) {
							sql19 = "select UserName,hodid from t_userdetails where vehid = '"
									+ rs2.getString("VehicleCode") + "'";
							rs19 = stmt19.executeQuery(sql19);
							if (rs19.next()) {
			%>
			<%-- <%=rs19.getString("UserName") %> --%>
			<%
				UserName = rs19.getString("UserName");
			%>

			<%
				hodid = rs19.getString("hodid");
			%>
			<%
				}
						}
			%>

			<input class="form-control" type="text" name="oldusername" id="oldusername"
				readonly="readonly" value="<%=UserName%>" onblur="usrval()"
				onkeyup="timer()" /> <label name="usrn" id="usrn"
				style="display: none;"><font color="red">&nbsp;&nbsp;&nbsp;Please
					Enter User Name</font></label> <input type="hidden" name="olduser123"
				id="olduser123" value="false">
			<!--            please wait functinality is here.... -->
			<!-- <div id="plzwait" name="plzwait" style="display: none;"><font color="red" size="2">Please Wait...</font></div> -->

		</div>
		<%if(request.getParameter("vehcles").equalsIgnoreCase("Select")) { %>
		<div class="col-4" style="display: none;" id="showuser">
			<input type="hidden" name="olduser" id="olduser" value="">
			<a href="#" onclick="showuser()"> <font color="blue" size="2">Change
					user</font>
			</a>
		</div>
		  <%  }else {%>
		<div class="col-4">
			 <input type="hidden" name="olduser" id="olduser" value="" >
       <a href = "#"  onclick = "showuser()"> <font color="blue" size="2">Change user</font> </a>
		</div>
		 <%} %>
	</div>

  <div>
     <div></div><div><div class="list" id="searchuser" name="searchuser" style="position: fixed; overflow: auto;"></div><div></div></div>
  </div>

	<div class="row mb-1">
		<div class="col-2">
			<label class="tcolor"><font color="red">*</font>Manager</label>
		</div>
		<div class="col-6 ">
			<%
				String USERname = "-";
						////System.out.println(OwnerName);
						sql20 = "select FirstName,LastName,UserName,hodid from t_userdetails where SrNo = '" + hodid + "'";
						rs20 = stmt20.executeQuery(sql20);
						if (rs20.next()) {
							//USERname=rs20.getString("FirstName")+" "+rs20.getString("LastName");
							USERname = rs20.getString("UserName");
			%>
			<%
				managerhodid = rs20.getString("hodid");
			%>
			<%
				}
			%>
			<input class="form-control" type="text" name="oldmanagername" id="oldmanagername"
				readonly="readonly" value="<%=USERname%>" onblur="manval()"
				onkeyup="timer1()" /> <label name="mann" id="mann"
				style="display: none;"><font color="red">&nbsp;&nbsp;&nbsp;Please
					Enter manager name</font></label> <input type="hidden" name="oldmanager123"
				id="oldmanager123" value="false">
			<%-- <%=USERname %> --%>
		</div>
		<%
			if (request.getParameter("vehcles").equalsIgnoreCase("Select")) {
		%>
		<div class="col-4" style="display: none;" id="showmanager">
			<input type="hidden" name="oldmanager" id="oldmanager" value="">
			<a href="#" onclick="showmanager()"> <font color="blue" size="2">Change
					Manager </font>
			</a>
		</div>
		<%
			} else {
		%>
		<div class="col-4">
			<input type="hidden" name="oldmanager" id="oldmanager" value="">
			<a href="#" onclick="showmanager()"> <font color="blue" size="2">Change
					Manager </font>
			</a>
		</div>
		<%
			}
		%>

	</div>
	
	<div>
	   <div></div><div><div id="searchmanager" name="searchmanager" style="position: fixed; overflow: auto;"></div><div></div></div>
	</div>
	<div class="row mb-1">
		<div class="col-2">
			<label class="tcolor">RSM</label>
		</div>
		<div class="col-6">
			<%
				String RSMname = "-", rsmid = "";
						////System.out.println(OwnerName);
						String sql21 = "select srno,FirstName,LastName,UserName from t_userdetails where SrNo = '"
								+ managerhodid + "'";
						ResultSet rs21 = stmt21.executeQuery(sql21);
						if (rs21.next()) {
							//RSMname=rs21.getString("FirstName")+" "+rs21.getString("LastName");
							RSMname = rs21.getString("UserName");
			%>
			<%
				rsmid = rs21.getString("srno");
			%>
			<%
				}
			%>
			<input type="hidden" name="rsmname" id="rsmname" value="<%=RSMname%>" />
			<%-- <%=RSMname%> --%>
			<input class="form-control" type="text" name="oldRSMname" id="oldRSMname"
				readonly="readonly" value="<%=RSMname%>" onblur="rsmval()"
				onkeyup="timer2()" /> <label name="rsmm" id="rsmm"
				style="display: none;"><font color="red">&nbsp;&nbsp;Please
					Enter RSM name</font></label> <input type="hidden" name="oldrsm123" id="oldrsm123"
				value="false">
			<%-- <%=USERname %> --%>

		</div>
		<%if(request.getParameter("vehcles").equalsIgnoreCase("Select")) { %>
		<div class="col-4" style="display:none;" id="showrsm">
			<input type="hidden" name="oldrsm" id="oldrsm" value="">
            <a href = "#"  onclick = "showrsm()"> <font color="blue" size="2">Change RSM</font> </a>
		</div>
		<%}else{ %>
		<div class="col-4" >
		 <input type="hidden" name="oldrsm" id="oldrsm" value="">
          <a href = "#"  onclick = "showrsm()"> <font color="blue" size="2">Change RSM</font> </a>
		</div>
		 <%    } %>
	</div>
  <hr>
	<div>
	   <div></div><div><div id="searchrsm" name="searchrsm" style="position:; overflow: auto;"></div><div></div></div>
	</div>
	<div class="mt-1">
		<label class="tcolor" style="color: orange;">Create New User
			Id</label> <input class="form-check-input" type="checkbox" 
			name="extAll" id="extAll" value="yes"  onclick="allSelected();"/>(Select check BOX Here)
	</div>
	<hr>
	                                <div class="row mt-1" style="display: none;" id="tr1">
									<div><label class="tcolor"><font color="red">*</font>New EMP Name</label></div>
									<div>
									     <input  class="form-control" type="text" name="empname" id="empname" onblur="empval()"></input>
 					                     <label name="empn" id="empn" style="display: none;"><font color="red">Please Enter Emp Name</font></label>
    				                </div>
									</div>
									
									<div class="row mt-1" style="display: none;" id="tr2">
									<div><label class="tcolor"><font color="red">*</font>New EMP Code</label></div>
									<div>
									     <input class="form-control" type="text" name="empcode" id="empcode" onblur="codeval()"></input>
 					                     <label name="coden" id="coden" style="display: none;"><font color="red">Please Enter Emp code</font></label>
									</div>
									</div>
									
									<div class="row mt-1" style="display: none;" id="tr4">
									<div><label class="tcolor"><font color="red">*</font>New Fleetview ID </label></div>
								    <div>
								        <input class="form-control" type="text" name="newempid" id="newempid" onblur="newempidval()"></input>
	   				                     <div id="abc">Please enter FleetView Id as username</div>
	   				                    <label name="newempidn" id="newempidn" style="display: none;">
	   				                     <font color="red">Please Enter New Fleetview Id</font></label>
								    </div>
									
									</div>
									
									<div class="row mt-1" id="tr5" style="display: none;">
									 <div><label class="tcolor"><font color="red">*</font>HOD Email Id:</label> </div>
									<div>
									 <font color="#060637" id="HOD"></font> 
     		                              <input type="hidden" name="oldHOD" id="oldHOD" value="">
                                          <a href = "#"  onclick = "showtext()"> <font color="blue" size="2">Change HOD</font> </a>
									</div>
									</div>
									
									<div class="row mt-1" id="tr6" style="display: none;">
									 <div><label class="tcolor"><font color="red">*</font>HOD</label> </div>
									<div>
									   <input class="form-control" type="text" name="newHOD" id="newHOD" onblur="hodval()"></input> 
      			                       <label name="hodn" id="hodn" style="display: none;"><font color="red">Please Enter HOD</font></label>
									</div>
									</div>
									
									<div class="row mt-1"  id="tr7" style="display: none;">
									   <div><label class="tcolor"><font color="red">*</font>Email</label></div>
									   <div>
									     <input  class="form-control" type="text" name="email" id="email" onblur="emailval()"></input> 
      			                         <label name="emailn" id="emailn" style="display: none;"><font color="red">Please Enter Email Id</font></label>
									  </div>
									</div>
									
									<div class="row mt-1" id="tr8" style="display: none;">
									<label class="tcolor"><font color="red">*</font>Mobile No</label>
									<div>
									     <input  class="form-control" type="text" name="phno" id="phno" onblur="phnoval()"></input> 
      		                        	 <label name="phnon" id="phnon" style="display: none;"><font color="red">Please Enter Mobile Number</font></label>
									</div>
									</div>
									
									<div class="row mt-1" id="tr9" style="display: none;">
									<div><label class="tcolor">Designation</label></div>
									<div>
									    <input class="form-control" type="text" name="deg" id="deg"></input>
									</div>
									</div>
									
									<div class="row mt-1" id="tr10" style="display: none;">
									<label class="tcolor">Location</label>
									<div>
									    <input class="form-control" type="text" name="loc" id="loc">
									</div>
									</div>
</section>
<%
 }
 %>					
	    

<%
} 
catch(Exception e)
	{
		out.println(e);
	}

finally
{
con1.close();
}
%>