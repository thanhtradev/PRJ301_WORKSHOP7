<%-- 
    Document   : header_loginedAdmin
    Created on : Jun 29, 2022, 1:50:07 AM
    Author     : thanhtra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
    <ul>
        <li><a href="mainController?action=manageAccounts">Manage Accounts</a></li>
        <li><a href="mainController?action=manageOrders">Manage Orders</a></li>
        <li><a href="#">Manage Plants</a></li>
        <li><a href="#">Manage Categories</a></li>
        <li>Welcome ${sessionScope['name']} | <a href="#">Logout</a></li>
    </ul>
</header>
