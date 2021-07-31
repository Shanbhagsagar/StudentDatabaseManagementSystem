
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

@WebServlet("/student_detail")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class student_detail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Connection & getting parameters
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String url = "jdbc:mysql://localhost:3306/stangelos";
        InputStream inputStream = null;
        String stid = null;
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
        Part stimg = request.getPart("stimg");
        String folderName = "profilephoto";
        String stfile = stimg.getSubmittedFileName();
        String stpath = folderName + File.separator + stfile;
        String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;
        File dir = new File(uploadPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        InputStream is = stimg.getInputStream();
        Files.copy(is, Paths.get(uploadPath + File.separator + stfile), StandardCopyOption.REPLACE_EXISTING);
        //Setting queries
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, "root", "");
            String sql="select max(stid) as maxid from student_details";
           pstmt =conn.prepareStatement(sql);
             rs = pstmt.executeQuery(sql);
               if(rs.next() == false || rs.getInt("maxid") == 0){
                int n1= 10000;
                stid=Integer.toString(n1);
            }
              else{
               int n= rs.getInt("maxid");
               int n1=n + 1;
               stid = Integer.toString(n1);
              }
            pstmt = conn.prepareStatement("insert into student_details(stid,stname,stphone,stemail,stadmission,stcourse,stpass,stgender,stfile,stpath,stbirth,stnational,stmobile,stadd,stcity,ststate,stcountry)" + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, stid);
            pstmt.setString(2, stname);
            pstmt.setString(3, stphone);
            pstmt.setString(4, stemail);
            pstmt.setString(5, stadmission);
            pstmt.setString(6, stcourse);
            pstmt.setString(7, stpass);
            pstmt.setString(8, stgender);
            pstmt.setString(9, stfile);
            pstmt.setString(10, stpath);
            pstmt.setString(11, stbirth);
            pstmt.setString(12, stnational);
            pstmt.setString(13, stmobile);
            pstmt.setString(14, stadd);
            pstmt.setString(15, stcity);
            pstmt.setString(16, ststate);
            pstmt.setString(17, stcountry);
            int count = pstmt.executeUpdate();
            if (count > 0) {
                  String sql2="select  max(stid) as maxid from student_details";
           pstmt =conn.prepareStatement(sql2);
             rs = pstmt.executeQuery(sql2);
            rs.next();
              out.println("<script>");
                out.println("alert('Generated Application Id :"+ rs.getString("maxid")+"');");
                out.println("</script>");
                out.println("<script>");
                out.println("alert('Record created successfully.');");
                out.println("</script>");
               
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/creation.jsp'/></html>");
          
            } else {
                out.println("<script>");
                out.println("alert('Record creation failed');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/creation.jsp'/></html>");
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
