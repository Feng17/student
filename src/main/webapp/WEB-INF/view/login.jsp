<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>学生信息管理</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="page-header">
    <c:if test="${not empty msg}">
        <h2> &nbsp; &nbsp; &nbsp; &nbsp; ${msg} </h2>
    </c:if>

    <c:if test="${empty msg}">
        <h2> &nbsp; &nbsp; &nbsp; &nbsp;欢迎</h2>
        <h4> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 您要访问的页面需要登录，登录后会跳转到您需要访问的页面。</h4>
    </c:if>
</div>
<div class="container">
    <form class="well form-horizontal" action="/signin" method="post">
        <fieldset>
            <legend>用户登录</legend>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="loginName">登录名：</label>
                <div class="col-sm-4">
                    <input id="loginName" type="text" name="username"  class="form-control" placeholder="请填写用户名" required >
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="loginPassword">密码：</label>
                <div class="col-sm-4">
                    <input id="loginPassword" type="password" name="password" class="form-control" placeholder="请填写密码" required >
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-4">
                    <button class="btn btn-primary btn-block" type="submit">登陆</button>
                    <button class="btn btn-default btn-block" type="reset">重置</button>
                </div>
            </div>
        </fieldset>
    </form>
    <br>
    <br>
    <h4> &nbsp; &nbsp; 没注册请先注册</h4>
    <button class="btn btn-info col-sm-2" data-toggle="modal"
            data-target="#myModal" type="button">注册</button>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">用户注册</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/register" method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名：</label>
                        <div class="col-sm-8">
                            <input class="form-control" type="text" pattern="\w+" maxlength=10 name="username" placeholder="请填写用户名 字母,数字或下划线 最多10位" required  >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码：</label>
                        <div class="col-sm-8">
                            <input class="form-control"  type="password"  minlength=5 name="password" placeholder="请填写密码 最少5位" required >
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-8">
                            <input class="btn btn-primary btn-block" type="submit" value="注册" >
                            <input class="btn btn-default btn-block" type="reset" value="重置" >
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>