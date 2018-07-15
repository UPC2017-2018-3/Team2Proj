<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<jsp:directive.page import="java.text.SimpleDateFormat"/> 

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
        
        <script language="javascript">
           
           function goodsAll()
		   {
		        
	            var strUrl = "<%=path %>/goods?type=goodsAll";
				var ret = window.showModalDialog(strUrl,"","dialogWidth:900px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			    if(ret==undefined)
			    {
			        ret=""
			    }
			    document.getElementById("goods_id").value=ret;
		       	
		    }
		    
		    
		   function gongyingshangAll()
		   {
		        var strUrl1 = "<%=path %>/gongyingshang?type=gongyingshangAll";
				var ret1 = window.showModalDialog(strUrl1,"","dialogWidth:900px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			    if(ret1==undefined)
			    {
			        ret1=""
			    }
			    
				document.getElementById("gongyingshang_id").value=ret1;
		   }
           
           function check()
           {
               if(document.formAdd.gongyingshang_id.value=="")
               {
                   alert("请选择供应商");
                   return false;
               }
               if(document.formAdd.danjuhao.value=="")
               {
                   alert("请输入单据号");
                   return false;
               }
               
               document.formAdd.submit();
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/ruku?type=rukuAdd" name="formAdd" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="14" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="center">
						         货物：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="goods_id" id="goods_id" readonly="readonly" style="width: 200px;"/>
						        <input type="button" value="选择" onClick="goodsAll()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="center">
						         供应商：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="gongyingshang_id" id="gongyingshang_id" readonly="readonly" style="width: 200px;"/>
						        <input type="button" value="选择" onClick="gongyingshangAll()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="center">
						         单据号：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="danjuhao" style="width: 200px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="center">
						         数量：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input value="10" type="text" name="rukushu" style="width: 200px;" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="center">
						         单价：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input value="5.5" type="text" name="danjia" style="width: 200px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="center">
						         时间：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input name="rukushi" type="text" style="width: 200px;" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="center">
						         备注：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="beizhu" style="width: 300px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="center">&nbsp;
						        
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       <input type="button" value="提交" onClick="check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
