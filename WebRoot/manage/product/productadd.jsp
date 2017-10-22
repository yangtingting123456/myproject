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
	if (document.getElementById('uploadfileid').value=="")
	{
		alert("房屋图片不能为空");
		return false;
	}
	if (document.getElementById('userid').value=="")
	{
		alert("房东不能为空");
		return false;
	}
	if (document.getElementById('jiageid').value=="")
	{
		alert("月租费不能为空");
		return false;
	}
		var valid=/^\d*$/;
	if(!valid.test(document.getElementById('jiageid').value)){
		alert("月租费必须是数字");
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
     <form action="${url }" method="post" onsubmit="return checkform()" enctype="multipart/form-data">
	<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
	<div id="container">
		
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">

				<tr>
					<td class="ui_text_rt">所在城市:</td>
					<td class="ui_text_lt">
						<select name="fenlei" class="ui_select01" id='fenleiid'>
                          <c:forEach items="${fenleilist}" var="bean">
                          <option value="${bean.id }"  >${bean.name }</option>
                          </c:forEach>
                        </select>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">房屋类别:</td>
					<td class="ui_text_lt">
						<select name=name class="ui_select01" id='nameid'>
						  <option value="">--请选择--</option>
                          <option value="3室1厅">3室1厅</option>
                          <option value="2室1厅">2室1厅</option>
                          <option value="单身公寓">单身公寓</option>
                          <option value="单间">单间</option>
                        </select>
					</td>
				</tr>
				
				
				
				<tr>
					<td class="ui_text_rt">房屋地址:</td>
					<td class="ui_text_lt">
						<input type="text" name="address"  id='addressid' class="ui_input_txt02"/>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">月租费（元/月）:</td>
					<td class="ui_text_lt">
						<input type="text" name="jiage"  id='jiageid' class="ui_input_txt02"/>
					</td>
				</tr>
				
			
				
				<tr>
					<td class="ui_text_rt">房屋介绍:</td>
					<td class="ui_text_lt">
						 <textarea rows="7" cols="50"  name="maoshu"  id="maoshuid" ></textarea>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">房屋图片:</td>
					<td class="ui_text_lt">
						<input type="file" name="uploadfile" size="30" id="uploadfileid" class="ui_input_txt02"/>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">房东:</td>
					<td class="ui_text_lt">
						<select name="user" class="ui_select01" id='userid'>
                          <c:forEach items="${userlist}" var="bean">
                          <option value="${bean.id }"  >${bean.truename }</option>
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