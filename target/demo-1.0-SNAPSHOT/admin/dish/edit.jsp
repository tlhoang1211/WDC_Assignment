<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Dish" %>
<%--
  Created by IntelliJ IDEA.
  User: vernom
  Date: 11/06/2021
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Page</title>
    <link href="http://7oroof.com/demos/babette/assets/images/favicon/favicon.png" rel="icon">
    <link rel="stylesheet" href="http://7oroof.com/demos/babette/assets/css/style.css" type="text/css">
    <link rel="stylesheet" href="http://7oroof.com/demos/babette/assets/css/libraries.css" type="text/css">
    <link rel="stylesheet" href="http://7oroof.com/demos/babette/assets/css/style.css" type="text/css">
</head>
<body style="background-image: url('http://7oroof.com/demos/babette/assets/images/backgrounds/8.jpg')">
    <header id="header" class="header header-transparent header-layout1">
        <nav class="navbar navbar-expand-lg sticky-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">
                    <img src="http://7oroof.com/demos/babette/assets/images/logo/logo-light.png" class="logo-light"
                         alt="logo">
                    <img src="http://7oroof.com/demos/babette/assets/images/logo/logo-dark.png" class="logo-dark"
                         alt="logo">
                </a>
                <button class="navbar-toggler" type="button">
                    <span class="menu-lines"><span></span></span>
                </button>
                <div class="collapse navbar-collapse" id="mainNavigation">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav__item">
                            <a href="/dish/create"  class="nav__item-link ">Create</a>
                        </li><!-- /.nav-item -->
                        <li class="nav__item">
                            <a href="/dish"  class="nav__item-link active">List</a>
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
            String linkImage = "https://res.cloudinary.com/dwarrion/image/upload/w_100,c_scale/";
        %>
        <div class="reservation__wrapper">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-5">
                    <div class="reservation__banner">
                        <img class="reservation__banner-img"
                             src="http://7oroof.com/demos/babette/assets/images/backgrounds/pattern/3.png" alt="background">
                        <div class="reservation__banner-inner">
                            <span class="reservation__banner-inner-subtitle">Check Availability</span>
                            <h5 class="reservation__banner-inner-title">Opening Times</h5>
                            <ul class="list-unstyled">
                                <li><span>Week days</span><span>09.00 – 24:00</span></li>
                                <li><span>Saturday</span><span>08:00 – 03.00</span></li>
                                <li><span>Saturday</span><span>Day off</span></li>
                            </ul>
                            <div class="reservation__banner-contact">
                                <span class="reservation__banner-contact-label">Call Us Now</span>
                                <a class="reservation__banner-contact-phone" href="tel:0201023456789">0201023456789</a>
                            </div><!-- /.reservation__banner-contact -->
                        </div><!-- /.reservation__banner-inner -->
                    </div><!-- /.reservation__banner -->
                </div><!-- /.col-lg-5 -->
                <div class="col-sm-12 col-md-12 col-lg-7">
                    <form class="reservation__form" id="dish_form" method="post" action="/dish/edit">
                        <input type="hidden" name="id" value="<%= dish.getId()%>">
                        <div class="row">
                            <div class="col-12">
                                <div class="reservation__form-heading  mb-30">
                                    <div class="d-flex justify-content-between">
                                        <h5>Make A Reservation</h5>
                                        <a href="http://7oroof.com/demos/babette/assets/images/shapes/table.jpg"
                                           data-lightbox="lightbox">Tables
                                            Arrangement</a>
                                    </div>
                                    <p class="heading__desc">You can book a table online easily in just a minute.
                                        Reservations are for
                                        lunch and dinner, check the availability of your table &amp; book it now!</p>
                                </div><!-- /.heading -->
                            </div>
                            <!-- /.col-lg-6 -->
                            <div class="col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <input type="text" name="code" class="form-control" placeholder="Food Code"
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
                                    <input type="text" name="name" class="form-control" placeholder="Food Name"
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
                            <div class="col-sm-4 col-md-4 col-lg-4">
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
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <select class="form-control" style="display: none;" name="status">
                                        <option value="0" <% if (dish.getStatus() == 0) { %> selected <%} %>>Selling
                                        </option>
                                        <option value="1" <% if (dish.getStatus() == 1) { %> selected <%} %>>On wait
                                        </option>
                                        <option value="2" <% if (dish.getStatus() == 2) { %> selected <%} %>>Stop
                                        </option>
                                    </select>
                                    <span class="error-msg">
                                    <%
                                        if (errors.containsKey("status")) {
                                            ArrayList<String> fullNameErrors = errors.get("status");
                                            for (String msg : fullNameErrors) {
                                    %>
                                    <li><%=msg%></li>
                                    <%
                                            }
                                        }%>
                                </span>
                                </div>
                            </div><!-- /.col-lg-6 -->
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <input type="number" class="form-control" placeholder="Food Price" name="price" value="<%=dish.getPrice() %>">
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
                            </div><!-- /.col-lg-6 -->
                            <div class="col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <button type="button" id="upload_widget" class="cloudinary-button">Upload files</button>
                                    <input type="hidden" name="thumbnails[]" id="oldThumb" value="<%=dish.getAvatar()%>">
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <img src="#" id="demo-img" style="display: none">
                                    <div class="thumbnails">

                                    </div>
                                    <div id="oldImage" style="width: 100px; height: 100px; background-repeat: no-repeat; background-position: center; background-size: cover; background-image:
                                            url('<%=linkImage + dish.getAvatar() + ".jpg"%>')"></div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <textarea name="description" class="form-control"><%=dish.getDescription() %></textarea>
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
                                <button type="submit" class="btn btn__primary btn__block">Update</button>
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
                cloudName: 'dwarrion',
                uploadPreset: 'j6d3dypu',
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
                    $("#oldImage").remove();
                    $("#oldThumb").remove();
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
