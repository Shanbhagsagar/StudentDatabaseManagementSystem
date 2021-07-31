
import java.sql.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

@WebServlet("/bookupload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class bookupload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String url = "jdbc:mysql://localhost:3306/stangelos";
        String folderName = "books";
        String uploadPath = request.getServletContext().getRealPath("")  + folderName;
      
        File dir = new File(uploadPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        Part filePart = request.getPart("file");//Textbox value of name file.
        String bookid = request.getParameter("bookid");
        String fileName = filePart.getSubmittedFileName();
        String path = folderName + File.separator + fileName;
        System.out.println("fileName: " + fileName);
        System.out.println("Path: " + uploadPath);
        System.out.println("Name: " + bookid);
        InputStream is = filePart.getInputStream();
        Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, "root", "");
             String sql="select max(bookid) as maxid from book";
             ps =conn.prepareStatement(sql);
             rs = ps.executeQuery(sql);
               if(rs.next() == false || rs.getInt("maxid") == 0){
                int n1= 1;
                bookid=Integer.toString(n1);
            }
              else{
               int n= rs.getInt("maxid");
               int n1=n + 1;
               bookid = Integer.toString(n1);
              }
            ps = conn.prepareStatement("insert into book(bookid,filename,path)" + "values(?,?,?)");
            ps.setString(1, bookid);
            ps.setString(2, fileName);
            ps.setString(3, path);
            int count = ps.executeUpdate();
            if (count > 0) {
                out.println("<script>");
                out.println("alert('Book inserted successfully');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/book.jsp'/></html>");
            } else {
                out.println("<script>");
                out.println("alert('Book insertion failed');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/book.jsp'/></html>");
            }
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
                if (ps != null) {
                    ps.close();
                    ps = null;
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
