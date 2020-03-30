<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.ithaungyonghua.dao.UserDao" %>
<%@ page import="com.ithuangyonghua.entity.UserEntity" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'denglu_success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    String name=request.getParameter("name");
    name=new String(name.getBytes("iso8859-1"),"utf-8");
    String mima=request.getParameter("mima");
    mima=new String(mima.getBytes("iso8859-1"),"utf-8");
    UserDao userDao  = new UserDao();
    UserEntity user = new UserEntity();
    user.setName(name);
    user.setPassword(mima);
    if(userDao.login(user))
    {
    	response.sendRedirect("index.jsp");
    }
    else
    {
    	out.print("<h2><center>登录信息有误，请重新输入登录信息！</center></h2>");
    	%>
    	<%@include file="denglu.jsp"%>
    	<%
    }
     %>
  </body>
</html>
