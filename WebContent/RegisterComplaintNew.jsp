<table>
<tr>
<td align="left">	
 <a href="http://www.mobile-eye.in" target="_blank"><img src="images/TW-MobileEyeLogo1.PNG" style="height: 50px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a>
</td>
</tr>
<tr>
<td><%@ include file="headerpopup.jsp"%>
</td></tr>
</table>
<%@page import="java.util.Date"%>
    <link href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


 <%@page import="com.fleetview.beans.classes"%>
 <%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader ("Expires", 0);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/view.css" media="all">
</head>
<script type="text/javascript">

onload=function resertval()
{
	 //var elems = document.getElementsByName("browser");
	 //	for(var i=0;i<elems.length;i++)
	 	//{
	 	//	elems[i].checked==false;
	 	//}

	 	//document.incident.EmailID.value="";
	 	//document.getElementById("Number").value="";
	 //	document.getElementById("search-text").value="";
	 //	document.getElementById("Category").value="Hardware";
	 	//document.getElementById("Priority").value="Low"; 	
}

function cleareall()
{
	//alert("in clear");
	 document.getElementById("tr1").style.display="none"; 
     document.getElementById("comm").style.display="none";   
	   
     document.getElementById("tr2").style.display="none"; 
     document.getElementById("tr5").style.display="none"; 
     document.getElementById("tr6").style.display="none"; 
     document.getElementById("tr7").style.display="none"; 
     document.getElementById("tr8").style.display="none"; 
     document.getElementById("tr9").style.display="none"; 
     document.getElementById("tr10").style.display="none";
     document.getElementById("tr11").style.display="none";  
     document.getElementById("tr12").style.display="none"; 
     document.getElementById("tr13").style.display="none"; 
     document.getElementById("tr14").style.display="none"; 
     document.getElementById("tr15").style.display="none"; 
     document.getElementById("tr16").style.display="none";
     document.getElementById("tr17").style.display="none";  
     document.getElementById("tr18").style.display="none"; 
     document.getElementById("tr18").style.display="none"; 
     document.getElementById("tr20").style.display="none"; 
     document.getElementById("tr21").style.display="none"; 
        document.incident.Filename1.value="";
		document.incident.Filename2.value="";
		document.incident.Filename3.value="";
		document.incident.Filename4.value="";
		document.incident.Filename5.value="";
		document.incident.Filename6.value="";
		document.incident.Filename7.value="";
		document.incident.Filename8.value="";
		document.incident.Filename9.value="";
		document.incident.Filename10.value="";
}
function validateEmail(email)
{
     var splitted = email.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;
}



function validateform1()
{
	try
	{
	
	 var emailid=document.incident.EmailID.value;
	 var number=document.getElementById("Number").value;
      var desc=document.getElementById("search-text").value;
      var Category=document.getElementById("Category").value;
      var SubCategory=document.getElementById("SubCategory").value;
      
      if(Category=="Select")
    	  {
    	  alert("Please select Category");
    	  return false;
    			  }
      
      if(SubCategory=="Select")
	  {
	  alert("Please select SubCategory");
	  return false;
			  }

      

	 var cnt=document.incident.counter.value;
	
	
				var oth=desc.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	
	 if(null==desc || desc.length==0 || oth=="")
     {
         alert("Please enter the Description!!");
         return false;
     }
	 var cat=document.getElementById("Category").value;
		
		if(cat=="Device")
			{
				var vehid=document.getElementById("VehId2").value;
				
				if(vehid=="Select")
					{
					 	alert("Please Select Vehicle Number !!");
			         	return false;					
					}
						
			}
		
	if(cnt==0)
	{
		//alert("count");
		if(document.incident.Filename1.value=="" || document.incident.Filename2.value=="" || document.incident.Filename3.value=="" || document.incident.Filename4.value=="" || document.incident.Filename5.value=="" || document.incident.Filename6.value=="" || document.incident.Filename7.value=="" || document.incident.Filename8.value=="" || document.incident.Filename9.value=="" || document.incident.Filename10.value=="")
		{
		//alert("in if");	
	    
		//alert("in else");	
		
		
		document.incident.Filename1.value="";
		document.incident.Filename2.value="";
		document.incident.Filename3.value="";
		document.incident.Filename4.value="";
		document.incident.Filename5.value="";
		document.incident.Filename6.value="";
		document.incident.Filename7.value="";
		document.incident.Filename8.value="";
		document.incident.Filename9.value="";
	    document.incident.Filename10.value="";
		
		
	     }
	 
	}  
  

     if(emailid!="")
    {
      /*alert("Please enter valid Email ID");
      return false;
     }
    else
	{*/
	        //emai=document.getElementById("email").value;
        var temp=new Array();
        temp=emailid.split(",");
        for(var i=0;i<temp.length;i++)
        {
		var sss=validateEmail(temp[i]);
		//alert(temp[i]);
		if(!sss)
			{
			    //alert(sss);
				alert("Please enter valid Email Id");
				return false;
			} 
        }
	}

	var elems = document.getElementsByName("browser");
	for(var i=0;i<elems.length;i++)
	{
		if(elems[i].checked==true)
		{
			//alert("if yes");
	    	if(number=="")
			{
				alert("Please enter Number");
				return false;
			}
	    	 if(isNaN(number))
	    		{

	    	    	//var n1=document.getElementById("no").value;
	    			var n2=number.match("#");
	    			var n4 = number.match("-");
	    			var n3=number.match("[+]");
	    			var splitted3=number.match("[A-Za-z!@$%^&*()_,.<>;:]");
	    			if((n2!=null || n4!=null || n3!=null) && null==splitted3)
	    			{
	    			if(n2=="#" && (number.charAt(0))!="#")
	    				{
	    					alert("Invalid number!!");
	    					return false;
	    				}
	    			else
	    				{
	    				    for(var i=1;i<=number.length;i++)
	    				    	{
	    			 		   	   if(number.charAt(i)=="#")
	    			    			   {
	    			    			        alert("Invalid number!!");
	    			    			        return false;
	    			    			   }
	    			    		}
	    				}
	    		
	    			
	    		//alert(n1.match("[+]"));
	    		if(n3=="+" && (number.charAt(0))!="+")
	    			{
	    				alert("Invalid number!!");
	    			}
	    		else
	    			{
	    			    for(var i=1;i<=number.length;i++)
	    			    	{
	    			    	   if(number.charAt(i)=="+")
	    			    		   {
	    			    		        alert("Invalid number!!");
	    			    		        return false;
	    			    		   }
	    			    	}
	    			}
	    		
	    		
	    		var cnt=1;
	    		//alert(n1.match("-"));
	    		if(number.charAt(0)=="-")
	    			{
	    			 alert("Invalid number!!");
	    			 return false;
	    			}
	    		else
	    			{
	    		 for(var i=1;i<=number.length;i++)
	    			    	{
	    			    	   if(number.charAt(i)=="-")
	    			    		   {
	    			    		   if(cnt>2)
	    			    			   {
	    			    		        alert("Invalid number!!");
	    			    		        return false;
	    			    			   }
	    			    		   cnt++;
	    			    		   }
	    			    	   
	    			    	}
	    			}
	    			}
	    			else
	    			{
	    		    	alert("Please enter Numeric Value");
		    			return false;
	    			}
	    		   
	    		    }
	    	 if((number.length < 4)  || (number.length >15))
	 	    	{
	 	    	//alert("Hii");
	            alert("Please enter valid Mobile Number"); return false;
	            }
			
		}
	
       // alert(number.length);
    return true;
	}
	}catch(e)
	{
		//alert(e);
		return false;
	}
    
	
}


