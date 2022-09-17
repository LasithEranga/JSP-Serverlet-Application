<%-- 
    Document   : NewJsp
    Created on : Sep 17, 2022, 2:44:53 PM
    Author     : Lasith
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Expense"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            List<Expense> expenses = (List<Expense>) request.getAttribute("expenses");
            for (int i=0; i<expenses.size(); i++){
            %>
            <p> 
                <%= expenses.get(i).getTitle() %> <%= expenses.get(i).getDescription()%>
            </p>
           
            <%}%>
    </body>
</html>
