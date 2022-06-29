<%-- 
    Document   : viewPlant
    Created on : Jun 23, 2022, 2:09:36 AM
    Author     : thanhtra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plant Shop</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <!--Header-->
        <%@include  file="header.jsp" %>

        <jsp:useBean id="plantObj" class="model.Plant" scope="request" />
        <!--        <table>
                    <tr><td rowspan="8"><img src="<jsp:getProperty name="plantObj" property="imgpath"></jsp:getProperty>"></td></tr>
                    <tr><td>ID:<jsp:getProperty name="plantObj" property="id"></jsp:getProperty></td></tr>
                    <tr><td>Product name:<jsp:getProperty name="plantObj" property="name"></jsp:getProperty></td></tr>
                    <tr><td>Price:<jsp:getProperty name="plantObj" property="price"></jsp:getProperty></td></tr>
                    <tr><td>Description:<jsp:getProperty name="plantObj" property="description"></jsp:getProperty></td></tr>
                    <tr><td>Status:<jsp:getProperty name="plantObj" property="status"></jsp:getProperty></td></tr>
                    <tr><td>Cate id:<jsp:getProperty name="plantObj" property="cateid"></jsp:getProperty></td></tr>
                    <tr><td>Category:<jsp:getProperty name="plantObj" property="catename"></jsp:getProperty></td></tr>
                    </table>
                    USE EL
                    <table>
                        <tr><td rowspan="8"><img src="${plantObj.imgpath}"></td></tr>
                    <tr><td>ID:${plantObj.id}</td></tr>
                    <tr><td>Product name:${plantObj.name}</td></tr>
                    <tr><td>Price:${plantObj.price}</td></tr>
                    <tr><td>Description:${plantObj.description}</td></tr>
                    <tr><td>Status:${plantObj.status}</td></tr>
                    <tr><td>Cate id:${plantObj.cateid}</td></tr>
                    <tr><td>Category:${plantObj.catename}</td></tr>
                </table>-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${plantObj.imgpath}" alt="" /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">ID: ${plantObj.id}</div>
                        <h1 class="display-5 fw-bolder">${plantObj.name}</h1>
                        <div class="fs-5 mb-5">
                            <span>$${plantObj.price}</span>
                        </div>
                        <p class="lead">${plantObj.description}</p>
                        <div class="d-flex">
                            <!--<input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />-->
                            <a class="btn btn-outline-dark mt-auto" href="mainController?action=addtocart&pid=${plantObj.id}">Add to cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Footer-->
        <%@include  file="footer.jsp" %>
    </body>
</html>
