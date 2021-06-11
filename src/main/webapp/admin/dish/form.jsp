<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Dish" %><%--
<%--
  Created by IntelliJ IDEA.
  User: vernom
  Date: 10/06/2021
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Page</title>
    <link href="http://7oroof.com/demos/babette/assets/images/favicon/favicon.png" rel="icon">
    <link rel="stylesheet" href="http://7oroof.com/demos/babette/assets/css/style.css" type="text/css">
    <link rel="stylesheet" href="http://7oroof.com/demos/babette/assets/css/libraries.css" type="text/css">
    <link rel="stylesheet" href="http://7oroof.com/demos/babette/assets/css/style.css" type="text/css">
</head>
<body style="background-image: url('https://t3.ftcdn.net/jpg/02/52/12/40/360_F_252124067_aCtp9ZD934RboKmjJzkXiwYDL7XkNjpn.jpg'); background-repeat: no-repeat; background-size: cover">
    <header id="header" class="header header-transparent header-layout1">
        <nav class="navbar navbar-expand-lg sticky-navbar">
            <div class="container" style="background-color: burlywood">
                <a class="navbar-brand" href="index.html">
                    <p style="color: white; font-size: 25px"><strong>Vernom Restaurant</strong></p>
                </a>
                <button class="navbar-toggler" type="button">
                    <span class="menu-lines"><span></span></span>
                </button>
                <div class="collapse navbar-collapse" id="mainNavigation">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav__item">
                            <a href="/dish/form"  class="nav__item-link active">Create</a>
                        </li><!-- /.nav-item -->
                        <li class="nav__item">
                            <a href="/dish"  class="nav__item-link">List</a>
                        </li><!-- /.nav-item -->
                        <!-- /.nav-item -->
                    </ul><!-- /.navbar-nav -->
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container -->
        </nav><!-- /.navabr -->
    </header>
    <div class="container">
        <%
            Dish dish = (Dish) request.getAttribute("dish");
            if (dish == null) {
                dish = new Dish("", "", 0, "", "", 0);
            }
            HashMap<String, ArrayList<String>> errors = (HashMap<String, ArrayList<String>>) request.getAttribute("errors");
            if (errors == null) {
                errors = new HashMap<>();
            }
        %>
        <div class="reservation__wrapper"  style="margin-top: 150px">
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <form class="reservation__form" id="dish_form" method="post" action="/dish/form">
                        <div class="row">
                            <div class="col-12">
                                <div class="reservation__form-heading  mb-30">
                                    <p class="heading__desc" style="text-align: center">Thêm món ăn mới vào thực đơn.</p>
                                </div><!-- /.heading -->
                            </div>
                            <!-- /.col-lg-6 -->
                            <div class="col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <input type="text" name="code" class="form-control" placeholder="Mã"
                                           value="<%=dish.getCode() %>">
                                    <span class="error-msg">
                                    <%
                                        if (errors.containsKey("code")) {
                                            ArrayList<String> fullNameErrors = errors.get("code");
                                            for (String msg : fullNameErrors) {
                                    %>
                                    <li><%=msg%></li>
                                    <%
                                            }
                                        }%>
                                </span>
                                </div>
                            </div><!-- /.col-lg-6 -->
                            <div class="col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control" placeholder="Tên"
                                           value="<%=dish.getName() %>">
                                    <span class="error-msg">
                                    <%
                                        if (errors.containsKey("name")) {
                                            ArrayList<String> fullNameErrors = errors.get("name");
                                            for (String msg : fullNameErrors) {
                                    %>
                                    <li><%=msg%></li>
                                    <%
                                            }
                                        }%>
                                </span>
                                </div>
                            </div><!-- /.col-lg-6 -->
                            <div class="col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <select class="form-control" style="display: none;" name="categoryId">
                                        <option value="1" <% if (dish.getCategoryId() == 1) { %> selected <%} %>>Món nướng
                                        </option>
                                        <option value="2" <% if (dish.getCategoryId() == 2) { %> selected <%} %>>Món luộc
                                        </option>
                                        <option value="3" <% if (dish.getCategoryId() == 3) { %> selected <%} %>>Món chay
                                        </option>
                                        <option value="4" <% if (dish.getCategoryId() == 4) { %> selected <%} %>>Ðồ uống
                                        </option>
                                    </select>
                                    <span class="error-msg">
                                    <%
                                        if (errors.containsKey("category_id")) {
                                            ArrayList<String> fullNameErrors = errors.get("category_id");
                                            for (String msg : fullNameErrors) {
                                    %>
                                    <li><%=msg%></li>
                                    <%
                                            }
                                        }%>
                                </span>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <input type="number" class="form-control" placeholder="Giá" name="price" value="<%=dish.getPrice() %>">
                                    <span class="error-msg">
                                    <%
                                        if (errors.containsKey("price")) {
                                            ArrayList<String> fullNameErrors = errors.get("price");
                                            for (String msg : fullNameErrors) {
                                    %>
                                    <li><%=msg%></li>
                                    <%
                                            }
                                        }
                                    %>
                                </span>
                                </div>
                            </div><!-- /.col-lg-6 -->
                            <div class="col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <button type="button" id="upload_widget" class="cloudinary-button"  style="background-color: burlywood; color: black">Upload files</button>
                                    <input type="hidden" name="image" id="image">
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <img src="#" id="demo-img" style="display: none">
                                    <div class="thumbnails"></div>
                                </div>
                            </div><!-- /.col-lg-6 -->
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <textarea name="description" class="form-control" placeholder="Mô tả thêm"><%=dish.getDescription() %></textarea>
                                    <span class="error-msg">
                                    <%
                                        if (errors.containsKey("price")) {
                                            ArrayList<String> fullNameErrors = errors.get("price");
                                            for (String msg : fullNameErrors) {
                                    %>
                                    <li><%=msg%></li>
                                    <%
                                            }
                                        }%>
                                </span>
                                </div>
                            </div><!-- /.col-lg-12 -->
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <button type="submit" class="btn btn__primary btn__block"  style="background-color: burlywood; color: black">Create</button>
                            </div><!-- /.col-lg-12 -->
                        </div><!-- /.row -->
                    </form>
                </div><!-- /.col-lg-7 -->
            </div><!-- /.row -->
        </div><!-- /.row -->
    </div>

    <script src="http://7oroof.com/demos/babette/assets/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="http://7oroof.com/demos/babette/assets/js/plugins.js"></script>
    <script src="http://7oroof.com/demos/babette/assets/js/main.js" type="text/javascript"></script>
    <script src="https://widget.cloudinary.com/v2.0/global/all.js" type="text/javascript"></script>
    <script type="text/javascript">
        var myWidget = cloudinary.createUploadWidget(
            {
                cloudName: 'vernom',
                uploadPreset: 'fn5rpymu',
                multiple: false,
                form: '#dish_form',
                fieldName: 'thumbnails[]',
                thumbnails: '.thumbnails'
            }, function (error, result) {
                if (!error && result && result.event === "success") {
                    console.log('Done! Here is the image info: ', result.info.url);
                    var arrayThumnailInputs = document.querySelectorAll('input[name="thumbnails[]"]');
                    for (let i = 0; i < arrayThumnailInputs.length; i++) {
                        arrayThumnailInputs[i].value = arrayThumnailInputs[i].getAttribute('data-cloudinary-public-id');
                    }
                    console.log(arrayThumnailInputs)
                }
            }
        );
        $('#upload_widget').click(function () {
            myWidget.open();
        })
        // xử lý js trên dynamic content.
        $('body').on('click', '.cloudinary-delete', function () {
            let publicId = JSON.parse($(this).parent().attr('data-cloudinary')).public_id;
            $(`input[data-cloudinary-public-id="${publicId}"]`).remove();
        });
    </script>
</body>
</html>
