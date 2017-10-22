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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
<link href="style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="scripts/artDialog/artDialog.js?skin=default"></script>
<title></title>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
	<form id="submitForm" name="submitForm" action="" method="post">
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
		<div id="container">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索</div>
						<div id="box_center">
							小区
							<select name="fangyuanEntity.fyXqCode" id="fyXq" class="ui_select01" onchange="getFyDhListByFyXqCode();">
                                <option value=""
                                >--请选择--</option>
                                <option value="6">瑞景河畔</option>
                                <option value="77">蔚蓝小区</option>
                                <option value="83">和盛园小区</option>
                            </select>

							座落&nbsp;&nbsp;<input type="text" id="fyZldz" name="fangyuanEntity.fyZldz" class="ui_input_txt02" />
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
							<input type="button" value="导入" class="ui_input_btn01" id="importBtn" />
							<input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" />
						</div>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th width="30"><input type="checkbox" id="all" onclick="selectOrClearAllCheckbox(this);" />
							</th>
							<th>位置</th>
							<th>房源</th>
							<th>房源面积</th>
							<th>计租面积</th>
							<th>户型</th>
							<th>建筑结构</th>
							<th>租赁性质</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
							<tr>
								<td><input type="checkbox" name="IDCheck" value="14458579642011" class="acb" /></td>
								<td>城中区</td>
								<td>瑞景河畔16号楼1-111</td>
								<td>65.97㎡</td>
								<td>65.97㎡</td>
								<td>一室一厅一卫</td>
								<td>混凝土</td>
								<td>公租房</td>
								<td>建成待租</td>
								<td>
									<a href="house_edit.html?fyID=14458579642011" class="edit">编辑</a> 
									<a href="javascript:del('14458579642011');">删除</a>
								</td>
							</tr>
						
							<tr>
								<td><input type="checkbox" name="IDCheck" value="14458625716623" class="acb" /></td>
								<td>城中区</td>
								<td>瑞景河畔16号楼1-112</td>
								<td>67.47㎡</td>
								<td>67.47㎡</td>
								<td>一室一厅一卫</td>
								<td>混凝土</td>
								<td>公租房</td>
								<td>已配租</td>
								<td>
									<a href="house_edit.html?fyID=14458625716623" class="edit">编辑</a> 
									<a href="javascript:del('14458625716623');">删除</a>
								</td>
							</tr>
						

					</table>
				</div>
				<div class="ui_tb_h30">
					<div class="ui_flt" style="height: 30px; line-height: 30px;">
						共有
						<span class="ui_txt_bold04">90</span>
						条记录，当前第
						<span class="ui_txt_bold04">1
						/
						9</span>
						页
					</div>
					<div class="ui_frt">
						<!--    如果是第一页，则只显示下一页、尾页 -->
						
							<input type="button" value="首页" class="ui_input_btn01" />
							<input type="button" value="上一页" class="ui_input_btn01" />
							<input type="button" value="下一页" class="ui_input_btn01"
								onclick="jumpNormalPage(2);" />
							<input type="button" value="尾页" class="ui_input_btn01"
								onclick="jumpNormalPage(9);" />
						
						
						
						<!--     如果是最后一页，则只显示首页、上一页 -->
						
						转到第<input type="text" id="jumpNumTxt" class="ui_input_txt01" />页
							 <input type="button" class="ui_input_btn01" value="跳转" onclick="jumpInputPage(9);" />
					</div>
				</div>
			</div>
		</div>
	</form>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
