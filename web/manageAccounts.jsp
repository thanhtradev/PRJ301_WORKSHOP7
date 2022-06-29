<%-- 
    Document   : ManageAccounts
    Created on : Jun 29, 2022, 2:21:04 PM
    Author     : thanhtra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"></c:import>
        <form action="mainController" method="post">
            <input type="txt" name="txtsearch" value="${param.txtsearch}">
            <input type="submit" name="action" value="searchAccount">
        </form>
        <h1></h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Full name</th>
                <th>Status</th>
                <th>Phone number</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            <c:forEach var="acc" items="${requestScope.accountList}">
            <tr>
                <td><c:out value="${acc.getAccid()}"></c:out></td>
                <td><c:out value="${acc.getEmail()}"></c:out></td>
                <td><c:out value="${acc.getFullname()}"></c:out></td>
                    <td><c:choose>
                                <c:when test="${acc.getStatus() eq 1}">Active</c:when>
                                <c:otherwise>Inactive</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:out value="${acc.getPhone()}"></c:out></td>
                    <td><c:choose>
                                <c:when test="${acc.getRoles() eq 1}">Admin</c:when>
                                <c:otherwise>User</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:if test="${acc.getRoles() eq 0}">
                            <c:url var="mylink" value="mainController">
                                <c:param name="email" value="${acc.getEmail()}"></c:param>
                                <c:param name="status" value="${acc.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param>
                            </c:url>
                            <a href="${mylink}">Block/Unblock</a>
                        </c:if>
                    </td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
