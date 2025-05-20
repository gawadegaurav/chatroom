<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    session.setAttribute("username", username);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Room Options</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .options-box {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            text-align: center;
        }
        a {
            display: block;
            margin: 15px 0;
            padding: 12px;
            background-color: #0072ff;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="options-box">
    <h2>Welcome, <%= username %>!</h2>
    <a href="index.jsp">Create a Room</a>
    <a href="joinroom.jsp">Join a Room</a>
</div>
</body>
</html>
