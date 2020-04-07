<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ithaungyonghua.dao.LanMuDao"%>
<%@ page import="com.ithuangyonghua.entity.LanMuEntity"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>栏目添加</title>
</head>

<%
	String name = request.getParameter("name");
	name = new String(name.getBytes("iso8859-1"), "utf-8");
	String creator = request.getParameter("creator");
	creator = new String(creator.getBytes("iso8859-1"), "utf-8");
	String creatorDate = request.getParameter("creatorDate");
	creatorDate = new String(creatorDate.getBytes("iso8859-1"), "utf-8");
	LanMuDao lmDao = new LanMuDao();
	boolean flag = lmDao.findByName(name);
	if (flag) {
		out.println("<h3><center>该栏目已存在,请重新添加!</center></h3>");
%>
<%@include file="lanmu_add.jsp"%>
<%
	} else {
		LanMuEntity lanmu = new LanMuEntity();
		lanmu.setName(name);
		lanmu.setCreator(creator);
		lanmu.setCreatorDate(creatorDate);
		int result = lmDao.insertLanmu(lanmu);
		if (result > 0) {
%>
<h1 align="center">发布成功</h1>
<h3 align="center">你的信息如下:</h3>
<h3 align="center">
	栏目名称:<%=name%></h3>
<h3 align="center">
	发布者:<%=creator%></h3>
<h3 align="center">
	发布时间:<%=creatorDate%></h3>
<h1 align="center">详细信息如下:</h1>
  <%@include file="lanmu_list.jsp"%>
<h1 align="center">
	<a href="lanmu.jsp">返回</a>
</h1>
<%
	} else {
			out.println("<h3><center>发布失败,请重新发布!</center></h3>");
	%>
	
	<%
		}
	}
%>


</html>



