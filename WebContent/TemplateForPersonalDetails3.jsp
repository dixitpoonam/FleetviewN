<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="headernew1.jsp" %>

<html>
  <head>  
    <title>Entry Form Template</title>  
    
<script src="js/datatable/feather.min.js"></script>
<script src="js/datatable/moment.js"></script>
<link rel="stylesheet" href="css/table/jquery-ui.css">
<script src="js/datatable/jquery-ui.js"></script>
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
 <script>
 function ValidateName(){
	 alert("Onblur Name");
	 var nameval = document.entryform.contactperson.value;
	 var text = /^[a-zA-Z  .]+$/
	 alert(nameval);
	 /* 
	 if(nameval==""||nameval==null){
		 alert("cannot leave name empty");
	 }
	 
	 if(!text.test(nameval))
		{
		alert("Please Enter valid EmailID"); 
		return false;
		} */
	 
	 
	}
 function ValidateEmail(){
	    //alert("onblur email...");
		var text= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/;
		//alert(text);
		var txtEmail=document.entryform.email;
	    //alert("email id:"+txtEmail.value);
		if(txtEmail.value=="")
			{
			alert("Please Enter EmailID");
			return false;
			}

		if(!text.test(txtEmail.value))
			{
			alert("Please Enter valid EmailID"); 
			return false;
			}
 }
 
 
 function ValidatePhone(){
	 //alert("on blur")
	 var mob=document.entryform.phoneno.value;
	 //alert("mob no:"+mob);
	 var text=/^[0-9]+$/; 
	 
	 if(mob==""){
		 alert("please enter Phone Number");
			return false;
	 }
	   if(!(mob ==0))
			{
				 if(isNaN(mob))
					{
						alert("please enter numeric value");
						return false;
					}	
				 if(!text.test(mob)){
                     alert("please enter numeric value");
                             return false;
                         }
					return true;
			    }
 }
 
 function validateAll(){
	 alert("in Validate All");
	 var nameval = document.entryform.contactperson.value;
	 var mob=document.entryform.phoneno.value;
	 var txtEmail=document.entryform.email;
	 
	 var text_email= /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/;
	 
 }
 </script>
 <style type="text/css">
