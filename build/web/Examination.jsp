<%@page import="java.sql.*"%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "stangelos";
    String userid = "root";
    String password = "";
    String exstart = request.getParameter("exstart");
    String exend = request.getParameter("exend");
    String exmode = request.getParameter("exmode");
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
%>
<%
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();

        String sql = "select * from admin where adid=" + session.getAttribute("adid");
        resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            String file = resultSet.getString("adfile");
%>   
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Examination</title>
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="sb-admin-2.css" rel="stylesheet">
    </head>
    <!--Body -->
    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">
                <!-- Sidebar - Brand -->
                <div class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon">
                        <img class="stanglogo"src="pic/logo.jpg" />
                    </div>
                </div>
                <!-- Divider -->
                <hr class="sidebar-divider my-0">
                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="details.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Admin Panel</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div class="sidebar-heading">
                    Details:
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link" href="details.jsp">
                        <i class="fas fa-fw fa-info-circle"></i>
                        <span>Details</span></a>
                </li>
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    Student Profile Creation:
                </div>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-user"></i>
                        <span>Profiles</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Options:</h6>
                            <a class="collapse-item" href="search.jsp"> Search/Update</a>
                            <a class="collapse-item" href="creation.jsp">Create</a>
                        </div>
                    </div>
                </li>
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    Batch Details:
                </div>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                        <i class="fas fa-fw fa-users"></i>
                        <span>Batch</span>
                    </a>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Options:</h6>
                            <a class="collapse-item" href="batchsearch.jsp"> Search/Update</a>
                            <a class="collapse-item" href="batchcreation.jsp">Create</a>
                        </div>
                    </div>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    Examination:
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item active">
                    <a class="nav-link" href="Examination.jsp">
                        <i class="fas fa-fw fa-book"></i>
                        <span>Exam Details</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    Books:
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link" href="book.jsp">
                        <i class="fas fa-fw fa-book"></i>
                        <span>Upload/Delete</span></a>
                </li>
                 <hr class="sidebar-divider">
                <div class="sidebar-heading">
                   Fees Panel:
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link" href="feespanel.jsp">
                        <i class="fas fa-fw fa-book"></i>
                        <span>Fees</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">
                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </ul>
            <!-- End of Sidebar -->
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <div class="topbar-divider d-none d-sm-block"></div>
                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=resultSet.getString("adname")%></span>
                                    <img class="img-profile rounded-circle" src="adminpp\<%=file%>" width="60px" height="60px">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="details.jsp">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <%
                            }
                            connection.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>    
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <h1 class="h3 mb-4 text-danger font-weight-bold text-center">Examination Search</h1>
                        <!-- Content Row -->
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-6">   
                                <!-- Default Card Example -->
                                <div class="card shadow mb-2" >
                                    <div class="card-header card1">
                                            
                                    </div>
                                    <div class="card-body text-left">
                                        <form method="post">
                                            <div class="row">
                                                <div class="col">    
                                                    Start date:
                                                </div>
                                                <div class="col">   
                                                    <input  class="form-control" type="date" name="exstart"/>
                                                </div>
                                            </div><br/> 
                                            <div class="row">
                                                <div class="col">    
                                                    End date:
                                                </div>
                                                <div class="col">   
                                                    <input  class="form-control" type="date" name="exend"/>
                                                </div>
                                            </div><br/>
                                            <div class="row">
                                                <div class="col">    
                                                    Exam Mode:
                                                </div>
                                                <div class="col">   
                                                    <select class="custom-select" name="exmode">
                                                        <option></option>
                                                        <option>Theory</option>
                                                        <option>Practical</option>
                                                    </select>
                                                </div>
                                            </div><br/>
                                            <div class="row">
                                                <div class="col">    
                                                    <center><input type="Submit" value="Search" class="b1"/></center>
                                                </div>
                                            </div> <br/>
                                        </form>          
                                    </div>
                                </div> 
                            </div>
                        </div>
                        <br/>
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-danger">Student</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Exam ID</th>
                                                <th>Student ID</th>
                                                <th>Subject</th>
                                                <th>Exam Mode</th>
                                                <th>Exam Date</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                try {
                                                    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                                                    statement = connection.createStatement();
                                                    String sql = "select * from exam";

                                                    if (exstart != "" && exend != "") {

                                                        sql += " where exdate between '" + exstart + "' and '" + exend + "'";
                                                    }
                                                    if (exmode != "") {
                                                        sql += " where exmode='" + exmode + "'";
                                                    }
                                                    resultSet = statement.executeQuery(sql);

                                                    while (resultSet.next()) {
                                            %>
                                            <tr>
                                                <td><%=resultSet.getInt(2)%></td>
                                                <td><%=resultSet.getInt(1)%></td>
                                                <td><%=resultSet.getString(5)%></td>
                                                <td><%=resultSet.getString(3)%></td>
                                                <td><%=resultSet.getString(4)%></td>
                                                <td>N/A</td>
                                            </tr>
                                            <%
                                                    }
                                                    connection.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>    
                        </div>
                        <!-- /.container-fluid -->
                    </div>
                    <!-- End of Main Content -->
                    <!-- Footer -->
                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Copyright &copy; Your Website 2019</span>
                            </div>
                        </div>
                    </footer>
                    <!-- End of Footer -->
                </div>
                <!-- End of Content Wrapper -->
            </div>
        </div>                 
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="adminlogout.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
        
         <!-- Page level plugins -->
            <script src="vendor/datatables/jquery.dataTables.min.js"></script>
            <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="js/demo/datatables-demo.js"></script>

            <script>
                $(document).ready(function () {
                    $('#dataTable').DataTable();
                    $('.dataTables_length').addClass('bs-select');
                });
            </script>

    </body>
</html>
