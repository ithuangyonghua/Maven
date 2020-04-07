<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ithaungyonghua.dao.ContentDao"%>
<%@ page import="com.ithuangyonghua.entity.ContentEntity"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center">
		<tbody>
			<tr>
				<td>新闻ID</td>
				<td>新闻标题</td>
				<td>关键字</td>
				<td>栏目名称</td>
				<td>发布者</td>
				<td>发布时间</td>
				<td>内容简介</td>
				<td>新闻内容</td>
			</tr>
			<%
			ContentDao contentDao = new ContentDao();
			  
			    List<ContentEntity> list=  contentDao.findAll();
			    for(int i=0;i<list.size();i++){
			%>
			<tr>
				 <td><%= list.get(i).getId()%></td>
				<td><%= list.get(i).getName() %></td>
				<td><%= list.get(i).getKeyword()%></td>
				<td><%=list.get(i).getTitlename()%></td> 
					<td><%=list.get(i).getCreator()%></td> 
						<td><%=list.get(i).getWriteDate()%></td> 
						<td><%=list.get(i).getJianjie()%></td> 
						<td><%=list.get(i).getContent()%></td> 
			</tr>
			<% 
			   }
			%>
		</tbody>
	</table>
</body>
</html>