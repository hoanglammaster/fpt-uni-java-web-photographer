<%-- 
    Document   : footer
    Created on : Jun 20, 2021, 9:29:22 PM
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
        <footer>
            <div id="footer-content">
                <div id="view-page">
                    <c:forEach items="${hitsChar}" var="digits">
                        <span class="counter-item">
                            ${digits}
                        </span>
                    </c:forEach>
<!--                    <span class="counter-item">
                        1
                    </span>
                    <span class="counter-item">
                        2
                    </span>
                    <span class="counter-item">
                        3
                    </span>
                    <span class="counter-item">
                        4
                    </span>
                    <span class="counter-item">
                        5
                    </span>
                    <span class="counter-item">
                        6
                    </span>-->
                </div>
            </div>
        </footer>
    </body>
</html>
