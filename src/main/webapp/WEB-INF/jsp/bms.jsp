<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
    <link rel="shortcut icon" href="<c:url value='/img/logo.jpg'/> " type="image/x-icon">
    <link rel="stylesheet" href="<c:url value='/css/bms.css'/> " type="text/css">
    <script src="<c:url value='/js/jquery-3.6.0.js'/> "></script>
    <script src="<c:url value='/js/user_center.js'/> "></script>
    <script src="<c:url value='/bootstrap/js/jquery.min.js'/> "></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/> "></script>
    <title>竞技场花后台</title>
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
<h2 align="center" style="letter-spacing: 0.8vmax;font-family:'Times New Roman', Times, serif;font-weight: 600;font-size: 2vmax">竞技场花管理界面</h2>
<div class="uc">
    <div class="nav_bar">
        <span class="nav_barFirst">用户管理</span>
        <span>商品管理</span>
        <span>订单管理</span>
        <div></div>
        <a href="<c:url value='/user/xh?p=reg'/> ">退出系统</a>
    </div>
    <div class="content">
<%--        用户信息管理--%>
        <div class="zs">
            <!-- 按钮触发模态框 --><button class="btn btn-primary btn-lg" data-toggle="modal" style="margin: 3px 10px; line-height: 9px;outline: none;font-size: 18px;position: fixed;margin-top: 10px" data-target="#myModal1">新增</button>
            <div style="height: 45px"></div>
            <!-- 模态框（Modal） --><div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel" style="font-weight: bold">新增用户</h4>
                        </div>
                        <div class="modal-body">

                            <form class="form-horizontal" role="form" action="<c:url value='/user/sign?it=0&p=reg'/> " method="post">

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">用户名</label>
                                    <div class="col-sm-10">
                                        <input type="text" required="required" class="form-control" name="user_name" id="lastname2"
                                       placeholder="请输入用户名">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="password" required="required" class="form-control" name="password" id="lastname1"
                                               placeholder="请输入用户密码">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-10">
                                        <input type="radio" name="sex" value="男" checked>&nbsp;男&nbsp;<input type="radio"  name="sex" value="女">&nbsp;女
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">生日</label>
                                    <div class="col-sm-10">
                                        <input type="date" class="form-control" name="birthday" id="lastname4"
                                               placeholder="请选择生日">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">电话</label>
                                    <div class="col-sm-10">
                                        <input type="text" required="required" class="form-control" name="tel" id="lastname"
                                               placeholder="请输入手机号">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">邮箱</label>
                                    <div class="col-sm-10">
                                        <input type="email" required="required" class="form-control" name="mail" id="lastname3" placeholder="请输入邮箱">
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary">提交更改</button>
                                </div>
                            </form>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </div>
            <table class="table">
                <thead>
                <tr>
<%--                    <td>选择</td>--%>
                    <td>用户名</td>
                    <td>姓名</td>
                    <td>密码</td>
                    <td>性别</td>
                    <td>生日</td>
                    <td>电话</td>
                    <td>邮箱</td>
                    <td>注册时间</td>
                    <td>级别</td>
                    <td>操作</td>
                </tr>
                </thead>
                <c:forEach items="${userList}" var="user" varStatus="u">
                <tbody>
                <tr>
