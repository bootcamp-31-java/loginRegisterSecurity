<%-- 
    Document   : Index
    Created on : Oct 24, 2019, 8:22:38 AM
    Author     : Rezaditya
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="models.Region"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Region Form</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!--  MY-->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="fontawesome/css/all.css" type="text/css" />
    <link href="css/simple-sidebar.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"></script>
    <script src="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  </head>

  <!--Initialize-->
  <%
    List<Region> regions = (List<Region>) session.getAttribute("regions");

    Region r = (Region) session.getAttribute("region");

    if (regions != null) {
      //          if (r == null) {
      //                 r =  new Region(new BigDecimal(0),"");
      //              }

  %>
  <!--End of Initialize-->

  <body id="page-top">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <a class="navbar-brand mr-1" href="index.jsp">Region Form</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

      <!-- Navbar Hi kamu -->
      <%//allow access only if session exists
        String user = null;
        if (session.getAttribute("user") == null) {
          response.sendRedirect("login.jsp");
        } else {
          user = (String) session.getAttribute("user");
        }
        String userName = null;
        String sessionID = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
          for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) {
              userName = cookie.getValue();
            }
            if (cookie.getName().equals("JSESSIONID")) {
              sessionID = cookie.getValue();
            }
          }
        }
      %>
      <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      </form>
      <!--<label>Hi <%=userName%>, Login successful. Your Session ID=<%=sessionID%></label>-->
      <span class="badge badge-primary"><h6>Hi <%=userName%>, Login successful.</h6></span>
      
      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow mx-1">
          <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-bell fa-fw"></i>
            <span class="badge badge-danger">9+</span>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
          <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-envelope fa-fw"></i>
            <span class="badge badge-danger">7</span>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
            <a class="dropdown-item" href="#">Settings</a>
            <a class="dropdown-item" href="#">Activity Log</a>
            <div class="dropdown-divider"></div>
            <form>
              
            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
            </form>
          </div>
        </li>
      </ul>

    </nav>

    <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Pages</span>
          </a>
          <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header">Login Screens:</h6>
            <a class="dropdown-item" href="login.jsp">Login</a>
            <a class="dropdown-item" href="register.jsp">Register</a>
            <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
            <div class="dropdown-divider"></div>
            <h6 class="dropdown-header">Other Pages:</h6>
            <a class="dropdown-item" href="404.html">404 Page</a>
            <a class="dropdown-item" href="blank.html">Blank Page</a>
          </div>
        </li>
        <!--        <li class="nav-item">
                  <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
                </li>-->
      </ul>

      <div id="content-wrapper">

        <div class="container-fluid">

          <!--         Breadcrumbs
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="#">Dashboard -</a>
                    </li>
                    <li class="breadcrumb-item active">Overview</li>
                  </ol>-->

          <!-- Button to Open the Modal -->
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#saveRegion">
            New Region
          </button>
          <br>

          <!-- The Modal -->
          <div class="modal fade" id="saveRegion">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content container">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">Form Region</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>


                <!-- Modal body -->
                <div class="container">
                  <form name="RegionForm" action="regionservlet" method="POST">
                    <div class="form-group">
                      <label for="regionId">Region Id:</label>
                      <input  type="number" class="form-control" id="regionId" name="regionId" placeholder="Region ID" value="<%=(r != null) ? r.getId() : ""%>">
                    </div>
                    <div>
                      <label for="regionId">Region Name:</label>
                      <input type="text" class="form-control" id="regionName" name="regionName" placeholder="Region Name" value="<%=(r != null) ? r.getName() : ""%>">
                    </div>
                    <div>
                      <br>
                      <button type="submit" class="btn btn-success border-dark" id="savealert">Submit</button>
                    </div>
                  </form>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>

              </div>
            </div>
          </div>
        </div>

        <% if (session.getAttribute("regions") != null) {
            for (Region region : regions) {%>

        <div class="container">

          <!-- The Modal -->
          <div class="modal fade" id="updateRegion<%=region.getId()%>">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content container">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">Form Region</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="container">
                  <form name="RegionForm" action="regionservlet" method="POST">
                    <div class="form-group">
                      <label for="regionId" >Region Id:</label>
                      <input type="number" class="form-control" id="regionId" name="regionId" placeholder="Region ID" value="<%=region.getId()%>" readonly>
                    </div>
                    <div>
                      <label for="regionId">Region Name:</label>
                      <input type="text" class="form-control" id="regionName" name="regionName" placeholder="Region Name" value="<%=region.getName()%>">
                    </div>
                    <div>
                      <br>
                      <button type="submit" id="buttonUpdate" class="btn btn-success border-dark">Update</button>
                    </div>
                  </form>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <%}
          }
        %>

        <!-- DataTables Example -->
        <br>
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table Region</div>
          <div class="card-body">
            <div class="table-responsive">
              <table id="dataTables" class="table table-bordered">
                <thead class="table-dark" align="center">
                  <tr>
                    <th>No</th>
                    <th>Region Id</th>
                    <th>Region Name</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <%
                    int record = 1;
                    for (Region region : regions) {
                  %>
                  <tr>
                    <td><%=record++%></td>
                    <td><%=region.getId()%></td>
                    <td><%=region.getName()%></td>
                    <td>
                      <a data-toggle="modal" data-target="#updateRegion<%=region.getId()%>" class="btn btn-info">
                        <i class="fas fa-edit" aria-hidden="true"></i> Update</a>
                      <a class="btn btn-danger" id="alertDelete" href="regionservlet?action=delete&id=<%=region.getId()%>">
                        <i class="fas fa-trash-alt" aria-hidden="true"></i>Delete</a>

                      <!--                      <button class="btn btn-dark" onclick="return Swal.fire({
                                                  type: 'warning',
                                                  title: 'delete this',
                                                  text: 'Something went wrong!',
                                                  footer: '<button href=regionservlet?action=delete&id=<%=region.getId()%>>why do i have this issue?</button>'
                                                })">coba alert</button>-->
                    </td>
                  </tr>
                  <%}%>
                </tbody>
              </table>
            </div>
          </div>
          <!--          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>-->
        </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
            <footer class="sticky-footer">
              <div class="container my-auto">
                <div class="copyright text-center my-auto">
                  <!--<span>Copyright © 2019</span>-->
                  <label>User=<%=user%> Your Session ID=<%=sessionID%></label>
                </div>
              </div>
            </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

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
        <form action="logoutservlet" method="post">
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <input type="submit" value="Logout" >
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/chart.js/Chart.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>

  <!--DataTables Bootstrap-->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>

  <script>
    $(document).ready(function () {
      var t = $('#dataTables').DataTable({
        "columnDefs": [{
            "searchable": false,
            "orderable": false,
            "targets": 0
          }],
        "order": [[1, 'asc']]
      });
      t.on('order.dt search.dt', function () {
        t.column(0, {search: 'applied', order: 'applied'}).nodes().each(function (cell, i) {
          cell.innerHTML = i + 1;
        });
      }).draw();
    });
  </script>

  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js\"></script>
  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>
  <!--  <script>
                          $("#savealert").ready(function () {
                            swal('Saved', 'Save Success', 'success')
                          });
    </script>-->

  <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
  <!--  <script>
                          $("#alertDelete").click(function (e) {
                            Swal.fire({
                              title: 'Are you sure?',
                              text: "You won't be able to revert this!",
                              type: 'warning',
                              showCancelButton: true,
                              confirmButtonColor: '#3085d6',
                              cancelButtonColor: '#d33',
                              confirmButtonText: 'Yes, delete it!'
  
                            }).then((result) => {
                              if (result.value) {
                                Swal.fire(
                                        'Deleted!',
                                        'Your file has been deleted.',
                                        'success'
                                        )
                              }
                            })
                          });
    </script>-->

</body>

<!--Destroy Session-->
<%
  } else {
    response.sendRedirect("regionservlet");
  }
  session.removeAttribute("regions");
  session.removeAttribute("region");

%>
<!--End of Destroy Session-->

</html>
