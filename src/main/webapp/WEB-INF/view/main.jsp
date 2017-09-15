<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生信息</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="container">
		<div class="page-header">
			<h1>所有学生信息</h1>
		</div>
		<table class= "table table-bordered">
			<tr class="active">
				<th>编号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年龄</th>
                <th>学号</th>
				<th>操作</th>
			</tr>
			 <c:forEach items="${pageBean.list}" var="student">
			<tr>
				<td>${student.id}</td>
				<td>${student.name}</td>
				<td>${student.gender}</td>
				<td>${student.age}</td>
		    	<td>${student.number}</td>
                <td><a class="btn btn-success"  href="/student/${student.id}">详情</a>&nbsp;&nbsp;
                    <a class="btn btn-primary" href="/updateStudent/${student.id}">修改</a>&nbsp;&nbsp;
				    <a class="btn btn-danger" data-toggle="modal" data-target="#${student.id}" >删除</a>
                </td>
			</tr>

                 <div class="modal fade" id="${student.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                                     <span class="label label-warning">Warning</span>&nbsp;确定要删除&nbsp;${student.name}&nbsp;吗
                                 </h4>
                                 <a class="btn btn-danger" href="/deleteStudent?id=${student.id}">是</a>
                                 <a class="btn btn-primary"data-dismiss="modal">否</a>
                             </div>
                         </div>
                     </div>
                 </div>
		  </c:forEach>
		</table>

        <%--分页导航--%>
            <ul class="pagination pagination-lg">
                <%--首页--%>
                <li><a href="/main?page=1">首页</a></li>
                <%--上一页--%>
                <c:choose>
                    <c:when test="${pageBean.curPage!=1}">
                        <li><a href="/main?page=${pageBean.curPage-1}"><span>&laquo;</span></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><span>&laquo;</span></li>
                    </c:otherwise>
                </c:choose>
                <%--中间部分--%>
                <c:choose>
                    <c:when test="${pageBean.allPage<=10}">
                        <c:forEach begin="1" end="${ pageBean.allPage}" var="i">
                            <li class="pageNum"><a href="/main?page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:when>
                    <c:when test="${pageBean.curPage<=5}">
                        <c:forEach begin="1" end="10" var="i">
                            <li class="pageNum"><a href="/main?page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:when>
                    <c:when test="${pageBean.allPage-pageBean.curPage<5}">
                        <c:forEach begin="${pageBean.allPage-9}" end="${ pageBean.allPage}" var="i">
                            <li class="pageNum"><a href="/main?page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach begin="${pageBean.curPage-4}" end="${ pageBean.curPage+5}" var="i">
                            <li class="pageNum"><a href="/main?page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                <%--下一页--%>
                <c:choose>
                    <c:when test="${pageBean.curPage!=pageBean.allPage}">
                        <li><a href="/main?page=${pageBean.curPage+1}"><span>&raquo;</span></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><span>&raquo;</span></li>
                    </c:otherwise>
                </c:choose>
                <%--尾页--%>
                <li><a href="/main?page=${pageBean.allPage}">尾页</a></li>
            </ul>
	</div>

<script type="text/javascript">
    $(function(){
        var curPage = ${pageBean.curPage};
        $(".pageNum").each(function(){
            if($(this).text()==curPage){
                $(this).addClass("active");
            }
        });
    });
</script>
</body>
</html>