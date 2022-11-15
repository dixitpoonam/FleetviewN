<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="bootstrap.min.css">
<link href="uiform/app.css" rel="stylesheet" type="text/css" />
<%@ include file="headernew.jsp"%>


</head>
<body>
	<div class="generic-container"
		style="margin-left: 275px; margin-top: 15px;">

		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead"><center>
						<b>Click on below image to download Excel Format for Trip Data</b>
					</center></span>
			</div>
			<div class="formcontainer">
				<form name="uploadexcelform" ENCTYPE="multipart/form-data"
					action="<%=request.getContextPath()%>/UploadTripClosureExcelServlet"
					method="post" class="form-horizontal">


					<div class="form-group col-md-12">

						<div class="col-md-5">
							<!-- <input type="text" class="form-control input-sm" style="width: 170px;" name="TTime" id="TTime" value=""onblur="chkTD(), Autoh()"  /> -->

							<input type="file" class="form-control-file" name="Filename" />
							<a href="javascript:document.uploadexcelform.submit();"
								class="btnLeft"><span class="btnRight"><font
									size="3">Upload</font></span></a>
						</div>
					</div>


					<div class="row">
						<div class="text-center">
							<input type="submit" value="Submit"
								class="btn btn-primary btn-sm">

						</div>
					</div>
				</form>






				<%
		//fleetview.closeConnection();
	%>


			</div>
		</div>

	</div>

</body>
</html>