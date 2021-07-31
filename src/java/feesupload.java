
import java.sql.*;
import java.util.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;


public class feesupload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Connection & getting parameters
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String url = "jdbc:mysql://localhost:3306/stangelos";
       
        String stid = request.getParameter("stid");
        String chqno = request.getParameter("chqno");
        String date = request.getParameter("dt");
        int feespaid = Integer.parseInt(request.getParameter("feespaid"));
        int total= Integer.parseInt(request.getParameter("total"));
      
        
       
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, "root", "");
            int prevDue =0;
             int balance = 0;
          //   balance=  total - feespaid;
        String sql="select id, feesdue from fees where stid ="+stid+" order by id desc limit 1"; 
 
        pstmt =conn.prepareStatement(sql);
         rs = pstmt.executeQuery(sql);
            if(rs.next() == false || rs.getInt("id") == 0)
            {
                System.out.println("No previous entry found.");
                prevDue = total;
            }
            else
            {
                System.out.println("Found a prevDue with previous Record"+rs.getInt("feesdue"));
                System.out.println("id is "+rs.getInt("id"));
                prevDue = rs.getInt("feesdue");
               
           
                 
           
            }
           
         
            
            balance=  prevDue - feespaid;
           if (feespaid > prevDue) {
                stid = null;
                chqno = null;
                date = null;
                feespaid = 0;
                total = 0;
                balance = 0;
                conn.close();
                out.println("<script>");
                out.println("alert('Fees paid greater than balance');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/feespanel.jsp'/></html>");
               
            }
            
            pstmt = conn.prepareStatement("insert into fees(stid,chqno,dt,feespaid,total,feesdue)" + "values(?,?,?,?,?,?)");
            pstmt.setString(1, stid);
            pstmt.setString(2, chqno);
            pstmt.setString(3, date);
            pstmt.setInt(4, feespaid);
            pstmt.setInt(5, total);
            pstmt.setInt(6, balance);
           
            
            int count = pstmt.executeUpdate();
                      
            if (count > 0) {
                                    
                out.println("<script>");
                out.println("alert('Record created successfully');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/feespanel.jsp'/></html>");
            } else {
                out.println("<script>");
                out.println("alert('Record creation failed');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/feespanel.jsp'/></html>");
            }
        } //Catching Exceptions
        catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
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