<%--                    <td><input type="checkbox" name="nids"></td>--%>
                    <td>${user.user_id}</td>
                    <td>${user.user_name}</td>
                    <td>${user.password}</td>
                    <td>${user.sex}</td>
                    <td>${user.birthday}</td>
                    <td>${user.tel}</td>
                    <td>${user.mail}</td>
                    <td>${user.record_date}</td>
                    <td>${user.grade==0?"会员用户":"普通用户"}</td>
                    <td>
                <button class="btn btn-primary" data-toggle="modal" data-target="#myModal1${u.index}" style="outline: none">编辑</button>
                    <%--模态框start--%>
                <div class="modal fade" id="myModal1${u.index}" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel" aria-hidden="true" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close"
                                        data-dismiss="modal" aria-hidden="true">
                                    &times;</button>
                                <h4 class="modal-title" >修改用户信息系</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form" action="<c:url value='/user/updateUserInfo?it=0'/> " method="post">
                                    <div class="form-group">
                                        <label for="firstname" class="col-sm-2 control-label">用户名</label>
                                        <div class="col-sm-10">
                                            <input type="text" required="required" class="form-control" name="user_id" id="user_id" placeholder="请输入用户名" readonly value="${user.user_id}">  </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="lastname" class="col-sm-2 control-label">密码</label>
                                        <div class="col-sm-10">
                                            <input  type="password" required="required" class="form-control" name="password" id="password" value="${user.password}"
                                                   placeholder="请输入用户密码">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="lastname" class="col-sm-2 control-label">姓名</label>
                                        <div class="col-sm-10">
                                            <input type="text" required="required" class="form-control" name="user_name" id="user_name" value="${user.user_name}"
                                                   placeholder="请输入姓名">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="lastname" class="col-sm-2 control-label">性别</label>
                                        <div class="col-sm-10" style="text-align: left">
                                            <c:if test="${user.sex=='男'}">
                                                <input type="radio" name="sex" value="男" checked>男
                                                <input type="radio" name="sex" value="女">女
                                            </c:if>
                                            <c:if test="${user.sex=='女'}">
                                                <input type="radio" name="sex" value="男" >男
                                                <input type="radio" name="sex" value="女" checked>女
                                            </c:if>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="lastname" class="col-sm-2 control-label">生日</label>
                                        <div class="col-sm-10">
                                            <input type="date" class="form-control" name="birthday" id="birthday" value="${user.birthday}"
                                                   placeholder="请选择生日">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="lastname" class="col-sm-2 control-label">电话</label>
                                        <div class="col-sm-10">
                                            <input type="text" required="required" class="form-control" name="tel" id="tel" value="${user.tel}"
                                                   placeholder="请输入手机号">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="lastname" class="col-sm-2 control-label">邮箱</label>
                                        <div class="col-sm-10">
                                            <input type="email" required="required" class="form-control" name="mail" id="mail" value="${user.mail}"
                                                   placeholder="请输入邮箱">
                                        </div>
                                    </div>

                                    <div class="form-group" style="text-align: left">
                                        <label for="lastname" class="col-sm-2 control-label">权限</label>
                                        <div class="col-sm-10">
                                            <c:if test="${user.grade==0}">
                                                <input type="radio" name="grade" value="0" checked>会员用户
                                                <input type="radio" name="grade" value="1">普通用户
                                            </c:if>
                                            <c:if test="${user.grade==1}">
                                                <input type="radio" name="grade" value="0" >会员用户
                                                <input type="radio" name="grade" value="1" checked>普通用户
                                            </c:if>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button type="submit" class="btn btn-primary" style="outline: none;">提交更改</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                    <%--模态框end--%>
                        <a href="<c:url value='/user/remove?user_id=${user.user_id}'/> " class="btn btn-success" style="line-height: 19px">注销</a>
                    </td>
                </tr>
                </tbody>
                </c:forEach>
            </table>
        </div>
        <div class="zs">
            <%--        商品信息管理--%>
                <!-- 按钮触发模态框 --><button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2" style="margin: 3px 10px; line-height: 9px;outline: none;font-size: 18px;position: fixed;margin-top: 10px">上架</button>
                <div style="height: 45px"></div>
                <!-- 模态框（Modal） --><div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="width: 50%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel1" style="font-weight: bold">上架商品</h4>
                        </div>
                        <div class="modal-body">

                            <form class="form-horizontal" role="form" action="<c:url value='/flower/setFlower?it=1&get=add'/> " method="post">
                                <div class="form-group">
                                    <label for="firstname" class="col-sm-2 control-label">商品编号</label>
                                    <div class="col-sm-10">
                                        <input type="text" required="required" class="form-control" name="flowercode" id="firstname1" placeholder="请输入商品编号">  </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">类别</label>
                                    <div class="col-sm-10">
                                        <select name="type" class="form-control">
                                            <option value="专业手工花束">专业手工花束</option>
                                            <option value="信箱的花">信箱的花</option>
                                            <option value="豪华的花">豪华的花</option>
                                            <option value="情人节鲜花">情人节鲜花</option>
                                            <option value="特别供应">特别供应</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">花束名</label>
                                    <div class="col-sm-10">
                                        <input type="text" required="required" class="form-control" name="flower_name" placeholder="请输入花束名">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">材料</label>
                                    <div class="col-sm-10">
                                        <input type="text" required="required" class="form-control" name="material" placeholder="请输入制作花束的材料,以英文状态下的“,”隔开">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">包装</label>
                                    <div class="col-sm-10">
                                        <input type="text" required="required" class="form-control" name="pack" placeholder="请输入包装">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">花语</label>
                                    <div class="col-sm-10">
                                        <input type="text" required="required" class="form-control" name="descs" placeholder="请输入花语">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">价格</label>
                                    <div class="col-sm-10">
                                        <input type="text" required="required" class="form-control" name="price" placeholder="请输入价格为整型">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">主图</label>
                                    <div class="col-sm-10">
                                        <input type="file" required="required" class="form-control" name="img01" placeholder="请选择主图">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">详图一</label>
                                    <div class="col-sm-10">
                                        <input type="file" required="required" class="form-control" name="img02" placeholder="请选择详图一">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">详图二</label>
                                    <div class="col-sm-10">
                                        <input type="file" required="required" class="form-control" name="img03" placeholder="详图二">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">详图三</label>
                                    <div class="col-sm-10">
                                        <input type="file" required="required" class="form-control" name="img04" placeholder="请选择详图三">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">详图四</label>
                                    <div class="col-sm-10">
                                        <input type="file" required="required" class="form-control" name="img05" placeholder="请选择详图四">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">详图五</label>
                                    <div class="col-sm-10">
                                        <input type="file" required="required" class="form-control" name="img06" placeholder="请选择详图五">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">配送范围</label>
                                    <div class="col-sm-10">
                                        <select name="deliverarea" class="form-control">
                                            <option value="全市">全市</option>
                                            <option value="全省">全省</option>
                                            <option value="全国">全国</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">商品数量</label>
                                    <div class="col-sm-10">
                                        <input type="text" required="required" class="form-control" name="amount" placeholder="请输入商品数量为整型">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastname" class="col-sm-2 control-label">商品说明</label>
                                    <div class="col-sm-10">
                                        <input type="text" required="required" class="form-control" name="remark" placeholder="请输入商品说明">
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary">上架商品</button>
                                </div>
                            </form>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <td>商品编号</td>
                        <td>花束类别</td>
                        <td>花束名</td>
                        <td>材料</td>
                        <td>包装</td>
                        <td>花语</td>
                        <td>价格</td>
