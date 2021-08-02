<%--
  Created by IntelliJ IDEA.
  User: jiangchao
  Date: 2021/1/21
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="shortcut icon" href="<c:url value='/img/logo.jpg'/>" type="image/x-icon">
    <link rel="stylesheet" href="<c:url value='/css/index.css'/> " type="text/css ">
    <title>Spend Arena</title>
</head>
<body>
<%@ include file="inhead.jsp"%>
<div>
    <div class="i1">
        <span>Send Someone A Bouquet Of Beautiful</span>
        <span>Flowers</span>
    </div>
    <div>
        <div class="a_ground">
            <span>专业手工花束</span>
            <span>HAND-TIED BOUQUETS</span>
        </div>
        <div class="represent">
            <c:forEach items="${hfList}" var="flower" end="2">
                <a href="<c:url value='/flower/findOne?flowercode=${flower.flowercode}'/> ">
                    <img src="<c:url value='/img/${fn:substring(flower.image, 0, fn:indexOf(flower.image, ","))}'/> " alt="">
                    <div class="represent_in">
                        <span>${flower.flower_name}</span>
                        <span>价格:￥<fmt:formatNumber value="${flower.price}" pattern="#.00"/></span>
                        <div>
                            立即订购
                        </div>
                    </div>
                    <c:if test="${flower.amount le 0}">
                        <div class="represent_overly">
                            已售空
                        </div>
                    </c:if>
                </a>
            </c:forEach>
        </div>
    </div>
    <div>
        <div class="a_ground">
            <span>信箱的花</span>
            <span>Letterbox Flowers</span>
        </div>
        <div class="represent">
            <c:forEach items="${lfList}" var="flower" end="2">
                <a href="<c:url value='/flower/findOne?flowercode=${flower.flowercode}'/> ">
                    <img src="<c:url value='/img/${fn:substring(flower.image, 0, fn:indexOf(flower.image, ","))}'/> " alt="">
                    <div class="represent_in">
                        <span>${flower.flower_name}</span>
                        <span>价格:￥<fmt:formatNumber value="${flower.price}" pattern="#.00"/></span>
                        <div>
                            立即订购
                        </div>
                    </div>
                    <c:if test="${flower.amount le 0}">
                        <div class="represent_overly">
                            已售空
                        </div>
                    </c:if>
                </a>
            </c:forEach>
        </div>
    </div>
    <div>
        <div class="a_ground">
            <span>豪华的花</span>
            <span>Luxury Flowers</span>
        </div>
        <div class="represent">
            <c:forEach items="${lfsList}" var="flower" end="2">
                <a href="<c:url value='/flower/findOne?flowercode=${flower.flowercode}'/> ">
                    <img src="<c:url value='/img/${fn:substring(flower.image, 0, fn:indexOf(flower.image, ","))}'/> " alt="">
                    <div class="represent_in">
                        <span>${flower.flower_name}</span>
                        <span>价格:￥<fmt:formatNumber value="${flower.price}" pattern="#.00"/></span>
                        <div>
                            立即订购
                        </div>
                    </div>
                    <c:if test="${flower.amount le 0}">
                        <div class="represent_overly">
                            已售空
                        </div>
                    </c:if>
                </a>
            </c:forEach>
        </div>
    </div>
    <div>
        <div class="a_ground">
            <span>情人节鲜花</span>
            <span>Valentine's Day Flowers</span>
        </div>
        <div class="represent">
            <c:forEach items="${dkList}" var="flower" end="2">
                <a href="<c:url value='/flower/findOne?flowercode=${flower.flowercode}'/> ">
                    <img src="<c:url value='/img/${fn:substring(flower.image, 0, fn:indexOf(flower.image, ","))}'/> " alt="">
                    <div class="represent_in">
                        <span>${flower.flower_name}</span>
                        <span>价格:￥<fmt:formatNumber value="${flower.price}" pattern="#.00"/></span>
                        <div>
                            立即订购
                        </div>
                    </div>
                    <c:if test="${flower.amount le 0}">
                        <div class="represent_overly">
                            已售空
                        </div>
                    </c:if>
                </a>
            </c:forEach>
        </div>
    </div>
    <div>
        <div class="a_ground">
            <span>特别供应</span>
            <span>Special Supply</span>
        </div>
        <div class="represent">
            <c:forEach items="${ssList}" var="flower" end="2">
                <a href="<c:url value='/flower/findOne?flowercode=${flower.flowercode}'/> ">
                    <img src="<c:url value='/img/${fn:substring(flower.image, 0, fn:indexOf(flower.image, ","))}'/> " alt="">
                    <div class="represent_in">
                        <span>${flower.flower_name}</span>
                        <span>价格:￥<fmt:formatNumber value="${flower.price}" pattern="#.00"/></span>
                        <div>
                            立即订购
                        </div>
                    </div>
                    <c:if test="${flower.amount le 0}">
                        <div class="represent_overly">
                            已售空
                        </div>
                    </c:if>
                </a>
            </c:forEach>
        </div>
    </div>
</div>
<%@ include file="inbottom.jsp"%>
</body>
</html>
