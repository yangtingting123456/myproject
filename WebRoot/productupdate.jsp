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
function checkform()
{
	if (document.getElementById('nameid').value=="")
	{
		alert("房屋类别不能为空");
		return false;
	}	
	if (document.getElementById('addressid').value=="")
	{
		alert("房屋地址不能为空");
		return false;
	}	
	if (document.getElementById('maoshuid').value=="")
	{
		alert("房屋介绍 不能为空");
		return false;
	}	
	
	
	if (document.getElementById('jiageid').value=="")
	{
		alert("月租费不能为空");
		return false;
	}
	 var valid = /^\d+(?=\.{0,1}\d+$|$)/ ;
	if(!valid.test(document.getElementById('jiageid').value)){
		alert("月租费必须是数字");
		return false;
	}
	
	return true;
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

   <form action="indexmethod!productupdate2" method="post" onsubmit="return checkform()" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${bean.id }"/>
   <div class="center_title_bar">房屋信息修改</div>
<table width="100%" border="1"  cellpadding="0" cellspacing="0" style="background-color: #b9d8f3;">
    
   <tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
   <td class="ui_text_rt">所在城市:</td>
					<td class="ui_text_lt">
						<select name="fenlei" class="ui_select01">
                         <c:forEach items="${fenleilist}" var="bean2">
                           <option value="${bean2.id }" <c:if test="${bean2.id==bean.fenlei.id }">selected</c:if> >${bean2.name }</option>
                         </c:forEach>
                        </select>
					</td>
    </tr>
    
    
    <tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
   <td class="ui_text_rt">房屋类别:</td>
					<td class="ui_text_lt">
						<select name=name class="ui_select01" id='nameid'>
                          <option value="3室1厅" <c:if test="${bean.name=='3室1厅' }">selected</c:if>>3室1厅</option>
                          <option value="2室1厅" <c:if test="${bean.name=='2室1厅' }">selected</c:if>>2室1厅</option>
                          <option value="单身公寓" <c:if test="${bean.name=='单身公寓' }">selected</c:if>>单身公寓</option>
                          <option value="单间" <c:if test="${bean.name=='单间' }">selected</c:if>>单间</option>
                        </select>
					</td>
    </tr>
    
    <tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
  <td class="ui_text_rt">房屋地址:</td>
					<td class="ui_text_lt">
						<input type="text" name="address"  id='addressid' value="${bean.address }" class="ui_input_txt02"/>
					</td>
    </tr>
    
    <tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
    <td class="ui_text_rt">月租费（元/月）:</td>
					<td class="ui_text_lt">
						<input type="text" name="jiage"  id='jiageid' value="${bean.jiage }" class="ui_input_txt02"/>
					</td>
    </tr>
    
    
   <tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
    <td class="ui_text_rt">房屋介绍:</td>
					<td class="ui_text_lt">
						 <textarea rows="7" cols="50"  name="maoshu"  id="maoshuid">${bean.maoshu }</textarea>
					</td>
    </tr>
    
    
    
  <tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
    <td align="center" > 操作：</td>
    <td align="center"> 
     <input type="submit" value="提交" style="width: 60px" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input  onclick="javascript:history.go(-1);" style="width: 60px" type="button" value="返回" />
    
    </td>
    </tr>
    	</table>
    	
    	</form>
    	
    
    
   
   </div><!-- end of center content -->
   
   <%@ include file="right.jsp" %>
   
            
   </div><!-- end of main content -->
   
   
   
   <div class="footer">
   
  <div class="bottom" align="right"> Email：123456@qq.com 联系电话：123456 QQ：123456<br />
   </div>

   </div>                 


</div>
<!-- end of main_container -->
</body>
</html>
