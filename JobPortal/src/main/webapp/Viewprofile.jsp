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
    <link rel="stylesheet" href="Viewprofile.css">
<% 
String id = (String)session.getAttribute("id");
String username = (String)session.getAttribute("username");
String imagename = (String)session.getAttribute("imagename");
EmployeeUseBean rb = (EmployeeUseBean)session.getAttribute("employeedata");
session.setAttribute("resumename",rb.getResumename());
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
                  <hr>
                   <option value="logout">Logout</option> 
           </select>
        </div>
        </div>

     <main class="main">
    <h1>Profile</h1>
    
    <img src=<%=path%> alt="Image">
    
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Resume</th>
        </tr>
        <tr>
            <td><%=rb.getName()%></td>
            <td><%=rb.getEmail()%></td>
            <td><form action="DownloadResume" method="post"><button type="submit">DownLoad Resume</button></form></td>
        </tr>
        <hr>
        <tr>
          <th>Username</th>
          <th>Age</th>
          <th>Phone</th>
      </tr>
      <tr>
          <td><%=rb.getUsername()%></td>
          <td><%=rb.getAge()%></td>
          <td><%=rb.getPhone()%></td>
      </tr>
    
      <tr>
        <th>Address</th>
        <th>College Name</th>
        <th>Stream</th>
    </tr>
    <tr>
        <td><%=rb.getAddress()%></td>
        <td><%=rb.getCollege()%></td>
        <td><%=rb.getCourse()%></td>
    </tr>
  
    <tr>
      <th>10th marks</th>
      <th>12th marks</th>
      <th>Degree Marks</th>
  </tr>
  <tr>
      <td><%=rb.getTen()%></td>
      <td><%=rb.getTwelve()%></td>
      <td><%=rb.getDegree()%></td>
  </tr>
  <tr>
    <th>Experience</th>
    <th>Skill</th>
</tr>
<tr>
    <td><%=rb.getExperience()%></td>
    <td><%=rb.getSkill()%></td>
</tr>
    </table>
</main>
</body>
</html>