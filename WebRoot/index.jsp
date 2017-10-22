<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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

</head>
<body>

<div id="main_container">
	
	 <%@ include file="head.jsp" %>
	
    
   <div id="main_content"> 
   
            <%@ include file="menu.jsp" %>
            
          
    
    
   <%@ include file="left.jsp" %>
   
   
   <div class="center_content">
   	<div class="center_title_bar">房屋租赁</div>
   	 <form action="indexmethod!index" method="post" onsubmit="return checkform()">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
                                               房屋类别：
					  <select name="name"  class="ui_select01" id='nameid'>
					      <option value="" >--所有--</option>
                          <option value="3室1厅" <c:if test="${name=='3室1厅' }">selected</c:if>>3室1厅</option>
                          <option value="2室1厅" <c:if test="${name=='2室1厅' }">selected</c:if>>2室1厅</option>
                          <option value="单身公寓" <c:if test="${name=='单身公寓' }">selected</c:if>>单身公寓</option>
                          <option value="单间" <c:if test="${name=='单间' }">selected</c:if>>单间</option>
                        </select>
				城市：
                    <select class="ui_select01" name="fenlei">
                      <option value="" >--所有--</option>
                      <c:forEach items="${fenleilist}"  var="bean2">
                       <option value="${bean2.id }" <c:if test="${fenlei== bean2.id }">selected</c:if>>${bean2.name }</option>
                      </c:forEach>
                    </select>
                   租金范围：<input type="text" style="width:10%" name="beginTime"  value="${beginTime }"/>~<input type="text" style="width:10%" name="endTime"  value="${endTime }"/>

               <input type="submit"  value="查询"/>
   	</form>
    
    <c:forEach  items="${productlist1}" var="bean">
    	<div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title">
                  <a href="javascript:;" onClick="javascript:window.open('indexmethod!productupdate3?id=${bean.id }','','width=660,height=480,left=550, top=250,toolbar=no, status=no, menubar=no, resizable=yes, scrollbars=yes');return false;">${bean.name }</a>
                 </div>
                 <div class="product_img">
                
                 <a href="javascript:;" onClick="javascript:window.open('indexmethod!productupdate3?id=${bean.id }','','width=660,height=480,left=550, top=250,toolbar=no, status=no, menubar=no, resizable=yes, scrollbars=yes');return false;"><img  src="<%=basePath%>/temp/${bean.imgpath }" width="100" height="100" border="0"/></a>
                 </div>
                 <div class="prod_price">
                                             月租金：${bean.jiage }元 <span class="price"></span>  </div>  
                 <div class="prod_price">                             
                                        所在城市：${bean.fenlei.name } <span class="price"></span>
                 </div>  
                              
            </div>
        </div>
    </c:forEach>
     	<div class="center_title_bar">${pagerinfo }</div>
 

   
   </div><!-- end of center content -->
   
   <%@ include file="right.jsp" %>
   
            
   </div><!-- end of main content -->
   
   
   
   <div class="footer">
   
 <div class="bottom"> Email：123456@qq.com 联系电话：123456 QQ：123456<br />
   </div>

   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
