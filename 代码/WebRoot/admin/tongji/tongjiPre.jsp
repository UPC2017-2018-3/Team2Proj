<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        
        <script language="javascript">
            function c()
            {
                document.form1.submit();
            }
        
        </script>
	</head>

	<body leftmargin="20" topmargin="20" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/tongji?type=tongjiRes" name="form1" method="post">
			    <TABLE cellSpacing="1" cellPadding="2" width="80%" align="left" bgColor="#CCCCCC" border="0">
			      <TR>
			          <TD align=center>
			              货物编号：<input type="text" name="bianhao" style="width: 150px;"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						货物名称：<input type="text" name="mingcheng" style="width: 200px;" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
			            <input type="button" value="统计" onclick="c()"/>
			          </TD>
			      </TR> 
			    </TABLE>
			</form>
   </body>
</html>
