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
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Electronix Store</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="iecss.css" />
<![endif]-->
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="js/boxOver.js"></script>

</head>
<body>
 <input type="hidden" name="id" value="${bean.id }"/>
 
   <div class="center_content">
   	<div class="center_title_bar">房屋详情 </div>
    
    		<div class="prod_box_big">
        	<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">            
                 
                 <div class="product_img_big">
                 <a href="" title="header=[Zoom] body=[&nbsp;] fade=[on]"><img  src="<%=basePath%>/temp/${bean.imgpath }" width="160" height="180" border="0"/></a>
                 </div>
                     <div class="details_big_box">
                    
                         <div class="product_title_big">${bean.name }</div>
                         <div class="specifications">                                           
                                                                       所在城市: <span class="blue"> ${bean.fenlei.name  }</span><br/>
                                                                          月租费（元/月）: <span class="blue"> ${bean.jiage } （元）</span><br/>  
                                                                           房东姓名: <span class="blue"> ${bean.user.truename } </span><br/>  
                                                                             房东电话: <span class="blue"> ${bean.user.phone }</span><br/>  
                                                                              房屋地址: <span class="blue"> ${bean.address }</span><br/>                                                                                                                       
                                                                           房屋介绍 : <span class="blue">${bean.maoshu }</span><br/>                                                                                                                                                                         
                         </div>
                    
                     </div> 
     
            </div>
            <div class="bottom_prod_box_big"></div>                                
        </div>
        
        
        
        
        
     <c:if test="${bean.czstauts=='已租' }">     	
   	<div class="center_title_bar">用户点评</div>
    	<table width="100%" border="1"  cellpadding="0" cellspacing="0" style="background-color: #b9d8f3;">
    	<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
<td width="30%">评论用户</td>
<td width="60%">内容</td>
</tr>
    	<c:forEach items="${dianpinlist}" var="bean2">
<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
<td width="30%">
用户：${bean2.user.username}<br/>
${fn:substring(bean2.createtime,0, 16)}
</td>
<td width="60%">${bean2.content }</td>
</tr>
<br/>
</c:forEach>         
  </table>
   </c:if>     
  
  <c:if test="${user.role==1 }">
     <form action="indexmethod!dianpingadd" method="post" onsubmit="return checkform()">
      <input type="hidden" name="id" value="${bean.id }"/>
     <textarea class="ckeditor"  name="content" id="content"></textarea>  
     <div align="left"><span class="STYLE10">
     <input type="submit" value="发送"/>
     </span></div>
     </form>
   </c:if>     

</div>




<!-- end of main_container -->
</body>

</html>