<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="Connections/conn.jsp" %>

<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="moreservlets.listeners.*" errorPage="" %>

   
<%
try{
Class.forName(MM_dbConn_DRIVER); 
Connection conn1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD); 
Statement st=conn1.createStatement();
String tripid=request.getParameter("tripid");
String own="",dir="";
if(tripid==""||tripid==null)
{
	
}
else
{
String username=(String)session.getAttribute("usertypevalue");
String sqlduptripidno="select * from t_startedjourney where TripId='"+tripid+"' ";;
System.out.println("***    "+sqlduptripidno);
ResultSet rsck = st.executeQuery(sqlduptripidno);
if(rsck.next())
{
	
     out.println("Trip Id Already Exist Please Enter Another Tripid");
     

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