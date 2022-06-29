<%-- Document : header Created on : Jun 2, 2022, 1:13:03 AM Author : thanh --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img
                src="images/logo.png"
                alt="Avatar Logo"
                style="width: 40px"
                class="rounded"
                />
        </a>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="registration.jsp">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mainController?action=viewcart"
                       >View Cart</a
                    >
                </li>
            </ul>
            <form class="d-flex" action="mainController" method="post">
                <input
                    class="form-control me-2"
                    type="text"
                    placeholder="Search"
                    name="txtsearch"
                    value="${param.txtsearch}"
                    />
                <select class="form-select" name="searchby">
                    <option value="byname">By name</option>
                    <option value="bycate">By category</option>
                </select>
                <button class="btn btn-primary" type="submit" name="action" value="search">Search</button>
            </form>
        </div>
    </div>
</nav>
