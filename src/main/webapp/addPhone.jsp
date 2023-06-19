<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 6/19/2023
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>ADD new PHONE</title>
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

    #header h2 {
      margin: 0;
    }

    #container {
      margin: 20px;
    }

    h3 {
      color: #333;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    td {
      padding: 10px;
    }

    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    input[type="text"], select {
      width: 200px;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    .save,
    .reset {
      background-color: #4CAF50;
      color: #fff;
      border: none;
      padding: 10px 20px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin-top: 10px;
    }

    .reset {
      background-color: #f44336;
      margin-left: 10px;
    }

    p a {
      color: #333;
      text-decoration: none;
    }

    p a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div id="wrapper">
  <div id="header">
    <h2>CodeLean Academy</h2>
  </div>
</div>

<div id="container">
  <h3>Add Student</h3>
  <form action="phone" method="POST" enctype="multipart/form-data">
    <input type="hidden" value="ADD" name="command">
    <table>
      <tbody>
      <tr>
        <td><label> Name:</label></td>
        <td><input type="text" name="name"></td>
      </tr>
      <tr>
        <td><label>Price:</label></td>
        <td><input type="text" name="price"></td>
      </tr>
      <tr>
        <td><label>Brand:</label></td>
        <td>
          <select name="brand">
            <option value="">Select a brand</option>
            <option value="Apple">Apple</option>
            <option value="Samsung">Samsung</option>
            <option value="Nokia">Nokia</option>
          </select>
        </td>
      </tr>
      <tr>
        <td><label>Description:</label></td>
        <td><input type="text" name="description"></td>
      </tr>
      <tr>
        <td><label></label></td>
        <td>
          <input type="submit" value="Save" class="save">
          <input type="reset" value="Reset" class="reset">
        </td>
      </tr>
      </tbody>
    </table>
  </form>
  <div style="clear: both"></div>
  <p>
    <a href="/phone">Back to List</a>
  </p>
</div>

</body>
</html>
