<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>go forward.com</title>
    <link rel="stylesheet" href="sineupadmin.css">
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
        <form action="AdminMultipart" method="post" enctype="multipart/form-data" class="form">
          <div><h2>SineUp &nbsp;Admin</h2>
             <h4><span name="error" value=${errormessage}></span></h4>
          </div>
        <div class="par_info">
            <label for="name">Enter your name: <input type="text" name="name" id="name" size="50" required></label>
            <label for="username">Enter your username: <input type="text" name="username" size="50"id="username" required></label>
            <label for="email">Enter your email: <input type="email" name="email" size="100"id="email" required></label>
            <label for="age">Enter your age: <input type="number" name="age" id="age" size="2" ></label>
            <label for="phone">Enter your phone no. : <input type="number" name="phone" id="phone" size="12" required></label>
            <label for="address">Enter your address:<input type="text" name="address" id="address" size="100"></label>
            <label for="password">Enter your password: <input type="text" name="password" id="password" pattern="[a-z0-9]{8,}" required></label>
        </div><hr>
      <div class="edu_info">
        <label for="companyname">Enter your company name :<input type="text" name="companyname" id="companyname" size="200" required><label>
         <label for="post">Enter your Job Post :<input type="text" name="jobpost" id="post" size="200" required><label>
        <label for="location">Enter your work Location :<input type="text" name="location" id="location" size="200" required></label>
        </div><hr>
     <div class="image">
        <label for="profileimage">Upload profile picture:</label>
        <input type="file" name="image" value="imagename" id="profileimage"  required>
     </div><hr>
     <div class="submitbutton">
      <input type="submit" value="submit">
    </div>
    </form>
      </main>
    
</body>
</html>