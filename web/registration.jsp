<%-- Document : registration Created on : Jun 2, 2022, 1:23:24 AM Author : thanh
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Plant Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="signin.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="signin text-center">
            <form action="mainController" method="post" class="form-signin">
                <h1 class="h3 mb-3 font-weight-normal">Register</h1>
                <input
                    type="text"
                    name="txtemail"
                    id="inputEmail"
                    class="form-control"
                    placeholder="Email address" 
                    value="${param.txtemail}"
                    required=""
                    />
                <input
                    type="text"
                    name="txtfullname"
                    id="inputEmail"
                    class="form-control"
                    placeholder="Full name"
                    value="${param.txtfullname}"
                    required=""
                    />
                <input
                    type="text"
                    name="txtphone"
                    id="inputEmail"
                    class="form-control"
                    placeholder="Phone number"
                    value="${param.txtphone}"
                    required=""
                    />
                <input
                    type="password"
                    name="txtpassword"
                    class="form-control"
                    placeholder="Password"
                    required=""
                    />
                <button
                    class="btn btn-lg btn-primary btn-block"
                    type="submit"
                    value="register"
                    name="action"
                    >
                    Register
                </button>
            </form>
        </div>

        <p><font color ="red">${requestScope['validateMsg']}</font></p>
            <%@include file="footer.jsp" %>
    </body>
</html>
