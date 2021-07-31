
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class breakapp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String host = "smtp.gmail.com";
            String user = "stangelos22@gmail.com";
            String pass = "Thomasben1";
            String fromdate = request.getParameter("fromdate");
            String todate = request.getParameter("todate");
            String rejoindate = request.getParameter("rejoindate");
            String reason = request.getParameter("reason");
            String stid = request.getParameter("stid");

            //Properties 
            Properties props = System.getProperties();
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");
            boolean sessionDebug = false;
            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg3 = new MimeMessage(mailSession);
            msg3.setFrom(new InternetAddress(user));
            InternetAddress[] address = {new InternetAddress(user)};
            msg3.setRecipients(Message.RecipientType.TO, address);
            msg3.setSubject("Break/Leave Application");
            msg3.setSentDate(new Date());
            msg3.setText("Admission id: " + stid + "From Date: " + fromdate + "\nTo Date: " + todate + "\nRejoin Date: " + rejoindate + "\nReason for Break: " + reason);

            //Transport 
            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(msg3, msg3.getAllRecipients());
            transport.close();
            response.sendRedirect("break.jsp");
        } catch (Exception ex) {
            System.out.println(ex);
            ex.printStackTrace();
        }
    }
}
