<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String stid = request.getParameter("stid");
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
    Connection conn = null;
    PreparedStatement pstmt = null;
     PreparedStatement pstmt1 = null;
    ResultSet rs = null;
%>
<%
    try {
        conn = DriverManager.getConnection(connectionUrl + database, userid, password);
        String sql1 ="DELETE FROM attendance WHERE btid="+btid+" and  stid="+stid;
         pstmt1 = conn.prepareStatement(sql1);
        int count1= pstmt1.executeUpdate(); 
        pstmt = conn.prepareStatement("DELETE FROM student_batch_details WHERE btid="+btid+" and  stid="+stid);
        int count = pstmt.executeUpdate();
        if (count > 0) {
            out.println("<script>");
            out.println("alert('Student deleted  from batch successfully');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        } else {
            out.println("<script>");
            out.println("alert('Student deletion  from batch  failed');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        }
         if (count1 > 0) {
            out.println("<script>");
            out.println("alert('Student attendance deleted successfully');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        } else {
            out.println("<script>");
            out.println("alert('Student attendance deletion failed');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        }
    } finally {
        try {
            if (rs != null) {
                rs.close();
                rs = null;
            }
            if (pstmt != null) {
                pstmt.close();
                pstmt = null;
            }
            if (conn != null) {
                conn.close();
                conn = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
