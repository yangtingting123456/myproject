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
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							
							<th>用户名</th>
							<th>留言内容</th>
							<th>留言时间</th>
						</tr>
						<c:forEach items="${list}"  var="bean">
							<tr>
								<td>
								<c:if  test="${bean.user.id==null}">系统管理员:</c:if>
                                <c:if  test="${bean.user.id!=null}">${bean.user.username}:</c:if>
								</td>
								<td>${bean.mywords }</td>
								<td>${bean.createDate }</td>	
							</tr>
						</c:forEach>
					</table>
					<table>
					<tr>
						<form action="method!feedbackadd" method="post" >
                         <textarea rows="7" cols="100" name="mywords" ></textarea>
                            <div align="left">
                          <input type="submit" value="发送">
                          </div>
                         </form>
						</tr>
					</table>
				</div>
				<div class="ui_tb_h30">
					<div class="ui_flt" style="height: 30px; line-height: 30px;">
						${pagerinfo }
					</div>
					
				</div>
			</div>
		</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
