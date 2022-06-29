<%-- 
    Document   : index
    Created on : Jun 2, 2022, 1:23:24 AM
    Author     : thanh
--%>

<%@page import="dao.PlantDao"%>
<%@page import="model.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                String keyword = request.getParameter("txtsearch");
                String searchby = request.getParameter("searchby");
                ArrayList<Plant> list;
                String[] tmp = {"out of stock", "availiable"};
                if (keyword == null && searchby == null) {
                    list = PlantDao.getPlants("", "");
                } else {
                    list = PlantDao.getPlants(keyword, searchby);
                }
                if (list != null && !list.isEmpty()) {
                    for (Plant plant : list) {
            %>
            <table class="product">
                <tr>
                    <td><img src="<%= plant.getImgpath()%>" class="plantimg"/></td>
                    <td>Product ID:<%= plant.getId()%></td>
                    <td>Product name:<%= plant.getName()%></td>
                    <td>Price:<%= plant.getPrice()%></td>
                    <td>Status:<%= tmp[plant.getStatus()]%></td>
                    <td>Category:<%= plant.getCatename()%></td> 
                    <td><a href="mainController?action=addtocart&pid=<%=plant.getId()%>">Add to cart</a></td>
                </tr>
            </table>
            <%
                    }
                }
            %>
        </section>
        <footer>
            <%@include  file="footer.jsp" %>
        </footer>
    </body>
</html>
