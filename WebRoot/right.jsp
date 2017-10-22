<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="right_content">
   		 <div class="title_box">租房合约</div>
       <%
org.springframework.web.context.WebApplicationContext app3 = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
dao.GonggaoDao gonggaoDao = (dao.GonggaoDao)app3.getBean("gonggaoDao");
List<model.Gonggao> list3 = gonggaoDao.selectBeanList(0,10," where deletestatus=0 ");


%>
    
      
    
        <ul class="left_menu">
       
        <%
        for(model.Gonggao bean:list3){
        	
       
        %>
        <li class="odd"></br>
        <a href="javascript:;
        " onClick="javascript:window.open('indexmethod!gonggaoupdate3?
        id=<%=bean.getId() %>','','width=460,height=460,left=550, top=350,toolbar=no, status=no, menubar=no, resizable=yes, scrollbars=yes');return false;"><%=bean.getBiaoti() %></a>
        </li>
         
        <% 
        }
        %>
        
       
        </ul> 
     
    
  
        
    
     
   </div><!-- end of right content -->   
   
   
