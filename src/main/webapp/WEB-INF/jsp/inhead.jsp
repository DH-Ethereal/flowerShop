<%--
  Created by IntelliJ IDEA.
  User: jiangchao
  Date: 2021/1/21
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="shortcut icon" href="<c:url value='/img/logo.jpg'/>" type="image/x-icon">
<link rel="stylesheet" href="<c:url value='/css/inhead.css'/> " type="text/css">
<script src="<c:url value='/js/jquery-3.6.0.js'/> "></script>
<script>
    $(document).ready(function(){
        $("#t1").mouseover(function(){
            $("#t1").css("opacity","0");
            $("#d").fadeIn();
        });
        $("#d").mouseover(function(){
            $("#t1").css("opacity","0");
            $("#d").css("display","block");
        });
        $("#d").mouseout(function(){
            $("#d").hide();
            $("#t1").css("opacity","1");
        });
    });
</script>
<title>Spend Arena</title>
<div class="header">
    <div class="top">
        <table>
            <tr>
                <td>以道德、诚心为本</td>
                <td>7:00 PM前订购可免费次日送货</td>
                <td>
                    <a href="<c:url value='/index.jsp'/> ">联系我们</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <c:if test="${user.user_id==null}">
                    <a href="<c:url value='/open/openLogin'/> ">登录</a> /
                    <a href="<c:url value='/open/openSign'/> ">注册</a>
                    </c:if>
                    <c:if test="${user.user_id!=null}">
                    <span>欢迎</span>&nbsp;
                    <span id="fu">
                            <a href="<c:url value='/open/jump?it=0'/> " id="t1">
                                <%-- 获取名字的最后一个字--%>
                                ${fn:substring(user.user_name,fn:length(user.user_name)-1,fn:length(user.user_name))}
                            </a>
                            <div class="user" id="d">
                                <a href="<c:url value='/open/jump?it=0'/> " id="t2">
                                        ${fn:substring(user.user_name,fn:length(user.user_name)-1,fn:length(user.user_name))}
                                </a>
                                <h2>${user.user_name}</h2>
                                <div>
                                    <div></div>
                                    <a href="<c:url value='/open/jump?it=0'/> ">个人资料</a>
                                    <a href="<c:url value='/open/jump?it=1'/> ">账号管理</a>
                                    <a href="<c:url value='/open/jump?it=2'/> ">购物车</a>
                                    <a href="<c:url value='/open/jump?it=3'/> ">我的订单</a>
                                    <div></div>
                                    <a href="<c:url value='/user/xh'/> ">退出账号</a>
                                </div>
                            </div>
                    </span>
                    </c:if>
                </td>
            </tr>
        </table>
    </div>
    <div class="head">
        <div style="width: 96%;height: 100%; margin: auto;">
            <table>
                <tr>
                    <td>
                        <a href="<c:url value='/flower/findFlowers?type=专业手工花束'/> ">专业手工花束</a>
                    </td>
                    <td>
                        <a href="<c:url value='/flower/findFlowers?type=信箱的花'/> ">信箱的花</a>
                    </td>
                    <td>
                        <a href="<c:url value='/flower/findFlowers?type=豪华的花'/> ">豪华的花</a>
                    </td>
                    <td>
                        <a href="<c:url value='/index.jsp'/> ">
                            <img src="<c:url value='/img/logo.png'/> " alt="">
                        </a>
                    </td>
                    <td>
                        <a href="<c:url value='/flower/findFlowers?type=情人节鲜花'/> ">情人节鲜花</a>
                    </td>
                    <td>
                        <a href="<c:url value='/flower/findFlowers?type=特别供应'/> ">特别供应</a>
                    </td>
                    <td>
                        <a href="<c:url value='/flower/findFlowers'/> ">所有产品</a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="right">
            <a href="<c:url value='/open/jump?it=2'/> "><img src="<c:url value='/img/cart.png'/> " alt=""></a>
        </div>
    </div>
</div>
<div class="zhan">
</div>

