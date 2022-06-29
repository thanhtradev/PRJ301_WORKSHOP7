<%-- 
    Document   : personalPage
    Created on : Jun 2, 2022, 2:07:02 AM
    Author     : thanh
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.AccountDao"%>
<%@page import="model.Account"%>
<%@page import="dao.OrderDao"%>
<%@page import="model.Order"%>
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
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            Cookie[] c = request.getCookies();
            boolean login = false;

            if (name == null) {
                String token = "";
                for (Cookie aCookie : c) {
                    if (aCookie.getName().equals("seclector")) {
                        token = aCookie.getValue();
                        Account acc = AccountDao.getAccount(token);
                        if (acc != null) {
                            name = acc.getFullname();
                            email = acc.getEmail();
                            login = true;
                        }
                    }
                }
            } else {
                login = true;
            }
            if (!login) {

        %>
        <p><font color="red"> you must login to view personal page</font></p>
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
            <!-- Load all order at here -->
            <%
                String[] status = {"", "Processing", "Completed", "Canceled"};
                String statusFilter = request.getParameter("status") == null ? "" : request.getParameter("status");
                String fromDateString = request.getParameter("from");
                String toDateString = request.getParameter("to");
                ArrayList<Order> list = OrderDao.getOrders(email);
                if (list != null || !list.isEmpty()) {
                    for (Order ord : list) {
                        if (fromDateString == null || fromDateString.isEmpty()) {
                            /// if Date filter = null
                            if (!statusFilter.equals("")) {
                                // If status filter not null
                                if (status[ord.getStatus()].equalsIgnoreCase(statusFilter)) {

            %>
            <table class="order">
                <tr><td>Order ID</td> <td>Order Date</td> <td>Ship Date</td><td>Order's Status</td><td>Action</td></tr>
                <tr>
                    <td><%= ord.getOrderId()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate()%></td>
                    <td><%= status[ord.getStatus()]%>
                        <br/>
                        <% if (ord.getStatus() == 1)%> <a href="#" > Cancel order</a>
                        <%
                            if (ord.getStatus() == 3) {
                        %> 
                        <a href="mainController?action=reorder&orderid=<%= ord.getOrderId()%>&status=1" > Re-order</a>
                        <%
                                }
                        %>
                    </td>
                    <td><a href="orderDetail.jsp?orderid=<%= ord.getOrderId()%>">Detail</a></td>
                </tr>
            </table>

            <%
                } // close filter by status
            } // close if status filter not null
            else {
                // if status = "" show all order
            %>
            <table class="order">
                <tr><td>Order ID</td> <td>Order Date</td> <td>Ship Date</td><td>Order's Status</td><td>Action</td></tr>
                <tr>
                    <td><%= ord.getOrderId()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate()%></td>
                    <td><%= status[ord.getStatus()]%>
                        <br/>
                        <% if (ord.getStatus() == 1)%> <a href="#" > Cancel order</a>
                        <% if (ord.getStatus() == 3) {%> <a href="mainController?action=reorder&orderid=<%= ord.getOrderId()%>&status=1" > Re-order</a>
                        <% }%>
                    </td>
                    <td><a href="orderDetail.jsp?orderid=<%= ord.getOrderId()%>">Detail</a></td>
                </tr>
            </table>
            <%
                } // close show all order
            } // close if date filter = null
            else {
                // show order by date
                String orderDateString = ord.getOrderDate();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date orderDate = dateFormat.parse(orderDateString);
                Date fromDate = dateFormat.parse(fromDateString);
                if (toDateString != null && !toDateString.isEmpty()) {
                    Date toDate = dateFormat.parse(toDateString);
                    if (orderDate.compareTo(fromDate) >= 0 && orderDate.compareTo(toDate) <= 0) {
                        // show order in fromdate andto date

            %>
            <table class="order">
                <tr><td>Order ID</td> <td>Order Date</td> <td>Ship Date</td><td>Order's Status</td><td>Action</td></tr>
                <tr>
                    <td><%= ord.getOrderId()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate()%></td>
                    <td><%= status[ord.getStatus()]%>
                        <br/>
                        <% if (ord.getStatus() == 1)%> <a href="#" > Cancel order</a>
                        <% if (ord.getStatus() == 3) {%> <a href="mainController?action=reorder&orderid=<%= ord.getOrderId()%>&status=1" > Re-order</a>
                        <% }%>
                    </td>
                    <td><a href="orderDetail.jsp?orderid=<%= ord.getOrderId()%>">Detail</a></td>
                </tr>
            </table>
            <%
                } // close check if toDate is null
            } else if (orderDate.compareTo(fromDate) >= 0) {
                //show order only after fromdate

            %>
            <table class="order">
                <tr><td>Order ID</td> <td>Order Date</td> <td>Ship Date</td><td>Order's Status</td><td>Action</td></tr>
                <tr>
                    <td><%= ord.getOrderId()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate()%></td>
                    <td><%= status[ord.getStatus()]%>
                        <br/>
                        <% if (ord.getStatus() == 1)%> <a href="#" > Cancel order</a>
                        <% if (ord.getStatus() == 3) {%> <a href="mainController?action=reorder&orderid=<%= ord.getOrderId()%>&status=1" > Re-order</a>
                        <% }%>
                    </td>
                    <td><a href="orderDetail.jsp?orderid=<%= ord.getOrderId()%>">Detail</a></td>
                </tr>
            </table>
            <%
                        }// close show order after toDate
                    } //close show order by date
                } //for
            } // if list
            else {
            %> 
            <p>You don't have any order</p>
            <%
                } //else
            %>
        </section>
        <footer>
            <%@include  file="footer.jsp" %>
        </footer>
        <%
            }
        %>
    </body>
</html>
