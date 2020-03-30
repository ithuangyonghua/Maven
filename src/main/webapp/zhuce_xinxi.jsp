<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ithaungyonghua.dao.UserDao" %>
<%@ page import="com.ithuangyonghua.entity.UserEntity" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'zhuce_xinxi.jsp' starting page</title>
    
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
  String yhm=request.getParameter("yonghuming");
  yhm=new String(yhm.getBytes("iso8859-1"),"utf-8");
  
  String mima=request.getParameter("mima");
  String xb=request.getParameter("xingbie");
  xb=new String(xb.getBytes("iso8859-1"),"utf-8");
  
  String zhuanye=request.getParameter("zhuanye");
   zhuanye=new String(zhuanye.getBytes("iso8859-1"),"utf-8");
   
  String[] xingqu=request.getParameterValues("xingqu");
  String str="";
  for(int i=0;i<xingqu.length;i++){
  		str=str+xingqu[i]+",";
  }
   str=new String(str.getBytes("iso8859-1"),"utf-8");
  
  String jianjie=request.getParameter("jianjie");
  jianjie=new String(jianjie.getBytes("iso8859-1"),"utf-8");
  UserDao userDao  = new UserDao();
  UserEntity user = new UserEntity();
  user.setName(yhm);
  user.setPassword(mima);
  user.setXingbie(xb);
  user.setXingqu(str);
  user.setZhuanye(zhuanye);
  user.setJianjie(jianjie);
  int result = userDao.insertUser(user);
  if(result>0){
	  
  
  %><h1 align="center"> 
    注册成功！</h1><h3 align="center">您的信息如下：</h3>
    <h3 align="center">用户名：<%=yhm %></h3>
    <h3 align="center">密码：<%= mima%></h3>
    <h3 align="center">性别：<%=xb %></h3>
    <h3 align="center">专业：<%=zhuanye %></h3>
    <h3 align="center">兴趣：<%=str %></h3>
    <h3 align="center">个人简介：<%=jianjie %></h3>
  </body>
  <%}else{ 
  out.print("<h2><center>注册失败!请重新注册</center></h2>");
    	%>
    	<%@include file="zhuce.jsp"%>
    	<%
  } %>
</html>
