<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
<script language="javascript" type="text/javascript">



</script>
 <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
           
           
           function down1(fujianPath,fujianYuashiMing)
           {
               var url="<%=path %>/updown/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
		       url=encodeURI(url); 
               url=encodeURI(url); 
               window.open(url,"_self");
           }
       </script>

</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  
  <TR>
    <TD bgColor=#b1ceef height=1></TD></TR>
  <TR height=20>
    <TD background=images/shadow_bg.jpg></TD></TR></TABLE>
     <form action="${url }?id=${bean.id }" method="post" onsubmit="return checkform()">
<TABLE cellSpacing=0 cellPadding=0 width="60%" align=center border=0>
  	
  	<TR height=>
    <TD align="center"> 
 ${bean.biaoti }
    </TD>
    </TR>
    
     
     
    <TR height=>
    <TD align="center"> 
    <textarea rows="10" cols="50"  name="content" readonly="readonly">${bean.content }</textarea>
    </TD>
    </TR>
    
    	<TR height=>
      <TD align="center"> 
${bean.fujianYuanshiming }<a href="#" onclick="down1( '${bean.fujian }','${bean.fujianYuanshiming }')" style="font-size: 11px;color: red">下载此文件</a>
    </TD>
     </TR>
    
    
    </TABLE>
    </form>
 </BODY></HTML>
