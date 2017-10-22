<%@ page language="java" import="java.util.*,model.User" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script language="javascript" type="text/javascript"> 
	
function registershow(){
		var now = new Date(); 
		var t = now.getTime()+''; 
		window.showModalDialog("register.jsp?t="+t, null, 
		'dialogWidth:850px;dialogHeight:650px;help:no;unadorned:no;resizable:no;status:no;scroll:no');
	}
	
</script>

<div class="left_content">
    <div class="title_box">用户登录</div>
    
        <c:if test="${user==null}">
         <form action="indexmethod!login" method="post" onsubmit="return checkform()" >
          <h4> 用户名：<input type="text" name="username" size="15" id="usernameid" /> </h4>
         <h4>  密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" size="15" id="passwordid" /> </h4>
          <h4>  角&nbsp;&nbsp;&nbsp;色：
               <select  name="role" id="roleid" class="select"> 
                           <option value="1">用户</option>
                           <option value="2">屋主</option>
                        </select> 
           </h4>
         
          <input style="width:80px; height:25px;" type="submit" name="submit"  value="登陆"  />  
          <input style="width:80px; height:25px;" type="reset" name="reset"  value="重置"  />  
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="javascript:;" onClick="javascript:window.open('register.jsp','','width=460,height=460,left=550, top=350,toolbar=no, status=no, menubar=no, resizable=yes, scrollbars=yes');return false;">新用户注册</a>
          </form>   
             
        </c:if>
      <input type="hidden" name="id" value="${bean.id }"/>
        <c:if test="${user!=null  }">
         <form action="indexmethod!loginout" method="post"  >
          <h4> 当前用户：${user.username }  </h4>
            <h4> 当前角色：
            <c:if test="${user.role==1}">普通用户</c:if>
			<c:if test="${user.role==2}">屋主</c:if>
             </h4>
         <h4> 当前状态：登录中 </h4>
         
         <input style="width:200px; height:25px;" type="submit" name="submit"  value="退出"  />
        
          <a href="javascript:;" onClick="javascript:window.open('indexmethod!userupdate?id=${user.id }','','width=460,height=460,left=550, top=350,toolbar=no, status=no, menubar=no, resizable=yes, scrollbars=yes');return false;">个人信息修改</a>
            
           </form>   
           </c:if>
        
        
        <br/><br/>
        
        
    
   </div><!-- end of left content -->
   
  
