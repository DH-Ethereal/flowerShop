<%--
  Created by IntelliJ IDEA.
  User: jiangchao
  Date: 2021/6/22
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:forward page="/open/index?user_id=${user.user_id}"/>
</body>
</html>
