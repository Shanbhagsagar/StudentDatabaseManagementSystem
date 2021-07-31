<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String btid = request.getParameter("btid");
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
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
%>
<%
    try {
        conn = DriverManager.getConnection(connectionUrl + database, userid, password);
        pstmt = conn.prepareStatement("insert into student_batch_details(stid, btid) " + "values(?,?)");
        pstmt.setString(1, stid);
        pstmt.setString(2, btid);

        int count = pstmt.executeUpdate();
        
        if (count > 0) {
            out.println("<script>");
            out.println("alert('Record created successfully');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        } else {
            out.println("<script>");
            out.println("alert('Record creation failed');");
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
