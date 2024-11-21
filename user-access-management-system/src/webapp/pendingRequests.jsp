<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Pending Requests</title>
</head>
<body>
    <h2>Pending Access Requests</h2>
    <form action="ApprovalServlet" method="post">
        <table border="1">
            <thead>
                <tr>
                    <th>Employee Name</th>
                    <th>Software</th>
                    <th>Access Type</th>
                    <th>Reason</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = com.example.useraccess.utils.DatabaseUtils.getConnection()) {
                        String sql = "SELECT r.id AS request_id, u.username, s.name AS software_name, r.access_type, r.reason " +
                                     "FROM requests r " +
                                     "JOIN users u ON r.user_id = u.id " +
                                     "JOIN software s ON r.software_id = s.id " +
                                     "WHERE r.status = 'Pending'";
                        PreparedStatement stmt = conn.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getString("software_name") %></td>
                        <td><%= rs.getString("access_type") %></td>
                        <td><%= rs.getString("reason") %></td>
                        <td>
                            <button type="submit" name="action" value="approve" formaction="ApprovalServlet?request_id=<%= rs.getInt("request_id") %>">Approve</button>
                            <button type="submit" name="action" value="reject" formaction="ApprovalServlet?request_id=<%= rs.getInt("request_id") %>">Reject</button>
                        </td>
                    </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </form>
</body>
</html>
