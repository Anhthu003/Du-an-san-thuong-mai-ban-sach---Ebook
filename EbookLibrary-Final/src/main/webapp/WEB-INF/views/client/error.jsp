<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<style>

    /* Reset some default styles */
body, h1, p, a {
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Arial', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f2f2f2;
    color: #333;
}

.container {
    text-align: center;
    background: white;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 10px 20px rgba(0,0,0,0.1);
}

.error h1 {
    font-size: 10rem;
    margin-bottom: 20px;
    color: #ff6b6b;
}

.error p {
    font-size: 1.5rem;
    margin-bottom: 20px;
}

.button {
    display: inline-block;
    padding: 10px 20px;
    font-size: 1rem;
    color: white;
    background-color: #ff6b6b;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

.button:hover {
    background-color: #ff3b3b;
}

</style>
    <div class="container">
        <div class="error">
            <h1>404</h1>
            <p>Oops! The page you are looking for does not exist.</p>
            <a href="/user/home" class="button">Go Home</a>
        </div>
    </div>
</body>
</html>