<%-- 
    Document   : home
    Created on : Jun 19, 2021, 3:16:09 PM
    Author     : hoang
--%>

<%@page import="model.Gallery"%>
<%@page import="controller.ImageController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <link rel="stylesheet" type="text/css" href="css/fontawesome-free-5.15.3-web/css/all.css"/>
    </head>
    <body>
        <%
            ImageController imgController = new ImageController(); 
        %>
        <!--header-->
        <%@include file="component/header.jsp" %>
        <div id="wapper">
            <!--content-->
            <div id="content">
                <div id="left-side">

                    <div class="sub-content">
                        <img src=${mostViewsImg.getImgUrl()}>
                        <div id="title-img"><i>${mostViewsImg.getImgTitle()}</i></div>
                    </div>
                    <div class="sub-content">
                        <ul>
                            <c:forEach items="${listGallerys}" var="gallerys">
                                <c:set var="link" value="gallery?id=${gallerys.getGalleryID()}"/>
                                <li>
                                    <div class="view-img">
                                        <img src=${gallerys.getMostViewsImg()}>
                                    </div>
                                    <h4>
                                        <a href="${link}">View ${gallerys.getGalleryName()}</a>
                                    </h4>
                                    <p>
                                        ${gallerys.getGalleryDescription()}
                                    </p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="sub-content article">
                        <h3>About me</h3>
                        <div id="article-content">
                            <span>
                                ${webInfor.getWebsiteDescription()}
                            </span>
                        </div>
                    </div>
                </div>
                <!--end left side-->

                <!--right side-->
                <%@include file="component/right_side.jsp" %>
            </div>
            <!--end content-->
        </div>
        <!--end wapper-->

        <!--footer-->
        <%@include file="component/footer.jsp" %>
    </body>
</html>
