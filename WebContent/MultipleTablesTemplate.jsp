<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ include file="headernew1.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">


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
 
</head>
<body>
<body>


<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>" />

<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 


String datex1, datex2, data1, data2;
%>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Report Head 1</h3>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
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
<!-- Table Starts here -->
	<div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">
							<thead>
										<tr>
											<th>Sr.No.</th>
											<th>VehRegNo</th>
											<th>Transporter</th>
											<th>VehicleType</th>
											<th>Total Distance</th>
											<th>Total RunHrs</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>8574</td>
											<td>ABC</td>
											<td><a href="#">Origin</a></td>
											<td>-</td>
											<td>-</td>
										</tr>

										<tr>
											<td>2</td>
											<td>8574</td>
											<td>XYZ</td>
											<td><a href="#">Origin</a></td>
											
											<td>-</td>
											<td>-</td>
										</tr>


										<tr>
											<td>3</td>
											<td>8574</td>
											<td>PQR</td>
											<td><a href="#">Origin</a></td>
											<td>-</td>
											<td>-</td>
										</tr>


										<tr>
											<td>4</td>
											<td>8574</td>
											<td>ASD</td>
											<td><a href="#">Origin</a></td>
											<td>-</td>
											<td>-</td>
										</tr>
									<tfoot>
										<tr>
											<th>Sr.No.</th>
											<th>VehRegNo</th>
											<th>Transporter</th>
											<th>VehicleType</th>
											<th>Total Distance</th>
											<th>Total RunHrs</th>
										</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							
							

			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Report Head 2</h3>
					</div>
				</div>
			</div>
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example2" class="table table-bordered">
							<thead>
										<tr>
											<th>Sr.No.</th>
											<th>VehRegNo</th>
											<th>Transporter</th>
											<th>VehicleType</th>
											<th>Total Distance</th>
											<th>Total RunHrs</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>8574</td>
											<td>ABC</td>
											<td><a href="#">Origin</a></td>
											<td>-</td>
											<td>-</td>
										</tr>

										<tr>
											<td>2</td>
											<td>8574</td>
											<td>XYZ</td>
											<td><a href="#">Origin</a></td>
											
											<td>-</td>
											<td>-</td>
										</tr>


										<tr>
											<td>3</td>
											<td>8574</td>
											<td>PQR</td>
											<td><a href="#">Origin</a></td>
											<td>-</td>
											<td>-</td>
										</tr>


										<tr>
											<td>4</td>
											<td>8574</td>
											<td>ASD</td>
											<td><a href="#">Origin</a></td>
											<td>-</td>
											<td>-</td>
										</tr>
									<tfoot>
										<tr>
											<th>Sr.No.</th>
											<th>VehRegNo</th>
											<th>Transporter</th>
											<th>VehicleType</th>
											<th>Total Distance</th>
											<th>Total RunHrs</th>
										</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							
							
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Report Head 3</h3>
					</div>
				</div>
			</div>
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example3" class="table table-bordered">
							<thead>
										<tr>
											<th>Sr.No.</th>
											<th>VehRegNo</th>
											<th>Transporter</th>
											<th>VehicleType</th>
											<th>Total Distance</th>
											<th>Total RunHrs</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>8574</td>
											<td>ABC</td>
											<td><a href="#">Origin</a></td>
											<td>-</td>
											<td>-</td>
										</tr>

										<tr>
											<td>2</td>
											<td>8574</td>
											<td>XYZ</td>
											<td><a href="#">Origin</a></td>
											
											<td>-</td>
											<td>-</td>
										</tr>


										<tr>
											<td>3</td>
											<td>8574</td>
											<td>PQR</td>
											<td><a href="#">Origin</a></td>
											<td>-</td>
											<td>-</td>
										</tr>


										<tr>
											<td>4</td>
											<td>8574</td>
											<td>ASD</td>
											<td><a href="#">Origin</a></td>
											<td>-</td>
											<td>-</td>
										</tr>
									<tfoot>
										<tr>
											<th>Sr.No.</th>
											<th>VehRegNo</th>
											<th>Transporter</th>
											<th>VehicleType</th>
											<th>Total Distance</th>
											<th>Total RunHrs</th>
										</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							</div>
							</div>
							</div>



							   
<!-- Included new footer file -->
<%@ include file="footernew1.jsp"%>
<!-- Included new footer file -->


<!--New Script code added Start -->
<script>
	$(window).on('load', function () {
		if (feather) {
			feather.replace({
				width: 14,
				height: 14
			});
		}
	})
</script>
<!--New Script code added End -->


