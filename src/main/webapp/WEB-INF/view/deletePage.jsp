<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>删除学生信息</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="container">
		<form class="form-horizontal" action="/deleteStudent" method="post">
			<div class="page-header">
				<c:if test="${not empty msg}">
					<h1>${msg}</h1>
				</c:if>
				<c:if test="${empty msg}">
					<h1>删除学生信息</h1>
				</c:if>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">学生编号</label>
				<div class="col-sm-4">
					<input class="form-control" type="text" pattern="\d+" maxlength=3 name="id" placeholder="请输入要删除的学生编号" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<input class="btn btn-primary btn-block" type="submit" value="提交" >
					<input class="btn btn-default btn-block" type="reset" value="重置" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>