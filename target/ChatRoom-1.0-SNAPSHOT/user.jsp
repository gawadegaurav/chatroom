<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Enter User Name</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-box {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        input[type="text"] {
            padding: 10px;
            width: 200px;
            margin-bottom: 20px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #0072ff;
            color: white;
            border: none;
            border-radius: 5px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="form-box">
    <h2>Enter Your Name</h2>
    <form action="roomoption.jsp" method="get">
        <input type="text" name="username" placeholder="Your name" required />
        <br />
        <input type="submit" value="Continue" />
    </form>
</div>
</body>
</html>
