<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
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

<!--<form action="${url }" method="post">-->
<!--商品名称：<input name="name" type="text"  value="${name }"/>-->
<!---->
<!--<input type="submit"  value="查询"/>-->
<!---->
<!---->
<!--</form>-->

   	<div class="center_title_bar">我的房屋</div>&nbsp;  &nbsp; &nbsp;  &nbsp;
  <div ><font color="blue"><h3><a href="indexmethod!productadd"> 发布租赁信息</a></h3></font></div>
   	
<table width="100%" border="1"  cellpadding="0" cellspacing="0" style="background-color: #b9d8f3;">


    	<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
    	 <td align="center" >房屋类别</td>
    	  <td align="center" >所在城市</td>
    	<td align="center" >发布人 </td>
    	<td align="center" >审核状态</td>
    	<td align="center" >出租状态</td>
    	<td align="center" >发布时间</td>
    	<td align="center" >操作</td>
    	</tr>
    	
    	
    <c:forEach items="${list}" var="bean">
    	  <tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
    	<td align="center" >${bean.name }</td>
    	<td align="center" >${bean.fenlei.name }</td>
    	<td align="center" >${bean.user.truename }</td>
       <td align="center" >
     		<c:if test="${bean.stauts=='待审核' }">待审核</c:if>
			<c:if test="${bean.stauts=='审核通过' }"><span style="color: red">审核通过</span></c:if>
			<c:if test="${bean.stauts=='不通过' }"><span style="color: green">不通过</span></c:if>
     	</td>
     	<td align="center" >
     	   <c:if test="${bean.czstauts=='未租' }"><span style="color: blue">未租</span></c:if>
			<c:if test="${bean.czstauts=='已租' }"><span style="color: red">已租</span></c:if>
     	</td>
    	<td align="center" >${fn:substring(bean.createtime,0, 16)}</td>
    	<td align="center" > 
     <a href="javascript:;" onClick="javascript:window.open('indexmethod!productupdate4?id=${bean.id }','','width=660,height=680,left=550, top=250,toolbar=no, status=no, menubar=no, resizable=yes, scrollbars=yes');return false;">查看详情</a>	 &nbsp; 
      <a href="indexmethod!productupdate?id=${bean.id }" ">修改</a> &nbsp; 
       <a href="indexmethod!productdelete?id=${bean.id }" onclick=" return confirm('确定要删除吗?'); ">删除</a> &nbsp; 
    
    </td>
    </tr>
    
    </c:forEach>
    
       <tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
    <td align="center" colspan="21" >${pagerinfo }</td>

  	
    </tr>
      
    	</table>
    	
    	
    
    
   
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
