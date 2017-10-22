<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/uploadfile/";
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
					<form action="method!leaselist" method="post">
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
                   租赁人：&nbsp;&nbsp;<input  name="truename" type="text"  value="${truename }" class="ui_input_txt02" />
              <input type="submit" value="查询" class="ui_input_btn01" onclick="search();" /> 
						</form>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							
							
							
	    <th >房屋类别</th>
    	 <th >所在城市</th>
    	  <th >房屋地址</th>
    	   <th >月租费（元/月）</th>
    	<th >发布人 </th>
    	<th >承租人</th>
    	<th >租赁时长(月)</th>
    	<th >合计金额</th>
    	<th >租赁状态</th>
    	<th >租赁时间</th>
    	<th >操作</th>
							
							
						</tr>
						<c:forEach items="${list}"  var="bean">
							<tr>
		<td align="center" >${bean.product.name }</td>
    	<td align="center" >${bean.product.fenlei.name }</td>
    	<td align="center" >${bean.product.address }</td>
    	<td align="center" >${bean.product.jiage }</td>
    	<td align="center" >${bean.product.user.truename }</td>
        <td align="center" >${bean.user.truename }</td>
         <td align="center" >${bean.times }</td>
           <td align="center" >${bean.price }</td>
     	<td align="center" >
     	   <c:if test="${bean.product.czstauts=='未租' }"><span style="color: blue">未租</span></c:if>
			<c:if test="${bean.product.czstauts=='已租' }"><span style="color: red">已租</span></c:if>
     	</td>
    	<td align="center" >${fn:substring(bean.createtime,0, 16)}</td>
								
								<td>
  	                                <a href="method!leasedelete?id=${bean.id }" onclick=" return confirm('确定要删除吗?');">删除</a> 
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