/*   @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700&family=Roboto&display=swap'); */
*{margin: 0;padding: 0;box-sizing: border-box;font-family: 'Roboto', sans-serif}body{background-color: #900c3f}
/* .container{padding: 20px 50px;min-height: 450px} */.fa-yoast{color: #ac1f32;font-weight: bold}.h4{font-family: 'Poppins', sans-serif}a{color: #333}a:hover{text-decoration: none;color: #444}.search{background-color: #fdfbfc}.search input{width: 100px;border: none;outline: none;padding-top: 2px;padding-bottom: 2px;background-color: #fdfbfc}
div.btn,button.btn{background-color: #ac1f32;color: #eee}
div.btn:hover, button.btn:hover{background-color: #ac1f32d7}.navbar-light .navbar-nav .nav-link{color: #333}nav{float: left}#language{float: right}#language select{border: none;outline: none}.wrapper{width: 85%;margin: 20px auto;box-shadow: 1px 1px 30px 10px rgba(250,250,250,0.8)}.h3{padding-top: 40px;font-size: 34px}label{display: block;font-size: 0.8rem;font-weight: 700}input{border: none;outline: none;border-bottom: 2px solid #ddd;width: 100%;padding-bottom: 10px}.wrapper{clear: both}#country{border: none;outline: none;width: 100%;padding-bottom: 12px;border-bottom: 2px solid #ddd}.wrapper .col-md-6:hover label{color: #ac1f32}.wrapper .col-md-6:hover input, .wrapper .col-md-6:hover #country{border-color: #ac1f32;cursor: pointer}.wrapper .col-md-6 input:focus{border-color: #ac1f32}.option{position: relative;padding-left: 30px;display: block;cursor: pointer;color: #888}
  .option input{display: none}.checkmark{position: absolute;top: -1px;left: 0;height: 20px;width: 20px;background-color: #fff;border: 1px solid #ccc;border-radius: 50%}.option input:checked ~ .checkmark:after{display: block}.option .checkmark:after{content: "\2713";width: 10px;height: 10px;display: block;position: absolute;top: 30%;left: 50%;transform: translate(-50%,-50%) scale(0);transition: 200ms ease-in-out 0s}
  .option:hover input[type="radio"] ~ .checkmark{background-color: #f4f4f4}
  .option input[type="radio"]:checked ~ .checkmark{background: #ac1f32;color: #fff;transition: 300ms ease-in-out 0s}.option input[type="radio"]:checked ~ .checkmark:after{transform: translate(-50%,-50%) scale(1);color: #fff}@media (min-width: 992px){.navbar-expand-lg .navbar-nav .nav-link{padding-right: 1.5rem;padding-left: 0rem}.navbar{padding: 0.5rem 0rem;width: 75%}}
  @media(max-width: 991px){.dropdown-menu{border: none}#language{padding-top: 20px}
  .navbar{padding: 0.5rem 0rem}}@media(max-width: 767px){.search input{width: 90%}
  .search{margin-bottom: 10px}div.btn{width: 100%}.h3{font-size: 25px}.brand{text-align: center}
  /* .container{padding: 20px;margin-left: 0px} */
  .navbar{padding: 0.5rem 0rem}}
  @media(max-width: 374px){.h3{font-size: 21px}}
</style>
  </head>
  <body>

 <!-- BEGIN: Content-->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-6">
						<h3 class="content-header-title  mb-0" style="color:#000080">Entry Form Template</h3>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
					   <button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0 btncol" data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
						Register Complaint</button>
					
						<button id="kt_engage_demos_toggle" class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0 btncol" >
							<span id="kt_engage_demos_label">Help</span>
						</button>
					  </div>
				</div>
			</div>
		</div>
        <div class="content-body"> <!--  start content body -->
           <!-- Basic Vertical form layout section start -->
           
            <section id="basic--layouts" >
                <div class="row">
                    <div class="col-md-12 col-12">
                        <div class="card">
                            <div class="card-body card"> <!-- Start card body -->
                                <form name="entryform" class="form form-vertical" method="POST">
                                <!-- ************************************************************************************ -->
					               	<div class="container bg-white mt-sm-4 mb-5">
										    <div class="wrapper d-flex justify-content-center flex-column px-md-5 px-1">
										
										        <div class="row my-4">
										            <div class="col-md-6"> 
										            <label>User Name</label> 
										            <input type="text" placeholder="User Name"> 
										            </div>
										            
										            <div class="col-md-6 pt-md-0 pt-4">
										             <label>First Name</label>
										              <input type="text" placeholder="First Name"> 
										            </div>
										        </div>
										        <div class="row my-md-4 my-2">
										            <div class="col-md-6">
										             <label>Last Name</label>
										             <input type="email" placeholder="Last Name"> </div>
										            <div class="col-md-6"> 
										            <label>Designation</label>
										            <input type="tel" placeholder="Enter Designation"> </div>
										        </div>
										        <div class="row my-md-4 my-2">
										            <div class="col-md-6">
										               <label>Old Password</label>
												         <input type="email" placeholder="Enter Old Password"> 
												    </div>
												     <div class="col-md-6">
										                 <label> New Password</label> 
										                 <input type="tel" placeholder="Enter New Password"> </div>
										        </div>
										        <div class="row my-md-4 my-2">
										            <div class="col-md-6">
										                <label>Re-enter New Password</label> 
										                <input type="email" placeholder="Re-enter New Password">
										             </div>
										            <div class="col-md-6 pt-md-0 pt-4"> 
										            <label>Phone Number</label> 
										            <input type="tel" placeholder="+91 9768594785"> </div>
										        </div>
										        <div class="row my-md-4 my-2">
										            <div class="col-md-6"> 
										            <label>Email ID</label> 
										            <input type="email" placeholder="jhon19@mail.com"> 
										            </div>
										        
										        </div>
										        <div class="row my-md-4 my-2">
										            <div class="col-md-6"> <label>Last Name</label>
										             <input type="email" placeholder="jhon19@mail.com"> </div>
										            <div class="col-md-6 pt-md-0 pt-4"> <label>Phone</label> 
										            <input type="tel" placeholder="+91 9768594785"> </div>
										        </div>
										        <div class="row my-md-4 my-2">
										            <div class="col-md-6"> <label>Company</label> 
										            <input type="email" placeholder="Company Name"> </div>
										            <div class="col-md-6 pt-md-0 pt-4">
										             <label>Company</label> 
										            <select name="country" id="country">
										                    <option value="ind">Transworld</option>
										                    <option value="us">EPPS</option>
										                    <option value="uk">Poshs Metal</option>
										                    <option value="aus">Ayasto</option>
										                </select> </div>
										       
										       
										        <div class="d-flex justify-content-end"> <button class="btn">Request a demo</button> </div>
										    </div>
										</div>		        
								   </div>   
								 <!--  ***************************** *************************************************** --> 
                                </form>
                            </div>  <!--  end of card body -->
                        </div>
                    </div>
                </div>
            </section>
            <!-- Basic Vertical form layout section end -->

        </div> <!--  end content body -->
    </div>   <!-- end content wrapper-->
</div> <!-- end app-content -->
<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>
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

      <br>
      <%@ include file="footernew1.jsp"%> 
  </body>
</html>