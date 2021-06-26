<%-- 
    Document   : gallery1
    Created on : Jun 20, 2021, 9:56:17 PM
    Author     : hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gallery 1</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <link rel="stylesheet" type="text/css" href="css/gallery_style.css"/>
        <link rel="stylesheet" type="text/css" href="css/fontawesome-free-5.15.3-web/css/all.css"/>
    </head>
    <body>
        <!--header-->
        <%@include file="component/header.jsp" %>

        <!--use wapper for set background-image-->
        <div id="wapper">

            <!--content-->
            <div id="content">
                <div id="left-side">
                    <div class="heading">
                        <h1 class="page-title">${gallery.getGalleryName()}</h1>
                    </div>
                    <div class="slide-content">

                        <!--slides image-->
                        <div class="container">
                            <c:forEach items="${listImg}" var="image">
                                <div class="mySlides">
                                    <img src="${image.getImgUrl()}" alt="${image.getImgAlt()}">
                                </div>
                            </c:forEach>
                            <c:if test="${listImg.isEmpty()}">
                                <div class="mySlides">
                                    <img src="" alt="This gallery not contain any image!">
                                </div>
                            </c:if>
                            
                            <!--play button in the center of the image-->
                            <c:if test="${!listImg.isEmpty()}">
                            <div id="play-button-containter">
                                <div id="play-button-outer">
                                    <div id="play-button" onclick="playSlides()"></div>
                                </div>
                                <div id="text-button">
                                    <p>Play</p>
                                </div>
                            </div>


                            <!--previous & next button, pre&next slide-->
                            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                            <a class="next" onclick="plusSlides(1)">&#10095;</a>

                            <!--play/pause button, this button also run slides-->
                            <span id="play-pause-button-container" onclick="playOrPause()">
                                <span class="play-pause-button play-pause-button-before"></span>
                                <span class="play-pause-button play-pause-button-after"></span>
                            </span>
                            </c:if>
                        </div>
                        <!--end containter-->

                    </div>
                    <!--end side content-->

                    <!--list thumbnail--> 
                    <!--display all image of gallery-->
                    <%
                        int index = 1;
                    %>
                    <c:forEach items="${listImg}" var="image">
                        <%
                            if (index == 1) {
                        %>
                        <ul class="thumbnails">
                            <%
                                }
                            %>
                            <li>
                                <div class="span3">
                                    <div class="thumbnail">
                                        <a href="photo?galleryID=${gallery.getGalleryID()}&imgID=${image.getImgId()}"><img src="${image.getImgUrl()}" alt="${image.getImgAlt()}"></a>
                                    </div>
                                </div>
                            </li>
                            <%
                                if (index == 4) {
                            %>
                        </ul>
                        <%
                            }
                            index++;
                            if (index == 5) {
                                index = 1;
                            }
                        %> 

                    </c:forEach>
                    <!--end left side-->

                    <!--right side-->
                </div>
                <%@include file="component/right_side.jsp" %>
                <!--end content-->
            </div>
            <!--end wapper-->
            <!--footer-->
            <%@include file="component/footer.jsp" %>
    </body>
    <script>
        var slideIndex = 0;
        var play = false;
        //slides[] save all div contain image
        var slides = document.getElementsByClassName("mySlides");
        //div of button [> play] (the center of image)
        var containter = document.getElementById("play-button-containter");
        //button (>, ||) in the bottom of image
        var play_button = document.getElementsByClassName("play-pause-button");
        var intervals;
        showSlides(slideIndex);

        //auto play slide each 1 seconds
        async function playSlides() {
            containter.style.display = "none";
            clearInterval(intervals);
            changePlayOrPause();
            // use setInterval, save to intervals will stop by call clearInterval(intervals);
            intervals = setInterval(function () {
                showSlides(slideIndex);
                slideIndex++;
                if (slideIndex >= slides.length) {
                    slideIndex = 0;
                }
            }, 1000);
        }

        //change the play button to pause button and vice versa
        function playOrPause() {
            if (play) {
                clearInterval(intervals);
                containter.style.display = "";
                changePlayOrPause();
            } else {
                playSlides();
            }
        }

        //change css ( > to || )
        function changePlayOrPause() {
            if (play) {
                play_button[0].style = "clip-path: polygon(0 0, 50% 25%, 50% 75%, 0% 100%)";
                play_button[1].style = " clip-path: polygon(50% 25%, 100% 50%, 100% 50%, 50% 75%)";
                play = false;
            } else {
                play_button[0].style = "clip-path: polygon(0 0, 30% 0, 30% 100%, 0% 100%)";
                play_button[1].style = " clip-path: polygon(70% 0, 100% 0, 100% 100%, 70% 100%)";
                play = true;
            }
        }

        //show only 1 image.
        function showSlides(n) {
            var i;
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[n].style.display = "block";
        }

        //pre & next slide
        function plusSlides(n) {
            slideIndex += n;
            if (slideIndex < 0) {
                slideIndex = slides.length - 1;
            }
            if (slideIndex >= slides.length) {
                slideIndex = 0;
            }
            showSlides(slideIndex);
        }

    </script>
</html>
