<%@page import="adminpanel.AdminUseBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>go forward.com</title>
    <link rel="stylesheet" href="EditAdminProfile.css">
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
    
    function updateValue(input) {
    	  input.setAttribute('value', input.value);
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
                   <option value="logout">Logout</option> 
           </select>
        </div>
        </div>
 
 
 <main class="main">
    <h1>Profile</h1>
    <form action="AllowAdminToEdit" method="post" enctype="multipart/form-data">
        <div class="image">
    <img src=<%=path%> alt="Image">
    <label for="image">Edit picture<input type="file" name="image" id="image" value="<%=arb.getImagename()%>" oninput="updateValue(this)" required></label>
      </div>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Username</th>
        </tr>
        <tr> 
            <td><input type="text" name="name" oninput="updateValue(this)" size="100" value="<%=arb.getName()%>"></td>
            <td><input type="text" name="email" oninput="updateValue(this)" size="100" value="<%=arb.getEmail()%>"></td>
             <td><input type="text" name="username"  oninput="updateValue(this)" size="100" value="<%=arb.getUsername()%>"></td>
           
        </tr>
        <hr>
        <tr>
          <th>Age</th>
          <th>Phone</th>
          <th>Address</th>
      </tr>
      <tr>
          <td><input type="text" name="age"  oninput="updateValue(this)" size="5"value="<%=arb.getAge()%>"></td>
          <td><input type="text" name="phone"  oninput="updateValue(this)"size="20" value="<%=arb.getPhone()%>"></td>
          <td><input type="text" name="address"  oninput="updateValue(this)" size="200" value="<%=arb.getAddress()%>"></td>
      </tr>
    
      <tr>
        <th>Company Name</th>
        <th>Location</th>
        <th>Job Post</th>
    </tr>
    <tr>
        <td><input type="text" name="companyname"  oninput="updateValue(this)" size="200" value="<%=arb.getCompanyname()%>"></td>
        <td><input type="text" name="location"  oninput="updateValue(this)" size="100" value="<%=arb.getLocation()%>"></td>
         <td><input type="text" name="jobpost"  oninput="updateValue(this)" size="5"value="<%=arb.getJobpost()%>"></td>
    </tr>
     <tr>
        <th>password</th>
    </tr>
    <tr>
        <td><input type="text" name="password"  oninput="updateValue(this)" size="25" value="<%=arb.getPassword()%>"></td>
    </tr>
    </table>

       <div class="submitbutton">
        <label for="pass">Enter your Current password :<input type="text" name="usergivenpassword" id="pass" required></label>
      <input type="submit" value="submit">
      <div>
</form>
</main>

</body>
</html>