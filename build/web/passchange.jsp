<%@page import="java.sql.*"%>
<%

    String stid = request.getParameter("stid");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "stangelos";
    String userid = "root";
    String password = "";
    String stpass = request.getParameter("pass2");
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    PreparedStatement pstmt = null;
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);

        String sql = "update student_details set stpass='" + stpass + "' where stid=" + stid;
        pstmt = connection.prepareStatement(sql);
        int count = pstmt.executeUpdate();
        if (count > 0) {
            out.println("<script>");
            out.println("alert('Password changed successfully');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/changepass.jsp'/></html>");
        } else {
            out.println("<script>");
            out.println("alert('Password change failed, try again');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/changepass.jsp'/></html>");
        }

        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Pass</title>
    </head>
    <body>
    </body>
</html>
