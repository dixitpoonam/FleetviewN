<script language="JavaScript1.2">
function regcomplaint(PageName)
{
	try{
		 //alert(e);
		// var PageName = document.getElementById("PageName").value;
		// PageName = "bcndsjh";
	window.open('RegisterComplaint.jsp?pagename='+PageName,'Win','width=710,height=600,top=200,left=200,scrollbars=yes');	 
	 }catch(e)
	 {
		 alert(e);
	 }
}
</script>
<%String PageName1=""; 

 PageName1=this.getClass().getName();


//String reportno = "";

System.out.println("pagename that we got in ************************ here is :- "+PageName1);

PageName1=PageName1.substring(PageName1.lastIndexOf(".")+1,PageName1.length());
System.out.println(PageName1);
PageName1=PageName1.replace("_",".");
PageName1=PageName1.replace(".005f","_");
System.out.println(PageName1);

%>
<%-- <button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" > <a href="#" onclick="regcomplaint(<%=PageName1 %>)" >Register Complaint</a> 
			 </button> --%>
		<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0 btn2" >	 
			 <input type="hidden" name="PageName" id="PageName" value="<%=PageName1 %>"/>
		 <a href="#" onclick="regcomplaint('<%=PageName1 %>')" title="Register Complaint"><font style="color:#FFFFFF;">Register Complaint</font></a>
</button>


