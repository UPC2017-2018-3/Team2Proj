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
	
	<link rel="stylesheet" href="<%=path %>/css/main.css" type="text/css"></link>
	<style type="text/css">
        .top_bt {font-size: 14px;color: #FFFFFF;text-decoration: none;font-weight: bold;line-height: 30px;}
    </style>
	
    <script language='javascript'>
		function openEditPwd(n) 
		{
	        window.open("/manage/usermanage/editPwd.jsp?kind=0&userid="+n,"","toolbar=no,location=no,resizable=yes,scrollbars=no,menubar=no,left=300,top=260,width=500,height=230");
        }

		function logout(context)
		{
		    var url="<%=path %>/login.jsp";
			window.parent.location.href=url;
		}
    </script>
  </head>
  
  <body class="topframe">
      <form METHOD=POST ACTION="">
		<div style="width: 100%; height: 80px; overflow: hidden;">
			<div style="width: 100%; height: 75px; overflow: hidden; background-color: #6A7EA8;">
				<table border="0" cellpadding="0" cellspacing="0" width="100%"  height="100%" valign=top>
					<tr>
					    <td width="50%" bgcolor="6B7EA9"><img src="<%=path %>/img/top_bt.jpg" width="466" height="50"></td>
					    <td width="20%" align="right" valign="bottom" bgcolor="6B7EA9">
						    <div align="right">
								<img src="<%=path %>/img/refresh.gif" width="60" height="20" border="0" onClick="logout('')" style="cursor:hand" title="注销">
								&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div style="width: 100%; height: 1px; overflow: hidden; background-color: #7F8EAD;">
			</div>
			<div style="widht: 100%; height: 4px; overflow: hidden; background-color: #929DB4;">
			</div>
		</div>
	  </form>
  </body>
</html>
