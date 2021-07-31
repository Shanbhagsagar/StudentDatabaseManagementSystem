<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
PreparedStatement ps = null; 
String pass2=request.getParameter("pass2");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stangelos","root","");

String sql="update student_details set stpass=? where stid="+session.getAttribute("forgetid"); 
ps = con.prepareStatement(sql);
ps.setString(1,pass2);

try{
int count = ps.executeUpdate();
if(count>0)
{ 
out.println("<script>");
out.println("alert('Password updated successfully');");
out.println("</script>");    
session.invalidate();
out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/login.jsp'/></html>");
} 
else{
out.println("<script>");
out.println("alert('Password updation failed');");
out.println("</script>");
out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/reset.jsp'/></html>");
}   
}
catch (Exception e) {
e.printStackTrace();
}
%>

