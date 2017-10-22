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
					<form action="${url }" method="post">
						<div id="box_center">		
							房屋类别：&nbsp;&nbsp;
							<select name="name"  class="ui_select01" id='nameid'>
							 <option value="" >--所有--</option>
                          <option value="3室1厅" <c:if test="${name=='3室1厅' }">selected</c:if>>3室1厅</option>
                          <option value="2室1厅" <c:if test="${name=='2室1厅' }">selected</c:if>>2室1厅</option>
                          <option value="单身公寓" <c:if test="${name=='单身公寓' }">selected</c:if>>单身公寓</option>
                          <option value="单间" <c:if test="${name=='单间' }">selected</c:if>>单间</option>
                        </select>
							城市：&nbsp;&nbsp;<select class="ui_select01" name="fenlei">
                   <option value="" >--所有--</option>
                 <c:forEach items="${fenleilist}"  var="bean2">
                    <option value="${bean2.id }" <c:if test="${fenlei== bean2.id }">selected</c:if>>${bean2.name }</option>
                 </c:forEach>
              </select>
              
              	审核状态：&nbsp;&nbsp;
							<select name="stauts"  class="ui_select01" id='stautsid'>
							 <option value="" >--所有--</option>
                          <option value="待审核" <c:if test="${stauts=='待审核' }">selected</c:if>>待审核</option>
                          <option value="审核通过" <c:if test="${stauts=='审核通过' }">selected</c:if>>审核通过</option>
                          <option value="不通过" <c:if test="${stauts=='不通过' }">selected</c:if>>不通过</option>
                        </select>
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
							<th>所在城市</th>
							<th>房屋类别</th>
							<th>房屋地址</th>
							<th>月租费（元/月）</th>
							<th>房屋图片</th>
							<th>房屋介绍</th>
							<th>房东</th>
							<th>审核状态</th>
							<th>发布时间</th>
							<th>操作</th>
							
							
						</tr>
						<c:forEach items="${list}"  var="bean">
							<tr>
							    <td>${bean.fenlei.name }</td>
								<td>${bean.name }</td>
								<td>${bean.address }</td>
								<td>${bean.jiage }</td>
								<td><img src='<%=basePath %>/temp/${bean.imgpath}' width="80" height="100"/></td>
								<td>${bean.maoshu}</td>
								<td>${bean.user.truename }</td>
								<td>
								<c:if test="${bean.stauts=='待审核' }">待审核</c:if>
								<c:if test="${bean.stauts=='审核通过' }"><span style="color: red">审核通过</span></c:if>
								<c:if test="${bean.stauts=='不通过' }"><span style="color: green">不通过</span></c:if>
								</td>
								<td>${fn:substring(bean.createtime,0, 19)}</td>
								
								<td>
									<a href="${url2 }update3?id=${bean.id }" class="edit">查看</a> &nbsp; &nbsp; &nbsp;
  	                                <a href="${url2 }update?id=${bean.id }">修改</a> &nbsp; &nbsp; &nbsp;
  	                                <a href="${url2 }delete?id=${bean.id }" onclick=" return confirm('确定要删除吗?');">删除</a> &nbsp; &nbsp; &nbsp;
  	                               <c:if test="${bean.stauts!='审核通过' }">
  	                                   <a href="method!productupdate4?id=${bean.id }">审核</a>
  	                                </c:if>   
  	                                 
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
