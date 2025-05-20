<%@ page import="java.sql.*, model.DataCon" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String joinRoomName = request.getParameter("roomname");

    if (joinRoomName != null && !joinRoomName.trim().isEmpty()) {
        DataCon ob = new DataCon();
        Connection conn = ob.getConn();
        String checkQuery = "SELECT 1 FROM room WHERE name = ?";
        try (PreparedStatement stmt = conn.prepareStatement(checkQuery)) {
            stmt.setString(1, joinRoomName);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                session.setAttribute("roomname", joinRoomName);
                response.sendRedirect("letschat.jsp");
            } else {
                out.println("<script>alert('Room does not exist!'); window.location='joinroom.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error occurred while joining.'); window.location='joinroom.jsp';</script>");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Join Room</title>
    <style>
        body {
            background-color: #eef2f5;
            font-family: Arial;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .join-box {
            background-color: #fff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.3);
            text-align: center;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            font-size: 16px;
            border-radius: 6px;
        }

        input[type="submit"] {
            background-color: #0072ff;
            color: white;
            border: none;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="join-box">
    <h2>Join Existing Room</h2>
    <form method="post">
        <input type="text" name="roomname" placeholder="Enter Room Name" required />
        <input type="submit" value="Join Room" />
    </form>
</div>
</body>
</html>
