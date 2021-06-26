<%-- 
    Document   : contact
    Created on : Jun 21, 2021, 10:25:00 PM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contact</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <link rel="stylesheet" type="text/css" href="css/contact_style.css"/>
        <link rel="stylesheet" type="text/css" href="css/fontawesome-free-5.15.3-web/css/all.css"/>
    </head>
    <body>
        <!--header-->
        <%@include file="component/header.jsp" %>

        <div id="wapper">
            <!--content-->
            <div id="content">
                <div id="left-side">
                    <div class="heading">
                        <h1 class="page-title">Contact</h1>
                    </div>
                    <div class="sub-content">
                        <div id="infor">
                            <h4>PHOTOGRAPHER</h4>
                            <div id="address">
                                <p>Address: <span class="address-infor">${contact.getAddress()}</span><br>
                                    City: <span class="address-infor">${contact.getCity()}</span><br>
                                    Country: <span class="address-infor">${contact.getCountry()}</span></p>
                            </div>
                            <table id="contact">
                                <tr>
                                    <td><p>Tel:</p></td>
                                    <td class="contact-infor"><a href="tel:${contact.getTel()}">${contact.getTel()}</a></td>
                                </tr>
                                <tr>
                                    <td><p>Email:</p></td>
                                    <td class="contact-infor"><a href="mailto:${contact.getEmail()}">${contact.getEmail()}</a></td>
                                </tr>
                            </table>

                        </div>
                    </div>
                    <div class="sub-content">
                        <div id="emb-map">
                            <iframe src="${contact.getEmbedMap()}" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
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

