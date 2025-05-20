<%@ page import="java.sql.*, model.DataCon" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String roomname = request.getParameter("roomname");

    if (roomname != null && !roomname.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            DataCon ob = new DataCon();
            conn = ob.getConn();

            // Select username and message from the messages table
            String query = "SELECT username, message FROM messages WHERE roomname = ? ORDER BY id ASC";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, roomname);
            rs = stmt.executeQuery();

            while (rs.next()) {
                String username = rs.getString("username");
                String message = rs.getString("message");
                out.println("<div class='container2'><strong>" + username + ":</strong> " + message + "</div>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
%>
