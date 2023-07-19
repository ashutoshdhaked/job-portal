<%@page import="comman.CardData"%>
<%@page import="java.util.Vector"%>
<%@page import="applyingprocedure.GetDataOfCreateCard"%>
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
    <link rel="stylesheet" href="adminsection.css">
    <title>go forward.com</title>
 <% 
String id = (String)session.getAttribute("id");
String username = (String)session.getAttribute("username");
String imagename = (String)session.getAttribute("imagename");
AdminUseBean arb = (AdminUseBean)session.getAttribute("Admindata");
Vector<CardData> v = GetDataOfCreateCard.getdata(id);
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
                  <option value="logout">Logout</option>
           </select>
        </div>
        </div>

        
  <div class="main">       
         <%for(CardData cd :v){ 
	  String pathforimage="downloads//"+cd.cardimagename;

        %>
        <div class="card">
            <img src=<%=pathforimage%> alt="Image" >
            <h3><%=cd.companyname %></h3>
            <p><%=cd.experience %></p>
            <p><%=cd.location%></p>
            <a href="AboutCard.jsp?cardid='<%=cd.cardid%>'">About more</a>
        </div>
        
   <% }%>
    
    </div>    
</body>
</html>
    