function getradio()
{
	//alert("Hii in radio 1");
	var elems = document.getElementsByName("browser");
	for(var i=0;i<elems.length;i++)
	{
		if(elems[i].checked==true)
		{
			document.incident.Number.value="";
		       document.getElementById("tr3").style.display="";   
		}
		else
			if(elems[i].checked==false)
		{
				document.incident.Number.value="";
			       document.getElementById("tr3").style.display="none"; 
		}
	}
	
}
function getradio1()
{
	//alert("Hii");
	
       document.getElementById("tr3").style.display="none";   	
}
function attach()
{
	try{
	//alert("Hii");
	//alert("in attach ");
	
		
var cnt=document.incident.counter.value;
//alert("351 count "+cnt);
if(cnt>0)
{
	//alert("count "+cnt);
}
else 
{
cnt=1;
var flagvalue=document.incident.flagvalue.value;
flagvalue++;
document.incident.flagvalue.value=flagvalue;
//alert(cnt);
document.incident.counter.value=cnt;

       document.getElementById("tr1").style.display="";   
	     document.getElementById("comm").style.display="";   
	       	
       document.incident.Filename1.style.display="";
      // document.incident.Filename1.value="";
      //document.getElementById("imageDiv").innerHTML="";
       document.getElementById("imageDiv").style.display="none";
     //  document.incident.Upload.style.display="";  
       document.getElementById("tr2").style.display="";   
}
	}catch(e)
	{
		alert(e);
	}
}

function attach1()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach1 ");
	
	document.getElementById("tr5").style.display="";  
	document.incident.Filename2.style.display="";
	//document.getElementById("imageDiv1").innerHTML="";
    document.getElementById("imageDiv1").style.display="none" ;	
    document.getElementById("tr2").style.display="none"; 
    document.getElementById("tr6").style.display="";  
}
function attach2()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach2 ");
	document.getElementById("tr7").style.display="";   
	document.incident.Filename3.style.display="";
	//document.getElementById("imageDiv2").innerHTML="";
    document.getElementById("imageDiv2").style.display="none";
    document.getElementById("tr6").style.display="none"; 
    document.getElementById("tr8").style.display="";  
}
function attach3()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach3 ");
	document.getElementById("tr9").style.display="";   
	document.incident.Filename4.style.display="";
	//document.getElementById("imageDiv3").innerHTML="";
    document.getElementById("imageDiv3").style.display="none";
    document.getElementById("tr8").style.display="none"; 
    document.getElementById("tr10").style.display="";  
}
function attach4()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach4 ");
	document.getElementById("tr11").style.display="";
	document.incident.Filename5.style.display="";
	//document.getElementById("imageDiv4").innerHTML="";
    document.getElementById("imageDiv4").style.display="none";   	
    document.getElementById("tr10").style.display="none"; 
    document.getElementById("tr12").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach5()
{
	var cnt=document.incident.counter.value;
	cnt++;
//	alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach5 ");
	document.getElementById("tr13").style.display="";  
	document.incident.Filename6.style.display="";
	//document.getElementById("imageDiv5").innerHTML="";
    document.getElementById("imageDiv5").style.display="none" 	;
    document.getElementById("tr12").style.display="none"; 
    document.getElementById("tr14").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach6()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach6 ");
	document.getElementById("tr15").style.display="";   
	document.incident.Filename7.style.display="";
	//document.getElementById("imageDiv6").innerHTML="";
    document.getElementById("imageDiv6").style.display="none";	
    document.getElementById("tr14").style.display="none"; 
    document.getElementById("tr16").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach7()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach7 ");
	document.getElementById("tr17").style.display="";  
	document.incident.Filename8.style.display="";
	//document.getElementById("imageDiv7").innerHTML="";
    document.getElementById("imageDiv7").style.display="none" ;	
    document.getElementById("tr16").style.display="none"; 
    document.getElementById("tr18").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach8()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach8 ");
	document.getElementById("tr19").style.display="";   
	document.incident.Filename9.style.display="";
	//document.getElementById("imageDiv8").innerHTML="";
    document.getElementById("imageDiv8").style.display="none";	
    document.getElementById("tr18").style.display="none"; 
    document.getElementById("tr20").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach9()
{
	var cnt=document.incident.counter.value;
	
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach9 ");
	document.getElementById("tr21").style.display="";  
	document.incident.Filename10.style.display="";
	//document.getElementById("imageDiv9").innerHTML="";
    document.getElementById("imageDiv9").style.display="none" ;	
    document.getElementById("tr20").style.display="none"; 
    
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}


function upload()
{
	try{
		var id_value = document.getElementById('up').value;
		var file1=document.incident.Filename1.value;
	

		 if(id_value != '')
		 { 
			 var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
			// var valid_type = /(.txt|.jpeg|.doc)$/i;
			    
		  if(valid_extensions.test(id_value))
		  { 
			
			  document.incident.Filename1.style.display="none";
				document.getElementById("imageDiv").style.display="";
				document.getElementById("f1").innerHTML=file1;
			  
		   //alert('OK');
		  }
		 // else if()
		  else
		  {
			 
			 
			 
			 var cnt=document.incident.counter.value;
   
    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
 		cleareall();
 		document.getElementById("f1").innerHTML=""; 	
 		
    }
    else
    {

    document.incident.counter.value=cnt;
	 document.incident.Filename1.value="";

	 document.incident.Filename2.value="";
	     document.getElementById("tr1").style.display="none";
	     document.getElementById("comm").style.display="none";   
	        
       document.getElementById("tr2").style.display="none"; 
       document.getElementById("f1").innerHTML=""; 	
}
			  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
		   
		  }
		 }
	
	//alert(file1);
	
	
	//document.incident.Upload.style.display="none";
	
	
	} catch(e)
	{
		alert(e);
	}

}

