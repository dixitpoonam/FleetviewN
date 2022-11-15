
<%@ include file="Connections/conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
</head>
<body>
<%!
Connection con1;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();
ResultSet rs1=null;
String sql="",startplace="",endplace="";
String username,startendloc="";
username=session.getAttribute("usertypevalue").toString();
 
sql="select distinct StartPlace,EndPlace,RouteCode from db_gps.t_castrolroutes where Owner='"+username+"' order by StartPlace,EndPlace asc";
ResultSet rst=stmt1.executeQuery(sql);
%>
            <div class="row col-12">
				<!-- Item alignment center  -->
				<div class="col-10">
					<label class="tcolor"></label>
					<div class="input-container">
						<select class="form-select"  name="routename" id="routename" onchange="fun2(this);"
							aria-label="Default select example">
							<option value="Select">Select</option>
							
							 <%
								int couter=1;
								while(rst.next())
								{
								
									startendloc=rst.getString("StartPlace")+"/"+rst.getString("EndPlace");
									%>
										<option value='<%=startendloc+ "/ "
																+ rst.getString("Routecode") + " /"%>'><%=startendloc + "/ "
																+ rst.getString("Routecode") + " /"%>
									   </option>	
									<%
								//	String buffer=startendloc+couter;
								//	System.out.println("buffer ------>"  +buffer);
								//	out.print(buffer);
								//	couter++;
								}
								
								%>
						</select>
					</div>
				</div>
			</div>
 <%

} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>
</body>
</html>