<%--                        <td>折扣</td>--%>
                        <td>图片集</td>
                        <td>配送范围</td>
                        <td>商品数量</td>
                        <td>上架时间</td>
                        <td>花束说明</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <c:forEach items="${flowerList}" var="flower" varStatus="m">
                    <tbody>
                    <tr>
                        <td>
                            <div style="width: 120px;">
                                ${flower.flowercode}
                            </div>
                        </td>
                        <td>
                            <div style="width: 120px;">
                                ${flower.type}
                            </div>
                        </td>
                        <td>
                            <div style="width: 120px;">
                                    ${flower.flower_name}
                            </div>
                        </td>
                        <td>
                            <div style="overflow-y:auto;width: 130px;height: 60px;word-break : normal">
                                    ${flower.material}
                            </div>
                        </td>
                        <td>
                            <div style="width: 120px;">
                                    ${flower.pack}
                            </div>
                        </td>
                        <td>
                            <div style="width: 120px;">
                                    ${flower.descs}
                            </div>
                        </td>
                        <td>
                            <div style="width: 120px;">
                                    ￥<fmt:formatNumber value="${flower.price}" pattern="#.00"/>
                            </div>
                        </td>
                        <td>
                            <div style="overflow-y:auto;width: 130px;height: 60px;word-break : break-all">
                                    ${flower.image}
                            </div>
                        </td>
                        <td>
                            <div style="width: 120px;">
                                    ${flower.deliverarea}
                            </div>
                        </td>
                        <td>
                            <div style="width: 120px;">
                                    ${flower.amount}
                            </div>
                        </td>
                        <td>
                            <div style="width: 120px;">
                                    ${flower.createtime}
                            </div>
                        </td>
                        <td>
                            <div style="overflow-y:auto;width: 130px;height: 60px;word-break : normal">
                                ${flower.remark}
                            </div>
                        </td>
                        <td>
                            <div style="width: 120px;">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#myModal2${m.index}" style="outline: none">编辑</button>
                                <!-- 模态框（Modal） --><div class="modal fade" id="myModal2${m.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog" style="width: 50%">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" style="font-weight: bold">修改商品信息</h4>
                                        </div>
                                        <div class="modal-body">

                                            <form class="form-horizontal" role="form" action="<c:url value='/flower/setFlower?it=1&get=update'/> " method="post">
                                                <div class="form-group">
                                                    <label for="firstname" class="col-sm-2 control-label">商品编号</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" required="required" class="form-control" name="flowercode" value="${flower.flowercode}" readonly placeholder="请输入商品编号">  </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">类别</label>
                                                    <div class="col-sm-10">
                                                        <%
                                                            String typeStr[] = {"专业手工花束","信箱的花","豪华的花","情人节鲜花","特别供应"};
                                                            pageContext.setAttribute("typeStr",typeStr);
                                                        %>
                                                            <select name="type" class="form-control">
                                                                <c:forEach items="${typeStr}" var="type">
                                                                    <option value="${type}" <c:if test="${flower.type==type}">selected="selected"</c:if>>${type}</option>
                                                                </c:forEach>
                                                            </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">花束名</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" required="required" class="form-control" name="flower_name" value="${flower.flower_name}" placeholder="请输入花束名">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">材料</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" required="required" class="form-control" name="material" value="${flower.material}" placeholder="请输入制作花束的材料,以英文状态下的“,”隔开">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">包装</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" required="required" class="form-control" name="pack" value="${flower.pack}" placeholder="请输入包装">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">花语</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" required="required" class="form-control" name="descs" value="${flower.descs}" placeholder="请输入花语">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">价格</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" required="required" class="form-control" name="price" value="<fmt:formatNumber value="${flower.price}" pattern="#.00"/>" placeholder="请输入价格为整型">
                                                    </div>
                                                </div>
                                                <c:set value="${fn:split(flower.image,',')}" var="imgStr"/>
