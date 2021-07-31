
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

public class contact1 extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String host = "smtp.gmail.com";
            String user = "stangelos22@gmail.com";
            String pass = "Thomasben1";
            String to = request.getParameter("e-mail");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("e-mail");
            String enquiry = request.getParameter("enquiry");

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
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(user));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject("Enquiry");
            msg.setSentDate(new Date());
            msg.setText("Thanks for contacting us..WE WILL GET BACK TO YOU SOON!!!");

            Message msg1 = new MimeMessage(mailSession);
            msg1.setFrom(new InternetAddress(user));
            InternetAddress[] address1 = {new InternetAddress(user)};
            msg1.setRecipients(Message.RecipientType.TO, address1);
            msg1.setSubject("Enquiry");
            msg.setSentDate(new Date());
            msg1.setText("Name:" + name + "\nEmail:" + email + "\nPhone:" + phone + "\nMessage:" + enquiry);

            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.sendMessage(msg1, msg1.getAllRecipients());
            transport.close();
            response.sendRedirect("contact.html");
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
