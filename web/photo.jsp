<%-- 
    Document   : photo
    Created on : Jun 24, 2021, 3:32:43 PM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Photo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <link rel="stylesheet" type="text/css" href="css/photo_style.css"/>
        <link rel="stylesheet" type="text/css" href="css/fontawesome-free-5.15.3-web/css/all.css"/>
    </head>
    <body>

        <!--header-->
        <%@include file="component/header.jsp" %>
        <div id="wapper">
            <!--content-->
            <div id="content">
                <div id="left-side">
                    <form action="photo" method="POST">


                        <div class="photo-control">
                            <div class="background-button back-butotn ">
                                <a href="gallery?id=${galleryID}"><i class="fas fa-long-arrow-alt-left"></i> <span class="padding-left">Back to album</span></a>
                                <input type="hidden" name="galleryID" value="${galleryID}">
                                <input type="hidden" name="imgID" value="${img.getImgId()}">
                            </div>
                            <div class="small-button">
                                <div class="background-button button-left">
                                    <button type="submit" name="btSubmit" class="fas fa-step-backward" value="backward"></button>
                                </div>
                                <div class="background-button button-right">
                                    <button type="submit" name="btSubmit" class="fas fa-step-forward" value="forward"></button>
                                </div>
                            </div>
                        </div>
                        <div class="big-image">
                            <div class="view-icon">
                                <img src="img/eye.png"> <span>${img.getImgViews()}</span>
                            </div>
                            <img class="image-max-percent" src="${img.getImgUrl()}" alt="${img.getImgAlt()}"> 
                        </div>
                    </form>
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
