<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headernew1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    
        <link rel="stylesheet" type="text/css" href="css/table/jquery.datetimepicker.css">
        <script src="js/datatable/jquery.datetimepicker.js"></script>
        <script type="text/javascript">
        
        function chk(){
        	//alert("in chk....");
        	var chkf="";
         	var chkt="";
         	
        	fdatetime=document.getElementById("datepicker").value;
        	tdatetime=document.getElementById("datepicker1").value;
        	
        	var objFromDate = fdatetime.substring(0, 11);
        	
        	var fdate=objFromDate.split("-");
         	if(fdate[1]=="Jan")
         	{
         		chkf="01";
         	}
         	if(fdate[1]=="Feb")
         	{
         		chkf="02";
         	}
         	if(fdate[1]=="Mar")
         	{
         		chkf="03";
         	}
         	if(fdate[1]=="Apr")
         	{
         		chkf="04";
         	}
         	if(fdate[1]=="May")
         	{
         		chkf="05";
         	}
         	if(fdate[1]=="Jun")
         	{
         		chkf="06";
         	}
         	if(fdate[1]=="Jul")
         	{
         		chkf="07";
         	}
         	if(fdate[1]=="Aug")
         	{
         		chkf="08";
         	}
         	if(fdate[1]=="Sep")
         	{
         		chkf="09";
         	}
         	if(fdate[1]=="Oct")
         	{
         		chkf="10";
         	}
         	if(fdate[1]=="Nov")
         	{
         		chkf="11";
         	}
         	if(fdate[1]=="Dec")
         	{
         		chkf="12";
         	}
         	var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
             var objToDate = tdatetime.substring(0, 11);
             var tdate=objToDate.split("-");
             if(tdate[1]=="Jan")
         	{
             	chkt="01";
         	}
         	if(tdate[1]=="Feb")
         	{
         		chkt="02";
         	}
         	if(tdate[1]=="Mar")
         	{
         		chkt="03";
         	}
         	if(tdate[1]=="Apr")
         	{
         		chkt="04";
         	}
         	if(tdate[1]=="May")
         	{
         		chkt="05";
         	}
         	if(tdate[1]=="Jun")
         	{
         		chkt="06";
         	}
         	if(tdate[1]=="Jul")
         	{
         		chkt="07";
         	}
         	if(tdate[1]=="Aug")
         	{
         		chkt="08";
         	}
         	if(tdate[1]=="Sep")
         	{
         		chkt="09";
         	}
         	if(tdate[1]=="Oct")
         	{
         		chkt="10";
         	}
         	if(tdate[1]=="Nov")
         	{
         		chkt="11";
         	}
         	if(tdate[1]=="Dec")
         	{
         		chkt="12";
         	}
             var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
            // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
              
             var date1 = new Date(objFromDate1);
             var date2 = new Date(objToDate1);
             
             //alert("from > "+date1+" Todate > "+date2);
              
                 if(date1 > date2)
                 {
                     alert("From Date Should be Less Than To Date");
                     return false; 
                 }

                 //return true;    	
        	alert("fdatetime:"+fdatetime+" tdatetime: "+tdatetime);
        	
        	 frtime = fdatetime.substring(12, 17);
         	alert("from time:"+frtime);
         	
         	totime = tdatetime.substring(12, 17);
         	alert("to time:"+totime);
         		
         	fhh = frtime.substring(0, 2);
         	fmm = frtime.substring(3);
         	
         	alert("from time: "+fhh+"."+fmm);
         	
          	thh = totime.substring(0, 2);
         	tmm = totime.substring(3)
         	 
         	
         	alert("to time:"+thh+"."+tmm);
         	
         	if(fhh > thh){
         		alert("from time is greater than to time")
         		return false;
         	}
         	
         	if(fhh==thh){           //from-hour is same as to-hour       
         		
         		if(fmm > tmm){
         			alert("from time is greater than to time")
         			return false;
         		}
         		
         	}
         	
         	return true;
         	
        }
        </script>
        
</head>
<body>
<div class="app-content content " id="allcontent">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left mb-1 col-md-3 col-12">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Datetimepicker Report</h3>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-9 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >


		<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
			Register Complaint</button>
		
			<button id="kt_engage_demos_toggle" class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0" >
				<span id="kt_engage_demos_label">Help</span>
			</button>
		
					  </div>
				</div>
			</div>
			
		</div>
		<%
	String datex1 = "", datex2 = "";

	String dd = request.getParameter("button");
	if (dd == null) {
		System.out.println("On load");

		datex1 =  session.getAttribute("PresentMonthFirst").toString()+" 00:00:00";  //dd-MMM-yyyy
		datex2 = session.getAttribute("today").toString()+" 23:59:59";
		

	} else {
		System.out.println("On submit");
		
		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");		
		
	} //end of else
	
	
	System.out.println(" datex1 "+datex1+" datex2 "+datex2);
	
	String dttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(datex1));
	String dt1time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(datex2));
	
	System.out.println("Query pass date time params:  from:" + dttime + " to: " + dt1time);

	
%>
		
		<!-- form comes here  -->
		<form name="formreport" id="formreport" method="post" onsubmit="return chk();">
		    <div class="row col-12">
		    <div class="col-md-3"></div>
			<div class="col-md-2">
				

				<label for="from">From:</label>
				<div class="input-group input-group-merge" >
				
					<input type="text" name="data" id="datepicker"  class="form-control" value="<%=datex1%>"> 
					<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
				</div>
						<script>
							$(document).ready(function() {
								$(function() {
									$("#datepicker").datetimepicker({
										dateFormat : 'dd-M-yy',
										controlType : 'select',
										oneLine : true,
										timeFormat : 'HH:mm:ss',
										changeMonth : true,
										changeYear : true
									});
								});

							});
						</script>



					</div>
			<div class="col-md-2">
				<label for="to">To:</label>
				<div class="input-group input-group-merge" >
				
					<input type="text" id="datepicker1" name="data1"  class="form-control" value="<%=datex1%>"/> 
				<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
				</div>
				<script>
							$(document).ready(function() {
								$(function() {
									$("#datepicker1").datetimepicker({
										dateFormat : 'dd-M-yy',
										controlType : 'select',
										oneLine : true,
										timeFormat : 'HH:mm:ss',
										changeMonth : true,
										changeYear : true
									});
								});

							});
						</script>
		</div>

			<div class="col-md-2">
				<input type="submit" class="btn btn-primary" style="margin-top: 10px;" name="button"   value="Submit">
			</div>
		</div><br>
			</form>
			</div>
			</div>
			


</body>
</html>