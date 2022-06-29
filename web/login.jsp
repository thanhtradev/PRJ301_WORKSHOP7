<%-- Document : login Created on : Jun 2, 2022, 1:23:24 AM Author : thanh --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Plant Shop</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="signin.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%
            String name = (String) session.getAttribute("name");
            if (name == null) {
        %>

        <!-- Login form -->
        <div class="signin text-center">
            <form action="mainController" method="post" class="form-signin">
                <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
                <input
                    type="text"
                    name="txtemail"
                    id="inputEmail"
                    class="form-control"
                    placeholder="Email address"
                    />
                <input
                    type="password"
                    name="txtpassword"
                    class="form-control"
                    placeholder="Password"
                    />

                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="savelogin" name="savelogin" />
                        Remember me
                    </label>
                </div>
                <button
                    class="btn btn-lg btn-primary btn-block"
                    type="submit"
                    value="login"
                    name="action"
                    >
                    Sign in
                </button>
            </form>
        </div>
        <%
        } else {
        %>    
        <div class="welcome">
            <div class="page-hero d-flex flex-column align-items-center justify-content-center text-center">
                <h1 class="display-4 fw-bolder">Welcome ${name}</h1>
                <p class="lead fw-normal mb-0">You are now logged in!</p>
                <a class="btn btn-dark" role="button" href="mainController?action=logout">Logout</a>
            </div>
        </div>
        <%            }
        %>
        <%@include file="footer.jsp" %>
    </body>
</html>