<%--                                                存在安全协议，不能显示图片名--%>
                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">主图</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" value="原始图片名为:${imgStr[0]},下方必须选择文件,存在安全协议,只能又得重新选" readonly>
                                                        <input type="file" required="required" class="form-control" name="img01" value="${imgStr[0]}">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">详图一</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" value="原始图片名为:${imgStr[1]},下方必须选择文件" readonly>
                                                        <input type="file" required="required" class="form-control" name="img02" value="${imgStr[1]}">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">详图二</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" value="原始图片名为:${imgStr[2]},下方必须选择文件" readonly>
                                                        <input type="file" required="required" class="form-control" name="img03" value="${imgStr[2]}">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">详图三</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" value="原始图片名为:${imgStr[3]},下方必须选择文件" readonly>
                                                        <input type="file" required="required" class="form-control" name="img04" value="${imgStr[3]}">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">详图四</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" value="原始图片名为:${imgStr[4]},下方必须选择文件" readonly>
                                                        <input type="file" required="required" class="form-control" name="img05" value="${imgStr[4]},下方必须选择文件">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">详图五</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" value="原始图片名为:${imgStr[5]},下方必须选择文件" readonly>
                                                        <input type="file" required="required" class="form-control" name="img06" value="${imgStr[5]}">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">配送范围</label>
                                                    <div class="col-sm-10">
                                                        <%
                                                            String delStr[] = {"全市","全省","全国"};
                                                            pageContext.setAttribute("delStr",delStr);
                                                        %>
                                                        <select name="deliverarea" class="form-control">
                                                            <c:forEach items="${delStr}" var="del">
                                                                <option value="${del}" <c:if test="${flower.deliverarea==del}">selected="selected"</c:if>>${del}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">商品数量</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" required="required" class="form-control" name="amount" value="${flower.amount}" placeholder="请输入商品数量为整型">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="lastname" class="col-sm-2 control-label">商品说明</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" required="required" class="form-control" name="remark" value="${flower.remark}" placeholder="请输入商品说明">
                                                    </div>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                    <button type="submit" class="btn btn-primary">提交更改</button>
                                                </div>
                                            </form>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal -->
                                </div>
                            </div>
                                <a href="<c:url value='/flower/removeOne?flowercode=${flower.flowercode}&it=1'/> " class="btn btn-success" style="line-height: 19px">下架</a>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
        <div class="zs">

        </div>
    </div>
</div>

<%@ include file="pop.jsp"%>
</body>
</html>
