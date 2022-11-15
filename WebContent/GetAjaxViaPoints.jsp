<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" import="moreservlets.listeners.*" errorPage="" %>
<%!
/*
String MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
String MM_dbConn_USERNAME="fleetview";
String MM_dbConn_PASSWORD="1@flv";
String MM_dbConn_STRING="jdbc:mysql://173.234.153.82/db_gps";
String MM_dbConn_STRING1="jdbc:mysql://173.234.153.82/db_gpsExceptions";
String MM_dbConn_STRING3="jdbc:mysql://173.234.153.82/db_CustomerComplaints";
String SiteRoot="http://173.234.153.82:8080/AVL/";
*/

String MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
String MM_dbConn_USERNAME="fleetview";
String MM_dbConn_PASSWORD="1@flv";
String MM_dbConn_STRING="jdbc:mysql://173.234.153.82/db_gps";
String MM_dbConn_STRING1="jdbc:mysql://173.234.153.82/db_gpsExceptions";
String MM_dbConn_STRING3="jdbc:mysql://173.234.153.82/db_CustomerComplaints";
String SiteRoot="http://173.234.153.82:8080/AVL/";

%><%
Connection conn;
Statement st,st1;
%>
<%

Class.forName(MM_dbConn_DRIVER); 

conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
Statement stquery=conn.createStatement();


ResultSet rs1=null;
String sql1="";
int counter=0,count=0,flg=1;
boolean flag=false;

String originalcompany=request.getParameter("company");
System.out.println(" originalcompany ******       "+originalcompany);

String company = request.getParameter("company").replaceAll(" ","");
System.out.println(" company ******       "+company);

String user = session.getValue("usertypevalue").toString();
	System.out.println("ooh"+user);

company=company.replace(".","");
company=company.replace(" ","");
company=company.replace("-","");
company=company.replace("_","");
  sql1="select * from  db_gps.t_warehousedata where Replace(Replace(Replace(Replace(Replace(Replace( Replace( Replace( WareHouse,'.', '') ,' ','') ,'-',''),',',''),'?',''),'_',''),'(',''),')','') like ('%"+company+"%') and (Owner='"+user+"' or Transporter='"+user+"') order by WareHouse limit 20 ";
  //out.print(sql1);
 System.out.println("INSupplier  INSupplier ******       "+sql1);
  rs1=st1.executeQuery(sql1);
 String buffer="<div style='height:140px;width:320px;overflow:auto;position:absolute;border-style=none;margin-left:140px; margin-top:10px;'><table style='background-color:#94ECF6; width:400px; display: block; border-style=1px;';>";
 int i=1;
/*if(request.getParameter("getCompanyName")==null)
 while(rs1.next())
   {
     flag=true;
     buffer+="<tr><td><a href='#' onClick='showVisitingCardDetails(\""+rs1.getString("CustomerCode")+"\");'  style='color: black;'>"+rs1.getString("CompanyName").replaceAll("(?i)"+company,"<font color=blue><u>"+company.toUpperCase()+"</u></font>")+".</a></tr></td>";
        i++;
   } 
else */

if (!rs1.next()) {
    System.out.println("No records found");
    buffer +="<tr><td align='left'><h4><a href='#' >No Records found</a></h4></td></tr>";
    rs1.beforeFirst();
} else {

	 //while(rs1.next())
	   do{
	      flag=true;
	      
	    // buffer+="<tr><td><a href='#' onClick='showSelectedSuppliers(\""+rs1.getString("SupplierCode")+"\",\""+rs1.getString("SupplierName")+"\");'  style='color: black;'>"+rs1.getString("SupplierName").replaceAll("(?i)"+company,"<font color=blue><u>"+company.toUpperCase()+"</u></font>")+".</a></tr></td>";
	      
	     buffer+="<tr><td><a href='#' onClick='addRowForSupplier(\""+rs1.getString("WareHouseCode")+"\",\"listTable\",\""+rs1.getString("WareHouse")+"\");'  style='color: black;'>"+rs1.getString("WareHouse").replaceAll("(?i)"+company,"<font color=blue><u>"+company.toUpperCase()+"</u></font>")+".</a></tr></td>";
	    // System.out.println("buffer::"+buffer);

	     
	     i++;
	   }while(rs1.next()); 
}//end of else

   buffer+="</table></div>";
out.println(buffer);



%>
