<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="loginemployee.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
  <header class="head">
    <div class="left">
      <b><i>go forward.com</i></b>
    </div>
    <div class="otherpage">
      <a href="index.html">Home</a>
      <a href="aboutus.html">About Us</a>
      <a href="contact.html">Contact info</a>
      <a href="loginemployee.jsp">Latest jobs</a>
      <a href="loginadmin.jsp">Hiring</a>
    </div>
  </header>
  <main class="main">
  <div class="container">
    <h1>Login Employee</h1>
    <form action="EmployeeLogin" method="post">
      <div class="input-group">
        <input type="email" id="email" name="email" required>
        <label for="email">Email</label>
      </div>
      <div class="input-group">
        <input type="password" id="password" name="password" required>
        <label for="password">Password</label>
      </div>
      <div class="errormessage"><span name="span" value=${message}></span></div>
      <button type="submit" class="submit-btn">Submit</button>
     
      <div class="forgot-password">
        <a href="#">Forgot Password?</a>
      </div>

    </form>
    <div class="social-login">
      <a href="#"><button class="social-btn"><i class="fa fa-google"></i> Sign up with Google</button></a><hr>
      <a href="#"><button class="social-btn"><i class="fa fa-facebook"></i> Sign up with Facebook</button></a>
    </div>
  </div>
</main>
</body>
</html>
    