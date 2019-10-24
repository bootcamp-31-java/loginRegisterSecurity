<%-- 
    Document   : TestJspTable
    Created on : Oct 24, 2019, 12:09:57 AM
    Author     : Aseprudin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }
            th, td {
                padding: 5px;
                text-align: left;
            }
        </style>
        <title>JSP Page</title>
    </head>

    <body>
        <h2>Table JSP</h2>
        <p>Sedang Mencoba Table</p>

        <table style="width:100%">
            <caption>Monthly savings</caption>
            <tr>
                <th>No</th>
                <th>Month</th>
                <th>Savings</th>
            </tr>
            <tr>
                <td>1</td>
                <td>January</td>
                <td>$100</td>
            </tr>
            <tr>
                <td>2</td>
                <td>February</td>
                <td>$50</td>
            </tr>
        </table>

    </body>
</html>
