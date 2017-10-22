<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
<link href="style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="scripts/jquery/jquery-1.4.4.min.js"></script>
<script src="scripts/My97DatePicker/WdatePicker.js" type="text/javascript" defer="defer"></script>
<script type="text/javascript" src="scripts/artDialog/artDialog.js?skin=default"></script>

</head>
<body>
<form action="${url }?id=${bean.id }" method="post" onsubmit="return checkform()" enctype="multipart/form-data">
	 <input type="hidden" name="id" value="${bean.id }"/>
	<div id="container">
		
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">

				
				<tr>
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
				
				<tr>
					<td class="ui_text_rt">所在城市:</td>
					<td class="ui_text_lt">
						<select name="fenlei" class="ui_select01">
                         <c:forEach items="${fenleilist}" var="bean2">
                           <option value="${bean2.id }" <c:if test="${bean2.id==bean.fenlei.id }">selected</c:if> >${bean2.name }</option>
                         </c:forEach>
                        </select>
					</td>
				</tr>
				
					<tr>
					<td class="ui_text_rt">房屋地址:</td>
					<td class="ui_text_lt">
						<input type="text" name="address"  id='addressid' value="${bean.address }" class="ui_input_txt02"/>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">月租费（元/月）:</td>
					<td class="ui_text_lt">
						<input type="text" name="jiage"  id='jiageid' value="${bean.jiage }" class="ui_input_txt02"/>
					</td>
				</tr>
				
			
				
				
			
				
				
				<tr>
					<td class="ui_text_rt">房屋介绍:</td>
					<td class="ui_text_lt">
						 <textarea rows="7" cols="50"  name="maoshu"  id="maoshuid">${bean.maoshu }</textarea>
					</td>
				</tr>
				
					<tr>
					<td class="ui_text_rt">房东:</td>
					<td class="ui_text_lt">
						<select name="user" class="ui_select01" id='userid'>
                          <c:forEach items="${userlist}" var="bean2">
                          <option value="${bean2.id }"  <c:if test="${bean2.id==bean.user.id }">selected</c:if> >${bean2.truename }</option>
                          </c:forEach>
                        </select>
					</td>
				</tr>

				
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input type="submit" value="提交" class="ui_input_btn01"/>
						&nbsp;<input onclick="javascript:history.go(-1);" type="button" value="返回" class="ui_input_btn01"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>