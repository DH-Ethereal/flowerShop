<%--
  Created by IntelliJ IDEA.
  User: jiangchao
  Date: 2021/1/17
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" href="<c:url value='/img/logo.jpg'/> " type="image/x-icon">
<script src="<c:url value='/js/jquery-3.6.0.js'/> "></script>
<link rel="stylesheet" href="<c:url value='/css/pop.css'/> ">
<script>
    $(document).ready(function(){
        $(".but").click(function(){
            $("#pop_box").fadeOut();
        });
    });
    $(document).keydown(function(event){//回车事件调用点击事件
        if(event.keyCode==13){
            $("#pop_box").click();
        }
    });
</script>
<c:if test="${info!=null}">
    <div class="pop" id="pop_box">
        <div class="pop_bg" id="pop_bg">
        </div>
        <div id="MyDiv" class="white_content">
            <div>
                <img src="<c:url value='${img}'/> " alt="">
                <span>${info}</span>
                <span class="but">关闭</span>
            </div>
        </div>
    </div>
</c:if>