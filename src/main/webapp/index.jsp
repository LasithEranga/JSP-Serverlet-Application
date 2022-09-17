<%-- 
    Document   : index
    Created on : Sep 17, 2022, 12:20:07 PM
    Author     : Lasith
--%>


<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 id="content">Hello World!</h1>
        <%
            ArrayList<Task> userList = (ArrayList<Task>) request.getAttribute("taskList");
            Iterator<Task> iter = userList.iterator();
            while (iter.hasNext()) {

               // Task task = iter.next();
            }
        %>
        
        <script>
            const users = ${users};
            document.getElementById("content").innerHTML = users.name;
        </script> 
        
    </body>
</html>
