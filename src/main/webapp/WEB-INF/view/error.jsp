<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>出错啦 </title>
    <meta http-equiv="refresh" content="5; url=/main" >
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h3 class="alert alert-warning" >
			<span class="label label-danger">Error</span>&nbsp;&nbsp;操作失败 &nbsp;&nbsp;&nbsp;<strong>${msg}</strong>&nbsp;&nbsp;
			<b style=color:blue><span id=jump>5</span> 秒钟后页面将自动返回主界面</b>
			如未自动跳转，请点击<a href="/main">这里</a>返回主界面
		</h3>
	</div>

    <script>
         function countDown(secs){
              jump.innerText=secs;
              if(--secs>0)
                       setTimeout("countDown("+secs+" )",1000);
       }
        countDown(5);
    </script>
</body>
</html>
