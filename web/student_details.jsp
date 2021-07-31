<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "stangelos";
    String userid = "root";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
     if (session.getAttribute("userid") == null) {
        out.println("<script>");
        out.println("alert('Session not found');");
        out.println("</script>");
        out.println("<html><meta http-equiv='refresh' content='0;url=http://localhost:8084/angelos/login.jsp'/></html>");
    }
%>
<%
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();

        String sql = "select * from student_details where stid=" + session.getAttribute("userid");
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            String file = resultSet.getString("stfile");
%>   
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Student Details</title>
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">
                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon rotate-n-15">
                    </div>
                    <img class="stanglogo"src="pic/logo.jpg" width="180px" height="50px"/></a>
                <!-- Divider -->
                <hr class="sidebar-divider my-0">
                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link">
                        <i class=" mx-3 fas fa-bw fa-book"></i>
                        <span class="deskfont">Student Desk</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div class="sidebar-heading">
                    Student
                </div>
                <!--My Details Nav -->
                <li class="nav-item active">
                    <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-user-circle"></i>
                        <span>My Details</span>
                    </a>
                    <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item active" href="student_details.jsp">Student Details</a>
                            <a class="collapse-item" href="batch_details.jsp">Batch Details</a>
                        </div>
                    </div>
                </li>
                <!--Exam nav -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                        <i class="fas fa-book-reader"></i>
                        <span>Examination</span>
                    </a>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Exam Self Help:</h6>
                            <a class="collapse-item" href="exam.jsp">Exam Details</a>
                            <a class="collapse-item" href="practicalbook.jsp">Practical Exam Booking</a>
                            <a class="collapse-item" href="theorybook.jsp">Theory Exam Booking</a>
                        </div>
                    </div>
                </li>
                <!--Download nav -->
                <li class="nav-item">
                    <a class="nav-link" href="download.jsp">
                        <i class="fas fa-download"></i>
                        <span>Download</span></a>
                </li>
                <!--Self Help Nav-->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-pen"></i>
                        <span>Queries</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Student Self Help:</h6>
                            <a class="collapse-item" href="batch_req.jsp">Batch Requirements</a>
                            <a class="collapse-item" href="queries.jsp">Queries/Complaint</a>
                            <a class="collapse-item" href="break.jsp">Leave Application</a>
                        </div>
                    </div>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div class="sidebar-heading">
                    Account
                </div>
                <!--Change Password nav-->
                <li class="nav-item">
                    <a class="nav-link" href="changepass.jsp">
                        <i class="fas fa-unlock"></i>
                        <span>Change Password</span></a>
                </li>
                <!-- Nav Item - Logout -->
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#logoutModal">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </ul>
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
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=resultSet.getString("stname")%></span>
                                    <img class="img-profile rounded-circle" src="profilephoto\<%=file%>" width="60px" height="60px">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="student_details.jsp">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logout.jsp" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <h1 class="h3 mb-4 text-danger font-weight-bold text-center">Student Details</h1>
                        <div class="row">
                            <div class="col-lg-4"></div>
                            <div class="col-lg-4">
                                <div class="card shadow mb-3">
                                    <div class="card-header py-3"><center>
                                            <img class="img-profile rounded-circle" src="profilephoto\<%=file%>" width="100px" height="100px"><br>
                                            <span class="m-0 text-danger display-4"><%=resultSet.getString("stname")%></span></center>
                                    </div>
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item">Addmission Id : <%=resultSet.getInt("stid")%></li>
                                            <li class="list-group-item">Contact Details : <%=resultSet.getString("stphone")%></li>
                                            <li class="list-group-item">Email:<%=resultSet.getString("stemail")%></li>
                                            <li class="list-group-item">Admission Date : <%=resultSet.getString("stadmission")%></li>
                                            <li class="list-group-item">Course Taken : <%=resultSet.getString("stcourse")%></li>
                                        </ul>
                                    </div>
                                </div>
                                <%
                                    }
                                        connection.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </div>
                        </div>
                            <br/>
                           <div class="row">
                            <div class="col-md-3 col-lg-3"></div>
                            <div class="col-md-6 col-lg-6">
                                  <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-danger">Fees list</h6>
                        </div>
                        <div class="card-body">
                            <form method="post" action="printprocess.jsp">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Transaction id</th>
                                                <th>Fees paid</th>
                                                <th>Total Fees</th>
                                                <th>Fees Due</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody> 
                                            <%
                                                try {
                                                    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                                                    statement = connection.createStatement();
                                                    String sql5 = "select * from fees as F join student_details as SD on F.stid=SD.stid where F.stid="+session.getAttribute("userid");
                                                   
                                                    resultSet= statement.executeQuery(sql5);
                                                    while (resultSet.next()) {

                                            %>
                                        <input type="hidden" name="stid" value="<%=resultSet.getString("stid")%>"> 
                                         <input type="hidden" name="stname" value="<%=resultSet.getString("stname")%>"> 
                                        <tr>
                                            <td>Q-<%=resultSet.getString("id")%></td>
                                            <td><%=resultSet.getString("feespaid")%></td>
                                            <td><%=resultSet.getString("total")%></td>
                                            <td><%=resultSet.getString("feesdue")%></td>
                                            <td><%=resultSet.getString("dt")%></td>
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
                            </form>
                        </div>    
                    </div>
                                
                            </div>  
                    </div>
                    <!-- /.container-fluid -->
                </div>
                                        <br/>
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
                        <a class="btn btn-primary" href="logout.jsp">Logout</a>
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
    </body>
</html>
