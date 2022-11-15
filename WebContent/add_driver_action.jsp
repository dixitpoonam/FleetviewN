<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  String d_id="";
  String d_name="";

  d_id=request.getParameter("d_id");
   System.out.println("Driver ID"+d_id);
   
  d_name=request.getParameter("d_name");
  System.out.println("Driver Name"+d_name);

%>
</body>
</html>