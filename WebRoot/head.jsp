<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>  
 function changeClock()  
 {  
     var d = new Date();  
     document.getElementById("clock").innerHTML = 
     
    "时间："+
     d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();  
 }  
 window.setInterval(changeClock, 1000);  
</script>


	<div id="header">
 <div id="logo">
            <a href="index.html"></a>
	    </div>
        
        <div class="oferte_content">
        <br/><br/><br/>
        <span style="font-size: 30px;font-weight: bold;color: #FF6600;">
平安社区房屋租赁管理系统平台
        </span>	
        </div> <!-- end of oferte_content-->
        

    </div>
