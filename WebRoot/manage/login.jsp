<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
		<meta charset="utf-8">
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
	 <!-----start-main---->
	 <div class="main">
		<div class="login-form">
			<h1>管理后台登陆</h1>
					<div class="head">
						<img src="images/user.png" alt=""/>
					</div>
				 <form name=form1 action="method!login" method=post>
						<input type="text" class="text" name=username >
						<input type="password" name=password>
						<div class="submit">
							<input type="submit" onclick="myFunction()" value="LOGIN" >
					</div>	
					<p> <a href="../">返回首页</a></p>
				</form>
			</div>
			<!--//End-login-form-->
			 <!-----start-copyright---->
   					<div class="copy-right">
						<p></p> 
					</div>
				<!-----//end-copyright---->
		</div>
			 <!-----//end-main---->
		 		
<div style="display:none"></div>
</body>
</html>