<!--New Script code added For table Start -->

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example1').DataTable({
                /* order: [[2, 'desc']], */
                dom: '<"d-flex justify-content-between align-items-center mx-0 row"<"col-sm-12 col-md-6"l><"col-sm-12 col-md-4"f><"col-sm-12 col-md-2 dt-action-buttons text-end"B>>t<"d-flex justify-content-between mx-0 row"<"col-sm-12 col-md-6"i><"col-sm-12 col-md-6"p>>',
                displayLength: -1,
                lengthMenu: [[-1, 10, 25, 50], ["All", 10, 25, 50]],
                buttons: [
                    {
                        extend: 'collection',
                        className: 'btn btn-outline-secondary dropdown-toggle me-2',
                        text: feather.icons['share'].toSvg({ class: 'font-small-4 me-50' }) + 'Export',
                        buttons: [
                            {
                                extend: 'print',
                                text: feather.icons['printer'].toSvg({ class: 'font-small-4 me-50' }) + 'Print',
                                className: 'dropdown-item',
								title: 'Report Head 1',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Report Head 1',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Report Head 1',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Report Head 1',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Report Head 1',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                           
                        ],
                        init: function (api, node, config) {
                            $(node).removeClass('btn-secondary');
                            $(node).parent().removeClass('btn-group');
                            setTimeout(function () {
                                $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex');
                            }, 50);
                        }
                    },
                    
                ],
                // responsive: true,
                language: {
                    paginate: {
                        // remove previous & next text from pagination
                        previous: '&nbsp;',
                        next: '&nbsp;'
                    }
                }
            });

             <%-- dt_basic.columns([<%=detailViewSequence%>]).visible(false) , --%>

            $('div.head-label').html('<h6 class="mb-0"></h6>');

            $("#but_showhide").on("click", function () {
                var checked_arr = $("#parent_filter_select2").val();
                var unchecked_arr = [0, 1, 2, 3, 4, 5, 6];
                var defaultArray = [0, 1, 2, 3, 4];

                unchecked_arr.forEach(element => {
                    dt_basic.columns(element).visible(false);
                });
                checked_arr.forEach(element => {
                    dt_basic.columns(element).visible(true);
                });

                console.log(checked_arr)

                if (checked_arr.length == 0) {
                    defaultArray.forEach(element => {
                        dt_basic.columns(element).visible(true);
                    });
                }
            });
        });


         <%-- $("#detailedView").on("click", function () {

            dt_basic.columns([<%=detailViewSequence%>]).visible(true),

                $('#example1').addClass('table-responsive');

        }); --%> 


        $.fn.select2.amd.define(
            "select2/selectAllAdapter",
            ["select2/utils", "select2/dropdown", "select2/dropdown/attachBody"],
            function (Utils, Dropdown, AttachBody) {
                function SelectAll() { }
                SelectAll.prototype.render = function (decorated) {
                    var self = this,
                        $rendered = decorated.call(this),
                        $selectAll = $(
                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-check-square-o"></i> Select All</button>'
                        ),
                        $unselectAll = $(
                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-square-o"></i> Unselect All</button>'
                        ),
                        $btnContainer = $('<div style="margin-top:3px;">')
                            .append($selectAll)
                            .append($unselectAll);
                    if (!this.$element.prop("multiple")) {
                        // this isn't a multi-select -> don't add the buttons!
                        return $rendered;
                    }
                    $rendered.find(".select2-dropdown").prepend($btnContainer);
                    $selectAll.on("click", function (e) {
                        var $results = $rendered.find(".select2-results__option[aria-selected=false]");
                        $results.each(function () {
                            //   self.trigger("select", {
                            // 	data: $(this).data("data"),
                            //   });
                            var $result = $(this);
                            console.log($result);
                            // Get the data object for it
                            var data = $result.data('data');

                            // Trigger the select event
                            self.trigger('select', {
                                data: data
                            });
                        });
                        self.trigger("close");
                    });
                    $unselectAll.on("click", function (e) {
                        var $results = $rendered.find(
                            ".select2-results__option[aria-selected=true]"
                        );
                        $results.each(function () {
                            self.trigger("unselect", {
                                data: $(this).data("data"),
                            });
                        });
                        self.trigger("close");
                    });
                    return $rendered;
                };

                return Utils.Decorate(Utils.Decorate(Dropdown, AttachBody), SelectAll);
            }
        );



        $("#parent_filter_select2").select2({
            placeholder: "Select",
            dropdownAdapter: $.fn.select2.amd.require("select2/selectAllAdapter"),
        });
        // $("#example1").DataTable({
        //   "responsive": true, "lengthChange": false, "autoWidth": false,
        //   "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        // }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    });
