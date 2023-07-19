<%@page import="adminpanel.AdminUseBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>go forward.com</title>
    <link rel="stylesheet" href="adminviewprofile.css">
    <title>go forward.com</title>
 <% 
String id = (String)session.getAttribute("id");
String username = (String)session.getAttribute("username");
String imagename = (String)session.getAttribute("imagename");
AdminUseBean arb = (AdminUseBean)session.getAttribute("Admindata");
String path="downloads//"+imagename;
%> 
<script>
    function handleOption(selectedValue) {
        if (selectedValue === 'adminviewprofile') {
            window.location.href = 'Adminviewprofile.jsp';
        } else if (selectedValue === 'admineditProfile') {
            window.location.href = 'EditAdminProfile.jsp';
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
            <a href="admincards.jsp">Applied Users</a>
            <a href="createcard.jsp">Create card</a>
          </div>
          <div class="profile">
            <select onchange="handleOption(this.value)">
                  <option value="none">profile</option>
                  <option value="adminviewprofile">view profile</option>
                  <option value="admineditProfile">edit profile</option>
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
            <th>Username</th>
        </tr>
        <tr>
            <td><%=arb.getName()%></td>
            <td><%=arb.getEmail()%></td>
            <td><%=arb.getUsername()%></td>
        </tr>
        <hr>
        <tr> 
          <th>Age</th>
          <th>Phone</th>
          <th>Address</th>
      </tr>
      <tr>    
          <td><%=arb.getAge()%></td>
          <td><%=arb.getPhone()%></td>
          <td><%=arb.getAddress()%></td>
      </tr>
    
      <tr>
        <th>CompanyName</th>
        <th>Location</th>
        <th>Job Post</th>
    </tr>
    <tr>
        <td><%=arb.getCompanyname()%></td>
        <td><%=arb.getAddress()%></td>
        <td><%=arb.getJobpost()%></td>
    </tr>
  
   
    </table>
</main>
</body>
</html>