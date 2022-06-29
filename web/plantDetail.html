<%-- 
    Document   : plantDetail
    Created on : Jun 19, 2022, 1:11:51 AM
    Author     : thanhtra
--%>

<%@page import="model.Plant"%>
<%@page import="dao.PlantDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Plant Shop</title>
    <link rel="stylesheet" href="mycss.css" type="text/css" />

</head>
<body>
    <header>
        <%@include  file="header.jsp" %>
    </header>
    <section>
        <%
            String[] tmp = {"Out of stock", "Availiable"};
            String pid = request.getParameter("pid");
            Plant plant = PlantDao.getPlantByID(Integer.parseInt(pid.trim()));
            if (plant != null) {
        %>

        <table>
            <tr>
                <td>Image</td>
                <td>Plant name</td>
                <td>Price</td>
                <td>Status</td>
                <td>Category</td>
            </tr>
            <tr>
                <td><img src="<%= plant.getImgpath()%>" class="plantimg"/></td>
                <td><%= plant.getName()%></td>
                <td><%= plant.getPrice()%></td>
                <td><%= tmp[plant.getStatus()]%></td>
                <td><%= plant.getCatename()%></td> 
                <td><a href="mainController?action=addtocart&pid=<%= plant.getId()%>">Add to cart</a></td>
            </tr>
        </table>

        <%
            }
        %>
    </section>
    <footer>
        <%@include  file="footer.jsp" %>
    </footer>
</body>
</html>