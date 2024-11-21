<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Create Software</title>
</head>
<body>
    <h2>Create New Software</h2>
    <form action="SoftwareServlet" method="post">
        <label for="name">Software Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" cols="50" required></textarea><br><br>

        <label>Access Levels:</label><br>
        <input type="checkbox" name="access_levels" value="Read"> Read<br>
        <input type="checkbox" name="access_levels" value="Write"> Write<br>
        <input type="checkbox" name="access_levels" value="Admin"> Admin<br><br>

        <button type="submit">Create</button>
    </form>

    <% if (request.getParameter("success") != null) { %>
        <p>Software created successfully!</p>
    <% } %>
</body>
</html>
