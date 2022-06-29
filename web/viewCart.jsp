<%-- Document : viewCart Created on : Jun 16, 2022, 9:40:27 PM Author : thanhtra
--%> 
<%@page import="model.Plant"%>
<%@page import="dao.PlantDao"%>
<%@page import="model.OrderDetail"%>
<%@page import="dao.OrderDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Plant Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <section>
            <%
                int total = 0;
                String name = (String) session.getAttribute("name");
                if (name != null) {
            %>
            <h3>Welcome <%= session.getAttribute("name")%> come back</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
            <h3><a href="personalPage.jsp">Personal page</a></h3>
            <%    }
            %>
            <font style="color: red"><%= request.getAttribute("WARNING") == null ? "" : (String) request.getAttribute("WARNING")%></font>

            <table width="100%" class="shopping" >
                <tr>
                    <td>Product id</td>
                    <td>Image</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Action</td> 
                </tr>
                <%
                    HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                    if (cart != null) {
                        for (String pid : cart.keySet()) {
                            int quantity = cart.get(pid);
                            Plant plant = PlantDao.getPlantByID(Integer.parseInt(pid));
                            total = total + plant.getPrice() * quantity;
                %>
                <form action="mainController" method="post">
                    <tr>
                        <td>
                            <input type="hidden" value="<%= pid%>" name="pid"><a href="getPlantServlet?pid=<%=pid%>"><%=pid%></a>
                        </td>
                        <td>
                            <img src="<%= plant.getImgpath()%>"  class='plantimg'/>
                        </td>
                        <td>
                            <%= plant.getPrice()%>
                        </td>
                        <td>
                            <input type="number" value="<%= quantity%>" name="quantity">  </td>
                        <td>
                            <input type="submit" value="delete" name="action"/>
                            <input type="submit" value="updatecart" name="action"/>
                        </td>

                    </tr>
                </form>
                <%
                    }
                } else {
                %>
                <tr>
                    <td>Your cart is empty</td>
                </tr>
                <%                    }
                %>
                <tr>
                    <td>Total money: </td>
                </tr>
                <tr>
                    <td>Order date: <%=new Date(System.currentTimeMillis())%></td>
                </tr>
            </table>
        </section>
        <section>
            <h3>Total: <%= total%></h3>
            <form action="mainController" method="post">
                <input type="submit" value="saveOrder" name="action"/>
            </form>
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>
