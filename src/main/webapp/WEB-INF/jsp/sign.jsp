<%--
  Created by IntelliJ IDEA.
  User: jiangchao
  Date: 2021/1/12
  Time: 17:51
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
    <title>CREATE ACCOUNT</title>
</head>
<body>
<%@ include file="inhead.jsp"%>
<div class="box">
    <div>
        <h1>CREATE AN ACCOUNT</h1>
    </div>
    <div class="first">

        <form action="<c:url value='/user/sign'/> " method="POST" autocomplete="off" onsubmit="return formSign()">
            <legend>PLEASE ENTOR YOUR INFORMATION</legend>

            <div class="form-group">
                <img src="<c:url value='/img/user_name.png'/> " alt="">
                <input type="text" placeholder="User Name ( Chinese )" name="user_name" id="user_name" onblur="checkUser_name()">
                <img src="" alt="" id="imgUser_name">
            </div>

            <div class="form-group">
                <img src="<c:url value='/img/password.png'/> " alt="">
                <input type="password" placeholder="Enter Password( No fewer than 6 digits must contain letters and numbers )" name="password" id="password1" onblur="checkPassword()">
                <img src="" alt="" id="imgPassword1">
            </div>

            <div class="form-group">
                <img src="<c:url value='/img/password.png'/> " alt="">
                <input type="password" placeholder="Confirm Password" id="password2" onblur="checkPassword1()">
                <img src="" alt="" id="imgPassword2">
            </div>

            <div class="form-group">
                <img src="<c:url value='/img/birthday.png'/> " alt="">
                <input type="date" placeholder="Choose Birthday &nbsp;"  name="birthday" id="birthday" style="width: 86%;">
                <span></span>
            </div>

            <div class="form-group">
                <img src="<c:url value='/img/tel.png'/> " alt="">
                <input type="text" placeholder="Telephone" name="tel" id="tel" onblur="checkTel()">
                <img src="" alt="" id="imgTel">
            </div>

            <div class="form-group">
                <img src="<c:url value='/img/mail.png'/> " alt="">
                <input type="text" placeholder="Mail" name="mail" id="mail" onblur="checkEmail()">
                <img src="" alt="" id="imgEmail">
            </div>

            <div class="form-group">
                <img src="<c:url value='/img/sex.png'/> " alt="">
                <input type="radio" style="height: 20%;width: 35px;margin-left: 0px;" name="sex" value="男" checked>
                <input type="text" value="男" readonly style="width: 14px;">
                <input type="radio" style="height: 20%;width: 35px;" name="sex" value="女">
                <input type="text" value="女" readonly style="width: 14px;">
                <span></span>
            </div>

            <div class="end">
                <input type="submit" value="CREATE AN ACCOUNT">
                <a href="<c:url value='/open/openLogin'/> ">ALREADY HAVE AN ACCOUNT? SIGN IN HERE</a>
            </div>

        </form>

        <%@ include file="pop.jsp"%>

    </div>
</div>
<jsp:include page="inbottom.jsp"/>
</body>
</html>