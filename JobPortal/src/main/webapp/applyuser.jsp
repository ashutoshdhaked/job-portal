<%@page import="employeepanel.ApplyUser"%>
<%@page import="comman.CardData"%>
<%@page import="comman.GetCardData"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>go forward.com</title>
<style>
    body {
      font-family: Arial, sans-serif;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .success-message {
      background-color: #4CAF50;
      color: #FFF;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.2);
      animation-name: successAnimation;
      animation-duration: 3s;
      animation-fill-mode: forwards;
      opacity: 0;
    }
     .unsuccess-message {
      background-color: #bf1e16;
      color: #FFF;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.2);
      animation-name: successAnimation;
      animation-duration: 3s;
      animation-fill-mode: forwards;
      opacity: 0;
    }
    .back{
    background-color: #333;
    text-align: center;
    margin-left: 30px;
     border-radius: 5px ;
  }
  .back a{
    color: #FFF;
    text-decoration: none;
    padding: 20px;
    font-size: 30px;
    border-radius: 5px ;
    margin-top:100px; 
  }
  .back a:hover{
    color: rgb(1, 1, 79);
  }
    @keyframes successAnimation {
      0% {
        opacity: 0;
        transform: translateY(50px);
      }

      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }
   
  </style>
</head>
<%
Vector <CardData> v =GetCardData.getdata();
String mycardid = request.getParameter("cardid");
CardData cd = null;
for(CardData x :v){
	String s = "'"+x.cardid+"'";
	if(s.equals(mycardid)){
		cd = x;
	}
}
String userid = (String)session.getAttribute("id");
boolean check = ApplyUser.apply(cd.adminid, userid, cd.cardid);
%>
<body>
 <div class="back">
         <a href="employeesection.jsp" >Click Here Go Back</a>
      </div>
      
<div class="container">
    <div class="success-message">
      <% if(check) {%>
      <h1>Application Successful!</h1>
      <p>Thank you for submitting your application. We will review it and get back to you soon.</p>
        </div>
      <%}else{ %>
      <div class="unsuccess-message">
       <h1>Sorry! UnSuccessful</h1>
      <p>There is any issue to submit your application or may be you already applied for this job.</p>
      </div>
      <%} %>
  </div>
</body>
</html>