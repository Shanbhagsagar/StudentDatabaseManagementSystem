
import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/batch_detail")

public class batch_detail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String url = "jdbc:mysql://localhost:3306/stangelos";
        String btid = request.getParameter("btid");
        String btsub = request.getParameter("btsub");
        String btfal = request.getParameter("btfal");
        String btstart = request.getParameter("btstart");
        String btend = request.getParameter("btend");
        String btlec = request.getParameter("btlec");

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, "root", "");
             String sql="select max(btid) as maxid from batch_details";
           pstmt =conn.prepareStatement(sql);
             rs = pstmt.executeQuery(sql);
          
            if(rs.next() == false || rs.getInt("maxid") == 0){
                int n1= 1;
                btid=Integer.toString(n1);
            }
            else{
            int n= rs.getInt("maxid");
            int n2=n + 1;
            btid = Integer.toString(n2);
            }
            pstmt = conn.prepareStatement("insert into batch_details(btid,btsub,btfal,btstart,btend,btlec) " + "values(?,?,?,?,?,?)");
            pstmt.setString(1, btid);
            pstmt.setString(2, btsub);
            pstmt.setString(3, btfal);
            pstmt.setString(4, btstart);
            pstmt.setString(5, btend);
            pstmt.setString(6, btlec);

            int count = pstmt.executeUpdate();
            if (count > 0) {
                     String sql2="select  max(btid) as maxid from batch_details";
           pstmt =conn.prepareStatement(sql2);
             rs = pstmt.executeQuery(sql2);
            rs.next();
                 out.println("<script>");
                out.println("alert('Generated Batch Id: "+ rs.getString("maxid")+"');");
                out.println("</script>");
                out.println("<script>");
                out.println("alert('Record created successfully');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchcreation.jsp'/></html>");
            } else {
                out.println("<script>");
                out.println("alert('Record creation failed');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/batchcreation.jsp'/></html>");
            }
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            ex.printStackTrace();
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
    }

}
