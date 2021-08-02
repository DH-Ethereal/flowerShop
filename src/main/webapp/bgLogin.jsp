<%--
  Created by IntelliJ IDEA.
  User: jiangchao
  Date: 2021/6/20
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="bgLogin">

<!-- Head -->
<head>

    <title>竞技场花后台</title>

    <!-- Meta-Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="<c:url value='/img/logo.jpg'/> " type="image/x-icon">

    <!-- style CSS -->
    <link rel="stylesheet" href="<c:url value='/css/bgLogin.css'/> " type="text/css" media="all">

    <!-- fontawesome -->
    <link rel="stylesheet" href="<c:url value='/css/font-awesome.min.css'/> " type="text/css" media="all">

    <!-- google fonts -->
    <link href="<c:url value='//fonts.googleapis.com/css?family=Mukta:300,400,500'/> " rel="stylesheet">

</head>
<!-- //Head -->

<!-- Body -->
<body>

<section class="main">

    <div class="bottom-grid">
        <div class="logo">
            <h1>竞技场花后台系统</h1>
        </div>
    </div>
    <div class="content-w3ls">
        <div class="text-center icon">
            <span class="fa fa-meetup"></span>
        </div>

        <div class="content-bottom">
            <form action="<c:url value='/user/bgLogin'/> " method="post">
                <div class="field-group">
                    <span class="fa fa-user" aria-hidden="true"></span>
                    <div class="wthree-field">
                        <input name="ad_name" id="text1" type="text" value="" placeholder="Username" required>
                    </div>
                </div>
                <div class="field-group">
                    <span class="fa fa-lock" aria-hidden="true"></span>
                    <div class="wthree-field">
                        <input name="ad_pwd" id="myInput" type="Password" placeholder="Password">
                    </div>
                </div>
                <div class="wthree-field">
                    <button type="submit" class="btn">Log in</button>
                </div>
            </form>
        </div>
    </div>
    <div class="copyright">
        <p>版权归属① Spend Arena , dh.ethereal@gmail.com .保留所有权利。</p>
    </div>
</section>
<%@ include file="WEB-INF/jsp/pop.jsp"%>

</body>
<!-- //Body -->

</html>
