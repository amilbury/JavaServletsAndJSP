<%-- 
    Document   : showOrders
    Created on : Nov 12, 2023, 3:46:57 p.m.
    Author     : amilb
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>A1-Milbury</title>
        <style>
            table, th, td {
                border: solid thin gray;
                border-collapse: collapse;
            }
            
            td, th {
                padding: 10px;
            }
            </style>
    </head>
    <body>
        <form action="ProcessOrder">
        <button type="submit">Checkout</button>
        <table>
            <tr><th>Part Number</th><th>Description</th><th>Resolution</th><th>Size</th><th>Refresh Rate</th>
                <th>IPS</th><th>Price</th><th>Quantity</th></tr>
            <c:set var = "index" value = "0"></c:set>
            <c:forEach var="o" items="${orders}">
                <tr>
                    <td>${o.monitor.partNum}</td>
                    <td>${o.monitor.description}</td>
                    <td>${o.monitor.resolution}</td>
                    <td>${o.monitor.size}</td>
                    <td>${o.monitor.refreshRate}</td>
                    <td>${o.monitor.ips}</td>
                    <td>${o.monitor.price}</td>
                    <td><input type="number" min="0" name="quantity${index}"></input></td>
                    <c:set var = "index"  value= "${index + 1}"></c:set>
            </c:forEach>
        </table>
      </form>
    </body>
</html>
