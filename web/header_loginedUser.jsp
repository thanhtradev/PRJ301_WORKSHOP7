<%-- Document : header_loginedUser Created on : Jun 2, 2022, 2:07:21 AM Author :
thanh --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Plant Shop</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <nav>
            <ul>
                <li>
                    <a href="index.jsp">Home</a>
                </li>
                <li><a href="updateProfile.jsp">Change profile</a></li>
                <li><a href="personalPage.jsp?status=completed">Completed orders</a></li>
                <li><a href="personalPage.jsp?status=canceled">Canceled orders</a></li>
                <li><a href="personalPage.jsp?status=processing">Processing orders</a></li>
                <li><a href="viewCart.jsp">Your cart</a></li>
                <li>
                    <form>
                    from <input type="date" name="from" /> to
                    <input type="date" name="to" />
                    <input type="submit" value="search"/>
                    </form>
                </li>
            </ul>
        </nav>
    </body>
</html>
