<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="com.ithaungyonghua.dao.ContentDao,com.ithuangyonghua.entity.ContentEntity"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		String newsname = request.getParameter("newsname");
		newsname = new String(newsname.getBytes("iso8859-1"), "UTF-8");
		String keyword = request.getParameter("keyword");
		keyword = new String(keyword.getBytes("iso8859-1"), "UTF-8");
		String titlename = request.getParameter("titlename");
		titlename = new String(titlename.getBytes("iso8859-1"), "UTF-8");
		String creator = request.getParameter("creator");
		creator = new String(creator.getBytes("iso8859-1"), "UTF-8");
		String writedate = request.getParameter("writedate");
		writedate = new String(writedate.getBytes("iso8859-1"), "UTF-8");
		String jianjie = request.getParameter("jianjie");
		jianjie = new String(jianjie.getBytes("iso8859-1"), "UTF-8");
		String content = request.getParameter("content");
		content = new String(content.getBytes("iso8859-1"), "UTF-8");
		ContentDao ctdao = new ContentDao();
		boolean flag = ctdao.findByName(newsname);
		if (flag) {
			out.println("<h3><center>该新闻标题已存在，请重新添加!</center></h3>");
	%>
	    <%@ include file="neirong_add.jsp"%>
	<%
		} else {
			ContentEntity conentity = new ContentEntity();
			conentity.setName(newsname);
			conentity.setKeyword(keyword);
			conentity.setTitlename(titlename);
			conentity.setCreator(creator);
			conentity.setWriteDate(writedate);
			conentity.setJianjie(jianjie);
			conentity.setContent(content);
			int result = ctdao.insertContentEntity(conentity);
			if(result>0){
				 %>
				  <h1 align="center">发布成功!</h1>
				  <h3 align="center">新闻内容如下:</h3>
				  <h3 align="center">新闻标题:<%= newsname %></h3>
				  <h3 align="center">关键字:<%= keyword %></h3>
				  <h3 align="center">栏目名称:<%= titlename %></h3>
				  <h3 align="center">发布者:<%= creator %></h3>
				  <h3 align="center">发布时间:<%= writedate %></h3>
				  <h3 align="center">内容简介:<%= jianjie %></h3>
				  <h3 align="center">主要内容:<%= content %></h3>
				  <h1 align="center">详细信息如下:</h1>
				  <%@ include file="neirong_list.jsp" %>
				  <h1 align="center"><a href="neirong.jsp">返回</a></h1>
				 <% 
			}else{
				out.println("<h3><center>发布失败,请重新发布</center></h3>");
				
			}
		}
	%>
</body>
</html>