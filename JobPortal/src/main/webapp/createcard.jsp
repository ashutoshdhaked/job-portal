<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
String message = request.getParameter("message");
%>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>go forward.com</title>
  <style>
    *{
    margin: 0%;
    padding: 0%;
       }
  
     .header {
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
      background-color: #333;
    }
    
    .back-button {
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fff;
      text-decoration: none;
      margin-right: 10px;
    }
    
    .back-button i {
      font-size: 30px;
    }
    
    .back-button i:hover{
      color: #0b0355;
    }

    h2 {
      text-align: center;
      color: #fff;
      font-size: 24px;
    }
    
    /* Media Queries for responsiveness */
    @media (max-width: 768px) {
      .header {
        flex-direction: column;
        padding: 10px;
      }
    }
     
  
  
  
    .container {
      display: flex;
    }
   
    .sidebar {
      width: 200px;
      background: #f2f2f2;
      padding: 20px;
    }

    .main-content {
      flex: 1;
      padding: 20px;
    }
    .main-content h1 {
        text-align: center;
        color: rgb(4,4,51);
    }
    .main-content h2 {
        
        color: rgb(0, 0, 16);
    }
    .nav {
      font-size:20px;
      display: flex;
    
    }
    .nav input{
     justify-content: center;
     width: 400px;

    }
   .nav hr{
     border: 1px solid #0f0ab2;
     height: 35px;
    } 

    .skill{
      border: 1px solid #ccc;
      margin-bottom: 20px;
      padding: 10px;
       font-size: 20px;
      max-width: max-content;
    }
    .aboutpost{
      border: 1px solid #ccc;
      margin-bottom: 20px;
      padding: 10px;
       font-size: 20px;
      max-width: max-content;
    }
    .aboutcompany{
      border: 1px solid #ccc;
      margin-bottom: 20px;
      padding: 10px;
       font-size: 20px;
      max-width: max-content;
    }
    .main-content div:hover{
        border: 2px solid #333;
    }
    .sbtn{
      text-align: center;
      max-width: max-content;
    }
    .sbtn button{
      padding: 10px;
      border-radius: 5px;
      color: aliceblue;
      background-color: #333;
      font-size: 20px;
    }
  </style>
</head>
<body>
<div class="header">
    <a href="adminsection.jsp" class="back-button"><i class="bi bi-arrow-left-circle-fill"></i></a>
    <h2>Create your Card Here  </h2>
  </div>

 <form action="CarddataToDatabase" method="post" enctype="multipart/form-data">
  <div class="container">
    <div class="sidebar">
      <h2>Custom Page Builder</h2>
    </div>
    <div class="main-content">
      <h1>Design your page</h1>
      <h2><span value=<%=message%>></span></h2>
   <hr>
   <nav class="nav">
   <label for="companyname">Enter your Company Name :&nbsp;&nbsp;&nbsp;<input type="text" name="cardcompanyname" id="companyname"  
    required></label>
    <hr>
      <label for="experience">Enter your required experience :&nbsp;&nbsp;&nbsp;<input type="text" name="cardexperience" id="experience"  
        required></label>
        <hr>
        <label for="worklocation">Enter your Work Location  :&nbsp;&nbsp;&nbsp;<input type="text" name="cardlocation" id="worjlocation"
          required></label>
          <hr>
        </nav>
      <div class="skill">
        <label for="myTextArea">write about required skills :</label>
    <textarea id="myTextArea" name="cardskill" rows="20" cols="100"></textarea>
      </div>
      <div class="aboutpost">
        <label for="myTextArea">write post descrption:</label>
    <textarea id="myTextArea" name="cardjobpost" rows="20" cols="100"></textarea>
      </div>
      <div class="aboutcompany">
        <label for="myTextArea">write company descryption:</label>
    <textarea id="myTextArea"  name="cardcompany"  rows="20" cols="100"></textarea>
      </div>
      <hr>
      <label for="cardimage">upload  cardimage: &nbsp;&nbsp;<input type="file" name="cardimage" id="cardimage"></label>
      <hr>
      <div class="sbtn">
        <button  type="submit"onclick="saveData()"> Submit</button>
      </div>
    </div>
  </div>
</form>
</body>
</html>