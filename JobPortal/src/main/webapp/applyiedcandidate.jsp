<%@page import="applyingprocedure.GetDataOfUserForAdmin"%>
<%@page import="applyingprocedure.UserData"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>go forward.com </title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="applyiedcandidate.css">
<%
String cardid = request.getParameter("cardid");
Vector<UserData> v = GetDataOfUserForAdmin.getdata(cardid);

%>
</head>
<body>
<div class="header">
    <a href="adminsection.jsp" class="back-button"><i class="bi bi-arrow-left-circle-fill"></i></a>
    <h2>Here is your candidates who are apply for this job </h2>
  </div>
        <main>
            <table>
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>College Name</th>
                    <th>Stream</th>
                    <th>10th Marks</th>
                    <th>12th Marks</th>
                    <th>Degree Marks</th>
                    <th>Experience</th>
                    <th>Skills</th>
                    <th>Resume</th>
                  </tr>
                </thead>
                <tbody>
                <%for(UserData ud : v){ 
                %>
                  <tr>
                    <td><%=ud.name%></td>
                    <td><%=ud.email%></td>
                    <td><%=ud.phone%></td>
                    <td><%=ud.address%></td>
                    <td><%=ud.collegename%></td>
                    <td><%=ud.stream%></td>
                    <td><%=ud.ten%></td>
                    <td><%=ud.twelve%></td>
                    <td><%=ud.degree%></td>
                    <td><%=ud.experience%></td>
                    <td><%=ud.skill%></td>
                    <td><a href="DownloadResumeforadmin?resumename=<%=ud.resumename%>">DownLoad Resume</td>
                  </tr>
                <%} %>
                </tbody>
              </table>
        </main>           
</body>
</html>