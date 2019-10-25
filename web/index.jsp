<%-- 
    Document   : Index
    Created on : Oct 24, 2019, 8:22:38 AM
    Author     : Aseprudin
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="models.Region"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>     
<html>
    <head>
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="fontawesome/css/all.css" type="text/css" />
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>




        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Region Form</title>


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

    <body>

        <div class="d-flex" id="wrapper">

            <!-- Sidebar -->
            <div class="bg-light border-right" id="sidebar-wrapper">
                <div class="sidebar-heading">Region </div>
                <div class="list-group list-group-flush">
                    <a href="index.jsp" class="list-group-item list-group-item-action bg-light">Dashboard</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a>
                </div>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <button class="btn btn-primary ml-1" id="menu-toggle">Menu</button>



                    <a class="navbar-brand ml-3" href="index.jsp"><h2> Region Form</h2></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </nav>
                <br>

                <div class="container-fluid">
                    <div class="container">

                        <!-- Button to Open the Modal -->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#saveRegion">
                            New Region
                        </button>

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
                                                <button type="submit" class="btn btn-success border-dark" id="saveR">Submit</button>
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

                    <div class="container">

                        <!-- The Modal -->
                        <div class="modal fade" id="updateRegion">
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
                                                <input type="number" class="form-control" id="regionId" name="regionId" placeholder="Region ID" value="<%=(r != null) ? r.getId() : ""%>" disabled="">
                                            </div>
                                            <div>
                                                <label for="regionId">Region Name:</label>
                                                <input type="text" class="form-control" id="regionName" name="regionName" placeholder="Region Name" value="<%=(r != null) ? r.getName() : ""%>">
                                            </div>
                                            <div>
                                                <br>
                                                <button type="submit" class="btn btn-success border-dark">Update</button>
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

                    <br>

                    <div class="container">
                        <table class="table table-bordered table-hover">
                            <thead>
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

                                        <a data-toggle="modal" data-target="#updateRegion" class="btn btn-info" href="regionservlet?action=update&id=<%=region.getId()%>">
                                            <i class="fas fa-edit" aria-hidden="true"></i> Update</a>
                                        <a class="btn btn-danger" href="regionservlet?action=delete&id=<%=region.getId()%>">
                                            <i class="fas fa-trash-alt" aria-hidden="true"></i> Delete</a>
                <!--                            <a class="" aria-hidden="true" href="regionservlet?action=update&id=<%=region.getId()%>"> <u>Update</u></a>-->
                <!--                            <a class=""  href="regionservlet?action=delete&id=<%=region.getId()%>">Delete</a>-->

                                    </td>
                                </tr>
                                <%  }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!--        <button type="button" id="tombol">Klik</button>-->
        <!--        JS Script-->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });

            

            
        </script>



        <!-- Menu Toggle Script -->
        <div class="container">

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
                                    <button type="submit" class="btn btn-success border-dark">Submit</button>
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
