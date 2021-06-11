<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Dish" %>
<%@ page import="entity.Data" %>
<%@ page import="entity.Category" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: vernom
  Date: 10/06/2021
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Data dishDataReturn = (Data) request.getAttribute("dishDataReturn");
    ArrayList<Category> dishCategory = (ArrayList<Category>) request.getAttribute("categories");
    int totalPage = dishDataReturn.getTotalPages();
    int currentPage = dishDataReturn.getCurrentPage();
    ArrayList<Dish> dishes = dishDataReturn.getListDish();
    String linkImage = "https://res.cloudinary.com/vernom/image/upload/";
    HashMap<String, ArrayList<String>> errors = (HashMap<String, ArrayList<String>>) request.getAttribute("errors");
    System.out.println(errors);
    if (errors == null) {
        errors = new HashMap<>();
    }
%>
<html>
<head>
    <title>List Page</title>
    <link href="http://7oroof.com/demos/babette/assets/images/favicon/favicon.png" rel="icon">
    <link rel="stylesheet" href="http://7oroof.com/demos/babette/assets/css/style.css" type="text/css">
    <link rel="stylesheet" href="http://7oroof.com/demos/babette/assets/css/libraries.css" type="text/css">
    <link rel="stylesheet" href="http://7oroof.com/demos/babette/assets/css/style.css" type="text/css">
    <style>
        a.page-link.active {
            background-color: #c7a254;
            border-color: #c7a254;
            color: #fff;
        }
    </style>