function upload1()
{
	try{
		var file1=document.incident.Filename2.value;
		var id_value = document.getElementById('up1').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.ods|.xls|.pdf|.txt~)$/i;
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.incident.Filename2.style.display="none";
		document.getElementById("imageDiv1").style.display="";
		document.getElementById("f2").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}
		  else
		  {

			  var cnt=document.incident.counter.value;
			   
			    cnt--;
			  // alert(cnt);
			    if(cnt==0)
			    {
			    	document.incident.counter.value=cnt;
					cleareall();
					document.getElementById("f2").innerHTML=""; 
			    }
			    else
			    {

			    document.incident.counter.value=cnt;
				
					  document.incident.Filename2.value="";
				       document.getElementById("tr5").style.display="none";   
				       document.getElementById("f2").innerHTML=""; 
			}
			  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
		   
		  }
		 }
	}catch(e)
		{
			alert(e);
		}
}

function upload2()
{
	try{
		var file1=document.incident.Filename3.value;
		var id_value = document.getElementById('up2').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.incident.Filename3.style.display="none";
		document.getElementById("imageDiv2").style.display="";
		document.getElementById("f3").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		

			}
			  else
			  {

				  var cnt=document.incident.counter.value;
				   
				    cnt--;
				   // alert(cnt);
				    if(cnt==0)
				    {
				    	document.incident.counter.value=cnt;
						cleareall();
						document.getElementById("f3").innerHTML=""; 
				    }
				    else
				    {
				 
				    document.incident.counter.value=cnt;
					
					 document.incident.Filename3.value="";
					document.getElementById("tr7").value=""; 
				       document.getElementById("tr7").style.display="none"; 
				       document.getElementById("f3").innerHTML=""; 
				} 
				  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
			   
			  }
			 }
		}catch(e)
		{
			alert(e);
		}
}

function upload3()
{
	try{
		var file1=document.incident.Filename4.value;
		var id_value = document.getElementById('up3').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.incident.Filename4.style.display="none";
		document.getElementById("imageDiv3").style.display="";
		document.getElementById("f4").innerHTML=file1;
		//document.incident.Upload.style.display="none";


	}
	  else
	  {
		  var cnt=document.incident.counter.value;

		    cnt--;
		  // alert(cnt);
		    if(cnt==0)
		    {
		    	document.incident.counter.value=cnt;
				cleareall();
				document.getElementById("f4").innerHTML=""; 
		    }
		    else
		    {

		    document.incident.counter.value=cnt;
			
			 document.incident.Filename4.value="";
			document.getElementById("tr9").value=""; 
		    document.getElementById("tr9").style.display="none";
		    document.getElementById("f4").innerHTML=""; 
		   
		}
		 
		  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
	   
	  }
	 }
		
		}catch(e)
		{
			alert(e);
		}
}

function upload4()
{
	try{
		var file1=document.incident.Filename5.value;
		var id_value = document.getElementById('up4').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;  
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.incident.Filename5.style.display="none";
		document.getElementById("imageDiv4").style.display="";
		document.getElementById("f5").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		


	}
	  else
	  {
		  var cnt=document.incident.counter.value;

		    cnt--;
		   //alert(cnt);
		    if(cnt==0)
		    {
		    	document.incident.counter.value=cnt;
				cleareall();
				document.getElementById("f5").innerHTML=""; 
		    }
		    else
		    {

		    document.incident.counter.value=cnt;
			
			 document.incident.Filename5.value="";
			document.getElementById("tr11").value=""; 
		       document.getElementById("tr11").style.display="none";  
		       document.getElementById("f5").innerHTML=""; 
		  	
		}
		  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
	   
	  }
	 }
		}catch(e)
		{
			alert(e);
		}
}

function upload5()
{
	try{
		var file1=document.incident.Filename6.value;
		var id_value = document.getElementById('up5').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.incident.Filename6.style.display="none";
		document.getElementById("imageDiv5").style.display="";
		document.getElementById("f6").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		

	}
	  else
	  {
		  var cnt=document.incident.counter.value;

		    cnt--;
		//  alert(cnt);
		    if(cnt==0)
		    {
		    	document.incident.counter.value=cnt;
				cleareall();
				document.getElementById("f6").innerHTML=""; 
		    }
		    else
		    {
		  
		    document.incident.counter.value=cnt;
			
			 document.incident.Filename6.value="";
		       document.getElementById("tr13").style.display="none"; 
		       document.getElementById("f6").innerHTML=""; 
		}
		  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
	   
	  }
	 }
		}catch(e)
		{
			alert(e);
		}
}

function upload6()
{
	try{
		var file1=document.incident.Filename7.value;
		var id_value = document.getElementById('up6').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.incident.Filename7.style.display="none";
		document.getElementById("imageDiv6").style.display="";
		document.getElementById("f7").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		

	}
	  else
	  {
		  var cnt=document.incident.counter.value;

		    cnt--;
		  //  alert(cnt);
		    if(cnt==0)
		    {
		    	document.incident.counter.value=cnt;
				cleareall();
				document.getElementById("f7").innerHTML=""; 
		    }
		    else
		    {

		    document.incident.counter.value=cnt;
			
			 document.incident.Filename7.value="";
		       document.getElementById("tr15").style.display="none";  
		       document.getElementById("f7").innerHTML=""; 
		}
		  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
	   
	  }
	 }
		}catch(e)
		{
			alert(e);
		}
}

