<%@ include file="headernew.jsp"%>
<!DOCTYPE html>
    <html>
      <head>
              <%@page import="java.text.SimpleDateFormat"%>
              <%@page import="java.util.Date"%>
              <%@page import="java.sql.*" %>
              <%@page import="java.util.*" %>
             <title></title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script	src="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"></script>



<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css ">
<script type="text/javascript" src="datatablejs/bootstrap.js"></script>

<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js "></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js "></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js "></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js "></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js "></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>

<script type="text/javascript" src="datatablejs/buttons.colVis.min.js"></script>




<style>
td.highlight {
	background-color: whitesmoke !important;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <link rel="stylesheet" href="css/styleTempChart.css"> 
 <script type="text/javascript" src="js/jspdf.min.js"></script>
<script type="text/javascript" src="js/jspdf.debug.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  
  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<style> 


#errmsg
{
color: red;
}
</style>
<!-- <style>
#exp_css {
    height: 10px;
    width: 5%;
    }
</style> -->
  <script>
  $(function() {
    $( "#from" ).datepicker({
    showAnim: "slide",
    dateFormat: "dd-M-yy"
});
  });
  </script>
    <script>
  $(function() {
    $( "#to" ).datepicker({
    showAnim: "slide",
    dateFormat: "dd-M-yy"
});
  });
  </script>


<!-- <script type="text/javascript">
$(function(){
	$('#minval').keypress(function(e){
	var txt = String.fromCharCode(e.which);
	console.log(txt + ' : ' + e.which);
	if(!txt.match(/[0-9-.]/))
	{
	return false;
	}
	});
	});
</script> -->
<script type="text/javascript">
$(function(){
	$('#maxval').keypress(function(e){
	var txt = String.fromCharCode(e.which);
	
	console.log(txt + ' : ' + e.which);
	if (!txt.match(/[0-9+-.]/))
	{
		//alert(txt);
		 alert("Enter only Standard temperature Format . Ex : 12,8.5,-20.00");
	return false;
	}
	

	});
	
	});
</script>
<script type="text/javascript">
$(function(){
	$('#minval').keypress(function(e){
	var txt = String.fromCharCode(e.which);
	//alert(txt);
	console.log(txt + ' : ' + e.which);
	if (!txt.match(/[0-9+-.]/))
	{
		//alert(txt);
		  alert("Enter only Standard Humidity Format . Ex : 12,8.5,-20.00");
		//$("#errmsg").html("Digits Only").show().fadeOut("slow");
	return false;
	}
	
	
	});
	
	});
</script>

<!-- <script type="text/javascript">
$(document).ready(function () {
    $("#maxval").keyup(function () {
		var txtbalance = $('#minval').val();
		var txtdays = $('#maxval').val();
		
		if (txtbalance === "" || txtdays === "") return false;
		
        if ( parseInt(txtbalance) > parseInt(txtdays) ) {
        	setTimeout(function(){
        		 $(this).val('');
                 alert("Max Temp.should be Greater than Min Temp.");
            },2000);
             
        }
    });
});
</script> -->
<script>
function validate() {
	
	document.getElementById("phone4").style.display="none";
	document.getElementById("phone10").style.display="none";
	
	  var invalid=/^[-]?([0-9]*[.])?[0-9]+$/; 
	 var mob=document.getElementById("minval").value.trim();
     // alert(mob);
	  if(!(mob==""))
			{
		   if((!invalid.test(mob)) && (!(mob=="null")))
					{
						document.getElementById("phone4").style.display="";
						return false;
					}	
					 
			}
	  
	  else if(mob="")
		{
			
			document.getElementById("phone10").style.display="";
		    return false;	
		}
	  
	  
	  /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /* /*  */ 
	  document.getElementById("phone6").style.display="none";
	  document.getElementById("phone8").style.display="none";
	  var invalid=/^[-]?([0-9]*[.])?[0-9]+$/; 
	 var mob1=document.getElementById("maxval").value.trim();
      //alert(mob1);
	  if(!(mob1==""))
			{
		   if((!invalid.test(mob1)) && (!(mob1=="null")))
					{
						document.getElementById("phone6").style.display="";
						return false;
					}	
					 
			}
	  else if(mob1="")
		{
			
			document.getElementById("phone8").style.display="";
		    return false;	
		}
	  
	  
	  
	  
	  
	var eID = document.getElementById("sens_val");
	var dayVal = eID.options[eID.selectedIndex].value;
	var daytxt = eID.options[eID.selectedIndex].text;	
	
if (parseFloat(document.getElementById("minval").value.trim()) > parseFloat(document.getElementById("maxval").value.trim())) {
    //alert($("#minval").val());
   // alert($("#maxval").val());
    alert("Max Humidity.should be Greater than Min Humidity.");
    return false;
} 



}
</script>

