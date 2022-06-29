<%-- 
    Document   : index
    Created on : Jun 2, 2022, 1:23:24 AM
    Author     : thanh
--%>

<%@page import="dao.PlantDao"%>
<%@page import="model.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plant Shop</title>
        <!--        <link rel="stylesheet" href="mycss.css" type="text/css" />-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <!--Header-->
        <%@include  file="header.jsp" %>
        <header class="bg-success py-2">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Plant shop</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Life is too short</p>
                    <p class="lead fw-normal text-white-50 mb-0">
                        Buy more and more houseplants
                    </p>
                </div>
            </div>
        </header>
        
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div
                    class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"
                    >
                    <%
                        String keyword = request.getParameter("txtsearch");
                        String searchby = request.getParameter("searchby");
                        ArrayList<Plant> list;
                        String[] tmp = {"out of stock", "available"};
                        if (keyword == null && searchby == null) {
                            list = PlantDao.getPlants("", "");
                        } else {
                            list = PlantDao.getPlants(keyword, searchby);
                        }
                        if (list != null && !list.isEmpty()) {
                            for (Plant plant : list) {
                    %>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img
                                class="card-img-top"
                                src="<%= plant.getImgpath()%>"
                                alt="Card image"
                                />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product Name -->
                                    <h5 class="fw-bolder"><%= plant.getName()%></h5>
                                    <p class="card-text">Some example text.</p>
                                    <!-- Price -->
                                    <%= plant.getPrice() + " $"%>
                                </div>
                            </div>
                            <!-- Product action -->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="mainController?action=addtocart&pid=<%=plant.getId()%>"
                                       >Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </section>
        <!--Footer-->
        <%@include  file="footer.jsp" %>

    </body>
</html>
