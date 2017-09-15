<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<nav class="navbar navbar-default navbar-fixed-top"  role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="/main">学生信息管理</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li>
                <a href="/searchStudent">查询学生信息</a>
            </li>
            <li>
                <a href="/addStudent">新增学生信息</a>
            </li>
            <li>
                <a href="/deletePage">删除学生信息</a>
            </li>
            <li>
                <a href="/updatePage">修改学生信息</a>
            </li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <li><a href="#">当前用户：${user.name}</a></li>
            <li><a href="/logout">退出登录</a></li>
        </ul>
    </div>
</nav>
<br>
<br>