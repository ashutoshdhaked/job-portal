<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>go forward.com</title>
    <link rel="stylesheet" href="sineupemployee.css">
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
        <form action="EmployeeMultipart" method="post" enctype="multipart/form-data" class="form">
          <div><h2>SineUp &nbsp;Employee</h2>
             <h4><span name="error" value=${message}></span></h4>
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
        <label for="cname">Enter your college name: <input type="text" name="college" id="cname" size="100"></label>
        <label for="course">Enter your specialaization: <input type="text" name="course" id="course" size="100"></label>
        <label for="ten">Enter your 10th marks : <input type="number" name="ten" id="ten" size="4"></label>
        <label for="twelve">Enter your 12th marks: <input type="number" name="twelve" id="twelve" size="4"></label>
        <label for="degree">Enter your degree marks: <input type="number" name="degree" id="degree" size="4"></label>  
      </div><hr>
     <div class="wor_info">
        <label>your work experience :
            <select name="experience">
              <option value="">(select one)</option>
              <option value="1-2">1 - 2 year</option>
              <option value="2-4">2 - 4 year</option>
              <option value="5">more than 4 year</option>
              <option value="no">No experience</option>
            </select>
          </label>
        <label for="skill">Enter your skills :<input type="text" name="skill" id="skill" size="150"></label>
     </div><hr>
     <div class="image">
        <label for="profileimage">Upload profile picture:</label>
        <input type="file" name="image" value="imagename" id="profileimage" required>
     </div><hr>
     <div class="resumeupload">
       <label for="resume">upload your resume <input type="file" name="resume" value="resumename" id="resume" required></label>

     </div><hr>
     <div class="submitbutton">
      <input type="submit" value="submit">
    </div>
    </form>
      </main>
    
</body>
</html>