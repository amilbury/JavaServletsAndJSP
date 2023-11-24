<%-- 
    Document   : checkout
    Created on : Nov 12, 2023, 9:28:50 p.m.
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
        <h1>Checkout</h1>
        <form action="showOrders.jsp">
            <button type ="submit">Continue Shopping</button>
        </form>
        <form action="orderComplete.jsp">
        <button type="submit">Buy It</button>
        <table>
            <tr><th>Part Number</th><th>Description</th><th>Price</th><th>Quantity</th><th>Cost</th></tr>
            <c:set var = "price" value = "${totalP}"></c:set>
            <c:set var = "hst" value = "${hst}"></c:set>
            <c:set var = "gTotal" value = "${total}"></c:set>
            <c:forEach var="o" items="${checkout}">
                <tr>
                    <c:set var = "cost" value = "${o.monitor.price*o.quantity}"></c:set>
                    <td>${o.monitor.partNum}</td>
                    <td>${o.monitor.description}</td>
                    <td>${o.monitor.price}</td>
                    <td>${o.quantity}</td>
                    <td>${cost}</td>
                </tr>
            </c:forEach>
                <tr>
                    <td>Sub-Total</td>
                    <td>${price}</td>
               </tr>
                <tr>
                    <td>HST</td>
                    <td>${hst}</td>
               </tr>
                <tr>
                    <td>Total</td>
                    <td>${gTotal}</td>
               </tr>
        </table>
      </form>
    </body>
</html>
