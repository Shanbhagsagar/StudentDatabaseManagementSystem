<%@page import="java.sql.*"%>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String url = "jdbc:mysql://localhost:3306/stangelos";
    String stid = request.getParameter("stid");
    String atdate = request.getParameter("atdate");
    String atin = request.getParameter("atin");
    String atout = request.getParameter("atout");
    String btid = request.getParameter("btid");
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, "root", "");
        pstmt = conn.prepareStatement("insert into attendance(stid, atdate,atin,atout,btid)" + "values(?,?,?,?,?)");
        pstmt.setString(1, stid);
        pstmt.setString(2, atdate);
        pstmt.setString(3, atin);
        pstmt.setString(4, atout);
        pstmt.setString(5, btid);
        int count = pstmt.executeUpdate();
        if (count > 0) {
            out.println("<script>");
            out.println("alert('Attendance updated successfully');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='0;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        } else {
            out.println("<script>");
            out.println("alert('Record creation failed');");
            out.println("</script>");
            out.println("<html><meta http-equiv='refresh' content='0;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
        }
        conn.close();
    } 
catch(Exception ex){
   out.println(ex);
}


%> 