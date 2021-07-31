package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"\">\n");
      out.write("        <title>Login</title>\n");
      out.write("        <!--Main Css-->\n");
      out.write("        <!--Fonts Css-->\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i\" rel=\"stylesheet\">\n");
      out.write("        <!--Bootstrap Linking-->\n");
      out.write("        <link href=\"//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("        <script src=\"//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("        <!--Login Css-->\n");
      out.write("        <link href=\"login.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <!--Login Content-->\n");
      out.write("    <body>\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            <div id=\"formContent\">\n");
      out.write("                <br/><br/>\n");
      out.write("                <div class=\"fadeIn first\">\n");
      out.write("                    <img src=\"pic\\logo1.png\" id=\"icon\" alt=\"User Icon\" /><br/><br/>\n");
      out.write("                    <div class=\"font1\"><center>STUDENT DESK</center></div>\n");
      out.write("                </div>\n");
      out.write("                <!-- Login Form -->\n");
      out.write("                <form method=\"post\" action=\"loginpass.jsp\" name=\"myform\" onsubmit=\"return validateform()\" >\n");
      out.write("                    <div class=\"form-group\"> \n");
      out.write("                        <input type=\"text\" id=\"inputName\" class=\"fadeIn second\" name=\"userid\" placeholder=\"LOGIN\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <input type=\"password\"  id=\"inputPassword\" class=\" fadeIn third\" name=\"password\" placeholder=\"PASSWORD\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <input type=\"submit\"  class=\"fadeIn fourth\" value=\"Log In\">\n");
      out.write("                </form>\n");
      out.write("                <!-- Forgot Passowrd -->\n");
      out.write("                <div id=\"formFooter\">\n");
      out.write("                    <a class=\"underlineHover\" href=\"forget.jsp\">Forgot Password?</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("            function validateform() {\n");
      out.write("                var password = document.myform.password.value;\n");
      out.write("                if (password.length < 7) {\n");
      out.write("                    alert(\"Password must be at least 7 characters long.\");\n");
      out.write("                    myform.reset();\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>    \n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
