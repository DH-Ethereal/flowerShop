<%--
  Created by IntelliJ IDEA.
  User: jiangchao
  Date: 2021/1/12
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="<c:url value='/img/logo.jpg'/> " type="image/x-icon">
    <link rel="stylesheet" href="<c:url value='/css/sign.css'/> " type="text/css">
    <script src="<c:url value='/js/sign.js'/> "></script>
    <title>Log In</title>
</head>
<body>
<%@ include file="inhead.jsp"%>
${carts}
<div class="box">
    <div>
        <h1>LOG IN</h1>
    </div>
    <div class="first">

        <form action="<c:url value='/user/login'/> " method="POST" autocomplete="off" onsubmit="return formLogin()">
            <legend>PLIEASE LOG ON</legend>

            <div class="form-group">
                <img src="<c:url value='/img/user_id.png'/> " alt="">
                <input type="text" placeholder="Please enter your Tel / Email" name="login_name" id="login_name" onblur="checkLogin_name()">
                <img src="" alt="" id="imgLogin_name">
            </div>

            <div class="form-group">
                <img src="<c:url value='/img/password.png'/> " alt="">
                <input type="password" placeholder="Please enter your Password" name="password" id="password1" onblur="checkPassword()">
                <img src="" alt="" id="imgPassword1">
            </div>

            <div class="end">
                <input type="submit" value="SIGN IN">
                <a href="<c:url value='/open/openSign'/> ">DON’T HAVE AN ACCOUNT? CREATE ONE</a>
            </div>

        </form>

        <%@ include file="pop.jsp"%>

    </div>
</div>
<jsp:include page="inbottom.jsp"/>
</body>
</html>