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
							${bean.name }
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">所在城市:</td>
					<td class="ui_text_lt">
							 ${bean.fenlei.name  }
					</td>
				</tr>
				
					<tr>
					<td class="ui_text_rt">房屋地址:</td>
					<td class="ui_text_lt">
						${bean.address }
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">月租费（元/月）:</td>
					<td class="ui_text_lt">
						${bean.jiage }
					</td>
				</tr>
				
			
				
				
				<tr>
					<td class="ui_text_rt">房屋图片:</td>
					<td class="ui_text_lt">
						 <img src='<%=basePath %>/temp/${bean.imgpath}' width="80" height="100" readonly="readonly" />
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
						${bean.user.truename }
					</td>
				</tr>
				
				

				
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
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