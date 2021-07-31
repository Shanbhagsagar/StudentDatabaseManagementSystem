<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String adid = request.getParameter("adminid");
    session.setAttribute("adid", adid);
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stangelos", "root", "");
    Statement st = con.createStatement();
     System.out.println("adid");
    ResultSet rs = st.executeQuery("select * from admin where adid="+ session.getAttribute("adid") +" and adpass='" + password + "'");
   try{
      
     int idlen = 0;
     int passlen = 0;
     if(rs.next()){
         idlen = rs.getString("adid").length();
         passlen = rs.getString("adpass").length();
     }
    
if(idlen > 0 && passlen > 0) 
{ 
    response.sendRedirect("details.jsp");    
} 
if((idlen == 0) && (passlen == 0)){
    out.println("<script>");
    out.println("alert('Please enter valid userid and password');");
    out.println("</script>");
    out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/adminlogin.jsp'/></html>");
}
} catch (Exception e) {
        e.printStackTrace();
    }
%>

