<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
        body,table {cursor: default;margin: 0px;background-color: #F5F5F5;background-image: url(images/bar_bg.gif);background-repeat: repeat-y;}
    </style>
	
    <script language='javascript'>
		function switchBar(obj)
		{
			if (parent.frame.cols!='0,*') 
			{
				parent.frame.cols='0,*';
				bar.src='<%=path %>/img/bar_03.gif';
				obj.title='打开左侧菜单';
			}
			else
			{
				parent.frame.cols='140,*';
				bar.src='<%=path %>/img/bar_01.gif';
				obj.title='关闭左侧菜单';
			}
		}
		function changeOver() 
		{
			if (parent.frame.cols!='0,*') 
			{
				bar.src='<%=path %>/img/bar_02.gif';
			}
			else
			{
				bar.src='<%=path %>/img/bar_04.gif';
			}
		}
		function changeOut() 
		{
			if (parent.frame.cols!='0,*') 
			{
				bar.src='<%=path %>/img/bar_01.gif';
			}
			else
			{
				bar.src='<%=path %>/img/bar_03.gif';
			}
		}
    </script>
  </head>
  
  <body>
      <table height="100%" width="10" border="0" cellspacing="0" cellpadding="0"> 
	      <tr> 
	         <td align="center">
	             <table width="100%" border="0" cellspacing="0" cellpadding="0"> 
	                 <tr> 
	                     <td onClick="javascript:switchBar(this);" title="关闭左侧菜单" style="Cursor:hand;" onMouseOver="javascript:changeOver();" onMouseOut="javascript:changeOut();">
	                          <img id="bar" src="<%=path %>/img/bar_01.gif" width="8" height="50" border="0">
	                     </td>
	                 </tr> 
	             </table>
	         </td>
	       </tr> 
      </table>
  </body>
</html>
