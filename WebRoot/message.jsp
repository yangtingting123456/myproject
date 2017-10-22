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
	
		n1<%@ include file="head.jsp" %>
    
   <div id="main_content"> 
   
            <%@ include file="menu.jsp" %>
            
          
    
    
   <%@ include file="left.jsp" %>
   
   <input type="hidden" name="id" value="${bean.id }"/>
   <div class="center_content">
   	<div class="center_title_bar">用户留言</div>
    	<table width="100%" border="1"  cellpadding="0" cellspacing="0" style="background-color: #b9d8f3;">
    	<c:forEach items="${list}" var="bean">
<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
<td width="10%">
<c:if  test="${bean.user.id==null}">系统管理员:</c:if>
<c:if  test="${bean.user.id!=null}">${bean.user.username}:</c:if>
</td>
<td width="50%">${bean.mywords }</td>
<td width="20%">${fn:substring(bean.createDate,0, 16)}</td>
</tr>
</c:forEach>
<tr><td  colspan='3'  align="center">${pagerinfo }</td> </tr>
         
      
  </table>
     <form action="indexmethod!feedbackadd" method="post" >
     <textarea rows="4" cols="68" name="mywords"  style="border:3px solid #ccc "></textarea>
     <div align="left"><span class="STYLE10">
     <input type="submit" value="发送"/>
     </span></div>
     </form>
    	
   
   </div><!-- end of center content -->
   
   <%@ include file="right.jsp" %>
   
            
   </div><!-- end of main content -->
   
   
   
   <div class="footer">
   
  <div class="bottom" align="right"> Email：123456@qq.com 联系电话：123456 QQ：123456<br />
    版权所有 2017 <a href="admin/login.jsp" title="个人所有" target="_blank"><span style="color: blue;"></span></a> </div>

      
   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
