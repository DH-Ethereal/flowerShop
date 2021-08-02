<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <script src="<c:url value='/js/jquery-3.6.0.js'/> "></script>
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
    <script src="<c:url value='/bootstrap/js/jquery.min.js'/> "></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/> "></script>
    <link rel="shortcut icon" href="<c:url value='/img/logo.jpg'/> " type="image/x-icon">
    <link rel="stylesheet" href="<c:url value='/css/user_center.css'/> " type="text/css">
    <script src="<c:url value='/js/user_center.js'/> "></script>
    <title>User Center</title>
    <style>
        th{
            text-align: center;
        }
        tr{
            text-align: center;
        }
        button{
            outline: none;
        }
        .table>tbody>tr>td{
            vertical-align: middle;
        }
    </style>
</head>
<script>
    //判断进入哪个div，页面加载即选择
    $(document).ready(function(){
        var navStr = $(".nav_bar").children('span');
        var divShow = $(".content").children('.zs');
        if (${it!=null}){
            $(navStr[parseInt(${it})]).addClass('nav_barFirst').siblings('span').removeClass('nav_barFirst');
            //索引对应div块显示
            $(divShow[parseInt(${it})]).show();
            //其他隐藏
            $(divShow[parseInt(${it})]).siblings('.zs').hide();
        }
    });
</script>

