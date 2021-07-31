<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("userid"); 
session.setAttribute("userid",userid); 
String password=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stangelos","root","");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from student_details where stid='"+userid+"' and stpass='"+password+"'"); 
try{
 int idlen = 0;
     int passlen = 0;
     if(rs.next()){
         idlen = rs.getString("stid").length();
         passlen = rs.getString("stpass").length();
     }
    
if(idlen > 0 && passlen > 0) 
{ 
    response.sendRedirect("student_details.jsp");    
} 
if((idlen == 0) && (passlen == 0)){
    out.println("<script>");
    out.println("alert('Please enter valid userid and password');");
    out.println("</script>");
    out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/login.jsp'/></html>");
}
}
catch (Exception e) {
e.printStackTrace();
}
%>
