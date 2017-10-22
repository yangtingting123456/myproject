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
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
		<div id="container">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
					<form action="${url }"  method="post">
						
						<div id="box_center">
						角色：&nbsp;&nbsp;
							<select name="role"  class="ui_select01" id='roleid'>
							 <option value="" >--所有--</option>
                          <option value="1" <c:if test="${role==1 }">selected</c:if>>普通用户</option>
                          <option value="2" <c:if test="${role==2 }">selected</c:if>>屋主</option>
                        </select>
							
							用户名：&nbsp;&nbsp;<input type="text" name="username" type="text"  value="${username }" class="ui_input_txt02" />
						<input type="submit" value="查询" class="ui_input_btn01" onclick="search();" /> 
						</div>
						
						</form>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th>角色</th>
							<th>用户名</th>
							<th>密码</th>
							<th>姓名</th>
							<th>地址</th>
							<th>电话</th>
							<th>电子邮箱</th>
							<th>qq</th>
							<th>添加时间</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${list}"  var="bean">
							<tr>
							<td>
							<c:if test="${bean.role==1 }">普通用户</c:if>
							<c:if test="${bean.role==2 }">屋主</c:if>
							</td>
								<td>${bean.username }</td>
								<td>${bean.password }</td>
								<td>${bean.truename }</td>
								<td>${bean.address }</td>
								<td>${bean.phone }</td>
								<td>${bean.email }</td>
								<td>${bean.qq }</td>
								<td>${fn:substring(bean.createtime,0, 19)}</td>
								<td>
  	                                <a href="method!userdelete?id=${bean.id }" onclick=" return confirm('确定要删除吗?');">删除</a> 
								</td>
							</tr>
						</c:forEach>


					</table>
				</div>
				<div class="ui_tb_h30">
					<div class="ui_flt" style="height: 30px; line-height: 30px;">
						${pagerinfo }
					</div>
					
				</div>
			</div>
		</div>
	</form>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
