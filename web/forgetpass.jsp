<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String stid=request.getParameter("stid");
session.setAttribute("forgetid",stid); 
String stemail=request.getParameter("stemail"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stangelos","root","");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from student_details where stid="+session.getAttribute("forgetid")); 

try{
rs.next();
 
if(rs.getString("stid").equals(session.getAttribute("forgetid")) && rs.getString("stemail").equals(stemail)) 
{ 
response.sendRedirect("reset.jsp");    
} 
else{
out.println("<script>");
out.println("alert('Please enter valid userid and email');");
out.println("</script>");
out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/forget.jsp'/></html>");
}

}
catch (Exception e) {
e.printStackTrace();
}
%>



