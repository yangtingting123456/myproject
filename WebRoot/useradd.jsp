<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link rel="stylesheet" type="text/css" href="style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="iecss.css" />
<![endif]-->

<script type="text/javascript" language="javascript">

function checkform(){
	if(document.getElementById("usernameid").value==""){
		
		alert('用户名不能为空');
		return false;
	}
	
	var valid = /^\w+$/;
	if(!valid.test(document.getElementById("usernameid").value)){
		alert('用户名必须是数字，字母或者下划线');
		return false;
		
	}
	
	if(document.getElementById("passwordid").value==""){
		
		alert('密码不能为空');
		return false;
	}
	
	if(document.getElementById("passwordid").value.length<6){
		
		alert('密码长度必须大于6位');
		return false;
	}
	
	if(document.getElementById("passwordid").value!=document.getElementById("password2id").value){
		
		alert('确认密码和原密码不一致');
		return false;
	}
	
	if(document.getElementById("truenameid").value==""){
		
		alert('真实姓名不能为空');
		return false;
	}
	
	
	if(document.getElementById("addressid").value==""){
		
		alert('地址不能为空');
		return false;
	}
	
	if(document.getElementById("phoneid").value==""){
		
		alert('手机不能为空');
		return false;
	}
	
	valid = /^0?1[3,5,8][0,1,2,3,4,5,6,7,8,9]\d{8}$/;
	
	if(!valid.test(document.getElementById("phoneid").value)){
		
		alert('请输入正确的手机格式');
		return false;
	}
	
	if(document.getElementById("emailid").value==""){
		
		alert('email不能为空');
		return false;
	}
	
	var reg = new RegExp('^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z][a-z.]{2,8}$');
	
	if(!reg.test(document.getElementById("emailid").value)){
		
		alert('请输入正确的邮箱地址');
		return false;
	}
	
	if(document.getElementById("qqid").value==""){
		
		alert('qq号码不能为空');
		return false;
	}
	
	
	
	
	
	return true;

}


</script>

</head>
<body>

<div id="main_container">
	
   <div id="main_content"> 

   <input type="hidden" name="id" value="${bean.id }"/>
   <div class="center_content">
   	<div class="center_title_bar">用户个人信息</div>
    <form action="indexmethod!register" method="post" onsubmit="return checkform()">
    	<table align="center" border="1" cellpadding="5" cellspacing="3" width="100%">
    	<tr>
    	<td>
    	用户名:
    	</td>
    	<td>
    	<input type="text" name="username" value="${bean.username }" size="25" id="usernameid" />
    	</td>
    	</tr>
    	
    	
    	<tr>
    	<td>
    	真实姓名:
    	</td>
    	<td>
    	<input type="text" name="truename" value="${bean.truename }" size="25" id="truenameid" />
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	地址:
    	</td>
    	<td>
    	<input type="text" name="address" value="${bean.address }" size="25" id="addressid" />
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	手机:
    	</td>
    	<td>
    	<input type="text" name="phone" value="${bean.phone }" size="25" id="phoneid" />
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	email:
    	</td>
    	<td>
    	<input type="text" name="email" value="${bean.email }" size="25" id="emailid" />
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	qq:
    	</td>
    	<td>
    	<input type="text" name="qq" size="25" value="${bean.qq }" id="qqid" />
    	</td>
    	</tr>
    		
    	
    	</table>
    	
    	</form>
    	
    
   
   </div><!-- end of center content -->
   
   
   
            
   </div><!-- end of main content -->
   

</div>
<!-- end of main_container -->
</body>
</html>
