<%-- 
    Document   : orderDetail
    Created on : Jun 18, 2022, 8:57:02 PM
    Author     : thanhtra
--%>

<%@page import="dao.OrderDao"%>
<%@page import="model.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plant Shop</title>
    </head>
    <body>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            if (name == null) {


        %>
        <p><font color="red"> You must login to view personal page</font></p>
        <p></p>
        <%        } else {
        %>
        <header>
            <%@include  file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome ${name} come back</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
            <h3><a href="personalPage.jsp">View all orders</a></h3>
        </section>
        <section>
            <%
                String orderid = request.getParameter("orderid");
                if (orderid != null) {
                    int orderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> list = OrderDao.getOrderDetail(orderID);
                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail detail : list) {
            %>
            <table>
                <tr>
                    <td>Order ID</td>
                    <td>Plant ID</td>
                    <td>Plant Name</td>
                    <td>Image</td>
                    <td>Quantity</td>
                </tr>
                <tr>
                    <td><%= detail.getOrderID()%></td>
                    <td><%= detail.getPlantID()%></td>
                    <td><%= detail.getPlantName()%></td>
                    <td><img src="<%= detail.getImgPath()%>" class="plantimg"/> <br/> <%= detail.getPrice()%></td>
                    <td><%= detail.getQuantity()%></td>
                    <% money = money + detail.getPrice() * detail.getQuantity();%>
                </tr>
            </table>

            <%
                }
            %>
            <h3>Total money: ${money}</h3>
            <%
            } else {
            %>
            <p>You don't have any order</p>
            <%
                    }
                }

            %>
        </section>
        <%            }
        %>
        <footer>
            <%@include  file="footer.jsp" %>
        </footer>
    </body>
</html>
