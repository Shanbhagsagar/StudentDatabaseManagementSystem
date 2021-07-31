package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class batchsearch_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');

    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "stangelos";
    String userid = "root";
    String password = "";
    String btid = request.getParameter("btid");
    String btsub = request.getParameter("btsub");
    String btfal = request.getParameter("btfal");
    String btstart = request.getParameter("btstart");
    String btend = request.getParameter("btend");

    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    if (session.getAttribute("adid") == null) {
        out.println("<script>");
        out.println("alert('Session not found');");
        out.println("</script>");
        out.println("<html><meta http-equiv='refresh' content='0;url=http://localhost:8084/angelos/adminlogin.jsp'/></html>");
    }

      out.write('\n');

    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();

        String sql1 = "select * from admin where adid=" + session.getAttribute("adid");
        resultSet = statement.executeQuery(sql1);

        while (resultSet.next()) {
            String file = resultSet.getString("adfile");

      out.write("  \n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"\">\n");
      out.write("        <title>BATCH-Search</title>\n");
      out.write("        <!-- Custom fonts for this template-->\n");
      out.write("        <link href=\"vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i\" rel=\"stylesheet\">\n");
      out.write("        <!-- Custom styles for this template-->\n");
      out.write("        <link href=\"sb-admin-2.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <!-- Body-->\n");
      out.write("    <body id=\"page-top\">\n");
      out.write("        <!-- Page Wrapper -->\n");
      out.write("        <div id=\"wrapper\">\n");
      out.write("            <!-- Sidebar -->\n");
      out.write("            <ul class=\"navbar-nav bg-gradient-danger sidebar sidebar-dark accordion\" id=\"accordionSidebar\">\n");
      out.write("                <!-- Sidebar - Brand -->\n");
      out.write("                <div class=\"sidebar-brand d-flex align-items-center justify-content-center\" href=\"index.html\">\n");
      out.write("                    <div class=\"sidebar-brand-icon\">\n");
      out.write("                        <img class=\"stanglogo\"src=\"pic/logo.jpg\" />\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <!-- Divider -->\n");
      out.write("                <hr class=\"sidebar-divider my-0\">\n");
      out.write("                <!-- Nav Item - Dashboard -->\n");
      out.write("                <li class=\"nav-item active\">\n");
      out.write("                    <a class=\"nav-link\" href=\"details.jsp\">\n");
      out.write("                        <i class=\"fas fa-fw fa-tachometer-alt\"></i>\n");
      out.write("                        <span>Admin Panel</span></a>\n");
      out.write("                </li>\n");
      out.write("                <!-- Divider -->\n");
      out.write("                <hr class=\"sidebar-divider\">\n");
      out.write("\n");
      out.write("                <!-- Heading -->\n");
      out.write("                <div class=\"sidebar-heading\">\n");
      out.write("                    Details:\n");
      out.write("                </div>\n");
      out.write("                <!-- Nav Item - Pages Collapse Menu -->\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"details.jsp\">\n");
      out.write("                        <i class=\"fas fa-fw fa-info-circle\"></i>\n");
      out.write("                        <span>Details</span></a>\n");
      out.write("                </li>\n");
      out.write("                <hr class=\"sidebar-divider\">\n");
      out.write("                <div class=\"sidebar-heading\">\n");
      out.write("                    Student Profile Creation:\n");
      out.write("                </div>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link collapsed\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapseTwo\" aria-expanded=\"true\" aria-controls=\"collapseTwo\">\n");
      out.write("                        <i class=\"fas fa-fw fa-user\"></i>\n");
      out.write("                        <span>Profiles</span>\n");
      out.write("                    </a>\n");
      out.write("                    <div id=\"collapseTwo\" class=\"collapse\" aria-labelledby=\"headingTwo\" data-parent=\"#accordionSidebar\">\n");
      out.write("                        <div class=\"bg-white py-2 collapse-inner rounded\">\n");
      out.write("                            <h6 class=\"collapse-header\">Options:</h6>\n");
      out.write("                            <a class=\"collapse-item\" href=\"search.jsp\"> Search/Update</a>\n");
      out.write("                            <a class=\"collapse-item\" href=\"creation.jsp\">Create</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <hr class=\"sidebar-divider\">\n");
      out.write("                <div class=\"sidebar-heading\">\n");
      out.write("                    Batch Details:\n");
      out.write("                </div>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapseThree\" aria-expanded=\"true\" aria-controls=\"collapseThree\">\n");
      out.write("                        <i class=\"fas fa-fw fa-users\"></i>\n");
      out.write("                        <span>Batch</span>\n");
      out.write("                    </a>\n");
      out.write("                    <div id=\"collapseThree\" class=\"collapse show\" aria-labelledby=\"headingTwo\" data-parent=\"#accordionSidebar\">\n");
      out.write("                        <div class=\"bg-white py-2 collapse-inner rounded\">\n");
      out.write("                            <h6 class=\"collapse-header\">Options:</h6>\n");
      out.write("                            <a class=\"collapse-item active\" href=\"batchsearch.jsp\"> Search/Update</a>\n");
      out.write("                            <a class=\"collapse-item\" href=\"batchcreation.jsp\">Create</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                 <hr class=\"sidebar-divider\">\n");
      out.write("                <!-- Divider -->\n");
      out.write("                <div class=\"sidebar-heading\">\n");
      out.write("                    Examination:\n");
      out.write("                </div>\n");
      out.write("                <!-- Nav Item - Pages Collapse Menu -->\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"Examination.jsp\">\n");
      out.write("                        <i class=\"fas fa-fw fa-book\"></i>\n");
      out.write("                        <span>Exam Details</span></a>\n");
      out.write("                </li>\n");
      out.write("                <!-- Divider -->\n");
      out.write("                <hr class=\"sidebar-divider\">\n");
      out.write("                <div class=\"sidebar-heading\">\n");
      out.write("                    Books:\n");
      out.write("                </div>\n");
      out.write("                <!-- Nav Item - Pages Collapse Menu -->\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"book.jsp\">\n");
      out.write("                        <i class=\"fas fa-fw fa-book\"></i>\n");
      out.write("                        <span>Upload/Delete</span></a>\n");
      out.write("                </li>\n");
      out.write("                <!-- Divider -->\n");
      out.write("                <hr class=\"sidebar-divider d-none d-md-block\">\n");
      out.write("                <!-- Sidebar Toggler (Sidebar) -->\n");
      out.write("                <div class=\"text-center d-none d-md-inline\">\n");
      out.write("                    <button class=\"rounded-circle border-0\" id=\"sidebarToggle\"></button>\n");
      out.write("                </div>\n");
      out.write("            </ul>\n");
      out.write("            <!-- End of Sidebar -->\n");
      out.write("            <!-- Content Wrapper -->\n");
      out.write("            <div id=\"content-wrapper\" class=\"d-flex flex-column\">\n");
      out.write("                <!-- Main Content -->\n");
      out.write("                <div id=\"content\">\n");
      out.write("                    <!-- Topbar -->\n");
      out.write("                    <nav class=\"navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow\">\n");
      out.write("                        <!-- Sidebar Toggle (Topbar) -->\n");
      out.write("                        <button id=\"sidebarToggleTop\" class=\"btn btn-link d-md-none rounded-circle mr-3\">\n");
      out.write("                            <i class=\"fa fa-bars\"></i>\n");
      out.write("                        </button>\n");
      out.write("                        <!-- Topbar Navbar -->\n");
      out.write("                        <ul class=\"navbar-nav ml-auto\">\n");
      out.write("                            <div class=\"topbar-divider d-none d-sm-block\"></div>\n");
      out.write("                            <!-- Nav Item - User Information -->\n");
      out.write("                            <li class=\"nav-item dropdown no-arrow\">\n");
      out.write("                                <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"userDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                                    <span class=\"mr-2 d-none d-lg-inline text-gray-600 small\">");
      out.print(resultSet.getString("adname"));
      out.write("</span>\n");
      out.write("                                    <img class=\"img-profile rounded-circle\" src=\"adminpp\\");
      out.print(file);
      out.write("\" width=\"60px\" height=\"60px\">\n");
      out.write("                                </a>\n");
      out.write("                                <!-- Dropdown - User Information -->\n");
      out.write("                                <div class=\"dropdown-menu dropdown-menu-right shadow animated--grow-in\" aria-labelledby=\"userDropdown\">\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"details.jsp\">\n");
      out.write("                                        <i class=\"fas fa-user fa-sm fa-fw mr-2 text-gray-400\"></i>\n");
      out.write("                                        Profile\n");
      out.write("                                    </a>\n");
      out.write("                                    <div class=\"dropdown-divider\"></div>\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"#\" data-toggle=\"modal\" data-target=\"#logoutModal\">\n");
      out.write("                                        <i class=\"fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400\"></i>\n");
      out.write("                                        Logout\n");
      out.write("                                    </a>\n");
      out.write("                                </div>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </nav>\n");
      out.write("                    ");

                            }
                            connection.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    
      out.write("  \n");
      out.write("                    <!-- End of Topbar -->\n");
      out.write("\n");
      out.write("                    <!-- Begin Page Content -->\n");
      out.write("                    <div class=\"container-fluid\">\n");
      out.write("                        <!-- Page Heading -->\n");
      out.write("                        <h1 class=\"h3 mb-4 text-danger font-weight-bold text-center\">BATCH SEARCH</h1>\n");
      out.write("                        <!-- Content Row -->\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-lg-3\"></div>\n");
      out.write("                            <div class=\"col-lg-6\">         \n");
      out.write("                                <!-- Default Card Example -->\n");
      out.write("                                <div class=\"card shadow mb-2\">\n");
      out.write("                                    <div class=\"card-header card1\">\n");
      out.write("                                        <div class=\"text-left text-link text-danger\"><h3>Batch Profiles:</h3></div>    \n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"card-body text-left\">\n");
      out.write("                                        <form action=\"\"method=\"\">\n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <div class=\"col\">    \n");
      out.write("                                                    Batch id:\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col\">   \n");
      out.write("                                                    <input class=\"form-control\" type=\"text\" name=\"btid\"/>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div><br/> \n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <div class=\"col\">    \n");
      out.write("                                                    Subject:\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col\">   \n");
      out.write("                                                    <input class=\"form-control\" type=\"text\" name=\"btsub\"/>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div> <br/>      \n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <div class=\"col\">    \n");
      out.write("                                                    Faculty:\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col\">   \n");
      out.write("                                                    <input class=\"form-control\" type=\"text\" name=\"btfal\"/>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div> <br/>      \n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <div class=\"col\">    \n");
      out.write("                                                    Start date:\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col\">   \n");
      out.write("                                                    <input class=\"form-control\" type=\"date\" name=\"btstart\"/>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div> <br/>     \n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <div class=\"col\">    \n");
      out.write("                                                    End date:\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col\">   \n");
      out.write("                                                    <input class=\"form-control\" type=\"date\" name=\"btend\"/>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div> <br/>\n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <div class=\"col\">    \n");
      out.write("                                                    <center><input type=\"Submit\" value=\"Submit\" class=\"b1\"/></center>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div> <br/>\n");
      out.write("                                        </form>          \n");
      out.write("                                    </div>\n");
      out.write("                                </div> \n");
      out.write("                            </div> \n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"card shadow mb-4\">\n");
      out.write("                            <div class=\"card-header py-3\">\n");
      out.write("                                <h6 class=\"m-0 font-weight-bold text-danger\">Batch Profiles</h6>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"card-body\">\n");
      out.write("                                <div class=\"table-responsive\">\n");
      out.write("                                    <table class=\"table table-bordered\" id=\"dataTable\" width=\"100%\" cellspacing=\"0\">\n");
      out.write("                                        <thead>\n");
      out.write("                                            <tr>\n");
      out.write("                                                <th>Batch Id</th>\n");
      out.write("                                                <th>Subject</th>\n");
      out.write("                                                <th>Action</th>\n");
      out.write("                                            </tr>\n");
      out.write("                                        </thead>\n");
      out.write("                                        <tbody>\n");
      out.write("                                            ");

                                                try {
                                                    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                                                    statement = connection.createStatement();
                                                    String sql = "select * from batch_details";

                                                    if (btid != "") {
                                                        sql += " where btid=" + btid;
                                                    }
                                                    if (btsub != "") {
                                                        sql += " where btsub='" + btsub + "'";
                                                    }
                                                    if (btfal != "") {
                                                        sql += " where btfal='" + btfal + "'";
                                                    }
                                                    if (btstart != "") {
                                                        sql += " where btstart='" + btstart + "'";
                                                    }
                                                    if (btend != "") {
                                                        sql += " where btend='" + btend + "'";
                                                    }

                                                    resultSet = statement.executeQuery(sql);

                                                    while (resultSet.next()) {
                                            
      out.write("\n");
      out.write("                                            <tr>\n");
      out.write("                                                <td>");
      out.print(resultSet.getInt("btid"));
      out.write("</td>\n");
      out.write("                                                <td>");
      out.print(resultSet.getString("btsub"));
      out.write("</td>\n");
      out.write("                                                <td>\n");
      out.write("                                                    <a class=\"text-danger\" href=\"view1.jsp?btid=");
      out.print(resultSet.getString("btid"));
      out.write("\">View</a> |\n");
      out.write("                                                    <a class=\"text-danger\" href=\"update1.jsp?btid=");
      out.print(resultSet.getString("btid"));
      out.write("\">Update</a> | \n");
      out.write("                                                    <a class=\"text-danger\" href=\"delbatch.jsp?btid=");
      out.print(resultSet.getString("btid"));
      out.write("\">Delete</a> |\n");
      out.write("                                                    <a class=\"text-danger\" href=\"addstu.jsp?btid=");
      out.print(resultSet.getString("btid"));
      out.write("\">Add Student</a> | \n");
      out.write("                                                    <a class=\"text-danger\" href=\"deletestu.jsp?btid=");
      out.print(resultSet.getString("btid"));
      out.write("\">Delete Student</a> | \n");
      out.write("                                                    <a class=\"text-danger\" href=\"attendance.jsp?btid=");
      out.print(resultSet.getString("btid"));
      out.write("\">Set Attendance</a>\n");
      out.write("                                                </td>\n");
      out.write("                                            </tr>\n");
      out.write("                                            ");

                                                    }
                                                    connection.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            
      out.write("\n");
      out.write("                                        </tbody> \n");
      out.write("                                    </table>\n");
      out.write("                                </div>\n");
      out.write("                            </div>    \n");
      out.write("                        </div>\n");
      out.write("                        <!-- /.container-fluid -->\n");
      out.write("                    </div>\n");
      out.write("                    <!-- End of Main Content -->\n");
      out.write("                    <!-- Footer -->\n");
      out.write("                    <footer class=\"sticky-footer bg-white\">\n");
      out.write("                        <div class=\"container my-auto\">\n");
      out.write("                            <div class=\"copyright text-center my-auto\">\n");
      out.write("                                <span>Copyright &copy; Your Website 2019</span>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </footer>\n");
      out.write("                    <!-- End of Footer -->\n");
      out.write("                </div>\n");
      out.write("                <!-- End of Content Wrapper -->\n");
      out.write("            </div>\n");
      out.write("            <!-- End of Page Wrapper -->\n");
      out.write("            <!-- Scroll to Top Button-->\n");
      out.write("            <a class=\"scroll-to-top rounded\" href=\"#page-top\">\n");
      out.write("                <i class=\"fas fa-angle-up\"></i>\n");
      out.write("            </a>\n");
      out.write("\n");
      out.write("            <!-- Logout Modal-->\n");
      out.write("            <div class=\"modal fade\" id=\"logoutModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("                <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h5 class=\"modal-title\" id=\"exampleModalLabel\">Ready to Leave?</h5>\n");
      out.write("                            <button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                                <span aria-hidden=\"true\">×</span>\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">Select \"Logout\" below if you are ready to end your current session.</div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button>\n");
      out.write("                            <a class=\"btn btn-primary\" href=\"adminlogout.jsp\">Logout</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- Bootstrap core JavaScript-->\n");
      out.write("            <script src=\"vendor/jquery/jquery.min.js\"></script>\n");
      out.write("            <script src=\"vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("            <!-- Core plugin JavaScript-->\n");
      out.write("            <script src=\"vendor/jquery-easing/jquery.easing.min.js\"></script>\n");
      out.write("\n");
      out.write("            <!-- Custom scripts for all pages-->\n");
      out.write("            <script src=\"js/sb-admin-2.min.js\"></script>\n");
      out.write("\n");
      out.write("            <!-- Page level plugins -->\n");
      out.write("            <script src=\"vendor/chart.js/Chart.min.js\"></script>\n");
      out.write("\n");
      out.write("            <!-- Page level custom scripts -->\n");
      out.write("            <script src=\"js/demo/chart-area-demo.js\"></script>\n");
      out.write("            <script src=\"js/demo/chart-pie-demo.js\"></script>\n");
      out.write("\n");
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
