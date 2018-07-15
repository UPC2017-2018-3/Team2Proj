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
	
  </head>
  
  <frameset rows="80,*,35" cols="*" frameborder="NO" border="0" framespacing="0">
		<frame src="<%=path %>/admin/top.jsp" name="topFrame" scrolling="NO" noresize APPLICATION="yes">
		<frameset id="frame" cols="140,*" frameborder="NO" border="0" framespacing="0">
			<frame src="<%=path %>/admin/leftMenu.jsp" name="leftFrame" scrolling="NO"  APPLICATION="yes">
			<frameset cols="10,*" frameborder="NO" border="0" framespacing="0"> 
				<frame id="hidden" src="<%=path %>/admin/hidden.jsp" name="hidden" scrolling="NO" noresize>
				<frame id="mainFrame" src="<%=path %>/admin/main.jsp" name="mainFrame" scrolling="yes" APPLICATION="yes">
			</frameset>
		</frameset>
		<frame src="<%=path %>/admin/bottom.jsp" name="bottom" scrolling="no" noresize marginwidth="0">
  </frameset>
  <noframes>
	    <body>
			对不起，您的浏览器不支持框架集！ 
	    </body>
  </noframes>
</html>
