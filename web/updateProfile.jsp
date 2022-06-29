<%-- 
    Document   : updateProfile
    Created on : Jun 2, 2022, 4:23:21 PM
    Author     : thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plant Shop</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />

    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            if (name == null) {


        %>
        <p><font color="red"> you must login to update profile</font></p>
        <p></p>
        <%        } else {
        %>
        <header>
            <%@include  file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= name%> come back</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
        </section>
        <section>
            <form action="mainController" method="post">
                <table>
                    <tr>
                        <td>Full name</td>
                        <td><input type="text" name="txtfullname" /></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><input type="text" name="txtphone" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="update" name="action"/></td>
                    </tr>
                </table>
            </form>
            <p><font color="red"><%= request.getAttribute("error") != null ? request.getAttribute("error") : ""%></font></p>
        </section>
        <footer>
            <%@include  file="footer.jsp" %>
        </footer>
        <%}%>
    </body>
</html>
