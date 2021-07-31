<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/stangelos";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
        String stid = request.getParameter("stid");
        String stpass = request.getParameter("stpass");
        String stname = request.getParameter("stname");
        String stphone = request.getParameter("stphone");
        String stemail = request.getParameter("stemail");
        String stadmission = request.getParameter("stadmission");
        String stcourse = request.getParameter("stcourse");
        String stgender = request.getParameter("stgender");
        String stbirth = request.getParameter("stbirth");
        String stnational = request.getParameter("stnational");
        String stmobile = request.getParameter("stmobile");
        String stadd = request.getParameter("stadd");
        String stcity = request.getParameter("stcity");
        String ststate = request.getParameter("ststate");
        String stcountry = request.getParameter("stcountry");
    if (stid != null) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, psw);
            String sql = "Update student_details set stid=?,stname=?,stphone=?,stemail=? ,stadmission=?,stcourse=?, stpass=?,stgender=?,stbirth=?,stnational=?,stmobile=?,stadd=?,stcity=?,ststate=?,stcountry=? where stid=" + stid;
            pstmt = con.prepareStatement(sql);
             pstmt.setString(1, stid);
            pstmt.setString(2, stname);
            pstmt.setString(3, stphone);
            pstmt.setString(4, stemail);
            pstmt.setString(5, stadmission);
            pstmt.setString(6, stcourse);
            pstmt.setString(7, stpass);
            pstmt.setString(8, stgender);
            pstmt.setString(9 ,stbirth);
            pstmt.setString(10, stnational);
            pstmt.setString(11, stmobile);
            pstmt.setString(12, stadd);
            pstmt.setString(13, stcity);
            pstmt.setString(14, ststate);
            pstmt.setString(15, stcountry);
            
            int i =  pstmt.executeUpdate();
            if (i > 0) {
                out.println("<script>");
                out.println("alert('Record updated successfully.');");
                out.println("</script>");
               
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/search.jsp'/></html>");
          
            } else {
                out.print("There is a problem in updating Record.");
            }
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>