</script>

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example2').DataTable({
                /* order: [[2, 'desc']], */
                dom: '<"d-flex justify-content-between align-items-center mx-0 row"<"col-sm-12 col-md-6"l><"col-sm-12 col-md-4"f><"col-sm-12 col-md-2 dt-action-buttons text-end"B>>t<"d-flex justify-content-between mx-0 row"<"col-sm-12 col-md-6"i><"col-sm-12 col-md-6"p>>',
                displayLength: -1,
                lengthMenu: [[-1, 10, 25, 50], ["All", 10, 25, 50]],
                buttons: [
                    {
                        extend: 'collection',
                        className: 'btn btn-outline-secondary dropdown-toggle me-2',
                        text: feather.icons['share'].toSvg({ class: 'font-small-4 me-50' }) + 'Export',
                        buttons: [
                            {
                                extend: 'print',
                                text: feather.icons['printer'].toSvg({ class: 'font-small-4 me-50' }) + 'Print',
                                className: 'dropdown-item',
								title: 'Report Head 2',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Report Head 2',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Report Head 2',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Report Head 2',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Report Head 2',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                           
                        ],
                        init: function (api, node, config) {
                            $(node).removeClass('btn-secondary');
                            $(node).parent().removeClass('btn-group');
                            setTimeout(function () {
                                $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex');
                            }, 50);
                        }
                    },
                    
                ],
                // responsive: true,
                language: {
                    paginate: {
                        // remove previous & next text from pagination
                        previous: '&nbsp;',
                        next: '&nbsp;'
                    }
                }
            });

             <%-- dt_basic.columns([<%=detailViewSequence%>]).visible(false) , --%>

            $('div.head-label').html('<h6 class="mb-0"></h6>');

            $("#but_showhide").on("click", function () {
                var checked_arr = $("#parent_filter_select2").val();
                var unchecked_arr = [0, 1, 2, 3, 4, 5, 6];
                var defaultArray = [0, 1, 2, 3, 4];

                unchecked_arr.forEach(element => {
                    dt_basic.columns(element).visible(false);
                });
                checked_arr.forEach(element => {
                    dt_basic.columns(element).visible(true);
                });

                console.log(checked_arr)

                if (checked_arr.length == 0) {
                    defaultArray.forEach(element => {
                        dt_basic.columns(element).visible(true);
                    });
                }
            });
        });


         <%-- $("#detailedView").on("click", function () {

            dt_basic.columns([<%=detailViewSequence%>]).visible(true),

                $('#example1').addClass('table-responsive');

        }); --%> 


        $.fn.select2.amd.define(
            "select2/selectAllAdapter",
            ["select2/utils", "select2/dropdown", "select2/dropdown/attachBody"],
            function (Utils, Dropdown, AttachBody) {
                function SelectAll() { }
                SelectAll.prototype.render = function (decorated) {
                    var self = this,
                        $rendered = decorated.call(this),
                        $selectAll = $(
                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-check-square-o"></i> Select All</button>'
                        ),
                        $unselectAll = $(
                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-square-o"></i> Unselect All</button>'
                        ),
                        $btnContainer = $('<div style="margin-top:3px;">')
                            .append($selectAll)
                            .append($unselectAll);
                    if (!this.$element.prop("multiple")) {
                        // this isn't a multi-select -> don't add the buttons!
                        return $rendered;
                    }
                    $rendered.find(".select2-dropdown").prepend($btnContainer);
                    $selectAll.on("click", function (e) {
                        var $results = $rendered.find(".select2-results__option[aria-selected=false]");
                        $results.each(function () {
                            //   self.trigger("select", {
                            // 	data: $(this).data("data"),
                            //   });
                            var $result = $(this);
                            console.log($result);
                            // Get the data object for it
                            var data = $result.data('data');

                            // Trigger the select event
                            self.trigger('select', {
                                data: data
                            });
                        });
                        self.trigger("close");
                    });
                    $unselectAll.on("click", function (e) {
                        var $results = $rendered.find(
                            ".select2-results__option[aria-selected=true]"
                        );
                        $results.each(function () {
                            self.trigger("unselect", {
                                data: $(this).data("data"),
                            });
                        });
                        self.trigger("close");
                    });
                    return $rendered;
                };

                return Utils.Decorate(Utils.Decorate(Dropdown, AttachBody), SelectAll);
            }
        );



        $("#parent_filter_select2").select2({
            placeholder: "Select",
            dropdownAdapter: $.fn.select2.amd.require("select2/selectAllAdapter"),
        });
        // $("#example1").DataTable({
        //   "responsive": true, "lengthChange": false, "autoWidth": false,
        //   "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        // }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    });
