<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script type="text/javascript" src="<%=path %>/js/public.js"></script>
		<script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           function rukuDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/ruku?type=rukuDel&id="+id;
               }
           }
           
           function rukuAdd()
           {
                 var url="<%=path %>/admin/ruku/rukuAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="18" background="<%=path %>/images/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="4%">序号</td>
					<td width="10%">单据号</td>
					<td width="15%">供应商</td>
					<td width="15%">货物</td>
					
					<td width="10%">数量</td>
					<td width="10%">单价</td>
					<td width="10%">总价</td>
					<td width="10%">时间</td>
					
					<td width="10%">备注</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.rukuList}" var="ruku" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${ss.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${ruku.danjuhao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${ruku.gongyingshang.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${ruku.goods.mingcheng}
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
						${ruku.rukushu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${ruku.danjia}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${ruku.zongjia}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${ruku.rukushi}
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
					    ${ruku.beizhu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="rukuDel(${ruku.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 8px;">
			  <tr>
			    <td>
			      <input type="button" value="添加采购信息" style="width: 130px;" onclick="rukuAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
