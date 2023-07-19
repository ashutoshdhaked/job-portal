<%@page import="employeepanel.EmployeeUseBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>go forward.com</title>
    <link rel="stylesheet" href="EditEmployeeProfile.css">
     <% 
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

    function updateValue(input) {
  input.setAttribute('value', input.value);
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
     <main class="main">
    <h1>Profile</h1>
    <form action="AllowEmployeeToEdit" method="post" enctype="multipart/form-data">
        <div class="image">
    <img src=<%=path%> alt="Image">
    <label for="image">Edit picture<input type="file" name="image" id="image" value="<%=rb.getImagename()%>" oninput="updateValue(this)" required></label>
      </div>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Resume</th>
        </tr>
        <tr> 
            <td><input type="text" name="name" oninput="updateValue(this)" size="100" value="<%=rb.getName()%>"></td>
            <td><input type="text" name="email" oninput="updateValue(this)" size="100" value="<%=rb.getEmail()%>"></td>
            <td><a href="DownloadResume?resumename=<%=rb.getResumename()%>">Download Resume</a>
                <label for="resume">Edit resume<input type="file" name="resume" id="resume" value="<%=rb.getResumename()%>" oninput="updateValue(this)" required></label>
            </td>
        </tr>
        <hr>
        <tr>
          <th>Username</th>
          <th>Age</th>
          <th>Phone</th>
      </tr>
      <tr>
          <td><input type="text" name="username"  oninput="updateValue(this)" size="100" value="<%=rb.getUsername()%>"></td>
          <td><input type="text" name="age"  oninput="updateValue(this)" size="5"value="<%=rb.getAge()%>"></td>
          <td><input type="text" name="phone"  oninput="updateValue(this)"size="20" value="<%=rb.getPhone()%>"></td>
      </tr>
    
      <tr>
        <th>Address</th>
        <th>College Name</th>
        <th>Stream</th>
    </tr>
    <tr>
        <td><input type="text" name="address"  oninput="updateValue(this)" size="200" value="<%=rb.getAddress()%>"></td>
        <td><input type="text" name="college"  oninput="updateValue(this)" size="200" value="<%=rb.getCollege()%>"></td>
        <td><input type="text" name="course"  oninput="updateValue(this)" size="100" value="<%=rb.getCourse()%>"></td>
    </tr>
  
    <tr>
      <th>10th marks</th>
      <th>12th marks</th>
      <th>Degree Marks</th>
  </tr>
  <tr>
      <td><input type="text" name="ten"  oninput="updateValue(this)" size="5"value="<%=rb.getTen()%>"></td>
      <td><input type="text" name="twelve  oninput=" updateValue(this)" size="5"value="<%=rb.getTwelve()%>"></td>
      <td><input type="text" name="degree"  oninput="updateValue(this)" size="5" value="<%=rb.getDegree()%>"></td>
  </tr>
  <tr>
    <th>Experience</th>
    <th>Skill</th>
    <th>password</th>
</tr>
<tr>
    <td><input type="text" name="experience"  oninput="updateValue(this)" size="200" value="<%=rb.getExperience()%>"></td>
    <td><input type="text" name="skill"  oninput="updateValue(this)" size="300" value="<%=rb.getSkill()%>"></td>
    <td><input type="text" name="password"   oninput="updateValue(this)" size="25"value="<%=rb.getPassword()%>"></td>
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