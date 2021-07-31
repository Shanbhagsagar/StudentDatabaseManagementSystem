
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/practical")
public class practical extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Connection and getting parameters
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String url = "jdbc:mysql://localhost:3306/stangelos";
        String stid = request.getParameter("stid");
        String exid = request.getParameter("exid");
        String exmode = request.getParameter("exmode");
        String exdate = request.getParameter("exdate");
        String exsub = request.getParameter("exsub");
        //Setting queries
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, "root", "");
            pstmt = conn.prepareStatement("insert into exam(stid,exid,exmode,exdate,exsub) values (?,?,?,?,?)");
            pstmt.setString(1, stid);
            pstmt.setString(2, exid);
            pstmt.setString(3, exmode);
            pstmt.setString(4, exdate);
            pstmt.setString(5, exsub);
            int count = pstmt.executeUpdate();
            if (count > 0) {
                out.println("<script>");
                out.println("alert('Exam booked successfully');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/practicalbook.jsp'/></html>");
            } else {
                out.println("<script>");
                out.println("alert('Exam booking failed');");
                out.println("</script>");
                out.println("<html><meta http-equiv='refresh' content='2;url=http://localhost:8084/angelos/practicalbook.jsp'/></html>");
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
