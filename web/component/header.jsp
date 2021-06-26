<%-- 
    Document   : header
    Created on : Jun 20, 2021, 9:22:53 PM
    Author     : hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>

        <!--navigation-->
        <nav>
            <ul class="nav-bar">
                <%
                    final String FONT_WEIGHT = "font-weight:600;";
                    String homeStyle = "";
                    int currentId = Integer.parseInt(request.getAttribute("pageId").toString());
                    if (currentId == 0) {
                        homeStyle = FONT_WEIGHT;
                    }
                %>
                <li><a href="home" style="<%=homeStyle%>">My Font Page</a></li>
                    <c:forEach items="${listGalleryHeader}" var="gallery">
                        <c:set var="link" value="gallery?id=${gallery.getGalleryID()}"/>
                        <%
                            String galleryStyle = "";
                        %>
                        <c:if test="${pageId == gallery.getGalleryID()}">
                            <%
                                galleryStyle = FONT_WEIGHT;
                            %>
                        </c:if>
                    <li><a href="${link}" style=<%=galleryStyle%>>${gallery.getGalleryName()}</a></li>
                    </c:forEach>
                    <%
                        String contactStyle = "";
                        if(currentId == -1){
                            contactStyle = FONT_WEIGHT;
                        }
                    %>
                <li><a href="contact" style="<%=contactStyle%>">Contact</a></li>
            </ul>
        </nav>
        <!--end navigation-->

        <!--header-->
        <header>
            <table id="header-content">
                <tr>
                    <td id="icon" rowspan="2"><img src=${webLogoURL}></td>
                    <td><a id="title-link" href="home">${webName}</a></td>
                </tr>
                <tr>
                    <td id="sub-title">Welcome to this website</td>
                </tr>
            </table>
        </header>
        <!--end header-->
    </body>
</html>
