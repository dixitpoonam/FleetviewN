<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="Connections/conn.jsp" %>

<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="moreservlets.listeners.*" errorPage="" %>

   
<%
try{
Class.forName(MM_dbConn_DRIVER); 
Connection conn1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD); 
Statement st=conn1.createStatement();
String html="";
String SubCategory="";

String Category=request.getParameter("Category");
System.out.println("Category :"+Category);
String demo="Select";

String sql="select distinct(SubCategory) from db_gps.t_ComplaintCategory where Category='"+Category+"' order by SubCategory";


ResultSet rs= st.executeQuery(sql);
String ContactPerson="";
System.out.println("sql :- "+sql);
while(rs.next())
{ 
	 SubCategory=rs.getString("SubCategory");
	System.out.println("SubCategory:: "+SubCategory);

html+="<option>"+SubCategory+"</option>";


}


String html1="";

String FinalString=html;
st=conn1.createStatement();
rs= st.executeQuery(sql);
String ContactPerson1="";
System.out.println("sql :- "+sql);
if(!rs.next()){
	
	html1="<option value='Select' selected='selected'>Select</option>";
	out.println(html1+FinalString);

	System.out.println("innnnnnnnnnnnnnnn");

}
else{
System.out.println("elsssssssss");

	html1="<option value='Select' selected='selected'>Select</option>";
	out.println(html1+FinalString);

}








conn1.close();
}
catch(Exception e){e.printStackTrace();}


%>