<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="headernew1.jsp" %>
    <%@ page import = "java.io.FileNotFoundException"%>
<%@ page import = "java.io.FileOutputStream"%>
<%@ page import = "java.io.IOException"%>
<%@ page import="javax.activation.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Tracking System</title>
<!-- Included our css file start-->
	<link rel="stylesheet" type="text/css" href="css/table/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/responsive.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/buttons.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/rowGroup.bootstrap5.min.css">
	<script src="https://unpkg.com/feather-icons@4.10.0/dist/feather.min.js"></script>
	<!-- Included our css file End -->
	
	<!-- Included our Js file Start-->

	<script src="js/datatable/jquery.dataTables.min.js"></script>
	<script src="js/datatable/moment.js"></script>
	<link rel="stylesheet" href="css/table/jquery-ui.css">

	<script src="js/datatable/jquery-ui.js"></script>

    <script src="js/datatable/dataTables.bootstrap5.min.js"></script>
    <script src="js/datatable/dataTables.responsive.min.js"></script>
    <script src="js/datatable/responsive.bootstrap5.js"></script>
    <script src="js/datatable/datatables.checkboxes.min.js"></script>
    <script src="js/datatable/datatables.buttons.min.js"></script>
    <script src="js/datatable/jszip.min.js"></script>
    <script src="js/datatable/pdfmake.min.js"></script>
    <script src="js/datatable/vfs_fonts.js"></script>
    <script src="js/datatable/buttons.html5.min.js"></script>
    <script src="js/datatable/buttons.print.min.js"></script>
    <script src="js/datatable/dataTables.rowGroup.min.js"></script>
 	<!-- Included our Js file End-->

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
</head>
<body>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left mb-1 col-md-3 col-12">
				<div class="row breadcrumbs-top">
					<div class="col-12">
					<h3 class="content-header-title  mb-0">Upload User Tag</h3>
					</div>
				</div>
			</div>
             <div class="content-header-right text-md-end col-md-9 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
	
<%-- 		 <%@include file="RegisterCompScript.jsp" %>
 --%>		
			 <br><button id="kt_engage_demos_toggle" class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0" >
				<span id="kt_engage_demos_label">Help</span>
			</button>
		
					  </div>
				</div>
			</div>
			<div class="content-body">
                <!-- Basic table -->
                 <section id="">
                    <div class="row col-12" style="--bs-gutter-x:0px">
                            <div class="card" style="height: 400px;">
                                <div class="card-body">
                                    <form name="uploadTask" method="post" enctype="multipart/form-data" onsubmit="return confirmSubmit()" action="InsertUsertag.jsp">
										<div class="row col-12">
											
												<div class="col-md-4">
													<label for="BulkUpload">Upload Excel(.xls) file</label> 
													<input name="file" id="file" type="file" class="form-control">
												</div>
												<div class="col-md-2">
													<input type="submit" class="btn btn-primary" name ="uploadexl" id="uploadexl" value="Submit" style="margin-top:10px" />
												</div>
											    <div class="col-md-2 mt-2">
											       <label for="SampleFormat">Format</label>
											       <a href="http://myfleetview.net/usr/share/apache-tomcat-7.0.109/webapps/docs/Usertagging.xls" style="font-weight: bold; color: black; " >
	                                               <img src="images/excel.jpg" width="20px" height="20px" style="border-style: none" title="download excel format"></img></a>
											       
											    </div>
											
										</div>
									</form>
                                                </div>
                                                </div>
                                                </div>
                                                </section>
                                                </div>
			
<%
				String msg = request.getParameter("msg");

				System.out.println("The msg is :" + msg);
				if (msg != null) {
			%>
			<script>alert("File Uploaded Successfully");</script>
			<%}
	      else{
	    	  String err = request.getParameter("err");
	    	  System.out.println("The err is :" + err);
	    	 if(err!=null){ 
	      if(err.equalsIgnoreCase("err1")){ %>
	    		  <script>alert("File Upload Failed. Incorrect details for User. Pl check your excel file for blank cells in between");</script>
	    <% }
	    }
	    }%>
			</div>
			</div>
			</div>
			
			
</body>
</html>