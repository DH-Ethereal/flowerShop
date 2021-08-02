<%--
  Created by IntelliJ IDEA.
  User: jiangchao
  Date: 2021/1/29
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <link rel="stylesheet" href="<c:url value='/css/detail .css'/> " type="text/css">
    <link rel="shortcut icon" href="<c:url value='/img/logo.jpg'/> " type="image/x-icon">
    <title>${flower.flower_name}</title>
</head>
<body>
<%@ include file="inhead.jsp"%>
<div class="detail">
    <div class="detail_top">我们在全国范围内提供鲜花和礼物，以帮助您保持联系。现在订购免费送货和贺卡。</div>
    <div class="detail_body">
        <div class="detail_img">
            <c:set value="${fn:split(flower.image,',')}" var="imageStr"/>
            <c:forEach items="${imageStr}" var="img" end="3">
                <img src="<c:url value='/img/${img}'/> " alt="">
            </c:forEach>
            <c:if test="${flower.amount==0}">
                <div class="kind_overly">
                    已售空
                </div>
            </c:if>
        </div>
        <div class="detail_put">
            <!-- 花名 -->
            <span>${flower.flower_name}</span>
            <!-- 价格 -->
            <span>￥<fmt:formatNumber value="${flower.price}" pattern="#.00"/>&nbsp;&nbsp;含运费</span>
            <!-- 花语 -->
            <span>${flower.descs}</span>
            <!-- 花束说明 -->
            <span>${flower.remark}</span>
            <c:if test="${flower.amount ge 1}">
                <a href="<c:url value='/cart/addCart?flowercode=${flower.flowercode}'/> ">加入购物车</a>
            </c:if>
            <c:if test="${flower.amount le 0}">
                <p>此商品不能被选购</p>
            </c:if>
        </div>
        <div class="detail_comprise">
            <div>
                <img src="<c:url value='img/${imageStr[4]}'/> " alt="">
                <p>如此精美的选择包括:</p>
                <ul>
                    <c:set value="${fn:split(flower.material,',')}" var="materialStr"/>
                    <c:forEach items="${materialStr}" var="material">
                        <li>${material}</li>
                    </c:forEach>
                </ul>
                <p>
                    我们的花店会精心挑选每朵美丽的花朵，以确保没有水的旅途中也足够坚固，因此您可以确定，当幸运的收件人抬起他们令人愉悦的礼物的盖子时，它们的外观也一样好。
                </p>
            </div>
            <div>
                <img src="<c:url value='img/${imageStr[5]}'/> " alt="">
                <p>所选用的包装:</p>
                <p style="text-indent: 2em;">${flower.pack}</p>
                <p>如您所知:</p>
                <p>这些美丽的花可能刚到的时候花蕾是闭合的，但一旦它们到了温暖的用户家，它们很快就会开放。偶尔，我们可能需要替换一些花或叶子，但不用担心——每一朵花都会像你在这些照片中看到的那样令人惊叹。</p>
            </div>
        </div>
    </div>
</div>
<%@ include file="pop.jsp"%>
<%@ include file="inbottom.jsp"%>
</body>
</html>
