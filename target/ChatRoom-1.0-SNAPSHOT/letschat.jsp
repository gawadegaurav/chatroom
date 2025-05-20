<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Get room name from session
    String roomname = (String) session.getAttribute("roomname");

    // Default to "Unknown" if not set
    if (roomname == null || roomname.trim().isEmpty()) {
        roomname = "Unknown";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chat Room: <%= roomname %></title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #eef2f5;
            margin: 0;
            padding: 0;
        }

        .chat-container {
            max-width: 700px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #333;
        }

        h3 {
            color: #555;
        }

        .chat-box {
            height: 300px;
            background: #fafafa;
            border: 1px solid #ccc;
            border-radius: 10px;
            overflow-y: scroll;
            padding: 15px;
            margin-bottom: 20px;
            text-align: left;
        }

        input[type="text"] {
            width: 70%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-right: 10px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        @media (max-width: 600px) {
            input[type="text"], input[type="submit"] {
                width: 100%;
                margin: 10px 0;
            }
        }
    </style>

    <script>
        // Auto-refresh chat every 1 second
        setInterval(loadmessage, 1000);

        function loadmessage() {
            $.post("loadmessage.jsp", {
                roomname: "<%= roomname %>"
            }, function (data) {
                $(".chat-box").html(data);
            });
        }

        $(document).ready(function () {
            $("#send").click(function () {
                var message = $("#message").val().trim();
                if (message !== "") {
                    $.post("sendmessage.jsp", {
                        roomname: "<%= roomname %>",
                        message: message
                    }, function () {
                        $("#message").val(""); // Clear input
                        loadmessage(); // Optionally refresh immediately
                    });
                }
            });

            // Enter key to send message
            $("#message").keypress(function (e) {
                if (e.which === 13) {
                    $("#send").click();
                }
            });
        });
    </script>
</head>
<body>
    <div class="chat-container">
        <h1>Welcome to Chat Room!</h1>
        <h3>Room Name: <%= roomname %></h3>
        <div class="chat-box"></div>
        <input type="text" id="message" placeholder="Type your message here..." />
        <input type="submit" value="Send" id="send" />
    </div>
</body>
</html>