<body>
<%@ include file="inhead.jsp"%>
<div class="uc">
    <div class="nav_bar">
        <span>个人资料</span>
        <span>账号管理</span>
        <span>购物车</span>
        <span>我的订单</span>
        <div></div>
        <a href="<c:url value='/user/xh'/> ">退出账号</a>
    </div>
    <div class="content">
        <div class="zs">
            <div class="z1">
                <span>
                    ${fn:substring(user.user_name,fn:length(user.user_name)-1,fn:length(user.user_name))}
                </span>
                <div>
                    <p>${user.user_name}</p>
                    <p>您还不是会员身份<a href="#">开通会员></a></p>
                </div>
            </div>
            <div class="z2">
                <span>基本信息</span>
                <div>
                    <p>
                        <span>用户ID:</span>
                        <span>${user.user_id}</span>
                    </p>
                    <p>
                        <span>真实姓名:</span>
                        <span>${user.user_name}</span>
                    </p>
                    <p>
                        <span>性别:</span>
                        <span>${user.sex}</span>
                    </p>
                    <p>
                        <span>出生日期:</span>
                        <span>${user.birthday}</span>
                    </p>
                </div>
                <!-- <a href="">
                    编辑
                </a> -->
            </div>
        </div>
        <div class="zs">
            <div class="z1" id="z1">
                <img src="<c:url value='/img/dun.png'/> " alt="">
            </div>
            <div class="z2">
                <span>账号管理</span>
                <div>
                    <p>
                        <span>密码:</span>
                        <span>********</span>
                        <a href="#">修改密码</a>
                    </p>
                    <p>
                        <span>手机:</span>
                        <span>
                            ${fn:substring(user.tel,0,3)}
                            ****
                            ${fn:substring(user.tel,fn:length(user.tel)-4,fn:length(user.tel))}
                        </span>
                        <a href="#">修改手机</a>
                    </p>
                    <p>
                        <span>邮箱:</span>
                        <span>
                            ${fn:substring(user.mail,0,3)}
                            ***
                            ${fn:substring(user.mail,fn:indexOf(user.mail,"@"),fn:length(user.mail))}
                        </span>
                        <a href="#">修改邮箱</a>
                    </p>
                    <p>
                        <span>安全</span>
                    </p>
                </div>
            </div>
        </div>
        <div class="zs">
            <div class="z3">
                <div>
                    <div>
                        <c:if test="${!empty cartList}">
                            <c:forEach items="${cartList}" var="cart" varStatus="indexStr">
                                <div class="cart0">
                                    <a href="<c:url value='/flower/findOne?flowercode=${cart.flower.flowercode}'/> ">
                                        <img src="<c:url value='/img/${fn:substring(cart.flower.image, 0, fn:indexOf(cart.flower.image, ","))}'/> " alt="">
                                    </a>
                                    <table>
                                        <tr>
                                            <td>商品名称</td>
                                            <td>单价</td>
                                            <td>数量</td>
                                            <td>删除</td>
                                        </tr>
                                        <tr>
                                            <form action="<c:url value='/cart/updateCart?cart_id=${cart.cart_id}&it=2'/> " method="POST">
                                                <td>${cart.flower.flower_name}</td>
                                                <td>￥<fmt:formatNumber value="${cart.flower.price}" pattern="#.00"/></td>
                                                <td>
                                                        <%--                                                最大数量--%>
                                                    <input type="text" value="${cart.flower.amount}" hidden id="amount_max${indexStr.index}">
                                                        <%--                                                 索引值--%>
                                                    <input type="text" value="${cartList.size()}" hidden id="max_i">
                                                    <div class="amount_mn">
                                                        <button type="submit" id="dec${indexStr.index}">-</button>
                                                        <input type="text" name="count" value="${cart.count}" readonly>
                                                        <button type="submit" id="inc${indexStr.index}">+</button>
                                                    </div>
                                                </td>
                                            </form>
                                            <td>
                                                <a href="<c:url value='/cart/deleteCart?cart_id=${cart.cart_id}&it=2'/> " class="form_d" style="padding: 0.8vh 0.7vh;">删除</a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div class="z302">
                        <c:if test="${!empty cartList}">
                        <a href="<c:url value='/cart/deleteCarts?it=2'/> " class="cj">清空购物车</a>
                            <span>合计:￥
                                <c:forEach items="${cartList}" var="cart">
                                    <c:set value="${totalScore+cart.totalprice}" var="totalScore"/>
                                </c:forEach>
                                <fmt:formatNumber value="${totalScore}" pattern="#.00"/>
                            </span>
                        <a data-toggle="modal" data-target="#myModal1">确认下单</a>
                            <!-- 模态框（Modal） --><div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="myModalLabel" style="font-weight: bold;font-size: 1.3vmax;">订单信息</h4>
                                    </div>
                                    <div class="modal-body">

                                        <form class="form-horizontal" role="form" action="<c:url value='/order/addOrder?it=2'/> " method="post">
                                            <div class="form-group">
                                                <label for="firstname" class="col-sm-2 control-label">收件人姓名</label>
                                                <div class="col-sm-10">
                                                    <input type="text" required="required" class="form-control" name="touser_name" value="${user.user_name}" id="firstname" placeholder="请输入收件人姓名">  </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="lastname" class="col-sm-2 control-label">收件人电话</label>
                                                <div class="col-sm-10">
                                                    <input type="text" required="required" class="form-control" name="touser_tel" value="${user.tel}" id="lastname1" placeholder="请输入收件人电话">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="lastname" class="col-sm-2 control-label">收件地址</label>
                                                <div class="col-sm-10">
                                                    <input type="text" required="required" class="form-control" name="touser_address" id="lastname2" placeholder="请输入收件地址">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="lastname" class="col-sm-2 control-label">总价</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="totalprice" value="<fmt:formatNumber value="${totalScore}" pattern="#.00"/>" id="lastname" readonly>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="lastname" class="col-sm-2 control-label">备注</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="od_remark" id="lastname3" placeholder="可以进行备注说明">
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal" style="outline: none">关闭</button>
                                                <button type="submit" class="btn btn-primary" style="outline: none">提交更改</button>
                                            </div>
                                        </form>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal -->
                            </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <div class="zs">
            <div class="z4">
                <table class="table">
                    <thead>
                    <tr>
                        <td>订单号</td>
                        <td>创建日期</td>
                        <td>收货地址</td>
                        <td>总金额</td>
                        <td>备注</td>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <c:if test="${!empty orders}">
                        <c:forEach items="${orders}" var="order" varStatus="o">
                            <tbody>
                            <tr>
                                <td>${order.order_id}</td>
                                <td>${order.od_createtime}</td>
                                <td>
                                        ${order.touser_address}
                                </td>
                                <td>
                                    <fmt:formatNumber value="${order.totalprice}" pattern="#.00"/>
                                </td>
                                <td>
                                        ${order.od_remark}
                                </td>
                                <td>
                                    <a href="#" style="padding: 0.8vh 0.7vh;" class="btn btn-primary" data-toggle="modal" data-target="#myModal1${o.index}">订单详情</a>
                                    <c:set value="${ols.selectAll(order.order_id)}" var="orderList"/>
                                    <!-- 模态框（Modal） --><div class="modal fade" id="myModal1${o.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" style="font-weight: bold;font-size: 1.3vmax;">订单详情</h4>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table">
                                                    <thead>
                                                    <tr>
                                                        <td>商品名称</td>
                                                        <td>商品数量</td>
                                                        <td>金额</td>
                                                    </tr>
                                                    </thead>
                                                    <c:forEach items="${orderList}" var="order_s">
                                                        <tbody>
                                                        <tr>
                                                            <td>${order_s.flower.flower_name}</td>
                                                            <td>${order_s.count}</td>
                                                            <td>
                                                                <fmt:formatNumber value="${order_s.summary}" pattern="#.00"/>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </c:forEach>
                                                </table>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal -->
                                    </div>
                                </div>
                                    <a href="<c:url value='/order/deleteOrder?order_id=${order.order_id}&it=3'/> " style="padding: 0.8vh 0.7vh;" class="btn btn-success">取消订单</a>
                                </td>
                            </tr>
                            </tbody>
                        </c:forEach>
                    </c:if>
                </table>
            </div>
        </div>
    </div>
</div>
<%@ include file="pop.jsp"%>
<%@ include file="inbottom.jsp"%>
</body>
</html>