<!-- <script type="text/javascript">
$(function(){
	  $("#minval, #maxval").on("keyup", function () {
	    var fst=$("#minval").val();
	    var sec=$("#maxval").val();
	   
	    if (Number(sec)<Number(fst)) {
	      alert("Min Temperature should be less than Max Temperature");
	      $(this).val('');
	    return false;
	    }
	  })
	})
</script> -->
<!-- <script type="text/javascript">
$(function() {

    var start = moment().subtract(29, 'days');
    var end = moment();

    function cb(start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    }

    $('#reportrange').daterangepicker({
        startDate: start,
        endDate: end,
        ranges: {
           'Today': [moment(), moment()],
           'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
           'Last 7 Days': [moment().subtract(6, 'days'), moment()],
           'Last 30 Days': [moment().subtract(29, 'days'), moment()],
           'This Month': [moment().startOf('month'), moment().endOf('month')],
           'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
    }, cb);

    cb(start, end);

});
</script> -->

<style type="text/css">.bg 
{background:url("images/images.jpg");}
.chart {opacity : 0.8; 
    -moz-opacity : 0.8; 
    -ms-filter: "alpha(opacity=80)"; /* IE 8 */ 
    filter : alpha(opacity=80); /* IE < 8 */
    }</style>

 

 <%

%>      	
        </head>
        <body>     
           
             <%
             Connection conn=null;
             Class.forName(MM_dbConn_DRIVER);
             conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
             Statement st=conn.createStatement();
             Statement st1=conn.createStatement();
             Statement st2=conn.createStatement();
             Statement st22=conn.createStatement();

             String ftime1="",ftime2="",ttime1="",ttime2="";
             String vehregno="";
             String date5="",date6="";
             String todatedefault="";
             String todatedefaultto="";
             String vehcode4="";
             String fromdate="",enddate="";
             String vehcode=request.getParameter("vehcode");
             
             //System.out.println("vehcode is------->>>"+ vehcode);
             String vehregno1=request.getParameter("vehreg");
             //System.out.println("vehregno1 is------->>>"+ vehregno1);
      		
             final String commaSeparatedVehicleList = session.getAttribute("VehList").toString();
         	//System.out.println("commaSeparatedVehicleList id;;;--->>>"+commaSeparatedVehicleList);
     		String sql1="select * from t_vehicledetails where VehicleCode='"+vehcode+"' limit 1";
     		ResultSet rs=st.executeQuery(sql1);
     		if(rs.next())
     		{
     			vehregno=rs.getString("VehicleRegNumber");
     			
     			
     		}
     		
     		//if(!(null==request.getParameter("data")))
     		//{
     		
     			
     			
     		 String FromTime="";
    		 String ToTime="";
             String FROM="",TO="";
             String Speed="";
             String DateValue="";
             FROM=request.getParameter("from");
			 	TO=request.getParameter("to");
			 	String fromtime1=request.getParameter("ftime1");
			 	String fromtime2=request.getParameter("ftime2");
			 	String totime1=request.getParameter("ttime1");
			 	String totime2=request.getParameter("ttime2");
			 	String Min=request.getParameter("minval");
         		String Max=request.getParameter("maxval");
         		String sensor=request.getParameter("sens_val");
         		
         		
         		
         		%>
         		
         			<input type="hidden" name="sensor1" id="sensor1" value=<%=sensor%>>
         		
         		<%
         		
         		String sensor1=request.getParameter("sensor1");

         		
         		System.out.println("MIN :-"+Min);
         		
         		System.out.println("MAX :-"+Max);
         		
         		System.out.println("SENSOR :-"+sensor);
         		
         		String DateRange=request.getParameter("datetimes");
         		String FromDateRangeNew="" ;
         		String ToDateRangeNew="";
         	String usertypevalue = session.getAttribute("usertypevalue").toString();
         		String FromDateRangeNew1="" ;
         		String ToDateRangeNew1="";
         		String FromDateRange="";
         		String ToDateRange="";
         		
         		String button="";
         		button=request.getParameter("submit");
         	
             %>
             <div id="oo"  style="background-color: #e3e9fd;">

			               <%

			             		if( DateRange==null ) {
			             			
			             			String Data = request.getParameter("data");
			             			String Data1 = request.getParameter("data1");
			             			
			             			//System.out.println("DateRange onload  Get:-"+DateRange);
			             			DateRange=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
			    			 		FROM=TO=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

			    			 		FromDateRange=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
			    			 		ToDateRange=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
			    			 		FromDateRangeNew=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
			    			 		ToDateRangeNew=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
			    			 		
			    			 		FromDateRange=Data;
			             			ToDateRange=Data1;
			             			
			             			FromDateRangeNew = new SimpleDateFormat("yyyy-MM-dd")
			    							.format(new SimpleDateFormat("dd-MMM-yyyy")
			    								.parse(FromDateRange));
			             			ToDateRangeNew = new SimpleDateFormat("yyyy-MM-dd")
			    							.format(new SimpleDateFormat("dd-MMM-yyyy")
			    								.parse(ToDateRange));
			             			
			    			 		
			    			 		FromDateRangeNew=FromDateRangeNew.concat(" 00:00");
			    			 		ToDateRangeNew=ToDateRangeNew.concat(" 23:59");
			    			 		
			    			 		//System.out.println("From DateRange New onload  Get:-"+FromDateRangeNew);
			    			 		//System.out.println("To DateRange New onload  Get:-"+ToDateRangeNew);
			    			 		DateRange=FromDateRange+" To "+ToDateRange;
			    			 		
			    			 		FromDateRangeNew1 = new SimpleDateFormat("dd MMM yyyy HH:mm")
			    							.format(new SimpleDateFormat("yyyy-MM-dd hh:mm")
			    								.parse(FromDateRangeNew));
			    				 	ToDateRangeNew1 = new SimpleDateFormat("dd MMM yyyy HH:mm")
			    							.format(new SimpleDateFormat("yyyy-MM-dd hh:mm")
			    								.parse(ToDateRangeNew));
			    			 		
			    			 	}
			             		
			    			 	else{
			    			 		//System.out.println("In else Date Range:-"+DateRange);
			    			 		String DateRange1=request.getParameter("datetimes");
			    			 		//System.out.println("In else Date Range 1:-"+DateRange1);
			    			 		
			    				 	DateRange=request.getParameter("datetimes");
			    				 	//System.out.println("DateRange on click Get:-"+DateRange);
			    				 	String[] arr=DateRange.split("-");
			    				 	FromDateRange=arr[0];
			    				 	ToDateRange=arr[1];
			    				 	//System.out.println("First Date Before Convert in Array :- "+FromDateRange);
			    				 	//System.out.println("Second Date Before Convert in Array :- "+ToDateRange);
			    				 	
			    				 	FromDateRangeNew = new SimpleDateFormat("yyyy-MM-dd HH:mm")
			    							.format(new SimpleDateFormat("dd MMM yyyy hh:mm")
			    								.parse(FromDateRange));
			    				 	ToDateRangeNew = new SimpleDateFormat("yyyy-MM-dd HH:mm")
			    							.format(new SimpleDateFormat("dd MMM yyyy hh:mm")
			    								.parse(ToDateRange));

			    				 	//System.out.println("From DateRange After Get:-"+FromDateRangeNew);
			    	         		//System.out.println("To DateRange After Get:-"+ToDateRangeNew);
			    	         		
			    	         		FromDateRangeNew1 = new SimpleDateFormat("dd MMM yyyy HH:mm")
			    							.format(new SimpleDateFormat("yyyy-MM-dd hh:mm")
			    								.parse(FromDateRangeNew));
			    				 	ToDateRangeNew1 = new SimpleDateFormat("dd MMM yyyy HH:mm")
			    							.format(new SimpleDateFormat("yyyy-MM-dd hh:mm")
			    								.parse(ToDateRangeNew));
			    	         		
			    	         		%>
			    					<%-- <script type="text/javascript">	
			    					document.getElementById("daterange").value = '<% out.print(DateRange); %>';					
			    					</script> --%>
			    				 
			    				 	<%
			    			 	}

			            String Space="";     
			            String TempDateTime="";
			            String SensorTemp ="";
			            String SensorTemp2 ="";
			            String SensorTemp3 ="";
			            String SensorTemp4 ="";
			            String SensorTemp6 ="";

			            String GraphValues="";
			            //System.out.println("else"+Min+"  "+Max);

			            
			            if(Min==null || Max==null || Min=="" || Max=="" || Min=="null" || Max=="null" || Min.equals("null") || Max.equals("null")){
			            	
			            	
			            	String trans = "";
			            	String Minhum="",Maxhum="";
			            	trans = session.getValue("usertypevalue").toString();

			            	String ssql = "select * from t_defaultvals where OwnerName='" + trans + "'";
			            	
			            	ResultSet rst = st22.executeQuery(ssql);
			    			if (rst.next()) {
			    				Min = rst.getString("MinHumidity");
			    				Max = rst.getString("MaxHumidity");
			    			}
			    	
			                   	System.out.println("Min Val :-"+Min);
				            	System.out.println("Max Val :-"+Max);
				            
				           
			            }
			            else{
			            	
			            	

			            	Min=request.getParameter("minval");
			            	Max=request.getParameter("maxval");
				            //System.out.println("else"+Min+"  "+Max);

			            	
			            	
			            	%>
			            <script type="text/javascript">	
			             	document.getElementById("minval").value = '<% out.print(Min); %>';
			             	document.getElementById("maxval").value = '<% out.print(Max); %>';
			             	
			             	</script>
			            	<% 
			            }
			          /*   //System.out.println("Min Value :- "+Min);
			            //System.out.println("Max Value :- "+Max); */
			            
			        	
	            		
						String Tempsql="";
			            if(sensor.equals("Sensor1"))
			            {
			             Tempsql="select Sen1 as Sen6,TheFieldDataDateTime,Speed from db_gps.t_veh"+vehcode+" where TheFieldDataDateTime >='"+FromDateRangeNew+"' and TheFieldDataDateTime <='"+ToDateRangeNew+"'  and Sen1!='-' and  TheFiledTextFileName in ('SI','OF','ON','ST','SP') order by TheFieldDataDateTime asc";
			            }
			            else if(sensor.equals("Sensor6"))
			            {
			            	 Tempsql="select Sen6,TheFieldDataDateTime,Speed from db_gps.t_veh"+vehcode+" where TheFieldDataDateTime >='"+FromDateRangeNew+"' and TheFieldDataDateTime <='"+ToDateRangeNew+"' and Sen6!=' NAN' and Sen6!='NAN' and Sen6!='-' and  TheFiledTextFileName in ('SI','OF','ON','ST','SP') order by TheFieldDataDateTime asc";	
			            }
			            else if(sensor.equals("Sensor7"))
			            {
			            	 Tempsql="select Sen7 as Sen6,TheFieldDataDateTime,Speed from db_gps.t_veh"+vehcode+" where TheFieldDataDateTime >='"+FromDateRangeNew+"' and TheFieldDataDateTime <='"+ToDateRangeNew+"' and Sen7!=' NAN' and Sen7!='NAN' and Sen7!='-' and  TheFiledTextFileName in ('SI','OF','ON','ST','SP') order by TheFieldDataDateTime asc";	
			            }
			            else if(sensor.equals("Sensor8"))
			            {
			            	 Tempsql="select Sen8 as Sen6,TheFieldDataDateTime,Speed from db_gps.t_veh"+vehcode+" where TheFieldDataDateTime >='"+FromDateRangeNew+"' and TheFieldDataDateTime <='"+ToDateRangeNew+"' and Sen8!=' NAN' and Sen8!='NAN' and Sen8!='-' and  TheFiledTextFileName in ('SI','OF','ON','ST','SP') order by TheFieldDataDateTime asc";	
			            }
			            else if(sensor.equals("Sensor9"))
			            {
			            	 Tempsql="select Sen9 as Sen6,TheFieldDataDateTime,Speed from db_gps.t_veh"+vehcode+" where TheFieldDataDateTime >='"+FromDateRangeNew+"' and TheFieldDataDateTime <='"+ToDateRangeNew+"' and Sen9!=' NAN' and Sen9!='NAN' and Sen9!='-' and  TheFiledTextFileName in ('SI','OF','ON','ST','SP') order by TheFieldDataDateTime asc";	
			            }
			            else if(sensor.equals("Sensor2"))
			            {
			            	 Tempsql="select Sen2 as Sen6,TheFieldDataDateTime,Speed from db_gps.t_veh"+vehcode+" where TheFieldDataDateTime >='"+FromDateRangeNew+"' and TheFieldDataDateTime <='"+ToDateRangeNew+"' and Sen2!=' NAN' and Sen2!='NAN' and Sen2!='-' and  TheFiledTextFileName in ('SI','OF','ON','ST','SP') order by TheFieldDataDateTime asc";	
			            }
			            else if(sensor.equals("Sensor3"))
			            {
			            	 Tempsql="select Sen3 as Sen6,TheFieldDataDateTime,Speed from db_gps.t_veh"+vehcode+" where TheFieldDataDateTime >='"+FromDateRangeNew+"' and TheFieldDataDateTime <='"+ToDateRangeNew+"' and Sen3!=' NAN' and Sen3!='NAN' and Sen3!='-' and  TheFiledTextFileName in ('SI','OF','ON','ST','SP') order by TheFieldDataDateTime asc";	
			            }
			            else if(sensor.equals("Sensor4"))
			            {
			            	 Tempsql="select Sen4 as Sen6,TheFieldDataDateTime,Speed from db_gps.t_veh"+vehcode+" where TheFieldDataDateTime >='"+FromDateRangeNew+"' and TheFieldDataDateTime <='"+ToDateRangeNew+"' and Sen4!=' NAN' and Sen4!='NAN' and Sen4!='-' and  TheFiledTextFileName in ('SI','OF','ON','ST','SP') order by TheFieldDataDateTime asc";	
			            }
			            
			            System.out.println("Main Query :- "+Tempsql);
			            ResultSet rst1=st.executeQuery(Tempsql);
			            
			            if (rst1.next() == false) {
			                System.out.println("No Data ");
			                %>
			            <script type="text/javascript">
			            $(document).ready(function () {
			                $("#no_data").show();
			               
			                $("#save-pdf").hide();
			          });
			            </script>
			                <%
			                
			              } else {
			            
			            while(rst1.next())
			            {
			            	TempDateTime=rst1.getString("TheFieldDataDateTime");
			            	Speed=rst1.getString("Speed");
				         //  //System.out.println("TempDateTime :- "+TempDateTime);

			            	 String TempDtNew = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
			         				.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
			         						.parse(TempDateTime));
			            	 String TempDtNew1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss ")
			            		        .format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
			            		                .parse(TempDtNew));

			            	 
			            
			            	SensorTemp6=rst1.getString("Sen6");

			 
					         //  //System.out.println("SensorTemp6 :- "+SensorTemp6);

			            
			     
		            	  GraphValues+="['"+TempDtNew1+"',   "+SensorTemp6+","+Min+","+Max+"],";
				          //System.out.println("GraphValues :- "+GraphValues);

		            
			            	
			           
			       
			            	//GraphValues+="['"+TempDateTime+"',   "+SensorTemp+"],";
			            	
			            	/*  //System.out.println("Date Time :- "+TempDtNew1);
			            	 //System.out.println("Sensor 1 Value :- "+SensorTemp);
			            	 //System.out.println("Sensor 2 Value :- "+SensorTemp2);
			            	 //System.out.println("Sensor 3 Value :- "+SensorTemp3);
			            	 //System.out.println("Min Value :- "+Min);
			            	 //System.out.println("Max Value :- "+Max); */
			            	
			            }
			              }
			            %>
			 
			  <script type="text/javascript">
			 
			  google.charts.load('current', {'packages':['corechart']});
			  google.charts.setOnLoadCallback(drawChart);
				
			  function drawChart() {

				  /* var vehregno2=document.getElementById('vehreg').value;
					 alert(vehregno2); */
						 var data = google.visualization.arrayToDataTable([
			         	 ['DateTime', 'Sensor','Min','Max'],
			    		 <%=GraphValues%>
			          		]);
						 
						 if (data.getNumberOfRows() == 0) {
						      data.addRows([
						        ['', 0, null,null, 'No Data Copy']
						      ]);
						    }
						 
						   
			   var options = {
					   
					   
			          title: ' Sensor  Graph - <%=vehregno%>   From <%=DateRange %>',  
					   
						   
					 titleTextStyle: {
			        			      fontSize: 15,
			        			      alignment: 'center'
			        			    }, 
			        	hAxis: {
			        	          title: 'Time'
			        	        },
			        	vAxis: {
			        	          title: 'Sensor'
			        	        },
			        	chartArea: {
			        	            bottom: 45,
			        	            left: 55,
			        	            right: 5,
			        	            top: 48, 
			        	            width: '100%',
			        	            height: '100%'
			        	          },   
			        	         
			        
			        curveType: 'function', 
			        series: {
			            1: { lineDashStyle: [8, 1] , type: 'line' },
			            2: { lineDashStyle: [8, 1] , type: 'line' },
			          },
			          lineWidth: 1,
			          legend: {position: 'bottom'},
			          colors:['#66c2ff','#4d79ff','Red'],

			          annotations: {
			              // remove annotation stem and push to middle of chart
			              stem: {
			                color: 'Red',
			                length: 120
			              },
			              textStyle: {
			                color: '#9E9E9E',
			                fontSize: 18
			              }
			            },
			          
			        };

			  
			  
			    	  var formatter = new google.visualization.DateFormat({pattern: "dd.MM.yyyy"});
			      	  formatter.format(data, 0);
					  var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));

					  var btnSave = document.getElementById('save-pdf');  
					  google.visualization.events.addListener(chart, 'ready', function () {
					    btnSave.disabled = false;
					  });

					  btnSave.addEventListener('click', function () {
					    var doc = new jsPDF('l', 'mm', [297, 210]);
					    doc.addImage(chart.getImageURI(), 0, 0);
					    doc.save('Sensor.pdf');
					  }, false);
			        
					      
			        chart.draw(data, options);
			        
			        $("text:contains(" + Options.title + ")").attr({'x':'60', 'y':'20'})
			      }
			    </script>  

			                    
			                    
			                            <table style="width: auto;height: 30%" >
									<tr id="title_name" style="width: auto;height: 30%" align="center">
									<td><center> <font face="san-serif" color="#0B2161" size="3" ><b>Sensor Graph</b></font></center></td>
									</tr>
									<tr></tr>
                                     <tr style="height: 30px;">
                                     
                                         <td>    
                                             <form name="temp" id="temp" method="get" >
                                              <div align="center" >
                                             Vehicle Reg No 
                                             <select id="vehcode" name="vehcode" style="text-align: center; color: gray; font-size: 12px;" >
 					<% String sqlDropdown="Select  VehicleCode,VehicleRegNumber from t_vehicledetails where VehicleCode IN "+commaSeparatedVehicleList+" order by VehicleRegNumber";
				  ResultSet rsDropdown=st2.executeQuery(sqlDropdown);
				  
				 //System.out.println("dropdown query of VehicleRegNumber is" + sqlDropdown);
				  while(rsDropdown.next()){
			      vehcode4=rsDropdown.getString("VehicleCode");
				  if(!vehcode4.equals(vehcode))
				  {
				  %>
				  <option value="<%=vehcode4%>"><%=rsDropdown.getString("VehicleRegNumber")%></option>
				  <%////System.out.println("VehicleCode is**************************" + vehcode4); %>
							
						<%
				  }	
				  else
				  {
					  %>
					  <option value="<%=vehcode4%>" selected><%=rsDropdown.getString("VehicleRegNumber")%></option>
					  <%//System.out.println("VehicleCode is" + vehcode4); %>
								
							<%
				  }
				  }%>
						
						</select>
										&nbsp;&nbsp;
										
                                              
                                              Date&nbsp;&nbsp; 

	<input type="text" id="daterange" name="datetimes" autocomplete="false" style="text-align: center; color: gray; width: 220px; font-size: 12px;"/>									  

	&nbsp;&nbsp; <label for="to" style="height: 30px; width: 50px;">Min</label>&nbsp;&nbsp;<input type="text" class="minval" id="minval" name="minval" value="<%=Min %>"  style="text-align: center; color: gray; width: 40px; font-size: 12px;"> 
	
