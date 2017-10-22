<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<form id="submitForm" name="submitForm" action="/xngzf/archives/initFangyuan.action" method="post">
	<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
	<div id="container">
		
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt" width="80">小区</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.fyXqCode" id="fyXq" class="ui_select01" onchange="getFyDhListByFyXqCode();">
                            <option value="">--请选择--</option>
                            <option value="6" selected="selected">瑞景河畔</option>
                            <option value="77">蔚蓝小区</option>
                            <option value="83">和盛园小区</option>
                        </select>
					</td>
				</tr>
			
				<tr>
					<td class="ui_text_rt">座落</td>
					<td class="ui_text_lt">
						<input type="text" id="fyZldz" name="fangyuanEntity.fyZldz" value="瑞景河畔16号楼1-112" class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">位置</td>
					<td class="ui_text_lt">
						<input type="text" id="fyPsdz" name="fangyuanEntity.fyPsdz" value="城中区" class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">位置</td>
					<td class="ui_text_lt">
						<input type="text" id="fyPsdz" name="fangyuanEntity.fyPsdz" value="城中区" class="ui_input_txt02"/>
					</td>
				</tr>
				
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="button" value="取消" class="ui_input_btn01"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>