function upload7()
{
	try{
		var file1=document.incident.Filename8.value;
		var id_value = document.getElementById('up7').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i; 
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.incident.Filename8.style.display="none";
		document.getElementById("imageDiv7").style.display="";
		document.getElementById("f8").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		

	}
	  else
	  {
		  var cnt=document.incident.counter.value;

		    cnt--;
		   // alert(cnt);
		    if(cnt==0)
		    {
		    	document.incident.counter.value=cnt;
				cleareall();
				document.getElementById("f8").innerHTML=""; 
		    }
		    else
		    {

		    document.incident.counter.value=cnt;
			
			 document.incident.Filename8.value="";
		       document.getElementById("tr17").style.display="none"; 
		       document.getElementById("f8").innerHTML=""; 
		}
		  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
	   
	  }
	 }
		}catch(e)
		{
			alert(e);
		}
}

function upload8()
{
	try{
		var file1=document.incident.Filename9.value;
		var id_value = document.getElementById('up8').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.incident.Filename9.style.display="none";
		document.getElementById("imageDiv8").style.display="";
		document.getElementById("f9").innerHTML=file1;
		//document.incident.Upload.style.display="none";

	}
	  else
	  {
		  var cnt=document.incident.counter.value;
		   
		    cnt--;
		  //  alert(cnt);
		    if(cnt==0)
		    {
		    	document.incident.counter.value=cnt;
				cleareall();
				document.getElementById("f9").innerHTML=""; 
		    }
		    else
		    {

		    document.incident.counter.value=cnt;
			
			 document.incident.Filename9.value="";
		       document.getElementById("tr19").style.display="none";  
		       document.getElementById("f9").innerHTML=""; 
		}
		  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
	   
	  }
	 }
		
		}catch(e)
		{
			alert(e);
		}
}

function upload9()
{
	try{
		var file1=document.incident.Filename10.value;
		var id_value = document.getElementById('up9').value;

		 if(id_value != '')
		 { 
			  var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
		  if(valid_extensions.test(id_value))
		  { 
		//alert(file1);
		
		document.incident.Filename10.style.display="none";
		document.getElementById("imageDiv9").style.display="";
		document.getElementById("f10").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		

	}
	  else
	  {
		  var cnt=document.incident.counter.value;

		    cnt--;
		   // alert(cnt);
		    if(cnt==0)
		    {
		    	document.incident.counter.value=cnt;
				cleareall();
				document.getElementById("f10").innerHTML=""; 
		    }
		    else
		    {
		  
		    document.incident.counter.value=cnt;
			
			 document.incident.Filename10.value="";
		     document.getElementById("tr21").style.display="none";  
		     document.getElementById("f10").innerHTML=""; 
		}
		  alert("Please Upload only doc,jpg,pdf,png,ods,xls,txt and jpeg Formatted File");
	  }
	 }
		}catch(e)
		{
			alert(e);
		}
}

