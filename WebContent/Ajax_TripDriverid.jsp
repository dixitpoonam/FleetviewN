<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="Connections/conn.jsp" %>

<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="moreservlets.listeners.*" errorPage="" %>

   
<%
try{
Class.forName(MM_dbConn_DRIVER); 
Connection conn1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD); 
Statement st=conn1.createStatement();
String driverid=request.getParameter("driverid");
String own="",dir="";
if(driverid==""||driverid==null)
{
	
}
else
{
String username=(String)session.getAttribute("usertypevalue");
String sqldrividno="select * from t_drivers where DriverID='"+driverid+"' and Owner='"+username+"'";
System.out.println("***    "+sqldrividno);
ResultSet rsck = st.executeQuery(sqldrividno);
if(rsck.next())
{
	
     out.println("Driver Id Already Exist Please Enter Another Driverid");
     

 }
else
{
out.println("");
}

}
conn1.close();
}
catch(Exception e){e.printStackTrace();}


%>