<label id="phone4"  style="display: none;"><font face="Arial" size="2" color="red">Enter only Temperature Format Ex. 12 or 12.5 or -20.10&nbsp;</font></label>
<label id="phone10"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Temperature Ex. 12 or 12.5 or -20.10&nbsp;</font></label>

                                          &nbsp;&nbsp;  <label for="to" style="height: 30px; width: 50px;">Max</label> &nbsp;&nbsp;<input type="text" id="maxval" name="maxval"  value="<%=Max %>" style="text-align: center; color: gray; width: 40px; font-size: 12px;"> 
                                          
<label id="phone6"  style="display: none;"><font face="Arial" size="2" color="red">Enter only Temperature Format Ex. 12 or 12.5 or -20.10&nbsp;</font></label>
<label id="phone8"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Temperature Ex. 12 or 12.5 or -20.10&nbsp;</font></label>

                                         &nbsp;&nbsp;
                                      
                                          <input type="submit" name="submit" id="submit" value="Submit" onclick="return validate();"  style="text-align: center; color: gray; font-size: 12px;">
								            </div>
                                        
                                      </form>
                              
            
                                         </td>
                                      </tr>
                                      
                                     
                                      
                                      <tr>
                                     
                                         <td align="left"  id="exp_css" >
                                       
                                 <font size="2px;"> <a id="detail_rep_url" href="humiditydetailreport.jsp?vehcode=<%=vehcode %>"  style="width: 10px;"> <u> Detail Report </u> </a>
								</font>
                                         </td>
                                         <td align="right" id="exp_css">
                                     <font size="2px;">    
                                  <a href="#" id="save-pdf" style="width: 10px;"> <u> Export </u> </a>
									</font>
                                
                                         </td>
                                         
                                      </tr>
                                        <tr align="center"> <td style="height: 100%;width: 100%; align:center">
                                     <div id="no_data"  style="display:none;" class="form" > 
                                     <img alt="" src="images/NO_DATA.jpeg" style="height: 50%;width: 50%; align:center">
                                     </div>
                                      </td></tr>
                                         <tr align="center"> 
                                        
                                         
                                                 <td style="height: 100%;width: 100%; align:center">
                               
 									 <div  id="chart_div" align="center" style='width:1200px; height: 500px;' >
 									 
 									 
									</div> 
 									</td>
                                                 
                                            </tr>
                                            <tr>
                                               <td align="center"><b><font color="BROWN" size="2" face="Arial"></font></b>
             <br> 
                            
                                                    
 		 	                                  </td>
 		 	                                </tr>
<!-- <a href="whatever.htm" onClick="window.print();return false"><img src="print.gif"></a>  -->
<!-- <a href="#" style="font-weight: bold; color: black;" onclick="gotoPrint('chartdiv');"></a> -->

			               </table>  
			            </div>
                    </body>
<!--   <script>
$(function() {
  $('input[name="datetimes"]').daterangepicker({
    timePicker: true,
    timePicker24Hour: true,
    autoUpdateInput: true,
  locale: {
    	  format: 'DD MMM YYYY HH:mm '
    }
  });
});

</script> -->


<script type="text/javascript">

$('#daterange').daterangepicker({ 
	timePicker: true,
    timePicker24Hour: true,
	startDate: moment().startOf('day').startOf('time'),
	endDate: moment().endOf('day'), 
	
	    locale: {
	    	  format: 'DD MMM YYYY HH:mm'
	    }
	});

$('#daterange').data('daterangepicker').setStartDate('<%=FromDateRangeNew1%>');
$('#daterange').data('daterangepicker').setEndDate('<%=ToDateRangeNew1%>');

</script> 
 <script type="text/javascript">
/*  $('#sens_val').val($('#sens_val').text()); */
</script>


               </html>
<%@ include file="footernew.jsp" %>
