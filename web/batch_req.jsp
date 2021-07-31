<%@page import="java.sql.*"%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "stangelos";
    String userid = "root";
    String password = "";

    if (session.getAttribute("userid") == null) {
        out.println("<script>");
        out.println("alert('Session not found');");
        out.println("</script>");
        out.println("<html><meta http-equiv='refresh' content='0;url=http://localhost:8084/angelos/login.jsp'/></html>");
    }

    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<!--Photo fetch-->
<%     try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        String sql1 = "select * from student_details where stid=" + session.getAttribute("userid");
        resultSet = statement.executeQuery(sql1);
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
        <title>Batch Requirements</title>

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
                <!-- Details Nav -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-user-circle"></i>
                        <span>My Details</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="student_details.jsp">Student Details</a>
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
                <!-- Query Nav -->
                <li class="nav-item  active">
                    <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-pen"></i>
                        <span>Queries</span>
                    </a>
                    <div id="collapseUtilities" class="collapse show" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Student Self Help:</h6>
                            <a class="collapse-item active" href="batch_req.jsp">Batch Requirements</a>
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
                <!-- Nav Item - Password -->
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
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <!-- End of Topbar -->
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <h1 class="h3 mb-4 text-danger font-weight-bold text-center">Batch Requirements</h1>
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-6">
                                <!-- Batch Requirements Form -->
                                <div class="card shadow mb-3">
                                    <div class="card-body">
                                        <form action="batchrequire" method="post">
                                            <ul class="list-group">
                                                <div class="input-group">
                                                    <input type="hidden" class="form-control" name="stid" value="<%=resultSet.getString("stid")%>">
                                                    <input type="hidden" class="form-control" name="email" value="<%=resultSet.getString("stemail")%>">
                                                    <input type="hidden" class="form-control" name="phone" value="<%=resultSet.getString("stphone")%>">
                                                </div>
                                                <%
                                                        }
                                                        connection.close();
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <label class="input-group-text" for="inputGroupSelect01">Preferred Time #1</label>
                                                    </div>
                                                    <select  name="time1" class="custom-select" required>
                                                        <option selected>Select</option>
                                                        <option value="8:00 AM">8:00 AM</option>
                                                        <option value="11:00 AM">11:00 AM</option>
                                                        <option value="4:00 PM">4:00 PM</option>
                                                    </select>
                                                    <div class="input-group-prepend">
                                                        <label class="input-group-text" for="inputGroupSelect01">To</label>
                                                    </div>
                                                    <select  name="time2" class="custom-select" required>
                                                        <option selected required>Select</option>
                                                        <option value="9:00 AM">9:00 AM</option>
                                                        <option value="10:00 AM">10:00 AM</option>
                                                        <option value="12:00 PM">12:00 PM</option>
                                                        <option value="1:00 PM">1:00 PM</option>
                                                        <option value="5:00 PM">5:00 PM</option>
                                                        <option value="6:00 PM">6:00 PM</option>
                                                    </select>    
                                                </div><br>

                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <label class="input-group-text" for="inputGroupSelect01">Preferred Time #2</label>
                                                    </div>
                                                    <select name="time3" class="custom-select" required>
                                                        <option selected required>Select</option>
                                                        <option value="8:00 AM">8:00 AM</option>
                                                        <option value="11:00 AM">11:00 AM</option>
                                                        <option value="4:00 PM">4:00 PM</option>
                                                    </select>
                                                    <div class="input-group-prepend">
                                                        <label class="input-group-text" for="inputGroupSelect01">To</label>
                                                    </div>
                                                    <select name="time4" class="custom-select" required>
                                                        <option selected required>Select</option>
                                                        <option value="9:00 AM">9:00 AM</option>
                                                        <option value="10:00 AM">10:00 AM</option>
                                                        <option value="12:00 PM">12:00 PM</option>
                                                        <option value="1:00 PM">1:00 PM</option>
                                                        <option value="5:00 PM">5:00 PM</option>
                                                        <option value="6:00 PM">6:00 PM</option>
                                                    </select>    
                                                </div><br>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <label class="input-group-text" >Course Name</label>
                                                    </div>
                                                    <select name="course" class="custom-select" required>
                                                        <option selected>Select</option>
                                                        <option value="BCA">BCA</option>
                                                        <option value="SAIG">SAIG</option>
                                                        <option value="SAIP Hardware">SAIP Hardware</option>
                                                    </select></div>
                                            </ul>
                                            <br><div class="d-flex justify-content-center"><button type="submit" class="btn btn-danger btn-lg center">Submit</button>   </div>
                                        </form>
                                    </div>
                                </div>
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
