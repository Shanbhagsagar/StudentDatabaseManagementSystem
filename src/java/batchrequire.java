
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class batchrequire extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String host = "smtp.gmail.com";
            String user = "stangelos22@gmail.com";
            String pass = "Thomasben1";
            String to = request.getParameter("email");
            String p1 = request.getParameter("phone");
            String t1 = request.getParameter("time1");
            String t2 = request.getParameter("time2");
            String t3 = request.getParameter("time3");
            String t4 = request.getParameter("time4");
            String c1 = request.getParameter("course");
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
            InternetAddress[] address = {new InternetAddress(to)};
            msg3.setRecipients(Message.RecipientType.TO, address);
            msg3.setSubject("Batch Request");
            msg3.setSentDate(new Date());
            msg3.setText("We have received your request regarding batch.\nWe will get back to you as soon as possible!!");
            Message msg4 = new MimeMessage(mailSession);
            msg4.setFrom(new InternetAddress(user));
            InternetAddress[] address1 = {new InternetAddress(user)};
            msg4.setRecipients(Message.RecipientType.TO, address1);
            msg4.setSubject("Batch Request");
            msg4.setSentDate(new Date());
            msg4.setText("Admission ID:" + stid + "\nEmail:" + to + "\nPhone:" + p1 + "\nPreferred time #1 :" + t1 + " to:" + t2 + "\nPreferred time #2 :" + t3 + " to:" + t4 + "\nCourse :" + c1);

            //Transport
            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(msg3, msg3.getAllRecipients());
            transport.sendMessage(msg4, msg4.getAllRecipients());
            transport.close();
            response.sendRedirect("batch_req.jsp");

        } //Catching exceptions
        catch (Exception ex) {
            System.out.println(ex);
            ex.printStackTrace();
        }
    }
}
