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
	
	<script type="text/javascript" src="<%=path %>/js/frameCtrl.js"></script>
	<script type="text/javascript" src="<%=path %>/js/frameCtrl.js"></script>
    
    <script language='javascript'>
		function defDrawerHegiht()
			{
				var objBackGround = document.getElementById( "div_BackGround" );
				var objContainer = document.getElementById( "div_Container" );
				var bottomPosition = objBackGround.getBoundingClientRect().bottom;
				div_Container.style.height = ( bottomPosition - 21 - 25 );
				
				var objDrwPanel = document.all.namedItem( "div_drw_Panel" );
				var objDrwContent = document.all.namedItem( "div_drw_Content" );
				
				for ( var i = 0; i < objDrwContent.length; i++ )
				{
					objDrwContent[i].style.height = ( bottomPosition - 21 - 25 - 14 - ( 26 * objDrwPanel.length ) );
				}
				
				var topPosition = objBackGround.getBoundingClientRect().top + 21;
				objContainer.style.position = "absolute";
				objContainer.style.display = "inline";
				objContainer.style.top = topPosition - parseInt( div_Container.style.height.substr( 0, ( div_Container.style.height.length - 2 ) ) ) + 14;
				objContainer.style.left = "0px";
				objContainer.showTop = topPosition;
				objContainer.hideTop = topPosition - parseInt( div_Container.style.height.substr( 0, ( div_Container.style.height.length - 2 ) ) ) + 14;
			}
			
			function collaspe( action )
			{
				var obj = document.getElementById( "div_entry" );
				var objContainer = document.getElementById( "div_Container" );
				var objSwitch = document.getElementById( "img_drwPuller" );
				
				if ( obj.curstatus == "hide" || action =="show" )
				{
					objContainer.style.display = "inline";

					objContainer.style.pixelTop += 50;
					if ( objContainer.style.pixelTop >= objContainer.showTop )
					{
						objContainer.style.pixelTop = objContainer.showTop;
						obj.curstatus = "show";
					}
					else
						window.setTimeout ("collaspe( 'show' );", 10);

					objSwitch.src = "<%=path %>/img/drawer_PullUp.gif";
				}
				else
				{
					objContainer.style.pixelTop -= 50;
					if (objContainer.style.pixelTop <= objContainer.hideTop) 
					{
						objContainer.style.pixelTop = objContainer.hideTop;
						obj.curstatus = "hide";
					}
					else
						window.setTimeout ("collaspe( 'hide' );", 10);

					objSwitch.src = "<%=path %>/img/drawer_PullDown.gif";
				}
				
			}
			
			function drwSwitch()
			{
				var objDrwContent = document.all.namedItem( "div_drw_Content" );
				var objMem = document.getElementById("span_curstatus");

				var curNo = event.srcElement.curDrwNo;
            	var lastNo = objMem.curNo;
				
            	if ( lastNo != curNo )
            	{
            		objDrwContent[lastNo].style.display = "none";
            		objDrwContent[curNo].style.display = "inline";
            		objMem.curNo = curNo;
            	}
            	else
            		return;
			}
			
			function start()
			{
				defDrawerHegiht();
				//correctPNG();
				collaspe("show");
			}

			//改变模块标题字体显示
			function changeShow(id)
			{				
				var elmt = document.getElementsByName("item");	
				//将所有模块文字变为正常
				for(var i=0;i<elmt.length;i++){					
					elmt[i].style.fontWeight = "normal";
				}
				//将当前模块文字变为加粗
				if(document.getElementById(id))
				document.getElementById(id).style.fontWeight = "bold";	
				//将所有树显示属性关闭				
				//document.getElementById("groupsTree").style.display = "none";
				//document.getElementById("rightTree").style.display = "none";
				
			}
			function showTree(id){
				document.getElementById(id).style.display = "inline";
				//tree.tree.focusClientNode(1);	
				//tree1.focusClientNode(1);	
			}
    </script>
  </head>
  
  <body class="leftframe" onload="start();">
		<div id="div_BackGround" style="width: 100%; height: 100%; overflow: hidden; background-image: url(<%=path %>/img/left_BackGround.gif); padding-top: 45px; padding-right: 6px;">
			<table style="width: 93%; height: 100%;" border="0" cellspacing="0" cellpadding="0" align="right">
				<tr height="100%">
					<td>
					</td>
				</tr>
				<tr height="25">
					<td>
        				<table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
        					<tr>
        						<td align="center" valign="middle"></td>
        					</tr>
        				</table>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="div_Drawer" style="position: absolute; top: 0px; left: 0px; z-index: 10;">
			<div id="div_entry" align="left" style="position: absolute; top: 0px; left: 0px; z-index: 20; width: 135px; height: 21px; overflow: hidden; cursor: hand;">
				<img id="img_drwPuller" src="<%=path %>/img/drawer_PullDown.gif" width="135" height="21" alt="主功能入口" />
			</div>
			<div id="div_Container" align="left" style="position: absolute; z-index: 11; left: 0px; display: none; width: 135px; height: 0px; overflow: hidden;">
				<div style="background-image: url(<%=path %>/img/drawer_BackGround.gif); border-left: 1px solid #94989A; border-right: 1px solid #94989A; filter:Alpha(opacity=90);">
					<!-- 修改的是curDrwNo的值 -->
					<div id="div_drw_Panel" align="center" class="div_drwPanel" >
    					<span class="drwPanel" curDrwNo="0" onclick="drwSwitch();" >修改登录密码</span>
    				</div>
    				<div id="div_drw_Content" align="center" class="div_drwContent" style="display: inline;">
						<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
							<a id="type" class="A1" hidefocus="false" href="<%=path %>/admin/userinfo/userPw.jsp" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>修改登录密码</a>
    					</span>
    				</div>
    				<!--  -->

					<!--  -->
					<div id="div_drw_Panel" align="center" class="div_drwPanel">
    					<span class="drwPanel" curDrwNo="1" onclick="drwSwitch();">货物类别管理</span>
    				</div>
    				<div id="div_drw_Content" align="center" class="div_drwContent" style="display: none;">
						<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
    						<a id="type" class="A1" hidefocus="false" href="<%=path %>/catelog?type=catelogMana" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>货物类别管理</a>
    					</span>
    					<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
    						<a id="type" class="A1" hidefocus="false" href="<%=path %>/admin/catelog/catelogAdd.jsp" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>添加货物类别</a>
    					</span>
    				</div>
    				<!--  -->
    				
    				<!--  -->
					<div id="div_drw_Panel" align="center" class="div_drwPanel">
    					<span class="drwPanel" curDrwNo="2" onclick="drwSwitch();">货物信息管理</span>
    				</div>
    				<div id="div_drw_Content" align="center" class="div_drwContent" style="display: none;">
						<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
    						<a id="type" class="A1" hidefocus="false" href="<%=path %>/goods?type=goodsMana" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>货物信息管理</a>
    					</span>
    					<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
    						<a id="type" class="A1" hidefocus="false" href="<%=path %>/admin/goods/goodsAdd.jsp" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>添加货物信息</a>
    					</span>
    				</div>
    				<!--  -->
    				
    				
    				<!--  -->
					<div id="div_drw_Panel" align="center" class="div_drwPanel">
    					<span class="drwPanel" curDrwNo="3" onclick="drwSwitch();">供应商---管理</span>
    				</div>
    				<div id="div_drw_Content" align="center" class="div_drwContent" style="display: none;">
						<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
    						<a id="type" class="A1" hidefocus="false" href="<%=path %>/gongyingshang?type=gongyingshangMana" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>供应商---管理</a>
    					</span>
    					<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
    						<a id="type" class="A1" hidefocus="false" href="<%=path %>/admin/gongyingshang/gongyingshangAdd.jsp" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>添加---供应商</a>
    					</span>
    				</div>
    				<!--  -->
    				
    				
    				<!--  -->
					<div id="div_drw_Panel" align="center" class="div_drwPanel">
    					<span class="drwPanel" curDrwNo="4" onclick="drwSwitch();">采购入库管理</span>
    				</div>
    				<div id="div_drw_Content" align="center" class="div_drwContent" style="display: none;">
						<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
    						<a id="type" class="A1" hidefocus="false" href="<%=path %>/ruku?type=rukuMana" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>入库信息管理</a>
    					</span>
    					<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
    						<a id="type" class="A1" hidefocus="false" href="<%=path %>/admin/ruku/rukuAdd.jsp" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>添加入库信息</a>
    					</span>
    				</div>
    				<!--  -->
    				
    				
    				<!--  -->
					<div id="div_drw_Panel" align="center" class="div_drwPanel">
    					<span class="drwPanel" curDrwNo="5" onclick="drwSwitch();">销售信息管理</span>
    				</div>
    				<div id="div_drw_Content" align="center" class="div_drwContent" style="display: none;">
						<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
    						<a id="type" class="A1" hidefocus="false" href="<%=path %>/xiaoshou?type=xiaoshouMana" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>销售信息管理</a>
    					</span>
    					<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
    						<a id="type" class="A1" hidefocus="false" href="<%=path %>/admin/xiaoshou/xiaoshouAdd.jsp" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>销售信息添加</a>
    					</span>
    				</div>
    				<!--  -->
    				
    				
    				<!--  -->
					<div id="div_drw_Panel" align="center" class="div_drwPanel">
    					<span class="drwPanel" curDrwNo="6" onclick="drwSwitch();">库存信息统计</span>
    				</div>
    				<div id="div_drw_Content" align="center" class="div_drwContent" style="display: none;">
						<span class="drwItem" style="color:gray;filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)">
    						<a id="type" class="A1" hidefocus="false" href="<%=path %>/admin/tongji/tongjiPre.jsp" target="mainFrame"><img src="<%=path %>/img/actualize_plan.png" border=0 width="30" height="30"><br>库存信息统计</a>
    					</span>
    				</div>
    				<!--  -->
    				
    				
				</div>
				
        		<div align="left" style="width: 135px; height: 14px;">
        			<img id="img_drwPuller" src="<%=path %>/img/drawer_End.gif" width="135" height="14" />
        		</div>
			</div>
		</div>
		
		
		<div align="rigit" style="">
			<table border='1' cellspacing='0' cellpadding='0' align="right">
				<tr>
				<td>
					<img name="img1" src="<%=path %>/img/spliter_hide.gif" style="cursor:pointer; " algin="right"></td>
				</tr>
			</table>
		</div>
	    <span id="span_curstatus" curNo="0" style="display:none;"></span>
	</body>
</html>