function cancel()
{
	//alert("in cancel");
	var cnt=document.incident.counter.value;
   
    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
 		cleareall();
 		document.getElementById("f1").innerHTML=""; 	
 		
    }
    else
    {

    document.incident.counter.value=cnt;
	 document.incident.Filename1.value="";

	 document.incident.Filename2.value="";
	     document.getElementById("tr1").style.display="none";  
	     document.getElementById("comm").style.display="";   
	      
       document.getElementById("tr2").style.display="none"; 
       document.getElementById("f1").innerHTML=""; 	
}
}
function cancel1()
{//alert("in cancel 1");
	var cnt=document.incident.counter.value;
   
    cnt--;
  // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f2").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
		  document.incident.Filename2.value="";
	       document.getElementById("tr5").style.display="none";   
	       document.getElementById("f2").innerHTML=""; 
}
}
function cancel2()
{//alert("in cancel 2");
	var cnt=document.incident.counter.value;
   
    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f3").innerHTML=""; 
    }
    else
    {
 
    document.incident.counter.value=cnt;
	
	 document.incident.Filename3.value="";
	document.getElementById("tr7").value=""; 
       document.getElementById("tr7").style.display="none"; 
       document.getElementById("f3").innerHTML=""; 
}
}
function cancel3()
{//alert("in cancel 3");
	var cnt=document.incident.counter.value;

    cnt--;
  // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f4").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename4.value="";
	document.getElementById("tr9").value=""; 
    document.getElementById("tr9").style.display="none";
    document.getElementById("f4").innerHTML=""; 
   
}
}
function cancel4()
{//alert("in cancel 4");
	var cnt=document.incident.counter.value;

    cnt--;
   //alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f5").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename5.value="";
	document.getElementById("tr11").value=""; 
       document.getElementById("tr11").style.display="none";  
       document.getElementById("f5").innerHTML=""; 
  	
}
}
function cancel5()
{//alert("in cancel 5");
	var cnt=document.incident.counter.value;

    cnt--;
//  alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f6").innerHTML=""; 
    }
    else
    {
  
    document.incident.counter.value=cnt;
	
	 document.incident.Filename6.value="";
       document.getElementById("tr13").style.display="none"; 
       document.getElementById("f6").innerHTML=""; 
}
}
function cancel6()
{//alert("in cancel 6");
	var cnt=document.incident.counter.value;

    cnt--;
  //  alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f7").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename7.value="";
       document.getElementById("tr15").style.display="none";  
       document.getElementById("f7").innerHTML=""; 
}
}
function cancel7()
{//alert("in cancel 7");
	var cnt=document.incident.counter.value;

    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f8").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename8.value="";
       document.getElementById("tr17").style.display="none"; 
       document.getElementById("f8").innerHTML=""; 
}
}
function cancel8()
{//alert("in cancel 8");
	var cnt=document.incident.counter.value;
   
    cnt--;
  //  alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f9").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename9.value="";
       document.getElementById("tr19").style.display="none";  
       document.getElementById("f9").innerHTML=""; 
}
}
function cancel9()
{//alert("in cancel 9");
	var cnt=document.incident.counter.value;

    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f10").innerHTML=""; 
    }
    else
    {
  
    document.incident.counter.value=cnt;
	
	 document.incident.Filename10.value="";
     document.getElementById("tr21").style.display="none";  
     document.getElementById("f10").innerHTML=""; 
}
}
function getComplaintReport(fname,lname,email)
{
	var total='total';
	window.open('showComplaintDetails.jsp?fname='+fname+'&lname='+lname+'&status='+total+'&email='+email+'','mywindow','width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
	
}
function getComplaintReportp(fname,lname,email)
{
	var total='ptotal';
	
	window.open('showComplaintDetails.jsp?fname='+fname+'&lname='+lname+'&status='+total+'&email='+email+'','mywindow','width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
	
}
function getComplaintReports(fname,lname,email)
{
	var total='stotal';
	
	window.open('showComplaintDetails.jsp?fname='+fname+'&lname='+lname+'&status='+total+'&email='+email+'','mywindow','width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
	
}

function veh()
{
	var cat=document.getElementById("Category").value;
	
	if(cat=="Device")
		{
		document.getElementById("VehId").style.display="";
		//document.getElementById("VehId1").style.visibility="visible";
		//document.getElementById("VehId2").style.visibility="visible";
		
		document.getElementById("VehId2").style.display="";
		document.getElementById("VehId1").style.display="";
		return true ;
		}
		else
			{
			document.getElementById("VehId").style.display="none";
			document.getElementById("VehId2").style.display="none";
			document.getElementById("VehId2").style.display="none";
			}
		return false;
		
}
</script>

<script>

function consig()
{


		var Category=document.getElementById("Category").value;
		///alert(Category);
			
		//alert("Customer---------"+customername);
		var ajaxRequest;  // The variable that makes Ajax possible!

		try
		{
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
		//alert("eeeeeeeeeeeeeeeeeeeeeeeeee");
		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{//alert("######################### ");
				
			   var reselt=ajaxRequest.responseText;
			   //alert("Original result"+reselt);
				var finalres=reselt.split("#");
				document.getElementById("SubCategory").innerHTML=finalres[0];
				//alert("After trim"+finalres[0]);
				
				  
			 
			}
		
		}
		
		var queryString = "?Category="+Category;
	     //alert("Query String ---"+queryString);
		ajaxRequest.open("GET","AjaxReg.jsp"+queryString, true);
		ajaxRequest.send(null); 
	   
		
		//re(1);
		}
</script>

<script>
function hello()
{
	
	//alert("HELLO");
	var cat111=document.getElementById("Category").value;

	
	var cat2=document.getElementById("SubCategory").value;
	//alert(cat2);

	var cat3=document.getElementById("Veh").value;
	//alert(cat3);
	
		var data=document.getElementById("data").value;
//alert(data);
	
	var cat1=document.getElementById("Category").value;
	//alert(cat1);
	 if(cat1=="Website")
		{
		 
			var datel=document.getElementById("data").value;
			//alert(datel);

			if(datel=="Select")
				{
				alert("Please select date");
				return false;
				}
		} 
	 else if(cat1=="Request") 
		 {
			var Vehi=document.getElementById("Veh").value;
			if(Vehi=="Select")
			{
			alert("Please select Vehicle");
			return false;
			}

		 }
	 else if(cat1=="Vehicle") 
		 {
		 
			var datel=document.getElementById("data").value;
			var Vehi=document.getElementById("Veh").value;
			if((Vehi=="Select"))
			{
				alert("Please select Vehicle");
				return false;
			}
			
			if(datel=="Select")
				{
				alert("Please select date");
				return false;
				}
		 
		 
		 }
	


	}

</script>
<body >
<%!
Connection conn,con;
String ReportName="",Description="",Entby="",Name="",EmailID="",Email1="",FileName="",Category="";
String Priority="",ClosingComments="",ClosedBy="",Status="";
Date ComplaintDateTime,UpadteDateTime;
String ContactNumber="";

%>
<%
try
{
	String datenew1="";
	
	Calendar cal = Calendar.getInstance();
	String today_dt = new SimpleDateFormat("dd-MMM-yyyy")
			.format(cal.getTime());
	String data2 = today_dt;
	String temp = data2;
	String toDate = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("dd-MMM-yyyy").parse(temp));

	
	
	
	
	String Bt2=request.getParameter("submit");
		

    System.out.println("-INNNNNNNNNNNN-------------"+Bt2);
    if(Bt2==null || Bt2=="null" || Bt2.equals("null"))
    {
    	datenew1 = "Select";
    	
    }
    else
    {
    	
    	datenew1 = request.getParameter("data");
    	System.out.println("IN datenew1"+datenew1);
    	
    	String newdate = new SimpleDateFormat("yyyy-MM-dd")
    			.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew1));


    }
	
	
	
	String PageName="";
	 String Msg=request.getParameter("Msg");
	 System.out.println("********Msg " +Msg);
	 String desc="";
	 String EmailID="";
	 String Number="";
	 String category="";
	 String priority="";
	 String name="";
	 
		if(Msg!=null && Msg.equalsIgnoreCase("1"))
		{
			  System.out.println("Msg "+Msg);
			     desc=request.getParameter("desc");
			     PageName=request.getParameter("PageName1");
			      EmailID=request.getParameter("email");
			      Number=request.getParameter("Number");
			      category=request.getParameter("Category");
			      priority=request.getParameter("Priority");
			      //name=request.getParameter("name");
			      //System.out.println("NAME SIS   "+name);
			   if(EmailID.equalsIgnoreCase("-"))
			   {
				   EmailID="";
			   }
			   System.out.println("Number "+Number);
			     System.out.println("desc "+desc);
			     System.out.println("PageName "+PageName);
			     System.out.println("EmailID "+EmailID);
			     
		     %>
		     
		     <script type="text/javascript">
		     
		     try{
			  alert("Error was occured while inserting the complaint. Please reattach your attachments and resubmit  your complaint.....");
		     }catch(e)
		     {
			     alert(e);
		     }
		     </script>
		     <%
		}
		else
			if(Msg!=null && Msg.equalsIgnoreCase("2"))
			{
				desc=request.getParameter("desc");
			     PageName=request.getParameter("PageName1");
			      EmailID=request.getParameter("email");
			      Number=request.getParameter("Number");
			      category=request.getParameter("Category");
			      priority=request.getParameter("Priority");
			      name=request.getParameter("name");
			      System.out.println("NAME SIS   "+name);
			   if(EmailID.equalsIgnoreCase("-"))
			   {
				   EmailID="";
			   }
			   System.out.println("Number "+Number);
			     System.out.println("desc "+desc);
			     System.out.println("PageName "+PageName);
			     System.out.println("EmailID "+EmailID);
			     %>
			     <input type="hidden" id = "filesize" name="filesize" value="<%=name %>">
			     
			     <script>
			     var name1 = document.getElementById("filesize").value;
			     alert(name1+" is having large size");
			     </script>
			     <%
			}
		else
		{
	 PageName=request.getParameter("PageName");
	 System.out.println("########### "+PageName);
	 PageName=request.getParameter("pagename");
	 
	 System.out.println("########### from main page "+PageName);
	 
	 desc="";
	 EmailID="";
		}
		System.out.println("$$$$$$$$$$$  "+desc);
		System.out.println("$$$$$$$$$$$  "+EmailID);
		
		PageName=request.getParameter("pagename");
		 
		 System.out.println("########### from main page "+PageName);
	 String ReportName="-";
	 //System.out.println("\n\n session id-->>"+session.getId().toString()); 
	 String fname=(String)session.getAttribute("fname");
	 System.out.println("first name    "+fname);
	 String lname=(String)session.getAttribute("lname");
	 System.out.println("last name    "+lname);
	 String email=(String)session.getAttribute("email");
	 System.out.println("enamil   "+email);
	 Class.forName(MM_dbConn_DRIVER); 
		con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		Statement s = con.createStatement();
		Statement s1 = con.createStatement();
		Statement s2 = con.createStatement();
		Statement s3 = con.createStatement();
		
		String sql2="select * from db_gps.t_reportnumber where PageName='"+PageName+"'";
		ResultSet rs3=s2.executeQuery(sql2);
		 System.out.println(">>>  "+sql2);
		if(rs3.next())
		{
			ReportName = rs3.getString("ReportName");
		}
		int counter=0;

%>

<img id="top" src="newimages/top.png" alt="" style="width: 650px;">
	
	<div id="form_container" style="width: 750px; height: 30px" align="center">
	
	<%
	int tot=0,ptot=0,stot=0;
	String sqltot="select count(*) as tot from db_gps.t_ComplaintDetail where EntBy='"+fname+" "+lname+"' or Name='"+fname+" "+lname+"' or Email1='"+email+"' order by UpdatedDateTime ";
	System.out.println("Total Query is " +sqltot);
	ResultSet rscom=s1.executeQuery(sqltot);
	if(rscom.next())
	{
		tot=rscom.getInt("tot");
	}
	System.out.println("Total Complaint Count is " +tot);

	
	String sqlptot="select count(*) as tot1 from db_gps.t_ComplaintDetail where (EntBy='"+fname+" "+lname+"' or Name='"+fname+" "+lname+"' or Email1='"+email+"') and Status='Pending' order by UpdatedDateTime ";
	System.out.println("Pending Query is " +sqlptot);
	ResultSet rscom1=s1.executeQuery(sqlptot);
	if(rscom1.next())
	{
		ptot=rscom1.getInt("tot1");
	}
	System.out.println("Pending Complaint Count is " +ptot);
	
	
	String sqlstot="select count(*) as tot2 from db_gps.t_ComplaintDetail where (EntBy='"+fname+" "+lname+"' or Name='"+fname+" "+lname+"' or Email1='"+email+"') and Status='Closed' order by UpdatedDateTime ";
	System.out.println("Solved Query is " +sqlstot);
	ResultSet rscom2=s1.executeQuery(sqlstot);
	if(rscom2.next())
	{
		stot=rscom2.getInt("tot2");
	}
	System.out.println("Solved Complaint Count is " +stot);
	
	
	%>
	
	
	
	
	
	
				<div align="center"><font size="3" face="Arial">Complaint Registration Form</font></div>
	
	
			<div id="" style="width: 650px; height: 10px" align="center">
		
		<table>
	<tr>
	<td>
	<font size="2" face="Arial"><B>Total Complaint :</B></font>&nbsp;
	<a href="#" onclick="getComplaintReport('<%=fname%>','<%=lname %>','<%=email %>')"><b><%=tot %></b></a>&nbsp;
		<font size="2" face="Arial"><B>Pending :</B></font>&nbsp;
			<a href="#" onclick="getComplaintReportp('<%=fname%>','<%=lname %>','<%=email %>')"><b><%=ptot %></b></a>&nbsp;
		
		<font size="2" face="Arial"><B>Closed :</B></font>&nbsp;
		<a href="#" onclick="getComplaintReports('<%=fname%>','<%=lname %>','<%=email %>')"><b><%=stot %></b></a>&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font face="Arial" size="2" >(<font color="red"> *</font> indicates mandatory fields)</font>
	
	
	
	
	</td>
	</tr>
	</table></div>

	<form name="incident" style="background: #F5F5F5;" method="post"  onsubmit="return validateform1();"  action="ComplaintInsert.jsp" enctype="multipart/form-data" >
		
<div class="form_container" style="text-align: center;" align="center">
	
	      <table border="0" width="100%" align="center" border=1>
	       <tr>
	       <br></br>
		
		<td align="left">
	
		<font color="black" size="2" face="Arial">&nbsp;&nbsp;User Name : </font></td>
	
	  <td><font size="2" face="Arial"><b>
	  <%=fname %> <%=lname %>
	 <br><%=email %></b></font>
	 
	
	</td>
		</tr>
	      
	      <tr>
			<td valign="top" align="left"><font  color="#990000" size="2">*</font><font color="black" size="2" face="Arial">&nbsp;Description : </font></td>
			<td >
			<%
			System.out.println("^^^^^^^^^^^ "+desc);
			%>
				<textarea  name="desc" rows="4" id="search-text"  style='width: 300px; height: auto; border-color: activeborder;'><%=desc %></textarea>
				
				<input type="hidden" name="PageName" id="PageName" value="<%=PageName %>"/>
			</td>
		</tr>
         
             <tr>
			
			<td valign="top" align="left" ><font color="black" size="2" face="Arial"> &nbsp;&nbsp;Report Name: </font></td>
			<td>
			    <font color="black" size="2" face="Arial"> <%=ReportName %></font>
				<input type="hidden" name="ReportName" id="ReportName" style="width:230px; height: auto; border-color: white;"value="<%=ReportName %>" readonly /> 
			</td>
			</tr>
	
	  <tr>
			<td valign="top" align="left"><font  color="#990000" size="2">*</font><font color="black" size="2" face="Arial">&nbsp;Category :</font></td>
			<td align="left"><font color="black" size="2" face="Arial">
			 <select name="Category" id="Category" style="
				  	width: 100px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;" onchange="return consig()" >
				  	<%
				  	String cat=request.getParameter("Category"); 
				  	System.out.println("cat::"+cat);
				  	if(cat==null)
				  	{
				  		cat="Select";
				  	}
				  	else
				  	{
				  		cat=""+cat;
				  	}
				  	
				  	%>
					      <option value="<%=cat%>"><%=cat %></option>
					
			 	<%
                    String sqlcomplaint="select distinct(Category) from db_gps.t_ComplaintCategory order by Category";
			 	    ResultSet rsc=s1.executeQuery(sqlcomplaint);
			 	    while(rsc.next())
			 	    {
			 	    	
			 	    	String Code=rsc.getString("Category");
			 	    	System.out.println("Code:: "+Code);
			 	     %>
<%-- 			 	     		<option value=<%=rsc.getString("Category")%>> <%=rsc.getString("Category")%></option>
 --%>			 	     
 			 	        <option value="<%=rsc.getString("Category") %>"><%=rsc.getString("Category")%></option>
 			 	 	<%} %>
			 </select></font>
			</td>
		 
			</tr>
			
			
			<tr>
			<td valign="top" align="left"><font  color="#990000" size="2">*</font><font color="black" size="2" face="Arial">&nbsp;SubCategory:</font></td>
			<td align="left"><font color="black" size="2" face="Arial">
			 <select name="SubCategory" id="SubCategory" style="
				  	width: 100px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;" onchange="return veh()" >
      <option value="Select">Select</option>
					      
					   
					
			 	<%-- <%
                    String sqlcomplaint1111="select distinct(SubCategory) from db_gps.t_ComplaintCategory where Category='Vehicle'";
			 	    ResultSet rsc1111=s1.executeQuery(sqlcomplaint1111);
			 	    while(rsc1111.next())
			 	    {
			 	     %>
			 	        <option value="<%=rsc1111.getString("SubCategory") %>"><%=rsc1111.getString("SubCategory")%></option>
			 	 	<%} %> --%>
			 </select></font>
			</td>
		 
			</tr>
			
			
			<tr>
			<td valign="top" align="left"><font  color="#990000" size="2"></font><font color="black" size="2" face="Arial">&nbsp;&nbsp;Vehicle No:</font></td>
			<td align="left"><font color="black" size="2" face="Arial">
			 <select name="Veh" id="Veh" style="
				  	width: 100px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;" onchange="return veh()" >
					      <option>Select</option>
					      
			<%		      
					      
String vehList=session.getAttribute("VehList").toString();

String sqlcomplaint1="Select distinct(Vehiclecode),VehicleRegNumber from db_gps.t_vehicledetails where vehiclecode in "+vehList+" order by VehicleRegNumber";
System.out.println("sqlcomplaint1  ::"+sqlcomplaint1);
 ResultSet rsc1=s1.executeQuery(sqlcomplaint1);
while(rsc1.next())
{
	String Code=rsc1.getString("Vehiclecode");
  	String VehregNo=rsc1.getString("VehicleRegNumber");
	
%>
					<option value=<%=Code %>> <%=VehregNo%></option>
<%
}		
%>
					
			 </select></font>
			</td>
		 
			</tr>
		
           <tr>
          <td valign="top" align="left"><font  color="#990000" size="2"></font>
          <font color="black" size="2" face="Arial">&nbsp;&nbsp;Date:</font></td>
			<td align="left"><font color="black" size="2" face="Arial">
			

			<input type="text" id="data" name="from_date1" size="12" value="<%=datenew1%>"
			style="width: 95px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"readonly />
			<script type="text/javascript">
			$(function () {
			    $("#data").datepicker({
			        dateFormat: 'dd-M-yy',
			        maxDate: new Date(new Date().setMonth(new Date().getMonth()	))
			    });
			});				</script>

		</font>
</td>
           </tr>
	       <tr>
			
			
			<td valign="top" align="left"><font  color="#990000" size="2">*</font><font color="black" size="2" face="Arial">&nbsp;Priority :</font></td>
			<td align="left"><font color="black" size="2" face="Arial">
			 <select name="Priority" id="Priority" style="
				  	width: 87px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;"
						>
			 	<option value="Low">Low</option>
			 	<option value="High">High</option>
			 	
			 </select></font>
			</td>
		</tr>
	      
	      <tr>
			
			<td valign="top" align="left"><font  color="#990000"></font><font color="black" size="2" face="Arial">&nbsp;&nbsp;Add Email recipients : </font></td>
			<td>
			<%
			System.out.println("^^^^^^^^^^^ "+EmailID);
			%>
				<input  type="text"  name="EmailID"  value="<%=EmailID%>"  id="EmailID"  style="width:350px; border-color: activeborder;" autocomplete="off" /> 
				<br><font color="black" size="1" face="Arial">Please enter comma separated email ids.</font>
			</td>
			</tr>
	      
	      
		<tr>
			<td valign="top" align="left" colspan="0"><font  color="#990000"></font><font color="black" size="2" face="Arial">&nbsp;&nbsp;Call me back</font> 
   &nbsp;&nbsp;<input type="checkbox" name="browser" id="browser"  value="1"  onclick="getradio();"><font color="black" size="1" face="Arial">Yes </font>
              </td>
              <td  align="center" style="display: none;" id="tr3">
               <input type="text" name="Number" id="Number" style="width:230px; border-color: activeborder;" autocomplete="off"  value="" />
              <input type="hidden" name="Number1" id="Number1" >
              </td>
              </tr>

			<tr>
			<input type="hidden"  name="counter" id="counter" value="<%=counter%>"></input>
			<input type="hidden"  name="flagvalue" id="flagvalue" value="<%=counter%>"></input>
			<td valign="top" align="center" colspan="2"><div align="center"><b>&nbsp;&nbsp; <a href="#" onclick="attach();"><font size="2" face="Arial">Attach File</font></a>
		</b>
		               <div><font size="1" color="black" face="Arial">&nbsp;&nbsp;(You can attach a screen shot of the error page <br>&nbsp;&nbsp;or a file which you would like to link with this complaint entry.)</font> </div>
			           <div id="div2" position="absolute" style="width: 250px;" align="center">
			           
		                <table border="0" align="center" style="width: 100px" >
		                <tr align="center" id="comm" style="display: none;">
		                <td ><div style="width: 120px;"><font color="black" size="2" face="Arial">File Comments :</font>&nbsp;&nbsp;&nbsp;
		       		    	</div></td><td><textarea  name="comments" rows="3" id="comments"  style='width: 300px; height: auto; border-color: activeborder;'></textarea></td>
		       		    </tr>
		       		    </table>
		       		    <table border="0" align="center" >
		       			<tr align="center" id="tr1" style="display: none;">
		       		    <input type="hidden" id="ip1" name="ip1" value=""></input>
		       		    
		       			<!-- <td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                       <td align="right">&nbsp;&nbsp;<input type="file" cols="40" name="Filename1" id="up" value="" onchange="upload();"/></td>
                      <td style="display: none;width: 20%;" id="imageDiv" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f1"></font></td>
                       <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                       
                        <tr align="center" id="tr2" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach1();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr5" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename2" value="" id="up1"  onchange="upload1();"/></td>
                       <td style="display: none;width: 20%;" id="imageDiv1" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f2"></font></td>
                       <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel1();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                        
                         <tr align="center" id="tr6" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach2();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr7" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename3" value="" id="up2"  onchange="upload2();"/></td>
                        <td style="display: none;width: 20%;" id="imageDiv2" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f3"></font></td>
                        <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel2();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                         
                         
                         <tr align="center" id="tr8" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach3();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr9" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename4" value="" id="up3"  onchange="upload3();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv3" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f4"></font></td>
                        <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel3();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                          
                           <tr align="center" id="tr10" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach4();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr11" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename5" value="" id="up4"  onchange="upload4();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv4" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f5"></font></td>
                       <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel4();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr12" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach5();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr13" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename6" value="" id="up5"  onchange="upload5();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv5" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f6"></font></td>
                       <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel5();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr14" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach6();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr15" style="display: none;" >
		             <!--  <td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename7" value="" id="up6"  onchange="upload6();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv6" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f7"></font></td>
                       <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel6();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr16" style="display: none;" >                        
                        <td valign="top" align="left"><b>  &nbsp;&nbsp;<a href="#" onclick="attach7();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr17" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename8" value="" id="up7"  onchange="upload7();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv7" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f8"></font></td>
                          <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel7();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr18" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach8();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr19" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename9" value="" id="up8"  onchange="upload8();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv8" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f9"></font></td>
                       <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel8();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr20" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach9();"><font size="2" face="Arial">AttachMoreFiles</font> </a></td></tr>
		               <tr align="center" id="tr21" style="display: none;" >
		               <!-- <td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename10" value="" id="up9"  onchange="upload9();"/></td>
                        <td style="display: none;width: 20%;" id="imageDiv9" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f10"></font></td>
                        <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel9();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                                             
                      
		                
                        </table>
                        </div>
			
			</td>
		</tr>
		
		<table align="center" border="0" cellpadding="4" width="40%" style="background: #F5F5F5; margin-left: 26%;">
			
		<tr><td> </td></tr><tr><td> </td></tr>
		<tr>
			<td valign="bottom" align="center" colspan="5">
			<div align="center">
			<input type="submit" id="submit" name="submit" value="Submit" style="border-style: outset; border-color: black"  onclick="return hello()" class="formElement" /></div>
			</td>
		</tr>
 
<%
if(Msg!=null && Msg.equalsIgnoreCase("1"))
{
	if(!(Number.equalsIgnoreCase("")) && !(Number.equalsIgnoreCase("-")))
	{
		System.out.println("in number "+Number);
		%>
		<input type="hidden" id="Number2" value="<%=Number %>"></input>
		
		<script>
		try
		{
		
		var elems = document.getElementsByName("browser");
		 	for(var i=0;i<elems.length;i++)
		 	{
		 		elems[i].checked=true;
		 	}
		 	document.getElementById("tr3").style.display="";
		 	//alert("Number2 "+document.getElementById("Number2").value);
		 
		 	document.getElementById("Number").value=document.getElementById("Number2").value;
		 	
		 	//alert("Number "+document.getElementById("Number").value);
		}catch(e)
		{
			//alert(e);
		}
		</script>
		<%
		System.out.println("in number1");
	}
	%>
	<input type="hidden" id="Category1" value="<%=category %>"></input>
		<input type="hidden" id="priority1" value="<%=priority %>"></input>
		<script>
		//alert("Category1 "+document.getElementById("Category1").value);
	 //	alert("priority1 "+document.getElementById("priority1").value);
		document.getElementById("Category").value=document.getElementById("Category1").value;
	 	document.getElementById("Priority").value=document.getElementById("priority1").value;
		</script>
	<%
}

%>
 
	</table>
	</table>

	<%@ include file="footernew.jsp" %>
	
	</div>
	
	
</form>


	</div>
<%
}
catch(Exception e)
{
	System.out.println("Exception--------->"+e);
	e.printStackTrace();
}

%>
<br></br>


<P></P>

</body>
</html>
