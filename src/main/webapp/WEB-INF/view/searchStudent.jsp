<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>查询结果</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<br>
<br>
	<div class="container">
		<form class="navbar-form" action="/search" method="post">
			<div class="form-group">
				<input name="id" type="text"  pattern="\d+" maxlength=3 class="form-control" placeholder="请输入编号">
				<input name="name"type="text" maxlength=10 class="form-control" placeholder="请输入姓名">
				<input name="gender" type="text" maxlength=5 class="form-control" placeholder="请输入性别">
				<input name="age" type="text"  pattern="\d+" maxlength=3 class="form-control" placeholder="请输入年龄">
				<input name="number" type="text" maxlength=30 class="form-control" placeholder="请输入学号">
			</div>
			<button type="submit" class="btn btn-primary">搜索</button>
		</form>
		<div class="page-header">
			<h1>查询学生信息</h1>
		</div>
		<table class="table table-bordered">
			<tr class="active">
				<th>编号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>学号</th>
				<th>操作</th>
			</tr>
			 <c:forEach items="${searchList}" var="search">
			<tr>
				<td>${search.id}</td>
				<td>${search.name}</td>
				<td>${search.gender}</td>
				<td>${search.age}</td>
				<td>${search.number}</td>
				<td><a class="btn btn-success"  href="/student/${search.id}">详情</a>&nbsp;&nbsp;
				    <a class="btn btn-primary" href="/updateStudent/${search.id}">修改</a>&nbsp;&nbsp;
				    <a class="btn btn-danger" data-toggle="modal" data-target="#${search.id}" >删除</a>
				</td>
			</tr>
				 <div class="modal fade" id="${search.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					 <div class="modal-dialog" role="document">
						 <div class="modal-content">

							 <div class="modal-header">
								 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									 <span aria-hidden="true">&times;</span>
								 </button>
								 <h4 class="modal-title" id="myModalLabel">删除</h4>
							 </div>
							 <div class="modal-body">
								 <h4 class="alert alert-warning" role="alert">
									 <span class="label label-warning">Warning</span>&nbsp;确定要删除&nbsp;${search.name}&nbsp;吗
								 </h4>
								 <a class="btn btn-danger" href="/deleteStudent?id=${search.id}">是</a>
								 <a class="btn btn-primary" data-dismiss="modal" >否</a>
							 </div>
						 </div>
					 </div>
				 </div>
			 </c:forEach>
		</table>
	</div>
</body>
</html>