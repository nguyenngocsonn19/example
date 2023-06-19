<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 6/19/2023
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Phone List</title>
    <style>
        /* CSS rules go here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        #wrapper {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }

        #header h1 {
            margin: 0;
        }

        #container {
            margin: 20px;
        }

        .add-phone-button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <header id="header">
        <h1>Code Lean</h1>
    </header>
</div>

<div id="container">
    <div id="content">
        <input type="button" value="Add Phone" onclick="window.location.href='addPhone.jsp'; return false;" class="add-phone-button" />

        <table>
            <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Brand</th>
                <th>Description</th>
            </tr>

            <c:forEach var="tempPhone" items="${PHONE_LIST}">
                <tr>
                    <td>${tempPhone.name}</td>
                    <td>${tempPhone.price}</td>
                    <td>${tempPhone.brand}</td>
                    <td>${tempPhone.description}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>
</body>
</html>
