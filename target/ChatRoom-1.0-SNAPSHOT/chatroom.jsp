<%@ page import="java.sql.*" %>
<%@ page import="model.DataCon" %>
<%@ page import="javax.servlet.http.HttpSession" %>  <!-- ? Make sure this is added -->

<%
    String roomname = request.getParameter("roomname");

    if (roomname == null || roomname.trim().isEmpty() || roomname.length() > 10) {
        out.println("<script>alert('Room name is too big or missing!'); window.location='index.jsp';</script>");
    } else if (!detectSpecial(roomname)) {
        out.println("<script>alert('Special characters are not allowed!'); window.location='index.jsp';</script>");
    } else {
        DataCon ob = new DataCon();
        Connection conn = ob.getConn();

        if (conn != null) {
            String checkQuery = "SELECT 1 FROM room WHERE name = ?";
            String insertQuery = "INSERT INTO room (name) VALUES (?)";

            try (
                PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery)
            ) {
                checkStmt.setString(1, roomname);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    out.println("<script>alert('Room name already exists!'); window.location='index.jsp';</script>");
                } else {
                    insertStmt.setString(1, roomname);
                    insertStmt.executeUpdate();

                    // ? Properly use session to store the room name
                    
                    session.setAttribute("roomname", roomname);

                    response.sendRedirect("letschat.jsp");
                }

                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>alert('Error occurred!'); window.location='index.jsp';</script>");
            }
        } else {
            out.println("<script>alert('Database connection failed!'); window.location='index.jsp';</script>");
        }
    }
%>

<%!
    public boolean detectSpecial(String str) {
        for (char ch : str.toCharArray()) {
            if (!Character.isLetterOrDigit(ch)) {
                return false;
            }
        }
        return true;
    }
%>
