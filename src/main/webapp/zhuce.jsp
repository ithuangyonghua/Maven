<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zhuce.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <h2 align="center">用户注册</h2>
  <body><form method="post" name="biaodan" action="zhuce_xinxi.jsp">
  <table width="430" border="1" height="202" align="center">
<tbody><tr>
<td width=30% align="center">&nbsp;用户名：</td>
<td>&nbsp;<input type="text" name="yonghuming"></td></tr>
<tr>
<td align="center">&nbsp;密码：<br></td>
<td>&nbsp;<input type="password" name="mima"></td></tr>
<tr>
<td align="center">&nbsp;性别：<br></td>
<td>&nbsp;<input type="radio" value="男" name="xingbie">男
<input type="radio" value="女" name="xingbie">女</td></tr>
<tr>
<td align="center">&nbsp;专业：<br></td>
<td>&nbsp;<select size="1" name="zhuanye">
<option value="计算机应用">计算机应用</option>
<option value="大数据">大数据</option>
<option value="网络互连">网络互连</option>
<option value="网页设计">网页设计</option>
</select>
</td></tr>
<tr>
<td align="center">&nbsp;兴趣：<br></td>
<td>&nbsp;<input type="checkbox" value="运动" name="xingqu">运动
<input type="checkbox" value="读书" name="xingqu">读书
<input type="checkbox" value="上网" name="xingqu">上网
<input type="checkbox" value="学习" name="xingqu">学习</td></tr>
<tr>
<td align="center">&nbsp;个人简介：<br></td>
<td>&nbsp;<textarea cols="20" rows="5" name="jianjie"></textarea></td></tr>

<tr>
<td align="center">&nbsp;个人照片：<br></td>
<td>&nbsp;<img src="tp/me.jpg" width=30%> </td></tr>
<tr>
<td colspan="2" align="center">&nbsp;<input type="submit" value="注册" name="button1"><input type="reset" value="取消" name="button2"></td>
</tr>
</tbody></table></form><br><br>
  </body>
</html>