</head>
<body style="background-image: url('http://7oroof.com/demos/babette/assets/images/backgrounds/8.jpg')">
    <header id="header" class="header header-transparent header-layout1">
        <nav class="navbar navbar-expand-lg sticky-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">
                    <p style="color: white; font-size: 25px"><strong>Vernom Restaurant</strong></p>
                </a>
                <button class="navbar-toggler" type="button">
                    <span class="menu-lines"><span></span></span>
                </button>
                <div class="collapse navbar-collapse" id="mainNavigation">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav__item">
                            <a href="/dish/create" class="nav__item-link ">Create</a>
                        </li><!-- /.nav-item -->
                        <li class="nav__item">
                            <a href="/dish" class="nav__item-link active">List</a>
                        </li><!-- /.nav-item -->
                        <!-- /.nav-item -->
                    </ul><!-- /.navbar-nav -->
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container -->
        </nav><!-- /.navabr -->
    </header>
    <main id="content" class="content" role="main">
        <!-- Page content -->
        <div class="row">
            <div class="col-lg-12">
                <section class="widget">
                    <header>
                        <h5>
                            Table <span class="fw-semi-bold">Styles</span>
                        </h5>
                        <div class="widget-controls mt-2">
                            <a href="#"><i class="la la-cog"></i></a>
                            <a data-widgster="close" href="#"><i class="glyphicon glyphicon-remove"></i></a>
                        </div>
                    </header>
                    <div class="widget-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="d-none d-md-table-cell" style="text-align: center">#</th>
                                <th style="text-align: center">Name</th>
                                <th style="text-align: center">Code</th>
                                <th class="d-none d-md-table-cell" style="text-align: center">Category</th>
                                <th class="d-none d-md-table-cell" style="text-align: center">Description</th>
                                <th class="d-none d-md-table-cell" style="text-align: center">Avatar</th>
                                <th class="d-none d-md-table-cell" style="text-align: center">Price</th>
                                <th class="d-none d-md-table-cell" style="text-align: center">Sell Date</th>
                                <th class="d-none d-md-table-cell" style="text-align: center">Status</th>
                                <th class="d-none d-md-table-cell" style="text-align: center">Last Update</th>
                                <th style="text-align: center;">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                    <% if (dishes != null && dishes.size() > 0) {
                                for (int i = 0; i < dishes.size(); i++) {
                            %>
                            <tr>
                                <td scope="col" style="text-align: center"><%=dishes.get(i).getId()%>
                                </td>
                                <td scope="col" style="text-align: center"><%=dishes.get(i).getName()%>
                                </td>
                                <td scope="col" style="text-align: center">
                                    <%=dishes.get(i).getCode()%>
                                </td>
                                <td scope="col" style="text-align: center">
                                    <%
                                        for (Category category : dishCategory) {
                                            if (dishes.get(i).getCategoryId() == category.getId()) {
                                    %>
                                    <%=category.getName()%>
                                    <%
                                            }
                                        }
                                    %>
                                </td>
                                <td scope="col" style="text-align: center"><%=dishes.get(i).getDescription()%>
                                </td>
                                <td scope="col" style="text-align: center">
                                    <div style="width: 100px; height: 100px; background-repeat: no-repeat; background-position: center; background-size: cover; background-image:
                                            url('<%=linkImage + dishes.get(i).getAvatar() + ".jpg"%>')"></div>
                                </td>
                                <c:set var="balance" value="<%=dishes.get(i).getPrice()%>"/>
                                <td scope="col" style="text-align: center">
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${balance}"/>VNĐ
                                </td>
                                <td scope="col"
                                    style="text-align: center"><%=dishes.get(i).getUpdatedAt()%>
                                </td>
                                <td scope="col"
                                    style="text-align: center"><%=dishes.get(i).toStatus(dishes.get(i).getStatus())%>
                                </td>
                                <td scope="col" style="text-align: center"><%=dishes.get(i).getUpdatedAt()%>
                                </td>
                                <td scope="col" style="text-align: center">
                                    <div class="btn-group">
                                        <a href="/dish/detail?id=<%=dishes.get(i).getId()%>" class="btn btn-primary"
                                           style="min-width: unset;">Xem</a>
                                        <a href="/dish/edit?id=<%=dishes.get(i).getId()%>" class="btn btn-success"
                                           style="min-width: unset;">Sửa</a>
                                        <a href="/dish/delete?id=<%=dishes.get(i).getId()%>" class="btn btn-danger"
                                           style="min-width: unset;">Xóa</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            </tr>
                            </tbody>

                        </table>
                        <div class="clearfix">
                            <div class="float-right">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination" style="align-content: center">
                                        <li class="page-item"><a class="page-link" href="dish?pages=<%=currentPage - 1%>"
                                                                 style="width: fit-content"  <% if(currentPage == 1 ){ %> <%= "disable" %> <%} %>>Previous</a>
                                        </li>
                                        <%
                                            for (int i = 0; i < totalPage; i++) {
                                        %>

                                        <%
                                            System.out.printf("currentPage : %d , i : %d , final : %d ,%s\n", currentPage, i, Math.abs(currentPage - i), Math.abs(currentPage - i) < 2);
                                            if (Math.abs(currentPage - i - 1) <= 2 || i == 0 || i == totalPage - 1) {
                                        %>
                                        <li class="page-item <% if(i == 0 ){ %> <%= "mr-5" %> <%} %> <% if(i == totalPage - 1){ %> <%= "ml-5" %> <%} %>">
                                            <a
                                                    class="page-link <% if(currentPage == i + 1 ){ %> <%= "active" %> <%} %>"
                                                    href="dish?pages=<%=i+1%>"
                                                    attr="<%= Math.abs(currentPage - i) < 2%>"><%=i + 1%>

                                            </a>
                                        </li>
                                        <%
                                            }
                                        %>
                                        <%
                                            }
                                        %>
                                        <li class="page-item"><a class="page-link" href="dish?pages=<%=currentPage +1%>"
                                                                 style="width: fit-content" <% if(currentPage == totalPage ){ %> <%= "disable" %> <%} %>>Next</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="error">
                                <div class="form-group">
                                <span class="error-msg">
                                    <%
                                        if (errors.containsKey("records")) {
                                            ArrayList<String> recordsErrors = errors.get("records");
                                            for (String msg : recordsErrors) {
                                    %>
                                    <li><%=msg%></li>
                                    <%
                                            }
                                        }%>
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>

                </section>
            </div>
        </div>
    </main>

    <script src="http://7oroof.com/demos/babette/assets/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="http://7oroof.com/demos/babette/assets/js/plugins.js"></script>
    <script src="http://7oroof.com/demos/babette/assets/js/main.js" type="text/javascript"></script>
</body>
</html>
