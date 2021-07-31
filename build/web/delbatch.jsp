<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String btid = request.getParameter("btid");
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
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
           String sql2 ="DELETE FROM attendance WHERE btid="+btid;
        //first delete from student_batch_details and then delete from batch details
        pstmt2 = connection.prepareStatement(sql2);
        int count2= pstmt2.executeUpdate();
        String sql = "DELETE from student_batch_details  where btid="+btid;
        //first delete from student_batch_details and then delete from batch details
        pstmt = connection.prepareStatement(sql);
         int count = pstmt.executeUpdate();
        String sql1 ="DELETE FROM batch_details WHERE btid="+btid;
        //first delete from student_batch_details and then delete from batch details
        pstmt1 = connection.prepareStatement(sql1);
        int count1= pstmt1.executeUpdate();
      
        
        if (count > 0) {
            out.println("<script>");
            out.println("alert('Student records deleted successfully');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        } else {
            out.println("<script>");
            out.println("alert('Student:Record deletion failed');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        }
         if (count1 > 0) {
            out.println("<script>");
            out.println("alert('Batch record deleted successfully');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        } else {
            out.println("<script>");
            out.println("alert('Batch:Record deletion failed');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        }
         if (count2 > 0) {
            out.println("<script>");
            out.println("alert('Attendance record deleted successfully');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        } else {
            out.println("<script>");
            out.println("alert('Attendance:Record deletion failed');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        }
        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
