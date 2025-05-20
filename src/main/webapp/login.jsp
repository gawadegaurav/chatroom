<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login / Signup</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial;
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
        }
        .login-box {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #0072ff;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="login-box">
    <h2>Login / Signup</h2>
    <form action="roomoption.jsp" method="post">
        <input type="text" name="username" placeholder="Enter your name" required />
        <input type="submit" value="Continue" />
    </form>
</div>
</body>
</html>
