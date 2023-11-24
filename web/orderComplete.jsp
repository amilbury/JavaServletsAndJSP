<%-- 
    Document   : orderComplete
    Created on : Nov 14, 2023, 10:21:07 a.m.
    Author     : amilb
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Your order is being processed</h1>
        <c:set var = "total" value="${total}"></c:set>
        <h3>${total}</h3>
    </body>
</html>
