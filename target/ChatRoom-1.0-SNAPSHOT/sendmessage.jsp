<%@ page import="java.sql.*, model.DataCon" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String roomname = request.getParameter("roomname");
    String message = request.getParameter("message");
    String username = (String) session.getAttribute("username"); // Get the username from session

    if (roomname != null && message != null && username != null &&
        !roomname.trim().isEmpty() && !message.trim().isEmpty() && !username.trim().isEmpty()) {

        Connection conn = null;
        PreparedStatement insertStmt = null;
        try {
            DataCon ob = new DataCon();
            conn = ob.getConn();

            if (conn != null) {
                String insertQuery = "INSERT INTO messages (username, roomname, message) VALUES (?, ?, ?)";
                insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setString(1, username);
                insertStmt.setString(2, roomname);
                insertStmt.setString(3, message);
                insertStmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (insertStmt != null) insertStmt.close();
            if (conn != null) conn.close();
        }
    }
%>
