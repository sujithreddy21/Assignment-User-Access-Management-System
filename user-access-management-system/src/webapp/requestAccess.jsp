<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Request Access</title>
</head>
<body>
    <h2>Request Access to Software</h2>
    <form action="RequestServlet" method="post">
        <label for="software_id">Software:</label>
        <select id="software_id" name="software_id" required>
            <%
                try (Connection conn = com.example.useraccess.utils.DatabaseUtils.getConnection()) {
                    String sql = "SELECT id, name FROM software";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
            %>
                        <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select><br><br>

        <label for="access_type">Access Type:</label>
        <select id="access_type" name="access_type" required>
            <option value="Read">Read</option>
            <option value="Write">Write</option>
            <option value="Admin">Admin</option>
        </select><br><br>

        <label for="reason">Reason for Request:</label>
        <textarea id="reason" name="reason" rows="4" cols="50" required></textarea><br><br>

        <button type="submit">Submit Request</button>
    </form>

    <% if (request.getParameter("success") != null) { %>
        <p>Request submitted successfully!</p>
    <% } %>
</body>
</html>
