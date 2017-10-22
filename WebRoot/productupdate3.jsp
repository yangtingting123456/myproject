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
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Electronix Store</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="iecss.css" />
<![endif]-->

<script type="text/javascript" src="js/boxOver.js"></script>
<script type="text/javascript" language="javascript">

function checkform(){
	var valid=/^\d*$/;
	if(!valid.test(document.getElementById('timesid').value)){
		alert(" 租房时长必须是数字");
		return false;
	}
	 if (document.getElementById('timesid').value=="")
	{
		alert(" 租房时长不能为空");
		return false;
	}
	
	return true;

}
</script>

</head>
<body>
<form name="detailForm" action="indexmethod!leaseadd" method="post" onsubmit="return checkform()" >
 <input type="hidden" name="id" value="${bean.id }"/>
 
   <div class="center_content">
   	<div class="center_title_bar">房屋详情 </div>
    
    	<div class="prod_box_big">
        	<div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">            
                 
                 <div class="product_img_big">
                 <a href="" title="header=[Zoom] body=[&nbsp;] fade=[on]"><img  src="<%=basePath%>/temp/${bean.imgpath }" width="170" height="200" border="0"/></a>
                 </div>
                     <div class="details_big_box">
                     
                         <div class="product_title_big">${bean.name }</div>
                         <div class="specifications">                                           
                                                                       所在城市: <span class="blue"> ${bean.fenlei.name  }</span><br/>
                                                                       月租费（元/月）: <span class="blue"> ${bean.jiage } （元）</span><br/>  
                                                                       房东姓名: <span class="blue"> ${bean.user.truename } </span><br/>  
                                                                       房东电话: <span class="blue"> ${bean.user.phone }</span><br/>  
                                                                       房屋地址: <span class="blue"> ${bean.address }</span><br/>                                                                                                                       
                                                                       房屋介绍 : <span class="blue">${bean.maoshu }</span><br/>                                                                                
                                                                        租房时长: <span class="blue"> 
                                          <input type="text" name="times" id="timesid" />
                                            </span> (月为单位)                                            
                         </div>
                        
                     </div> 
                   <c:if test="${user.role==1 }">
                     <a href="javascript:document.detailForm.submit();" class="addtocart"><span class="red">租房</span></a>   
                   </c:if>            
            </div>
            <div class="bottom_prod_box_big"></div>                                
        </div>
        
         
    

</div>
</form>
<!-- end of main_container -->
</body>

</html>