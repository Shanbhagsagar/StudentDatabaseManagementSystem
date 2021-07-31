<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/stangelos";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
    String btid = request.getParameter("btid");
    String btsub = request.getParameter("btsub");
    String btfal = request.getParameter("btfal");
    String btstart = request.getParameter("btstart");
    String btend = request.getParameter("btend");
    String btlec = request.getParameter("btlec");

    if (btid != null) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, psw);
            String sql = "Update batch_details set btid=?,btsub=?,btfal=?,btstart=?,btend=? ,btlec=? where btid=" + btid;
            ps = con.prepareStatement(sql);
            ps.setString(1, btid);
            ps.setString(2, btsub);
            ps.setString(3, btfal);
            ps.setString(4, btstart);
            ps.setString(5, btend);
            ps.setString(6, btlec);
            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("<script>");
                out.println("alert('Record updated successfully.');");
                out.println("</script>");
               
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchsearch.jsp'/></html>");
          
            } else {
                out.print("There is a problem in updating Record.");
            }
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>