<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String adid=request.getParameter("adid");
session.setAttribute("forgetid",adid); 
String ademail=request.getParameter("ademail"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stangelos","root","");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from admin where adid="+session.getAttribute("forgetid")); 

try{
rs.next();
 
if(rs.getString("adid").equals(session.getAttribute("forgetid")) && rs.getString("ademail").equals(ademail)) 
{ 
response.sendRedirect("adreset.jsp");    
} 
else{
out.println("<script>");
out.println("alert('Please enter valid userid and email');");
out.println("</script>");
out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/adforget.jsp'/></html>");
}

}
catch (Exception e) {
e.printStackTrace();
}
%>



