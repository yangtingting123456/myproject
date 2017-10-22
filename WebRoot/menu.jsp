<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="menu_tab">
            <div class="left_menu_corner"></div>
                    <ul class="menu">
                         <li><a href="./" class="nav1">  首页 </a></li>

                       
                         
                          <c:if test="${user.role==1 }">
                          <li class="divider"></li>
                         <li><a href="indexmethod!leaselist"  class="nav3">我的租房</a></li>
                         </c:if>
                         
                         
                         <c:if test="${user.role==2 }">
                          <li class="divider"></li>
                         <li><a href="indexmethod!productlist"  class="nav3">房屋信息</a></li>
                         </c:if>
                         
                           <li class="divider"></li>                         
                         <li><a href="indexmethod!feedbacklist" class="nav6">用户留言</a></li>
                         
                        <li class="divider"></li>
                       <li> 
                       <a href="manage/login.jsp" class="nav4">后台登陆</a>
                       </li>
                         
                    </ul>

             <div class="right_menu_corner"></div>
            </div><!-- end of menu tab -->
