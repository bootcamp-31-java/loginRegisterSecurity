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
        <h2>Region Forms</h2>

        <form name="RegionForm" action="regionservlet" method="POST">
            <table border="0" width="2" cellspacing="2">
                <tbody>
                    <tr>
                        <td>Region ID</td>
                        <td><input type="text" name="regionId" value="<%=(r!=null)?r.getId():"" %>" /></td>
                    </tr>
                    <tr>
                        <td>Region Name</td>
                        <td><input type="text" name="regionName" value="<%=(r!=null)?r.getName():"" %>"/></td>
                    </tr>
                    <tr>
                        <td> <input type="submit" value="Save" name="save"  /></td>
                    </tr>
                </tbody>
            </table>
        </form>

        <table border="1">
            <thead>
                <tr>
                    <th>Nomor</th>
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
                    <td><%=record++ %></td>
                    <td><%=region.getId() %></td>
                    <td><%=region.getName() %></td>
                    <td>
                        <a href="regionservlet?action=update&id=<%=region.getId() %>">Update</a>
                        <a href="regionservlet?action=delete&id=<%=region.getId() %>">Delete</a>
                    </td>
                </tr>
                <%  } %>
            </tbody>
        </table>

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
