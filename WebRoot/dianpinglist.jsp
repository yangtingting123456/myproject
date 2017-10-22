<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script language="javascript" type="text/javascript">

function changenum(id){
		var num = document.getElementById(id+"_num").value;
		var reg1 =  /^\d+$/;
	if (num.match(reg1) == null)
	{
		alert("购买数量必须为正整数");
		return false;
	}
		if (num == 0 )
	{
		alert("购买数量必须大于0的正整数");
		return false;
	}
		var now = new Date(); 
		var t = now.getTime()+''; 
		window.location.href="indexmethod!gouwucheupdate?id="+id+"&number="+num+"&t="+t;
		
		
	}

</script>


</head>
<body>

<div id="main_container">
	
		<%@ include file="head.jsp" %>
    
   <div id="main_content"> 
   
            <%@ include file="menu.jsp" %>
            
          
    
    
   <%@ include file="left.jsp" %>
   
   
   <div class="center_content">
 	<div class="center_title_bar">${title }</div>
   <form action="indexmethod!gouwuchelist?id=${bean.id }"method="post" onsubmit="return checkform()">
    	<table width="100%" border="1"  cellpadding="0" cellspacing="0" style="background-color: #b9d8f3;">
    	<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
    	<td  align="center" >商品名</td>
    	<td  align="center" >商品价格</td>
    	<td  align="center" >定制尺寸</td>
    	<td  align="center" >定制颜色</td>
    	<td  align="center" >订购数量</td>
    	<td  align="center" >购买用户</td>
    	<td  align="center" >购买时间</td>
    	<td  align="center" >操作</td>
    	</tr>
    	
    	
    <c:forEach items="${list}" var="bean">
    	<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
    	<td  align="center" >${bean.product.name }</td>
    	<td  align="center" >${bean.product.jiage}</td>
    	<td  align="center" >${bean.chicun }</td>
    	<td  align="center" >${bean.yanse }</td>
    	<td  align="center" >${bean.number}</td>
    	<td  align="center" >${bean.user.username}</td>
    	<td  align="center" >${bean.createtime}</td>
    	<td align="center">
  	 
<br/>
  	  <a href="javascript:;" onClick="javascript:window.open('indexmethod!productupdate4?id=${bean.product.id }','','width=660,height=760,left=550, top=250,toolbar=no, status=no, menubar=no, resizable=yes, scrollbars=yes');return false;">评论</a>
 
    </td>
    	</tr>
    </c:forEach>
       
     
    	</table>
    	
    	</form>
    	
    
   </div><!-- end of center content -->
   
   <%@ include file="right.jsp" %>
   
            
   </div><!-- end of main content -->
   
   
   
   <div class="footer">
  <div class="bottom" align="right"> Email：123456@qq.com 联系电话：123456 QQ：123456<br />
    版权所有 2017 <a href="admin/login.jsp" title="源码之家" target="_blank"><span style="color: blue;"></span></a> </div>

   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
