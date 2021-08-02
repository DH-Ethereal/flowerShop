<%--
  Created by IntelliJ IDEA.
  User: jiangchao
  Date: 2021/1/29
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="shortcut icon" href="<c:url value='/img/logo.jpg'/> " type="image/x-icon">
    <link rel="stylesheet" href="<c:url value='/css/kind.css'/> " type="text/css ">
    <script src="<c:url value='/js/jquery-3.6.0.js'/> "></script>
    <title>Spend Arena</title>
</head>
<script>
    $(function (){
        $("#kind_sort").change(function (){
            var sort = $("#kind_sort").val();
            <c:if test="${type==null}">
                window.location = "<c:url value='/flower/findFlowers?sort=\"+sort+\"'/>";
            </c:if>
            <c:if test="${type!=null}">
                var type = "${type}";
                window.location = "<c:url value= '/flower/findFlowers?type=\"+type+\"&sort=\"+sort+\"'/>";
            </c:if>
        });
    });
</script>
<body>
<%@ include file="inhead.jsp"%>
<div class="kind">
    <div class="kind_top">我们在全国范围内提供鲜花和礼物，以帮助您保持联系。现在订购免费送货和贺卡。</div>
    <c:if test="${flowerList!=null}">
        <c:if test="${type==null}">
            <span class="kind_caption">所有产品</span>
        </c:if>
        <c:if test="${type!=null}">
            <span class="kind_caption">${type}</span>
        </c:if>
    <div class="kind_sort">
        &nbsp;&nbsp;
        <label>排序方式：</label>
        <%
            String sortStr[] = {"精选","最畅销","价格升序","价格降序","最新","最早"};
            pageContext.setAttribute("sortStr",sortStr);
        %>
        <select name="sort" id="kind_sort" >
            <c:forEach items="${sortStr}" var="s">
                <option value="${s}" <c:if test="${sort==s}">selected="selected"</c:if>>${s}</option>
            </c:forEach>
        </select>
    </div>
    <div class=" merchandise">
        <c:forEach items="${flowerList}" var="flower">
            <a href="<c:url value='/flower/findOne?flowercode=${flower.flowercode}'/> ">
                <img src="<c:url value='/img/${fn:substring(flower.image, 0, fn:indexOf(flower.image, ","))}'/> " alt="">
                <div class="kind_in">
                    <span>${flower.flower_name}</span>
                    <span>价格:￥<fmt:formatNumber value="${flower.price}" pattern="#.00"/></span>
                    <div>
                        立即订购
                    </div>
                </div>
                <c:if test="${flower.amount le 0}">
                    <div class="kind_overly">
                        已售空
                    </div>
                </c:if>
            </a>
        </c:forEach>
    </div>
    </c:if>
    <div class="kind_bottom">
        无论你是为一个生日，一个周年纪念日购物，或仅仅是让某人知道你想他们，用什么显示你的关心，像一束美丽的鲜花，是由专家花匠手绑鲜花!从明亮和充满活力的颜色到更微妙的粉彩和中性色调，有适合您的东西。您是在找订花吗?。
    </div>
</div>
<%@ include file="inbottom.jsp"%>
</body>
</html>
