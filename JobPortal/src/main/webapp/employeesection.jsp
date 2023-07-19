<%@page import="comman.CardData"%>
<%@page import="comman.GetCardData"%>
<%@page import="java.util.Vector"%>
<%@page import="employeepanel.EmployeeUseBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>go forward.com</title>
    <link rel="stylesheet" href="employeesection.css">
<% 
Vector<CardData> v = GetCardData.getdata();
String id = (String)session.getAttribute("id");
String username = (String)session.getAttribute("username");
String imagename = (String)session.getAttribute("imagename");
EmployeeUseBean rb = (EmployeeUseBean)session.getAttribute("employeedata");
String path="downloads//"+imagename;
%>
<script>
    function handleOption(selectedValue) {
        if (selectedValue === 'viewprofile') {
            window.location.href = 'Viewprofile.jsp';
        } else if (selectedValue === 'editProfile') {
            window.location.href = 'EditEmployeeProfile.jsp';
        }
        else if (selectedValue === 'logout') {
            window.location.href = 'logout.jsp';
        }
    }
</script>
</head>
<body>

    <div class="header">
        <img src=<%=path%> alt="Profile Picture">
        <h1>Welcome &nbsp;<i><%=username%></i></h1>
        <div class="links">
            <a href="applied.jsp">Applied</a>
            <a href="employeesection.jsp">Apply Now</a>
          </div>
          <div class="profile">
            <select onchange="handleOption(this.value)">
                  <option value="none">profile</option>
                  <option value="viewprofile">view profile</option>
                  <option value="editProfile">edit profile</option> 
                  <option value="logout">Logout</option> 
           </select>
        </div>
        </div>
        
        
  <div class="main">
  <%for(CardData cd :v){ 
	  String pathforimage="downloads//"+cd.cardimagename;
    %>
        <div class="card">
            <img src=<%=pathforimage%> alt="Image ">
            <h3><%=cd.companyname %></h3>
            <p><%=cd.experience %></p>
            <p><%=cd.location%></p>
            <a href="applyuser.jsp?cardid='<%=cd.cardid%>'">Apply</a>
            <a href="AboutCard.jsp?cardid='<%=cd.cardid%>'">About more</a>
        </div>
   <% }%>
    
    </div>
</body>
</html>
    