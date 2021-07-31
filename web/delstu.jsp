    <%@page import="java.util.logging.Level"%>
    <%@page import="java.util.logging.Logger"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.io.PrintWriter"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
        String stid = request.getParameter("stid");
        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String database = "stangelos";
        String userid = "root";
        String password = "";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection connection = null;
        PreparedStatement pstmt = null;
        try {
            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
            String sql = "DELETE FROM student_details WHERE stid =" + stid;
            pstmt = connection.prepareStatement(sql);
            int count = pstmt.executeUpdate();
            if (count > 0) {
                out.println("<script>");
                out.println("alert('Record deleted successfully');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/search.jsp'/></html>");
            } else {
                out.println("<script>");
                out.println("alert('Record deletion failed');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/search.jsp'/></html>");
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    
