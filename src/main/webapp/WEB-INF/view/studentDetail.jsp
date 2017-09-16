<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>学生详情</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<br>
<div class="container">
    <h1>详情</h1>
    <div  class="col-md-12 column">
        <img src="/image?name=${student.image}" height="200">
        <br>
        <br>
    </div>
    <div class="col-md-12 column">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>学号</th>
                <th>联系方式</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.gender}</td>
                <td>${student.age}</td>
                <td>${student.number}</td>
                <td>${student.tel}</td>
                <td> <a class="btn btn-primary " href="/updateStudent/${student.id}">修改 </a></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>