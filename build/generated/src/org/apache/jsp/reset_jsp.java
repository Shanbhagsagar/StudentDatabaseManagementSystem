package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class reset_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Forgot Password</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("   <link href=\"//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("<script src=\"//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js\"></script>\n");
      out.write("<script src=\"//code.jquery.com/jquery-1.11.1.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!--css-->\n");
      out.write("     <link href=\"forget.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"form-gap\"></div>\n");
      out.write("<div class=\"container\">\n");
      out.write("\t<div class=\"row\">\n");
      out.write("\t\t<div class=\"col-md-4 col-md-offset-4\">\n");
      out.write("            <div class=\"panel panel-default\">\n");
      out.write("              <div class=\"panel-body\">\n");
      out.write("                <div class=\"text-center\">\n");
      out.write("                  <h2 class=\"text-center\">RESET PASSWORD</h2>\n");
      out.write("                  <div class=\"panel-body\">\n");
      out.write("    \n");
      out.write("                    <form id=\"register-form\" role=\"form\" name=\"f1\" autocomplete=\"off\" onsubmit=\"return matchpass()\" class=\"form\" method=\"post\">\n");
      out.write("    \n");
      out.write("                      <div class=\"form-group\">\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            New Password: <input id=\"pass1\" name=\"pass1\"  class=\"form-control\"  type=\"password\" required>\n");
      out.write("                        </div><br/>\n");
      out.write("                    <div class=\"input-group\">\n");
      out.write("                        Re-enter Password: <input id=\"pass2\"  name=\"pass2\"  class=\"form-control\"  type=\"password\" required>\n");
      out.write("                        </div><br/>\n");
      out.write("                          \n");
      out.write("                      </div>\n");
      out.write("                      <div class=\"form-group\">\n");
      out.write("                        <input name=\"recover-submit\" class=\"btn btn-lg btn-primary btn-block\" value=\"Reset Password\" type=\"submit\">\n");
      out.write("                      </div>\n");
      out.write("                      \n");
      out.write("                      <input type=\"hidden\" class=\"hide\" name=\"token\" id=\"token\" value=\"\"> \n");
      out.write("                    </form>\n");
      out.write("    \n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("        <script>\n");
      out.write("function matchpass(){\n");
      out.write("var pass1=document.f1.pass1.value;\n");
      out.write("var pass2=document.f1.pass2.value;\n");
      out.write("\n");
      out.write("  if(pass1.length<7){  \n");
      out.write("    alert(\"Password must be at least 7 characters long.\");  \n");
      out.write("       f1.reset();\n");
      out.write("       return false;  \n");
      out.write("  }  \n");
      out.write("    else{\n");
      out.write("     if(pass1===pass2){\n");
      out.write("     return true;\n");
      out.write("      }  \n");
      out.write("    else{\n");
      out.write("     alert(\"password must be same!\");\n");
      out.write("     return false;\n");
      out.write("     }  \n");
      out.write("    }\n");
      out.write("\n");
      out.write("\n");
      out.write("  \n");
      out.write("}\n");
      out.write("         </script>   \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