</script>

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example3').DataTable({
                /* order: [[2, 'desc']], */
                dom: '<"d-flex justify-content-between align-items-center mx-0 row"<"col-sm-12 col-md-6"l><"col-sm-12 col-md-4"f><"col-sm-12 col-md-2 dt-action-buttons text-end"B>>t<"d-flex justify-content-between mx-0 row"<"col-sm-12 col-md-6"i><"col-sm-12 col-md-6"p>>',
                displayLength: -1,
                lengthMenu: [[-1, 10, 25, 50], ["All", 10, 25, 50]],
                buttons: [
                    {
                        extend: 'collection',
                        className: 'btn btn-outline-secondary dropdown-toggle me-2',
                        text: feather.icons['share'].toSvg({ class: 'font-small-4 me-50' }) + 'Export',
                        buttons: [
                            {
                                extend: 'print',
                                text: feather.icons['printer'].toSvg({ class: 'font-small-4 me-50' }) + 'Print',
                                className: 'dropdown-item',
								title: 'Report Head 3',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Report Head 3',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Report Head 3',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Report Head 3',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Report Head 3',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                           
                        ],
                        init: function (api, node, config) {
                            $(node).removeClass('btn-secondary');
                            $(node).parent().removeClass('btn-group');
                            setTimeout(function () {
                                $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex');
                            }, 50);
                        }
                    },
                    
                ],
                // responsive: true,
                language: {
                    paginate: {
                        // remove previous & next text from pagination
                        previous: '&nbsp;',
                        next: '&nbsp;'
                    }
                }
            });

             <%-- dt_basic.columns([<%=detailViewSequence%>]).visible(false) , --%>

            $('div.head-label').html('<h6 class="mb-0"></h6>');

            $("#but_showhide").on("click", function () {
                var checked_arr = $("#parent_filter_select2").val();
                var unchecked_arr = [0, 1, 2, 3, 4, 5, 6];
                var defaultArray = [0, 1, 2, 3, 4];

                unchecked_arr.forEach(element => {
                    dt_basic.columns(element).visible(false);
                });
                checked_arr.forEach(element => {
                    dt_basic.columns(element).visible(true);
                });

                console.log(checked_arr)

                if (checked_arr.length == 0) {
                    defaultArray.forEach(element => {
                        dt_basic.columns(element).visible(true);
                    });
                }
            });
        });


         <%-- $("#detailedView").on("click", function () {

            dt_basic.columns([<%=detailViewSequence%>]).visible(true),

                $('#example1').addClass('table-responsive');

        }); --%> 


        $.fn.select2.amd.define(
            "select2/selectAllAdapter",
            ["select2/utils", "select2/dropdown", "select2/dropdown/attachBody"],
            function (Utils, Dropdown, AttachBody) {
                function SelectAll() { }
                SelectAll.prototype.render = function (decorated) {
                    var self = this,
                        $rendered = decorated.call(this),
                        $selectAll = $(
                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-check-square-o"></i> Select All</button>'
                        ),
                        $unselectAll = $(
                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-square-o"></i> Unselect All</button>'
                        ),
                        $btnContainer = $('<div style="margin-top:3px;">')
                            .append($selectAll)
                            .append($unselectAll);
                    if (!this.$element.prop("multiple")) {
                        // this isn't a multi-select -> don't add the buttons!
                        return $rendered;
                    }
                    $rendered.find(".select2-dropdown").prepend($btnContainer);
                    $selectAll.on("click", function (e) {
                        var $results = $rendered.find(".select2-results__option[aria-selected=false]");
                        $results.each(function () {
                            //   self.trigger("select", {
                            // 	data: $(this).data("data"),
                            //   });
                            var $result = $(this);
                            console.log($result);
                            // Get the data object for it
                            var data = $result.data('data');

                            // Trigger the select event
                            self.trigger('select', {
                                data: data
                            });
                        });
                        self.trigger("close");
                    });
                    $unselectAll.on("click", function (e) {
                        var $results = $rendered.find(
                            ".select2-results__option[aria-selected=true]"
                        );
                        $results.each(function () {
                            self.trigger("unselect", {
                                data: $(this).data("data"),
                            });
                        });
                        self.trigger("close");
                    });
                    return $rendered;
                };

                return Utils.Decorate(Utils.Decorate(Dropdown, AttachBody), SelectAll);
            }
        );



        $("#parent_filter_select2").select2({
            placeholder: "Select",
            dropdownAdapter: $.fn.select2.amd.require("select2/selectAllAdapter"),
        });
        // $("#example1").DataTable({
        //   "responsive": true, "lengthChange": false, "autoWidth": false,
        //   "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        // }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    });
</script>
			
</body>
</html>