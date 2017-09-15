<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<html>
<head>
	<title>更新学生信息</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="container">
		<form class="form-horizontal" action="/update" method="post" >
			<div class="page-header">
				<h1>
					更新学生信息
				</h1>
				<h4>
					所有栏目都为必填项
				</h4>
			</div>
			<div class="col-sm-7">
				<div class="form-group">
					<label class="col-sm-2 control-label">编号</label>
					<div class="col-sm-8">
						<p class="form-control">${student.id}</p>
						<input type="hidden" name="id" value="${student.id}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-8">
						<input class="form-control" type="text" maxlength=10 name="name" placeholder="${student.name}" required >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">性别</label>
					<div class="col-sm-8">
						<input class="form-control" type="text" maxlength=5 name="gender" placeholder="${student.gender}" required >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">年龄</label>
					<div class="col-sm-8">
						<input class="form-control" type="text" pattern="\d+" maxlength=3  name="age" placeholder="${student.age}" required >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">学号</label>
					<div class="col-sm-8">
						<input class="form-control" type="text" name="number" maxlength=30 placeholder="${student.number}" required >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">联系方式</label>
					<div class="col-sm-8">
						<input class="form-control" type="text" name="tel" maxlength=30 placeholder="${student.tel}"required >
					</div>
				</div>
				<br>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<input class="btn btn-primary btn-block" type="submit" value="提交" >
						<input class="btn btn-default btn-block" type="reset" value="重置" >
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>