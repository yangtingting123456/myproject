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


</head>
 <body>

<div id="main_container">
	

   <div class="center_content">
   	<div class="center_title_bar">用户修改</div>
    <form action="indexmethod!userupdate2" method="post" onsubmit="return checkform()">
     <input type="hidden" name="id" value="${bean.id }"/>
    	<table align="center" border="1" cellpadding="5" cellspacing="3" width="100%">
    	<tr>
    	<td>
    	用户名:
    	</td>
    	<td>
    	<input type="text" name="username" size="25" id="usernameid" value="${bean.username }" /><span style="color: red;">*</span>
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	密码:
    	</td>
    	<td>
    	<input type="password" name="password" size="25" id="passwordid" value="${bean.password}" /><span style="color: red;">*</span>
    	</td>
    	</tr>

    	
    	<tr>
    	<td>
    	真实姓名:
    	</td>
    	<td>
    	<input type="text" name="truename" size="25" id="truenameid" value="${bean.truename }" /><span style="color: red;">*</span>
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	地址:
    	</td>
    	<td>
    	<input type="text" name="address" size="25" id="addressid" value="${bean.address }" /><span style="color: red;">*</span>
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	手机:
    	</td>
    	<td>
    	<input type="text" name="phone" size="25" id="phoneid" value="${bean.phone }" /><span style="color: red;">*</span>
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	email:
    	</td>
    	<td>
    	<input type="text" name="email" size="25" id="emailid" value="${bean.email }" /><span style="color: red;">*</span>
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	qq:
    	</td>
    	<td>
    	<input type="text" name="qq" size="25" id="qqid" value="${bean.qq}" /><span style="color: red;">*</span>
    	</td>
    	</tr>
    	
    	
    	<tr>
    	<td>
    	操作:
    	</td>
    	<td>
    	<input type="submit" value="保存" />

    	</td>
    	</tr>
 	
    	</table>
    	
    	</form>
    	
       
   </div><!-- end of main content -->
   

</div>
<!-- end of main_container -->
</body>
 </html>
  